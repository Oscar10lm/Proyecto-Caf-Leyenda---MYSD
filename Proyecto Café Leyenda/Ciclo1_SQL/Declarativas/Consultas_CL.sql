-- ============================================================
-- CAFE LEYENDA - Ciclo 1: Ventas e Inventario
-- Archivo: Consultas.sql
-- Descripcion: Consultas SQL operativas
-- ============================================================

-- ------------------------------------------------------------
-- 1. REGISTRAR VENTA (Cajero)
-- ------------------------------------------------------------
INSERT INTO Venta (idVenta, idEmpleado, idCliente, idMetodoPago, fecha, hora, estadoPedido)
VALUES (1, 1, NULL, 1, SYSDATE, TO_CHAR(SYSDATE,'HH24:MI'), 'pendiente');

INSERT INTO DetalleVenta (idDetalleVenta, idVenta, idProducto, cantidad, precioUnitario, subtotal)
VALUES (1, 1, 1, 2,
    (SELECT precioVenta FROM Producto WHERE idProducto = 1),
    2 * (SELECT precioVenta FROM Producto WHERE idProducto = 1));

UPDATE Venta
SET total = (SELECT SUM(subtotal) FROM DetalleVenta WHERE idVenta = 1)
WHERE idVenta = 1;

-- ------------------------------------------------------------
-- 2. GENERAR FACTURA (Cajero)
-- ------------------------------------------------------------
SELECT
    v.idVenta,
    v.fecha,
    v.hora,
    ue.nombre           AS nombreEmpleado,
    uc.nombre           AS nombreCliente,
    p.nombre            AS metodoPago,
    pr.nombre           AS nombreProducto,
    dv.cantidad,
    dv.precioUnitario,
    dv.subtotal,
    v.total
FROM Venta v
JOIN Empleado e         ON v.idEmpleado     = e.idUsuario
JOIN Usuario ue         ON e.idUsuario      = ue.idUsuario
JOIN Pago p             ON v.idMetodoPago   = p.idMetodoPago
LEFT JOIN Cliente c     ON v.idCliente      = c.idUsuario
LEFT JOIN Usuario uc    ON c.idUsuario      = uc.idUsuario
JOIN DetalleVenta dv    ON v.idVenta        = dv.idVenta
JOIN Producto pr        ON dv.idProducto    = pr.idProducto
WHERE v.idVenta = 1;

-- ------------------------------------------------------------
-- 3. VER INVENTARIO - Cajero
-- ------------------------------------------------------------
SELECT
    p.idProducto,
    p.nombre                                                AS nombreProducto,
    i.stockActual,
    i.stockMinimo,
    i.fechaActualizacion,
    CASE
        WHEN i.stockActual = 0               THEN 'Agotado'
        WHEN i.stockActual <= i.stockMinimo  THEN 'Stock bajo'
        ELSE                                      'Disponible'
    END                                                     AS estadoStock
FROM Producto p
JOIN Inventario i ON p.idProducto = i.idProducto
ORDER BY estadoStock ASC, p.nombre ASC;

-- ------------------------------------------------------------
-- 4. VER INVENTARIO - Barista
-- ------------------------------------------------------------
SELECT
    p.idProducto,
    p.nombre                                                AS nombreProducto,
    i.stockActual,
    i.stockMinimo,
    i.fechaActualizacion,
    i.motivoActualizacion,
    CASE
        WHEN i.stockActual = 0               THEN 'Agotado'
        WHEN i.stockActual <= i.stockMinimo  THEN 'Stock bajo'
        ELSE                                      'Disponible'
    END                                                     AS estadoStock
FROM Producto p
JOIN Inventario i ON p.idProducto = i.idProducto
ORDER BY estadoStock ASC, p.nombre ASC;

-- ------------------------------------------------------------
-- 5. VER PEDIDOS - Barista
-- ------------------------------------------------------------
SELECT
    v.idVenta,
    v.fecha,
    v.hora,
    pr.nombre           AS nombreProducto,
    dv.cantidad
FROM Venta v
JOIN DetalleVenta dv    ON v.idVenta        = dv.idVenta
JOIN Producto pr        ON dv.idProducto    = pr.idProducto
WHERE v.estadoPedido    = 'pendiente'
ORDER BY v.fecha ASC, v.hora ASC;

-- ------------------------------------------------------------
-- 6. MARCAR PEDIDO COMO ENTREGADO - Barista
-- ------------------------------------------------------------
UPDATE Venta
SET estadoPedido = 'entregado'
WHERE idVenta       = 1
  AND estadoPedido  = 'pendiente';