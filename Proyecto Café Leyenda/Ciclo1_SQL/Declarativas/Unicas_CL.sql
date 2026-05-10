-- ============================================================
-- CAFE LEYENDA - Ciclo 1
-- Archivo: Unicas_CL.sql
-- Descripcion: Definicion de Claves Alternativas (Alternate Keys / UK)
-- ============================================================

ALTER TABLE Usuario
    ADD CONSTRAINT AK_Usuario_Nombre UNIQUE (nombre);

ALTER TABLE Cargo
    ADD CONSTRAINT AK_Cargo_Nombre UNIQUE (nombre);

ALTER TABLE Categoria
    ADD CONSTRAINT AK_Categoria_Nombre UNIQUE (nombre);

ALTER TABLE Producto
    ADD CONSTRAINT AK_Producto_Nombre UNIQUE (nombre);

ALTER TABLE MetodoPago
    ADD CONSTRAINT AK_MetodoPago_Nombre UNIQUE (nombre);