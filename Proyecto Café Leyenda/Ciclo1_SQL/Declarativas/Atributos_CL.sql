-- ============================================================
-- CAFE LEYENDA - Ciclo 1
-- Archivo: Atributos_CL.sql
-- Descripcion: Capa de Integridad de Dominio (CHECK Constraints)
-- ============================================================

-- USUARIO
ALTER TABLE Usuario
    ADD CONSTRAINT CK_Usuario_Correo CHECK (correo LIKE '%@%.%');

-- EMPLEADO
ALTER TABLE Empleado
    ADD CONSTRAINT CK_Empleado_Salario CHECK (salario > 0);

ALTER TABLE Empleado
    ADD CONSTRAINT CK_Empleado_Estado CHECK (estado IN ('ACTIVO', 'INACTIVO', 'VACACIONES'));

-- CLIENTE
ALTER TABLE Cliente
    ADD CONSTRAINT CK_Cliente_Puntos CHECK (puntosLealtad >= 0);

-- PRODUCTO
ALTER TABLE Producto
    ADD CONSTRAINT CK_Producto_Precio CHECK (precioVenta >= 0);

-- INVENTARIO
ALTER TABLE Inventario
    ADD CONSTRAINT CK_Inv_StockPositivo CHECK (stockActual >= 0 AND stockMinimo >= 0);

ALTER TABLE Inventario
    ADD CONSTRAINT CK_Inv_StockMax CHECK (stockMaximo >= stockMinimo);

-- LOTES
ALTER TABLE LoteProducto
    ADD CONSTRAINT CK_Lote_Disponible CHECK (cantidadDisponible >= 0);

ALTER TABLE LoteProducto
    ADD CONSTRAINT CK_Lote_Fechas CHECK (fechaVencimiento >= fechaProduccion);

-- TRANSACCIONALES
ALTER TABLE Compra
    ADD CONSTRAINT CK_Compra_Total CHECK (total >= 0);

ALTER TABLE DetalleCompra
    ADD CONSTRAINT CK_DetComp_Cant CHECK (cantidad > 0);

ALTER TABLE DetalleCompra
    ADD CONSTRAINT CK_DetComp_Prec CHECK (precioCompra >= 0);

ALTER TABLE Venta
    ADD CONSTRAINT CK_Venta_Total CHECK (total >= 0);

ALTER TABLE DetalleVenta
    ADD CONSTRAINT CK_DetVta_Cant CHECK (cantidad > 0);

ALTER TABLE DetalleVenta
    ADD CONSTRAINT CK_DetVta_Prec CHECK (precioUnitario >= 0);

ALTER TABLE Pago
    ADD CONSTRAINT CK_Pago_Monto CHECK (monto > 0);

-- MOVIMIENTOS INVENTARIO
ALTER TABLE MovimientoInventario
    ADD CONSTRAINT CK_Mov_Cantidad CHECK (cantidad > 0);

ALTER TABLE MovimientoInventario
    ADD CONSTRAINT CK_Mov_Tipo CHECK (tipoMovimiento IN ('ENTRADA', 'SALIDA', 'AJUSTE'));

-- Restricción de exclusividad mutua para la trazabilidad condicional del movimiento
ALTER TABLE MovimientoInventario
    ADD CONSTRAINT CK_Mov_Exclusividad CHECK (
        (idVenta IS NOT NULL AND idCompra IS NULL) OR 
        (idVenta IS NULL AND idCompra IS NOT NULL) OR 
        (idVenta IS NULL AND idCompra IS NULL)
    );