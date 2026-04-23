-- ============================================================
-- CAFE LEYENDA - Ciclo 1: Ventas e Inventario
-- Archivo: Atributos.sql
-- Descripcion: Definicion de restricciones por atributo (Tipos)
-- ============================================================

-- USUARIO
-- Ttelefono: 10 digitos que empiece en 3 (formato colombiano)
ALTER TABLE Usuario ADD CONSTRAINT chk_usuario_telefono
    CHECK (REGEXP_LIKE(telefono, '^3[0-9]{9}$'));

-- Tcorreo: debe contener @ y un dominio
ALTER TABLE Usuario ADD CONSTRAINT chk_usuario_correo
    CHECK (REGEXP_LIKE(correo, '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'));

-- Tnombre: solo letras y espacios
ALTER TABLE Usuario ADD CONSTRAINT chk_usuario_nombre
    CHECK (REGEXP_LIKE(nombre, '^[A-Za-zÁÉÍÓÚáéíóúÑñ ]+$'));

-- CARGO
ALTER TABLE Cargo ADD CONSTRAINT chk_cargo_nombre
    CHECK (REGEXP_LIKE(nombre, '^[A-Za-zÁÉÍÓÚáéíóúÑñ ]+$'));

-- CATEGORIA
ALTER TABLE Categoria ADD CONSTRAINT chk_categoria_nombre
    CHECK (REGEXP_LIKE(nombre, '^[A-Za-zÁÉÍÓÚáéíóúÑñ ]+$'));

-- PRODUCTO
-- Tprecio: valor decimal positivo mayor a 0
ALTER TABLE Producto ADD CONSTRAINT chk_producto_precio
    CHECK (precioVenta > 0);

ALTER TABLE Producto ADD CONSTRAINT chk_producto_nombre
    CHECK (REGEXP_LIKE(nombre, '^[A-Za-zÁÉÍÓÚáéíóúÑñ0-9 ]+$'));

-- INVENTARIO
-- Tstock: numero entero no negativo
ALTER TABLE Inventario ADD CONSTRAINT chk_inventario_stockActual
    CHECK (stockActual >= 0);

ALTER TABLE Inventario ADD CONSTRAINT chk_inventario_stockMinimo
    CHECK (stockMinimo >= 0);

-- PAGO
ALTER TABLE Pago ADD CONSTRAINT chk_pago_nombre
    CHECK (REGEXP_LIKE(nombre, '^[A-Za-zÁÉÍÓÚáéíóúÑñ ]+$'));

-- VENTA
ALTER TABLE Venta ADD CONSTRAINT chk_venta_estadoPedido
    CHECK (estadoPedido IN ('pendiente', 'entregado'));

-- Thora: formato HH:MM
ALTER TABLE Venta ADD CONSTRAINT chk_venta_hora
    CHECK (REGEXP_LIKE(hora, '^([01][0-9]|2[0-3]):[0-5][0-9]$'));

-- DETALLE VENTA
-- Tcantidad: entero positivo mayor o igual a 1
ALTER TABLE DetalleVenta ADD CONSTRAINT chk_detalle_cantidad
    CHECK (cantidad >= 1);

ALTER TABLE DetalleVenta ADD CONSTRAINT chk_detalle_precioUnitario
    CHECK (precioUnitario > 0);

ALTER TABLE DetalleVenta ADD CONSTRAINT chk_detalle_subtotal
    CHECK (subtotal > 0);