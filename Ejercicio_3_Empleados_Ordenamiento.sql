-- ============================================================
-- EJERCICIO PL/SQL / ORACLE SQL DEVELOPER
-- CARGAR 3 EMPLEADOS Y ORDENARLOS
-- ============================================================
-- 1) Ejecutar una sola vez para crear la tabla.
-- Si la tabla ya existe, omite esta parte.
-- ============================================================

CREATE TABLE DEMO_EMPLEADOS (
    id_empleado NUMBER PRIMARY KEY,
    nombre      VARCHAR2(100),
    sueldo      NUMBER
);

-- ============================================================
-- 2) CARGAR 3 EMPLEADOS
-- ============================================================
-- Al ejecutar con F5, Oracle solicitará los 6 valores.

BEGIN

    INSERT INTO DEMO_EMPLEADOS
    VALUES (1, '&empleado1', &sueldo1);

    INSERT INTO DEMO_EMPLEADOS
    VALUES (2, '&empleado2', &sueldo2);

    INSERT INTO DEMO_EMPLEADOS
    VALUES (3, '&empleado3', &sueldo3);

    COMMIT;

END;
/

-- ============================================================
-- 3) MOSTRAR EMPLEADOS EN ORDEN ALFABÉTICO
-- ============================================================

SELECT
    id_empleado,
    nombre,
    sueldo
FROM DEMO_EMPLEADOS
ORDER BY nombre ASC;

-- ============================================================
-- 4) MOSTRAR EMPLEADOS POR SUELDO DE MAYOR A MENOR
-- ============================================================

SELECT
    id_empleado,
    nombre,
    sueldo
FROM DEMO_EMPLEADOS
ORDER BY sueldo DESC;

-- ============================================================
-- 5) OPCIONAL: MOSTRAR AMBOS CRITERIOS EN UNA SOLA CONSULTA
--    Primero sueldo mayor a menor y, en caso de empate,
--    nombre en orden alfabético.
-- ============================================================

SELECT
    id_empleado,
    nombre,
    sueldo
FROM DEMO_EMPLEADOS
ORDER BY sueldo DESC, nombre ASC;

-- ============================================================
-- EJEMPLO DE DATOS
-- Empleado 1: Ana, sueldo 850000
-- Empleado 2: Carlos, sueldo 1200000
-- Empleado 3: Beatriz, sueldo 950000
--
-- ORDEN ALFABÉTICO:
-- Ana
-- Beatriz
-- Carlos
--
-- ORDEN POR SUELDO DESC:
-- Carlos     1200000
-- Beatriz     950000
-- Ana         850000
-- ============================================================
