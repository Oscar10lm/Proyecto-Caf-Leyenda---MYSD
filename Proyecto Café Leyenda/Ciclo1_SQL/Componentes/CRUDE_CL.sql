-- ============================================================
-- CAFE LEYENDA - Ciclo 1: Componentes
-- Archivo: CRUDE_CL.sql
-- Descripcion: Especificacion de Paquetes de Componentes (Interfaces)
-- ============================================================

-- ========================================================
-- 1. PC_PRODUCTO: Administración del Catálogo e Inventario
-- ========================================================
CREATE OR REPLACE PACKAGE PC_PRODUCTO IS
    -- Agrega una nueva categoría comercial
    PROCEDURE AD_CATEGORIA(n_id IN NUMBER, n_nom IN VARCHAR2, n_desc IN VARCHAR2);
    
    -- Agrega un producto asignado a una categoría
    PROCEDURE AD_PRODUCTO(n_id IN NUMBER, n_nom IN VARCHAR2, n_desc IN VARCHAR2, n_prec IN NUMBER, n_cat IN NUMBER);
    
    -- Inicializa el inventario base para un producto
    PROCEDURE AD_INVENTARIO(n_id IN NUMBER, n_prod IN NUMBER, n_sAct IN NUMBER, n_sMin IN NUMBER, n_sMax IN NUMBER, n_ub IN VARCHAR2);
    
    -- Consulta el catálogo consolidado con sus existencias
    FUNCTION CO_CATALOGO_GENERAL RETURN SYS_REFCURSOR;
END PC_PRODUCTO;
/

-- ========================================================
-- 2. PC_USUARIO: Administración del Sistema de Actores (Herencia)
-- ========================================================
CREATE OR REPLACE PACKAGE PC_USUARIO IS
    -- Registra la supertabla base de Usuario
    PROCEDURE AD_USUARIO(n_id IN NUMBER, n_nom IN VARCHAR2, n_mail IN VARCHAR2, n_tel IN VARCHAR2);
    
    -- Especializa al usuario como Empleado
    PROCEDURE AD_EMPLEADO(n_id IN NUMBER, n_sal IN NUMBER, n_est IN VARCHAR2);
    
    -- Especializa al usuario como Cliente
    PROCEDURE AD_CLIENTE(n_id IN NUMBER, n_punt IN NUMBER, n_tip IN VARCHAR2);
    
    -- Consulta la ficha consolidada de datos cruzados
    FUNCTION CO_CONSULTAR_DATOS(n_id IN NUMBER) RETURN SYS_REFCURSOR;
END PC_USUARIO;
/

-- ========================================================
-- 3. PC_VENTA: Transaccionalidad de la Operación
-- ========================================================
CREATE OR REPLACE PACKAGE PC_VENTA IS
    -- Registra la cabecera de la venta
    PROCEDURE AD_VENTA(n_id IN NUMBER, n_total IN NUMBER, n_emp IN NUMBER, n_cli IN NUMBER);
    
    -- Registra el detalle de una línea de venta (Activa Triggers asociados)
    PROCEDURE AD_DETALLE(n_vta IN NUMBER, n_prod IN NUMBER, n_cant IN NUMBER, n_prec IN NUMBER);
    
    -- Consulta el histórico de ventas por empleado
    FUNCTION CO_VENTAS_POR_EMPLEADO(n_emp IN NUMBER) RETURN SYS_REFCURSOR;
END PC_VENTA;
/
