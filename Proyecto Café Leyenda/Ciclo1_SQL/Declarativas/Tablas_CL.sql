-- ============================================================
-- CAFE LEYENDA - Ciclo 1: Ventas e Inventario
-- Archivo: Tablas.sql
-- Descripcion: Creacion de tablas
-- ============================================================

CREATE TABLE Usuario (
    idUsuario   NUMBER,
    nombre      VARCHAR2(50)    NOT NULL,
    correo      VARCHAR2(60),
    telefono    CHAR(10)
);

CREATE TABLE Cargo (
    idCargo         NUMBER,
    nombre          VARCHAR2(40)    NOT NULL,
    descripcion     VARCHAR2(200)
);

CREATE TABLE Empleado (
    idUsuario   NUMBER,
    idCargo     NUMBER          NOT NULL
);

CREATE TABLE Cliente (
    idUsuario   NUMBER
);

CREATE TABLE Categoria (
    idCategoria     NUMBER,
    nombre          VARCHAR2(40)    NOT NULL,
    descripcion     VARCHAR2(200)
);

CREATE TABLE Producto (
    idProducto      NUMBER,
    idCategoria     NUMBER          NOT NULL,
    nombre          VARCHAR2(40)    NOT NULL,
    descripcion     VARCHAR2(200),
    precioVenta     NUMBER(10,2)    NOT NULL
);

CREATE TABLE Inventario (
    idInventario            NUMBER,
    idProducto              NUMBER          NOT NULL,
    stockActual             NUMBER(6)       NOT NULL,
    stockMinimo             NUMBER(6)       NOT NULL,
    fechaActualizacion      DATE            NOT NULL,
    motivoActualizacion     VARCHAR2(200)
);

CREATE TABLE Pago (
    idMetodoPago    NUMBER,
    nombre          VARCHAR2(10)    NOT NULL
);

CREATE TABLE Venta (
    idVenta         NUMBER,
    idEmpleado      NUMBER          NOT NULL,
    idCliente       NUMBER,
    idMetodoPago    NUMBER          NOT NULL,
    fecha           DATE            NOT NULL,
    hora            CHAR(5)         NOT NULL,
    total           NUMBER(10,2),
    estadoPedido    VARCHAR2(10)    DEFAULT 'pendiente'
);

CREATE TABLE DetalleVenta (
    idDetalleVenta  NUMBER,
    idVenta         NUMBER          NOT NULL,
    idProducto      NUMBER          NOT NULL,
    cantidad        NUMBER(4)       NOT NULL,
    precioUnitario  NUMBER(10,2)    NOT NULL,
    subtotal        NUMBER(10,2)
);