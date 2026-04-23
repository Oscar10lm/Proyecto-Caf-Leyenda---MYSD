-- ============================================================
-- CAFE LEYENDA - Ciclo 1: Ventas e Inventario
-- Archivo: Unicas.sql
-- Descripcion: Definicion de claves unicas
-- ============================================================

-- <<U>> nombre en Usuario: no pueden existir dos usuarios con el mismo nombre
ALTER TABLE Usuario ADD CONSTRAINT uq_usuario_nombre
    UNIQUE (nombre);

-- <<U>> nombre en Cargo: no pueden existir dos cargos con el mismo nombre
ALTER TABLE Cargo ADD CONSTRAINT uq_cargo_nombre
    UNIQUE (nombre);

-- <<U>> nombre en Categoria: no pueden existir dos categorias con el mismo nombre
ALTER TABLE Categoria ADD CONSTRAINT uq_categoria_nombre
    UNIQUE (nombre);

-- <<U>> nombre en Producto: no pueden existir dos productos con el mismo nombre
ALTER TABLE Producto ADD CONSTRAINT uq_producto_nombre
    UNIQUE (nombre);

-- <<U>> nombre en Pago: no pueden existir dos metodos de pago con el mismo nombre
ALTER TABLE Pago ADD CONSTRAINT uq_pago_nombre
    UNIQUE (nombre);

-- Un producto solo puede tener un registro de inventario (relacion 1 a 1)
ALTER TABLE Inventario ADD CONSTRAINT uq_inventario_producto
    UNIQUE (idProducto);

-- correo unico por usuario si se registra
ALTER TABLE Usuario ADD CONSTRAINT uq_usuario_correo
    UNIQUE (correo);