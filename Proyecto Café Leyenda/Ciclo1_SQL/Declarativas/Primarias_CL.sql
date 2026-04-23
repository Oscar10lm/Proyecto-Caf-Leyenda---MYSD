-- ============================================================
-- CAFE LEYENDA - Ciclo 1: Ventas e Inventario
-- Archivo: Primarias.sql
-- Descripcion: Definicion de claves primarias
-- ============================================================

ALTER TABLE Usuario      ADD CONSTRAINT pk_usuario
    PRIMARY KEY (idUsuario);

ALTER TABLE Cargo        ADD CONSTRAINT pk_cargo
    PRIMARY KEY (idCargo);

ALTER TABLE Empleado     ADD CONSTRAINT pk_empleado
    PRIMARY KEY (idUsuario);

ALTER TABLE Cliente      ADD CONSTRAINT pk_cliente
    PRIMARY KEY (idUsuario);

ALTER TABLE Categoria    ADD CONSTRAINT pk_categoria
    PRIMARY KEY (idCategoria);

ALTER TABLE Producto     ADD CONSTRAINT pk_producto
    PRIMARY KEY (idProducto);

ALTER TABLE Inventario   ADD CONSTRAINT pk_inventario
    PRIMARY KEY (idInventario);

ALTER TABLE Pago         ADD CONSTRAINT pk_pago
    PRIMARY KEY (idMetodoPago);

ALTER TABLE Venta        ADD CONSTRAINT pk_venta
    PRIMARY KEY (idVenta);

ALTER TABLE DetalleVenta ADD CONSTRAINT pk_detalleVenta
    PRIMARY KEY (idDetalleVenta);