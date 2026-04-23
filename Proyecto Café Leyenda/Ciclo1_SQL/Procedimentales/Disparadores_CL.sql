CREATE OR REPLACE TRIGGER tr_validar_stock
BEFORE INSERT ON DetalleVenta
FOR EACH ROW
DECLARE
    stock_disponible NUMBER;
BEGIN
    SELECT stockActual INTO stock_disponible
    FROM Inventario
    WHERE idProducto = :NEW.idProducto;

    IF stock_disponible < :NEW.cantidad THEN
        RAISE_APPLICATION_ERROR(-20001, 'Stock insuficiente');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER tr_actualizar_stock
AFTER INSERT ON DetalleVenta
FOR EACH ROW
BEGIN
    UPDATE Inventario
    SET stockActual = stockActual - :NEW.cantidad
    WHERE idProducto = :NEW.idProducto;
END;
/

CREATE OR REPLACE TRIGGER tr_calcular_subtotal
BEFORE INSERT ON DetalleVenta
FOR EACH ROW
BEGIN
    :NEW.subtotal := :NEW.cantidad * :NEW.precioUnitario;
END;
/
