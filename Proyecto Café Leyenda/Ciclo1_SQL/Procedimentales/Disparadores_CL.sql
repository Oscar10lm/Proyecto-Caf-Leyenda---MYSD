-- ============================================================
-- CAFE LEYENDA - Ciclo 1
-- Archivo: Disparadores_CL.sql
-- Descripcion: Logica de Negocio Procedimental (Triggers)
-- ============================================================

-- 1. TRIGGER: VALIDAR STOCK SUFICIENTE ANTES DE VENTA
CREATE OR REPLACE TRIGGER TR_VALIDAR_STOCK
BEFORE INSERT ON DetalleVenta
FOR EACH ROW
DECLARE
    v_stock_actual NUMBER;
BEGIN
    -- Buscar el stock disponible para el producto vendido en Inventario
    SELECT stockActual INTO v_stock_actual
    FROM Inventario
    WHERE idProducto = :NEW.idProducto;

    IF v_stock_actual < :NEW.cantidad THEN
        RAISE_APPLICATION_ERROR(-20001, 'STOCK INSUFICIENTE: No hay existencias suficientes para el producto: ' || :NEW.idProducto);
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20002, 'ERROR INVENTARIO: El producto no está registrado en el inventario.');
END;
/

-- 2. TRIGGER: CALCULAR SUBTOTAL AUTOMÁTICO
CREATE OR REPLACE TRIGGER TR_CALCULAR_SUBTOTAL
BEFORE INSERT OR UPDATE ON DetalleVenta
FOR EACH ROW
BEGIN
    :NEW.subtotal := :NEW.cantidad * :NEW.precioUnitario;
END;
/

-- 3. TRIGGER: REGISTRAR MOVIMIENTO DE INVENTARIO AUTOMÁTICO Y ACTUALIZAR STOCK
CREATE OR REPLACE TRIGGER TR_PROCESAR_SALIDA_VENTA
AFTER INSERT ON DetalleVenta
FOR EACH ROW
DECLARE
    v_id_inventario NUMBER;
    v_nuevo_id_mov  NUMBER;
BEGIN
    -- Obtener el ID de inventario ligado al producto
    SELECT idInventario INTO v_id_inventario
    FROM Inventario
    WHERE idProducto = :NEW.idProducto;

    -- Disminuir el stockActual en Inventario
    UPDATE Inventario
    SET stockActual = stockActual - :NEW.cantidad
    WHERE idInventario = v_id_inventario;

    -- Generar un ID de movimiento simulado basado en SYSTIMESTAMP para simplicidad
    v_nuevo_id_mov := DBMS_RANDOM.VALUE(10000, 99999);

    -- Insertar rastro en Kárdex / MovimientosInventario ligando la venta compuesta
    INSERT INTO MovimientoInventario (
        idMovimiento, idInventario, fechaHora, cantidad, tipoMovimiento, motivo, idVenta, idProducto
    ) VALUES (
        v_nuevo_id_mov, v_id_inventario, SYSDATE, :NEW.cantidad, 'SALIDA', 'Venta Automatica Generada', :NEW.idVenta, :NEW.idProducto
    );
END;
/
