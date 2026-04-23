-- ============================================================
-- CAFE LEYENDA - Ciclo 1: Ventas e Inventario
-- Archivo: XPoblar.sql
-- Descripcion: Eliminacion de datos
-- ADVERTENCIA: Ejecutar en este orden para respetar las FK
-- ============================================================

DELETE FROM DetalleVenta;
DELETE FROM Venta;
DELETE FROM Inventario;
DELETE FROM Producto;
DELETE FROM Categoria;
DELETE FROM Empleado;
DELETE FROM Cliente;
DELETE FROM Usuario;
DELETE FROM Cargo;
DELETE FROM Pago;

COMMIT;