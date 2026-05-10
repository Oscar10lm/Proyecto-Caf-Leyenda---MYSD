-- ============================================================
-- CAFE LEYENDA - Ciclo 1: Ventas, Compras e Inventario
-- Archivo: Tablas_CL.sql
-- Descripcion: Creacion fisica de las 18 tablas base
-- ============================================================

CREATE TABLE Usuario (
    idUsuario   NUMBER(10)      NOT NULL,
    nombre      VARCHAR2(100)   NOT NULL,
    correo      VARCHAR2(100),
    telefono    VARCHAR2(20)
);

CREATE TABLE Empleado (
    idUsuario   NUMBER(10)      NOT NULL,
    salario     NUMBER(12,2)    NOT NULL,
    estado      VARCHAR2(20)    NOT NULL
);

CREATE TABLE Cliente (
    idUsuario       NUMBER(10)      NOT NULL,
    puntosLealtad   NUMBER(10)      NOT NULL,
    tipoCliente     VARCHAR2(50)    NOT NULL
);

CREATE TABLE Cargo (
    idCargo     NUMBER(10)      NOT NULL,
    nombre      VARCHAR2(100)   NOT NULL,
    descripcion VARCHAR2(255)
);

CREATE TABLE CargoEmpleado (
    idCargo     NUMBER(10)      NOT NULL,
    idEmpleado  NUMBER(10)      NOT NULL
);

CREATE TABLE Categoria (
    idCategoria NUMBER(10)      NOT NULL,
    nombre      VARCHAR2(100)   NOT NULL,
    descripcion VARCHAR2(255)
);

CREATE TABLE Producto (
    idProducto  NUMBER(10)      NOT NULL,
    nombre      VARCHAR2(100)   NOT NULL,
    descripcion VARCHAR2(255),
    precioVenta NUMBER(12,2)    NOT NULL,
    idCategoria NUMBER(10)      NOT NULL
);

CREATE TABLE Inventario (
    idInventario    NUMBER(10)      NOT NULL,
    idProducto      NUMBER(10)      NOT NULL,
    stockActual     NUMBER(10)      NOT NULL,
    stockMinimo     NUMBER(10)      NOT NULL,
    stockMaximo     NUMBER(10)      NOT NULL,
    ubicacion       VARCHAR2(100)   NOT NULL
);

CREATE TABLE LoteProducto (
    idLote              NUMBER(10)      NOT NULL,
    idProducto          NUMBER(10)      NOT NULL,
    fechaProduccion     DATE            NOT NULL,
    fechaVencimiento    DATE            NOT NULL,
    cantidadDisponible  NUMBER(10)      NOT NULL
);

CREATE TABLE Proveedor (
    idProveedor NUMBER(10)      NOT NULL
);

CREATE TABLE DireccionProveedor (
    idDireccion NUMBER(10)      NOT NULL,
    idProveedor NUMBER(10)      NOT NULL,
    direccion   VARCHAR2(255)   NOT NULL
);

CREATE TABLE Compra (
    idCompra    NUMBER(10)      NOT NULL,
    fecha       DATE            NOT NULL,
    total       NUMBER(12,2)    NOT NULL,
    idProveedor NUMBER(10)      NOT NULL
);

CREATE TABLE DetalleCompra (
    idCompra        NUMBER(10)      NOT NULL,
    idProducto      NUMBER(10)      NOT NULL,
    cantidad        NUMBER(10)      NOT NULL,
    precioCompra    NUMBER(12,2)    NOT NULL,
    subtotal        NUMBER(12,2)    NOT NULL
);

CREATE TABLE Venta (
    idVenta     NUMBER(10)      NOT NULL,
    fechaHora   TIMESTAMP       NOT NULL,
    total       NUMBER(12,2)    NOT NULL,
    idEmpleado  NUMBER(10)      NOT NULL,
    idCliente   NUMBER(10)      NOT NULL
);

CREATE TABLE DetalleVenta (
    idVenta         NUMBER(10)      NOT NULL,
    idProducto      NUMBER(10)      NOT NULL,
    cantidad        NUMBER(10)      NOT NULL,
    precioUnitario  NUMBER(12,2)    NOT NULL,
    subtotal        NUMBER(12,2)    NOT NULL
);

CREATE TABLE MetodoPago (
    idMetodoPago NUMBER(10)     NOT NULL,
    nombre       VARCHAR2(50)   NOT NULL
);

CREATE TABLE Pago (
    idPago          NUMBER(10)      NOT NULL,
    monto           NUMBER(12,2)    NOT NULL,
    fechaHora       TIMESTAMP       NOT NULL,
    idVenta         NUMBER(10)      NOT NULL,
    idMetodoPago    NUMBER(10)      NOT NULL
);

CREATE TABLE MovimientoInventario (
    idMovimiento    NUMBER(10)      NOT NULL,
    idInventario    NUMBER(10)      NOT NULL,
    fechaHora       TIMESTAMP       NOT NULL,
    cantidad        NUMBER(10)      NOT NULL,
    tipoMovimiento  VARCHAR2(30)    NOT NULL,
    motivo          VARCHAR2(255),
    idVenta         NUMBER(10),
    idCompra        NUMBER(10),
    idProducto      NUMBER(10)
);