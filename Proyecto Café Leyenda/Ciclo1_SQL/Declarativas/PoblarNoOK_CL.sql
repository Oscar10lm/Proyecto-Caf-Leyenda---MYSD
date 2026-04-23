-- ============================================================
-- CAFE LEYENDA - Ciclo 1: Ventas e Inventario
-- Archivo: PoblarNoOK.sql
-- Descripcion: Intentos de ingreso de datos erroneos
-- Cada INSERT debe FALLAR con su restriccion correspondiente
-- ============================================================

-- ------------------------------------------------------------
-- 1. VIOLACION DE TIPO - Ttelefono
-- Falla: telefono no empieza en 3
-- ------------------------------------------------------------
INSERT INTO Usuario VALUES (99, 'Juan Perez', NULL, '6001234567');

-- ------------------------------------------------------------
-- 2. VIOLACION DE TIPO - Tcorreo
-- Falla: correo sin formato valido
-- ------------------------------------------------------------
INSERT INTO Usuario VALUES (99, 'Juan Perez', 'correosinforma', '3001234567');

-- ------------------------------------------------------------
-- 3. VIOLACION DE NULIDAD
-- Falla: nombre NOT NULL en Usuario
-- ------------------------------------------------------------
INSERT INTO Usuario VALUES (99, NULL, NULL, NULL);

-- ------------------------------------------------------------
-- 4. VIOLACION DE CLAVE PRIMARIA
-- Falla: idUsuario = 1 ya existe
-- ------------------------------------------------------------
INSERT INTO Usuario VALUES (1, 'Otro Usuario', NULL, NULL);

-- ------------------------------------------------------------
-- 5. VIOLACION DE CLAVE UNICA
-- Falla: nombre 'Cajero' ya existe en Cargo
-- ------------------------------------------------------------
INSERT INTO Cargo VALUES (99, 'Cajero', 'Cargo duplicado');

-- ------------------------------------------------------------
-- 6. VIOLACION DE CLAVE FORANEA - Empleado
-- Falla: idUsuario = 99 no existe en Usuario
-- ------------------------------------------------------------
INSERT INTO Empleado VALUES (99, 1);

-- ------------------------------------------------------------
-- 7. VIOLACION DE CLAVE FORANEA - Venta
-- Falla: idEmpleado = 99 no existe en Empleado
-- ------------------------------------------------------------
INSERT INTO Venta VALUES (99, 99, NULL, 1, SYSDATE, '10:00', NULL, 'pendiente');

-- ------------------------------------------------------------
-- 8. VIOLACION DE TIPO - Tprecio
-- Falla: precioVenta no puede ser 0 ni negativo
-- ------------------------------------------------------------
INSERT INTO Producto VALUES (99, 1, 'Producto malo', NULL, -1000);

-- ------------------------------------------------------------
-- 9. VIOLACION DE TIPO - Tstock
-- Falla: stockActual no puede ser negativo
-- ------------------------------------------------------------
INSERT INTO Inventario VALUES (99, 1, -5, 10, SYSDATE, NULL);

-- ------------------------------------------------------------
-- 10. VIOLACION DE TIPO - estadoPedido
-- Falla: valor fuera del dominio permitido
-- ------------------------------------------------------------
INSERT INTO Venta VALUES (99, 1, NULL, 1, SYSDATE, '11:00', NULL, 'cancelado');

-- ------------------------------------------------------------
-- 11. VIOLACION DE UNICIDAD - Inventario 1 a 1
-- Falla: idProducto = 1 ya tiene inventario
-- ------------------------------------------------------------
INSERT INTO Inventario VALUES (99, 1, 10, 5, SYSDATE, 'Duplicado');

-- ------------------------------------------------------------
-- 12. VIOLACION DE TIPO - Thora
-- Falla: hora con formato incorrecto
-- ------------------------------------------------------------
INSERT INTO Venta VALUES (99, 1, NULL, 1, SYSDATE, '25:99', NULL, 'pendiente');