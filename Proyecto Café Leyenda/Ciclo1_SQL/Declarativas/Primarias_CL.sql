-- ============================================================
-- CAFE LEYENDA - Ciclo 1
-- Archivo: Primarias_CL.sql
-- Descripcion: Definicion de claves primarias físicas
-- ============================================================

ALTER TABLE Usuario
    ADD CONSTRAINT PK_Usuario PRIMARY KEY (idUsuario);

ALTER TABLE Empleado
    ADD CONSTRAINT PK_Empleado PRIMARY KEY (idUsuario);

ALTER TABLE Cliente
    ADD CONSTRAINT PK_Cliente PRIMARY KEY (idUsuario);

ALTER TABLE Cargo
    ADD CONSTRAINT PK_Cargo PRIMARY KEY (idCargo);

ALTER TABLE CargoEmpleado
    ADD CONSTRAINT PK_CargoEmpleado PRIMARY KEY (idCargo, idEmpleado);

ALTER TABLE Categoria
    ADD CONSTRAINT PK_Categoria PRIMARY KEY (idCategoria);

ALTER TABLE Producto
    ADD CONSTRAINT PK_Producto PRIMARY KEY (idProducto);

ALTER TABLE Inventario
    ADD CONSTRAINT PK_Inventario PRIMARY KEY (idInventario);

ALTER TABLE LoteProducto
    ADD CONSTRAINT PK_LoteProducto PRIMARY KEY (idLote);

ALTER TABLE Proveedor
    ADD CONSTRAINT PK_Proveedor PRIMARY KEY (idProveedor);

ALTER TABLE DireccionProveedor
    ADD CONSTRAINT PK_DireccionProveedor PRIMARY KEY (idDireccion);

ALTER TABLE Compra
    ADD CONSTRAINT PK_Compra PRIMARY KEY (idCompra);

ALTER TABLE DetalleCompra
    ADD CONSTRAINT PK_DetalleCompra PRIMARY KEY (idCompra, idProducto);

ALTER TABLE Venta
    ADD CONSTRAINT PK_Venta PRIMARY KEY (idVenta);

ALTER TABLE DetalleVenta
    ADD CONSTRAINT PK_DetalleVenta PRIMARY KEY (idVenta, idProducto);

ALTER TABLE MetodoPago
    ADD CONSTRAINT PK_MetodoPago PRIMARY KEY (idMetodoPago);

ALTER TABLE Pago
    ADD CONSTRAINT PK_Pago PRIMARY KEY (idPago);

ALTER TABLE MovimientoInventario
    ADD CONSTRAINT PK_MovimientoInventario PRIMARY KEY (idMovimiento);