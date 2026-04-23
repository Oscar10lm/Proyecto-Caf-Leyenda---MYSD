ALTER TABLE DetalleVenta
ADD CONSTRAINT fk_detalle_producto
FOREIGN KEY (idProducto) REFERENCES Producto(idProducto)
ON DELETE RESTRICT;

ALTER TABLE Producto
ADD CONSTRAINT fk_producto_categoria
FOREIGN KEY (idCategoria) REFERENCES Categoria(idCategoria)
ON DELETE RESTRICT;
