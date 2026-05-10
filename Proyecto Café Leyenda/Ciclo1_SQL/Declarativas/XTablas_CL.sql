-- ============================================================
-- CAFE LEYENDA - Ciclo 1
-- Archivo: XTablas_CL.sql
-- Descripcion: Borrado fisico en orden inverso de dependencias
-- ============================================================

-- 1. Tablas de registro operacional / trazabilidad dependiente
DROP TABLE MovimientoInventario;
DROP TABLE Pago;
DROP TABLE DetalleVenta;
DROP TABLE DetalleCompra;

-- 2. Cabeceras transaccionales
DROP TABLE Venta;
DROP TABLE Compra;

-- 3. Tablas secundarias e inventarios
DROP TABLE DireccionProveedor;
DROP TABLE Inventario;
DROP TABLE LoteProducto;
DROP TABLE CargoEmpleado;

-- 4. Tablas primarias de catálogo
DROP TABLE Producto;

-- 5. Subclases especializadas
DROP TABLE Empleado;
DROP TABLE Cliente;

-- 6. Entidades maestras base
DROP TABLE Usuario;
DROP TABLE Cargo;
DROP TABLE Categoria;
DROP TABLE MetodoPago;
DROP TABLE Proveedor;