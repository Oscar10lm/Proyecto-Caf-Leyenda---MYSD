-- ============================================================
-- CAFE LEYENDA - Ciclo 1: Componentes
-- Archivo: CRUDNoOK_CL.sql
-- Descripcion: Escenario de Fallo Controlado (3 Casos Inválidos)
-- ============================================================

SET SERVEROUTPUT ON;

PROMPT =======================================================
PROMPT INICIO DE PRUEBAS DE PROTECCION DE DATOS (COMPONENTES)
PROMPT =======================================================

-- 1. Intento de duplicación de UNIQUE KEY (AK-1 Nombre de Producto)
PROMPT Caso 1: Nombre Duplicado
BEGIN
    PC_PRODUCTO.AD_PRODUCTO(501, 'Cafe Tinto Grande', 'Intento de duplicado', 4000, 1);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('SISTEMA PROTEGIDO: Error capturado al intentar duplicar Nombre -> ' || SQLERRM);
END;
/

-- 2. Intento de venta de producto sin stock suficiente (Disparo de Trigger preventivo)
PROMPT Caso 2: Stock Insuficiente
BEGIN
    -- Intentamos vender 9999 unidades del producto 500 (que configuramos con 100 existencias)
    PC_VENTA.AD_DETALLE(50001, 500, 9999, 3500);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('SISTEMA PROTEGIDO: Venta Bloqueda -> ' || SQLERRM);
END;
/

-- 3. Intento de asignación de Empleado a un ID inexistente en la tabla base Usuario (Violación FK de Herencia)
PROMPT Caso 3: Empleado Sin Usuario Padre
BEGIN
    PC_USUARIO.AD_EMPLEADO(99999, 1000000, 'ACTIVO');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('SISTEMA PROTEGIDO: Integridad de Herencia Activada -> ' || SQLERRM);
END;
/
