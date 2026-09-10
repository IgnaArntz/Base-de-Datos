-- ============================================================
-- EJEMPLO PL/SQL: EVALUACION DE NOTAS
-- 7.0      -> EXCELENTE
-- 4.0 a 6.9 -> APROBADO
-- Menor a 4.0 -> REPROBADO
-- ============================================================

SET SERVEROUTPUT ON;

DECLARE
    v_nota NUMBER := &nota;
BEGIN

    -- Validamos que la nota esté dentro del rango esperado
    IF v_nota < 1 OR v_nota > 7 THEN

        DBMS_OUTPUT.PUT_LINE('ERROR: La nota debe estar entre 1.0 y 7.0');

    ELSIF v_nota = 7 THEN

        DBMS_OUTPUT.PUT_LINE('Nota: ' || v_nota);
        DBMS_OUTPUT.PUT_LINE('Resultado: EXCELENTE');

    ELSIF v_nota >= 4 THEN

        DBMS_OUTPUT.PUT_LINE('Nota: ' || v_nota);
        DBMS_OUTPUT.PUT_LINE('Resultado: APROBADO');

    ELSE

        DBMS_OUTPUT.PUT_LINE('Nota: ' || v_nota);
        DBMS_OUTPUT.PUT_LINE('Resultado: REPROBADO');

    END IF;

END;
/
