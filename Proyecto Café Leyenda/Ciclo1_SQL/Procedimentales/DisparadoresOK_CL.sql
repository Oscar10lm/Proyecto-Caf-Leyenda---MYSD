INSERT INTO Inventario VALUES (1, 1, 50, 10, SYSDATE);

INSERT INTO DetalleVenta (idDetalleVenta, idVenta, idProducto, cantidad, precioUnitario)
VALUES (1, 1, 1, 2, 4000);

SELECT stockActual FROM Inventario WHERE idProducto = 1;

SELECT subtotal FROM DetalleVenta WHERE idDetalleVenta = 1;
