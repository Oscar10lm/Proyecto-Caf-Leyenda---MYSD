-- ============================================================
-- CAFE LEYENDA - Ciclo 1
-- Archivo: Foraneas_CL.sql
-- Descripcion: Malla de Integridad Referencial (FK)
-- ============================================================

-- HERENCIA (1:1)
ALTER TABLE Empleado
    ADD CONSTRAINT FK_Empleado_Usuario FOREIGN KEY (idUsuario)
    REFERENCES Usuario(idUsuario);

ALTER TABLE Cliente
    ADD CONSTRAINT FK_Cliente_Usuario FOREIGN KEY (idUsuario)
    REFERENCES Usuario(idUsuario);

-- ORGANIZACION Y CATALOGO
ALTER TABLE CargoEmpleado
    ADD CONSTRAINT FK_CargoEmp_Cargo FOREIGN KEY (idCargo)
    REFERENCES Cargo(idCargo);

ALTER TABLE CargoEmpleado
    ADD CONSTRAINT FK_CargoEmp_Empleado FOREIGN KEY (idEmpleado)
    REFERENCES Empleado(idUsuario);

ALTER TABLE Producto
    ADD CONSTRAINT FK_Producto_Categoria FOREIGN KEY (idCategoria)
    REFERENCES Categoria(idCategoria);

-- INVENTARIO
ALTER TABLE Inventario
    ADD CONSTRAINT FK_Inventario_Producto FOREIGN KEY (idProducto)
    REFERENCES Producto(idProducto);

ALTER TABLE LoteProducto
    ADD CONSTRAINT FK_Lote_Producto FOREIGN KEY (idProducto)
    REFERENCES Producto(idProducto);

-- COMPRAS Y PROVEEDORES
ALTER TABLE DireccionProveedor
    ADD CONSTRAINT FK_Direccion_Proveedor FOREIGN KEY (idProveedor)
    REFERENCES Proveedor(idProveedor);

ALTER TABLE Compra
    ADD CONSTRAINT FK_Compra_Proveedor FOREIGN KEY (idProveedor)
    REFERENCES Proveedor(idProveedor);

ALTER TABLE DetalleCompra
    ADD CONSTRAINT FK_DetComp_Compra FOREIGN KEY (idCompra)
    REFERENCES Compra(idCompra);

ALTER TABLE DetalleCompra
    ADD CONSTRAINT FK_DetComp_Producto FOREIGN KEY (idProducto)
    REFERENCES Producto(idProducto);

-- VENTAS Y PAGOS
ALTER TABLE Venta
    ADD CONSTRAINT FK_Venta_Empleado FOREIGN KEY (idEmpleado)
    REFERENCES Empleado(idUsuario);

ALTER TABLE Venta
    ADD CONSTRAINT FK_Venta_Cliente FOREIGN KEY (idCliente)
    REFERENCES Cliente(idUsuario);

ALTER TABLE DetalleVenta
    ADD CONSTRAINT FK_DetVta_Venta FOREIGN KEY (idVenta)
    REFERENCES Venta(idVenta);

ALTER TABLE DetalleVenta
    ADD CONSTRAINT FK_DetVta_Producto FOREIGN KEY (idProducto)
    REFERENCES Producto(idProducto);

ALTER TABLE Pago
    ADD CONSTRAINT FK_Pago_Venta FOREIGN KEY (idVenta)
    REFERENCES Venta(idVenta);

ALTER TABLE Pago
    ADD CONSTRAINT FK_Pago_Metodo FOREIGN KEY (idMetodoPago)
    REFERENCES MetodoPago(idMetodoPago);

-- TRAZABILIDAD DE FLUJOS (MOVIMIENTOS)
ALTER TABLE MovimientoInventario
    ADD CONSTRAINT FK_Mov_Inventario FOREIGN KEY (idInventario)
    REFERENCES Inventario(idInventario);

-- Relación Compuesta con DetalleVenta (Garantiza rastreo del renglón exacto)
ALTER TABLE MovimientoInventario
    ADD CONSTRAINT FK_Mov_DetalleVenta FOREIGN KEY (idVenta, idProducto)
    REFERENCES DetalleVenta(idVenta, idProducto);

-- Relación Compuesta con DetalleCompra
ALTER TABLE MovimientoInventario
    ADD CONSTRAINT FK_Mov_DetalleCompra FOREIGN KEY (idCompra, idProducto)
    REFERENCES DetalleCompra(idCompra, idProducto);