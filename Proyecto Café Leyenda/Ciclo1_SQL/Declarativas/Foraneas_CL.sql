-- ============================================================
-- CAFE LEYENDA - Ciclo 1: Ventas e Inventario
-- Archivo: Foraneas.sql
-- Descripcion: Definicion de claves foraneas
-- ============================================================

-- Empleado hereda de Usuario (idUsuario es PK y FK)
ALTER TABLE Empleado ADD CONSTRAINT fk_empleado_usuario
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario);

-- Empleado pertenece a un Cargo
ALTER TABLE Empleado ADD CONSTRAINT fk_empleado_cargo
    FOREIGN KEY (idCargo) REFERENCES Cargo(idCargo);

-- Cliente hereda de Usuario (idUsuario es PK y FK)
ALTER TABLE Cliente ADD CONSTRAINT fk_cliente_usuario
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario);

-- Producto pertenece a una Categoria
ALTER TABLE Producto ADD CONSTRAINT fk_producto_categoria
    FOREIGN KEY (idCategoria) REFERENCES Categoria(idCategoria);

-- Inventario controla un Producto (relacion 1 a 1)
ALTER TABLE Inventario ADD CONSTRAINT fk_inventario_producto
    FOREIGN KEY (idProducto) REFERENCES Producto(idProducto);

-- Venta es registrada por un Empleado
ALTER TABLE Venta ADD CONSTRAINT fk_venta_empleado
    FOREIGN KEY (idEmpleado) REFERENCES Empleado(idUsuario);

-- Venta puede pertenecer a un Cliente (opcional)
ALTER TABLE Venta ADD CONSTRAINT fk_venta_cliente
    FOREIGN KEY (idCliente) REFERENCES Cliente(idUsuario);

-- Venta tiene un metodo de Pago
ALTER TABLE Venta ADD CONSTRAINT fk_venta_pago
    FOREIGN KEY (idMetodoPago) REFERENCES Pago(idMetodoPago);

-- DetalleVenta pertenece a una Venta (composicion)
ALTER TABLE DetalleVenta ADD CONSTRAINT fk_detalle_venta
    FOREIGN KEY (idVenta) REFERENCES Venta(idVenta);

-- DetalleVenta referencia un Producto
ALTER TABLE DetalleVenta ADD CONSTRAINT fk_detalle_producto
    FOREIGN KEY (idProducto) REFERENCES Producto(idProducto);