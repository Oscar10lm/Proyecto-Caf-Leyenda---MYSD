ALTER TABLE Inventario 
ADD CONSTRAINT chk_stock_positivo 
CHECK (stockActual >= 0);

ALTER TABLE LoteProducto 
ADD CONSTRAINT chk_fechas_lote 
CHECK (fechaVencimiento > fechaProduccion);

ALTER TABLE DetalleVenta 
ADD CONSTRAINT chk_precio_positivo 
CHECK (precioUnitario > 0);
