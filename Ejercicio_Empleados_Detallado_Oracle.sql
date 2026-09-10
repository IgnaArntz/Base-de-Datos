-- ============================================================
-- EJERCICIO DE PRACTICA
-- CARGAR 3 EMPLEADOS Y ORDENAR POR NOMBRE Y SUELDO
-- Oracle SQL / PL-SQL
-- ============================================================
--
-- OBJETIVO DEL EJERCICIO
--
-- En este ejercicio aprenderemos a:
-- 1. Crear una tabla.
-- 2. Insertar empleados.
-- 3. Guardar nombre y sueldo.
-- 4. Consultar los datos.
-- 5. Ordenar los empleados alfabeticamente.
-- 6. Ordenar los empleados por sueldo de mayor a menor.
--
-- IMPORTANTE:
-- Este ejercicio esta escrito de forma detallada para estudiar.
-- No se pretende memorizarlo completo.
-- La idea es reconocer que instruccion se utiliza para cada necesidad.
--
-- ============================================================
-- PARTE 1 - CREAR LA TABLA
-- ============================================================
--
-- Una tabla permite almacenar informacion.
--
-- En este caso necesitamos:
-- id_empleado -> identificador del empleado
-- nombre      -> nombre del empleado
-- sueldo      -> sueldo del empleado
--
-- ============================================================

CREATE TABLE EMPLEADO_PRACTICA (
    id_empleado NUMBER PRIMARY KEY,
    nombre      VARCHAR2(50),
    sueldo      NUMBER
);

-- ============================================================
-- EXPLICACION
-- ============================================================
--
-- CREATE TABLE
-- Permite crear una nueva tabla en la base de datos.
--
-- EMPLEADO_PRACTICA
-- Es el nombre que le damos a la tabla.
--
-- id_empleado NUMBER PRIMARY KEY
-- Crea una columna numerica para identificar al empleado.
-- PRIMARY KEY significa que ese valor identifica de forma unica
-- cada registro.
--
-- nombre VARCHAR2(50)
-- Guarda texto de hasta 50 caracteres.
--
-- sueldo NUMBER
-- Guarda el sueldo del empleado.
--
-- ============================================================
-- PARTE 2 - INSERTAR LOS 3 EMPLEADOS
-- ============================================================
--
-- INSERT INTO permite agregar registros a una tabla.
--
-- La estructura basica es:
--
-- INSERT INTO nombre_tabla
-- VALUES (valor1, valor2, valor3);
--
-- ============================================================

INSERT INTO EMPLEADO_PRACTICA
VALUES (1, 'Ana', 850000);

INSERT INTO EMPLEADO_PRACTICA
VALUES (2, 'Carlos', 1200000);

INSERT INTO EMPLEADO_PRACTICA
VALUES (3, 'Beatriz', 950000);

-- ============================================================
-- EXPLICACION
-- ============================================================
--
-- El primer INSERT agrega:
-- ID       = 1
-- NOMBRE   = Ana
-- SUELDO   = 850000
--
-- El segundo INSERT agrega:
-- ID       = 2
-- NOMBRE   = Carlos
-- SUELDO   = 1200000
--
-- El tercer INSERT agrega:
-- ID       = 3
-- NOMBRE   = Beatriz
-- SUELDO   = 950000
--
-- Despues de los INSERT podemos consultar la tabla.
--
-- ============================================================
-- PARTE 3 - GUARDAR LOS CAMBIOS
-- ============================================================
--
-- COMMIT confirma los cambios realizados en la base de datos.
--
-- ============================================================

COMMIT;

-- ============================================================
-- PARTE 4 - MOSTRAR LOS EMPLEADOS
-- ============================================================
--
-- SELECT permite consultar informacion almacenada en la tabla.
--
-- ============================================================

SELECT
    id_empleado,
    nombre,
    sueldo
FROM EMPLEADO_PRACTICA;

