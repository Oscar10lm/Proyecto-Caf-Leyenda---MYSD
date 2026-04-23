INSERT INTO Categoria VALUES (1, 'Bebidas', 'Bebidas calientes');

INSERT INTO Producto VALUES (1, 'Café', 'Negro', 4000, 0, 1);

-- Intentar borrar categoría (debe fallar)
DELETE FROM Categoria WHERE idCategoria = 1;
