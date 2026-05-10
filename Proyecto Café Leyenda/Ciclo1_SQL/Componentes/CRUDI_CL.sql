-- ============================================================
-- CAFE LEYENDA - Ciclo 1: Componentes
-- Archivo: CRUDI_CL.sql
-- Descripcion: Implementacion de Cuerpos de Paquete (Lógica)
-- ============================================================

-- ========================================================
-- 1. PC_PRODUCTO BODY
-- ========================================================
CREATE OR REPLACE PACKAGE BODY PC_PRODUCTO IS
    PROCEDURE AD_CATEGORIA(n_id IN NUMBER, n_nom IN VARCHAR2, n_desc IN VARCHAR2) IS
    BEGIN
        INSERT INTO Categoria (idCategoria, nombre, descripcion)
        VALUES (n_id, n_nom, n_desc);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN ROLLBACK; RAISE;
    END;

    PROCEDURE AD_PRODUCTO(n_id IN NUMBER, n_nom IN VARCHAR2, n_desc IN VARCHAR2, n_prec IN NUMBER, n_cat IN NUMBER) IS
    BEGIN
        INSERT INTO Producto (idProducto, nombre, descripcion, precioVenta, idCategoria)
        VALUES (n_id, n_nom, n_desc, n_prec, n_cat);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN ROLLBACK; 
        RAISE_APPLICATION_ERROR(-20100, 'Error al insertar producto (Probable violación de UK o FK): ' || SQLERRM);
    END;

    PROCEDURE AD_INVENTARIO(n_id IN NUMBER, n_prod IN NUMBER, n_sAct IN NUMBER, n_sMin IN NUMBER, n_sMax IN NUMBER, n_ub IN VARCHAR2) IS
    BEGIN
        INSERT INTO Inventario (idInventario, idProducto, stockActual, stockMinimo, stockMaximo, ubicacion)
        VALUES (n_id, n_prod, n_sAct, n_sMin, n_sMax, n_ub);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN ROLLBACK; RAISE;
    END;

    FUNCTION CO_CATALOGO_GENERAL RETURN SYS_REFCURSOR IS
        v_cur SYS_REFCURSOR;
    BEGIN
        OPEN v_cur FOR
            SELECT p.nombre AS Producto, c.nombre AS Categoria, p.precioVenta, i.stockActual
            FROM Producto p
            JOIN Categoria c ON p.idCategoria = c.idCategoria
            LEFT JOIN Inventario i ON p.idProducto = i.idProducto
            ORDER BY p.nombre;
        RETURN v_cur;
    END;
END PC_PRODUCTO;
/

-- ========================================================
-- 2. PC_USUARIO BODY
-- ========================================================
CREATE OR REPLACE PACKAGE BODY PC_USUARIO IS
    PROCEDURE AD_USUARIO(n_id IN NUMBER, n_nom IN VARCHAR2, n_mail IN VARCHAR2, n_tel IN VARCHAR2) IS
    BEGIN
        INSERT INTO Usuario (idUsuario, nombre, correo, telefono)
        VALUES (n_id, n_nom, n_mail, n_tel);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN ROLLBACK; RAISE;
    END;

    PROCEDURE AD_EMPLEADO(n_id IN NUMBER, n_sal IN NUMBER, n_est IN VARCHAR2) IS
    BEGIN
        INSERT INTO Empleado (idUsuario, salario, estado)
        VALUES (n_id, n_sal, n_est);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN ROLLBACK;
        RAISE_APPLICATION_ERROR(-20200, 'Error al asignar empleado. Verifique integridad base.');
    END;

    PROCEDURE AD_CLIENTE(n_id IN NUMBER, n_punt IN NUMBER, n_tip IN VARCHAR2) IS
    BEGIN
        INSERT INTO Cliente (idUsuario, puntosLealtad, tipoCliente)
        VALUES (n_id, n_punt, n_tip);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN ROLLBACK; RAISE;
    END;

    FUNCTION CO_CONSULTAR_DATOS(n_id IN NUMBER) RETURN SYS_REFCURSOR IS
        v_cur SYS_REFCURSOR;
    BEGIN
        OPEN v_cur FOR
            SELECT u.nombre, u.correo, e.estado, c.tipoCliente
            FROM Usuario u
            LEFT JOIN Empleado e ON u.idUsuario = e.idUsuario
            LEFT JOIN Cliente c ON u.idUsuario = c.idUsuario
            WHERE u.idUsuario = n_id;
        RETURN v_cur;
    END;
END PC_USUARIO;
/

-- ========================================================
-- 3. PC_VENTA BODY
-- ========================================================
CREATE OR REPLACE PACKAGE BODY PC_VENTA IS
    PROCEDURE AD_VENTA(n_id IN NUMBER, n_total IN NUMBER, n_emp IN NUMBER, n_cli IN NUMBER) IS
    BEGIN
        -- Se usa SYSTIMESTAMP para automatizar la fechaHora de la venta
        INSERT INTO Venta (idVenta, fechaHora, total, idEmpleado, idCliente)
        VALUES (n_id, SYSTIMESTAMP, n_total, n_emp, n_cli);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN ROLLBACK; RAISE;
    END;

    PROCEDURE AD_DETALLE(n_vta IN NUMBER, n_prod IN NUMBER, n_cant IN NUMBER, n_prec IN NUMBER) IS
    BEGIN
        -- El subtotal se calculará vía Trigger TR_CALCULAR_SUBTOTAL
        -- El trigger TR_VALIDAR_STOCK validará existencias
        -- El trigger TR_PROCESAR_SALIDA actualizará stock y generará Movimiento automático
        INSERT INTO DetalleVenta (idVenta, idProducto, cantidad, precioUnitario, subtotal)
        VALUES (n_vta, n_prod, n_cant, n_prec, 0); 
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN ROLLBACK; RAISE;
    END;

    FUNCTION CO_VENTAS_POR_EMPLEADO(n_emp IN NUMBER) RETURN SYS_REFCURSOR IS
        v_cur SYS_REFCURSOR;
    BEGIN
        OPEN v_cur FOR
            SELECT idVenta, fechaHora, total 
            FROM Venta 
            WHERE idEmpleado = n_emp
            ORDER BY fechaHora DESC;
        RETURN v_cur;
    END;
END PC_VENTA;
/