-- ============================================================
-- EXPLICACION
-- ============================================================
--
-- SELECT
-- Indica que queremos consultar informacion.
--
-- id_empleado, nombre, sueldo
-- Son las columnas que queremos mostrar.
--
-- FROM EMPLEADO_PRACTICA
-- Indica desde que tabla queremos obtener los datos.
--
-- En este momento los registros aparecen en el orden en que
-- Oracle los devuelve; no debemos asumir que estan ordenados.
--
-- ============================================================
-- PARTE 5 - ORDEN ALFABETICO
-- ============================================================
--
-- ORDER BY permite ordenar los resultados de una consulta.
--
-- ASC significa ASCENDENTE.
--
-- Para nombres:
-- A -> B -> C -> D ...
--
-- ============================================================

SELECT
    id_empleado,
    nombre,
    sueldo
FROM EMPLEADO_PRACTICA
ORDER BY nombre ASC;

-- ============================================================
-- EXPLICACION
-- ============================================================
--
-- ORDER BY nombre
-- Le dice a Oracle que debe ordenar utilizando la columna nombre.
--
-- ASC
-- Indica que el orden sera ascendente, es decir, alfabeticamente
-- desde A hasta Z.
--
-- Resultado esperado:
--
-- Ana
-- Beatriz
-- Carlos
--
-- ============================================================
-- PARTE 6 - ORDENAR POR SUELDO DE MAYOR A MENOR
-- ============================================================
--
-- DESC significa DESCENDENTE.
--
-- Para sueldos:
-- mayor -> menor
--
-- ============================================================

SELECT
    id_empleado,
    nombre,
    sueldo
FROM EMPLEADO_PRACTICA
ORDER BY sueldo DESC;

-- ============================================================
-- EXPLICACION
-- ============================================================
--
-- ORDER BY sueldo
-- Indica que el orden se realizara utilizando la columna sueldo.
--
-- DESC
-- Indica que debe mostrar primero el valor mas alto y despues
-- los valores menores.
--
-- Resultado esperado:
--
-- Carlos     1200000
-- Beatriz     950000
-- Ana         850000
--
-- ============================================================
-- PARTE 7 - ORDENAR POR DOS CRITERIOS
-- ============================================================
--
-- Tambien podemos ordenar utilizando mas de una columna.
--
-- Primero ordenamos por sueldo de mayor a menor.
-- Si dos empleados tienen el mismo sueldo, ordenamos sus nombres
-- alfabeticamente.
--
-- ============================================================

SELECT
    id_empleado,
    nombre,
    sueldo
FROM EMPLEADO_PRACTICA
ORDER BY sueldo DESC, nombre ASC;

-- ============================================================
-- EXPLICACION FINAL
-- ============================================================
--
-- ORDER BY sueldo DESC
-- Primer criterio: sueldo, de mayor a menor.
--
-- nombre ASC
-- Segundo criterio: nombre, de A a Z, pero solo se utiliza
-- para resolver empates en el primer criterio.
--
-- ============================================================
-- PARTE 8 - ASOCIACIONES PARA RECORDAR
-- ============================================================
--
-- Cuando el enunciado diga:
--
-- "ordenar alfabeticamente"
--       |
--       v
-- ORDER BY nombre ASC;
--
-- Cuando diga:
--
-- "ordenar de mayor a menor"
--       |
--       v
-- ORDER BY sueldo DESC;
--
-- Cuando diga:
--
-- "ordenar de menor a mayor"
--       |
--       v
-- ORDER BY sueldo ASC;
--
-- ============================================================
-- PARTE 9 - ESTRUCTURA GENERAL DE UNA CONSULTA
-- ============================================================
--
-- SELECT columnas
-- FROM tabla
-- WHERE condicion
-- ORDER BY columna ASC o DESC;
--
-- Ejemplo:
--
-- SELECT nombre, sueldo
-- FROM EMPLEADO_PRACTICA
-- WHERE sueldo >= 900000
-- ORDER BY sueldo DESC;
--
-- En este ejemplo:
--
-- SELECT  -> que informacion quiero ver
-- FROM    -> de donde la obtengo
-- WHERE   -> que registros quiero filtrar
-- ORDER BY -> como quiero ordenar el resultado
--
-- ============================================================
-- NOTA
-- ============================================================
--
-- Si vuelves a ejecutar todo el ejercicio, CREATE TABLE puede
-- producir un error porque la tabla ya existe.
--
-- Para volver a practicar desde cero, puedes eliminar la tabla
-- y despues ejecutar nuevamente:
--
-- DROP TABLE EMPLEADO_PRACTICA;
--
-- ============================================================
