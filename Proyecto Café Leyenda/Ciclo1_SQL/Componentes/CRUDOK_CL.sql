-- ============================================================
-- CAFE LEYENDA - Ciclo 1: Componentes
-- Archivo: CRUDOK_CL.sql
-- Descripcion: Escenario de Éxito (5 Casos Válidos)
-- ============================================================

SET SERVEROUTPUT ON;

-- 1. Configuración del Entorno base
EXEC PC_PRODUCTO.AD_CATEGORIA(1, 'Bebidas Calientes', 'Categoria estandar de cafeteria');

-- 2. Registro Exitoso de Usuarios (Base y Subclases)
EXEC PC_USUARIO.AD_USUARIO(10, 'Admin Principal', 'admin@cafe.com', '1234567');
EXEC PC_USUARIO.AD_EMPLEADO(10, 2500000, 'ACTIVO');

EXEC PC_USUARIO.AD_USUARIO(20, 'Cliente VIP', 'vip@cliente.com', NULL);
EXEC PC_USUARIO.AD_CLIENTE(20, 150, 'VIP');

-- 3. Registro de Producto e Inventario Inicial
EXEC PC_PRODUCTO.AD_PRODUCTO(500, 'Cafe Tinto Grande', 'Taza de 12oz', 3500, 1);
EXEC PC_PRODUCTO.AD_INVENTARIO(1001, 500, 100, 20, 200, 'Barra 1');

-- 4. Transacción de Venta Exitosa (Detonará automatización de stock)
EXEC PC_VENTA.AD_VENTA(50001, 10500, 10, 20);

-- 5. Inserción de Línea de Venta 
-- (Esto disparará la validación de stock, auto-calculará el subtotal, y restará del inventario)
EXEC PC_VENTA.AD_DETALLE(50001, 500, 3, 3500);

-- Consultas finales para verificar la persistencia de los datos
VAR rc_consulta REFCURSOR;
PROMPT --- CATALOGO FINAL ---
EXEC :rc_consulta := PC_PRODUCTO.CO_CATALOGO_GENERAL;
PRINT rc_consulta;
