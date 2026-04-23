-- ============================================================
-- CAFE LEYENDA - Ciclo 1: Ventas e Inventario
-- Archivo: PoblarOK.sql
-- Descripcion: Ingreso de datos correctos (sin autogenerado)
-- ============================================================

-- CARGOS
INSERT INTO Cargo VALUES (1, 'Cajero',  'Atiende el punto de pago');
INSERT INTO Cargo VALUES (2, 'Barista', 'Prepara y entrega los pedidos');

-- USUARIOS (base para Empleados y Clientes)
INSERT INTO Usuario VALUES (1, 'Laura Gomez',   'laura@gmail.com',  '3101234567');
INSERT INTO Usuario VALUES (2, 'Pedro Ramirez',  NULL,               '3209876543');
INSERT INTO Usuario VALUES (3, 'Ana Torres',     'ana@gmail.com',    NULL);
INSERT INTO Usuario VALUES (4, 'Carlos Ruiz',    NULL,               NULL);

-- EMPLEADOS (heredan de Usuario)
INSERT INTO Empleado VALUES (1, 1);  -- Laura es Cajero
INSERT INTO Empleado VALUES (2, 2);  -- Pedro es Barista

-- CLIENTES (heredan de Usuario)
INSERT INTO Cliente VALUES (3);  -- Ana es Cliente
INSERT INTO Cliente VALUES (4);  -- Carlos es Cliente

-- CATEGORIAS
INSERT INTO Categoria VALUES (1, 'Bebidas calientes', 'Cafe, te y similares');
INSERT INTO Categoria VALUES (2, 'Alimentos',         'Snacks y comidas rapidas');

-- PRODUCTOS
INSERT INTO Producto VALUES (1, 1, 'Cafe americano',  'Cafe negro sin leche',  3500);
INSERT INTO Producto VALUES (2, 1, 'Capuchino',        NULL,                    5000);
INSERT INTO Producto VALUES (3, 2, 'Croissant',        'Hojaldre relleno',      4500);
INSERT INTO Producto VALUES (4, 2, 'Tostada con queso',NULL,                    3000);

-- INVENTARIO
INSERT INTO Inventario VALUES (1, 1, 80, 20, SYSDATE, 'Carga inicial');
INSERT INTO Inventario VALUES (2, 2, 60, 15, SYSDATE, 'Carga inicial');
INSERT INTO Inventario VALUES (3, 3, 40, 10, SYSDATE, 'Carga inicial');
INSERT INTO Inventario VALUES (4, 4, 50, 10, SYSDATE, 'Carga inicial');

-- METODOS DE PAGO
INSERT INTO Pago VALUES (1, 'Efectivo');
INSERT INTO Pago VALUES (2, 'Tarjeta');
INSERT INTO Pago VALUES (3, 'Nequi');

-- VENTAS
INSERT INTO Venta VALUES (1, 1, 3,    1, SYSDATE, '08:30', NULL, 'pendiente');
INSERT INTO Venta VALUES (2, 1, NULL, 2, SYSDATE, '09:15', NULL, 'pendiente');

-- DETALLE VENTAS
INSERT INTO DetalleVenta VALUES (1, 1, 1, 2, 3500, 7000);  -- 2 cafes americanos
INSERT INTO DetalleVenta VALUES (2, 1, 3, 1, 4500, 4500);  -- 1 croissant
INSERT INTO DetalleVenta VALUES (3, 2, 2, 1, 5000, 5000);  -- 1 capuchino

-- ACTUALIZAR TOTALES
UPDATE Venta SET total = (SELECT SUM(subtotal) FROM DetalleVenta WHERE idVenta = 1) WHERE idVenta = 1;
UPDATE Venta SET total = (SELECT SUM(subtotal) FROM DetalleVenta WHERE idVenta = 2) WHERE idVenta = 2;

COMMIT;