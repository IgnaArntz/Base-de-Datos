-- ============================================================
-- EJERCICIO DE PRACTICA
-- CONCATENACION + JOIN
-- Oracle SQL / PL-SQL
-- ============================================================
--
-- OBJETIVO DEL EJERCICIO
--
-- En este ejercicio aprenderemos a:
-- 1. Crear dos tablas relacionadas.
-- 2. Insertar datos en ambas tablas.
-- 3. Utilizar JOIN para relacionar las tablas.
-- 4. Utilizar ON para indicar como se relacionan.
-- 5. Utilizar || para concatenar textos y valores.
-- 6. Mostrar una consulta con informacion combinada.
--
-- ============================================================
-- CONCEPTO 1 - CONCATENACION
-- ============================================================
--
-- Definicion:
-- El operador || permite unir textos y valores.
--
-- Ejemplo:
--
-- 'Nombre: ' || nombre
--
-- Si nombre = 'Juan'
-- el resultado sera:
--
-- Nombre: Juan
--
-- ============================================================
-- CONCEPTO 2 - JOIN
-- ============================================================
--
-- Definicion:
-- JOIN permite combinar informacion proveniente de dos o mas
-- tablas relacionadas.
--
-- ON indica la condicion mediante la cual se relacionan las tablas.
--
-- Estructura:
--
-- SELECT columnas
-- FROM tabla1
-- JOIN tabla2
--     ON tabla1.columna = tabla2.columna;
--
-- ============================================================
-- PARTE 1 - CREAR TABLA FABRICANTE
-- ============================================================

CREATE TABLE FABRICANTE_PRACTICA (
    codigo_fabricante NUMBER PRIMARY KEY,
    nombre_fabricante VARCHAR2(50)
);

-- ============================================================
-- EXPLICACION
-- ============================================================
--
-- codigo_fabricante
-- Identifica de forma unica a cada fabricante.
--
-- nombre_fabricante
-- Guarda el nombre del fabricante.
--
-- ============================================================
-- PARTE 2 - CREAR TABLA PRODUCTO
-- ============================================================
--
-- Esta tabla tendra una columna que permitira relacionarla
-- con FABRICANTE_PRACTICA.
--
-- ============================================================

CREATE TABLE PRODUCTO_PRACTICA (
    codigo_producto    NUMBER PRIMARY KEY,
    nombre_producto    VARCHAR2(50),
    precio             NUMBER,
    codigo_fabricante  NUMBER
);

-- ============================================================
-- EXPLICACION
-- ============================================================
--
-- codigo_producto
-- Identifica de forma unica al producto.
--
-- nombre_producto
-- Guarda el nombre del producto.
--
-- precio
-- Guarda el precio del producto.
--
-- codigo_fabricante
-- Indica a que fabricante pertenece el producto.
--
-- Esta columna sera la que utilizaremos para hacer el JOIN.
--
-- ============================================================
-- PARTE 3 - INSERTAR FABRICANTES
-- ============================================================

INSERT INTO FABRICANTE_PRACTICA
VALUES (1, 'Samsung');

INSERT INTO FABRICANTE_PRACTICA
VALUES (2, 'Lenovo');

INSERT INTO FABRICANTE_PRACTICA
VALUES (3, 'Apple');

COMMIT;

-- ============================================================
-- EXPLICACION
-- ============================================================
--
-- Tenemos tres fabricantes:
--
-- 1 -> Samsung
-- 2 -> Lenovo
-- 3 -> Apple
--
-- ============================================================
-- PARTE 4 - INSERTAR PRODUCTOS
-- ============================================================

INSERT INTO PRODUCTO_PRACTICA
VALUES (101, 'Galaxy Tab', 350000, 1);

INSERT INTO PRODUCTO_PRACTICA
VALUES (102, 'ThinkPad', 850000, 2);

INSERT INTO PRODUCTO_PRACTICA
VALUES (103, 'iPad', 700000, 3);

INSERT INTO PRODUCTO_PRACTICA
VALUES (104, 'Galaxy Phone', 500000, 1);

COMMIT;

-- ============================================================
-- EXPLICACION
-- ============================================================
--
-- Cada producto tiene un codigo_fabricante.
--
-- Galaxy Tab    -> 1 -> Samsung
-- ThinkPad      -> 2 -> Lenovo
-- iPad          -> 3 -> Apple
-- Galaxy Phone  -> 1 -> Samsung
--
-- Por eso podemos relacionar ambas tablas.
--
-- ============================================================
-- PARTE 5 - CONSULTAR SOLO PRODUCTOS
-- ============================================================

SELECT
    codigo_producto,
    nombre_producto,
    precio,
    codigo_fabricante
FROM PRODUCTO_PRACTICA;

-- ============================================================
-- EXPLICACION
-- ============================================================
--
-- Esta consulta muestra solamente informacion de la tabla
-- PRODUCTO_PRACTICA.
--
-- Todavia no estamos utilizando JOIN.
--
-- ============================================================
-- PARTE 6 - UTILIZAR JOIN
-- ============================================================
--
-- Ahora queremos obtener:
--
-- codigo del producto
-- nombre del producto
-- precio
-- nombre del fabricante
--
-- El nombre del fabricante se encuentra en otra tabla.
-- Por eso necesitamos JOIN.
--
-- ============================================================

SELECT
    p.codigo_producto,
    p.nombre_producto,
    p.precio,
    f.nombre_fabricante
FROM PRODUCTO_PRACTICA p
JOIN FABRICANTE_PRACTICA f
    ON p.codigo_fabricante = f.codigo_fabricante;

-- ============================================================
-- EXPLICACION PASO A PASO
-- ============================================================
--
-- PRODUCTO_PRACTICA p
--
-- La letra p es un alias para la tabla PRODUCTO_PRACTICA.
--
-- FABRICANTE_PRACTICA f
--
-- La letra f es un alias para la tabla FABRICANTE_PRACTICA.
--
-- JOIN
--
-- Le indica a Oracle que queremos combinar ambas tablas.
--
-- ON
--
-- Indica la condicion que permite relacionarlas.
--
-- p.codigo_fabricante = f.codigo_fabricante
--
-- Significa:
--
-- codigo_fabricante de PRODUCTO
--             =
-- codigo_fabricante de FABRICANTE
--
-- ============================================================
-- PARTE 7 - CONCATENACION
-- ============================================================
--
-- Ahora utilizaremos ||.
--
-- Queremos mostrar una frase como:
--
-- Producto: Galaxy Tab - Fabricante: Samsung
--
-- Para construir esa frase utilizamos ||.
--
-- ============================================================

SELECT
    'Producto: ' || p.nombre_producto ||
    ' - Fabricante: ' || f.nombre_fabricante AS informacion_producto
FROM PRODUCTO_PRACTICA p
JOIN FABRICANTE_PRACTICA f
    ON p.codigo_fabricante = f.codigo_fabricante;

-- ============================================================
-- EXPLICACION
-- ============================================================
--
-- 'Producto: '
-- Es un texto fijo.
--
-- ||
-- Une el texto con el siguiente valor.
--
-- p.nombre_producto
-- Es el nombre del producto.
--
-- || ' - Fabricante: '
-- Agrega otro texto.
--
-- f.nombre_fabricante
-- Agrega el nombre del fabricante.
--
-- AS informacion_producto
-- Le coloca un nombre a la columna resultante.
--
-- Resultado esperado:
--
-- Producto: Galaxy Tab - Fabricante: Samsung
-- Producto: ThinkPad - Fabricante: Lenovo
-- Producto: iPad - Fabricante: Apple
-- Producto: Galaxy Phone - Fabricante: Samsung
--
-- ============================================================
-- PARTE 8 - CONCATENAR VARIOS DATOS
-- ============================================================
--
-- Podemos concatenar mas de dos valores.
--
-- En este ejemplo mostraremos:
--
-- Codigo + Producto + Precio + Fabricante
--
-- ============================================================

SELECT
    'Codigo: ' || p.codigo_producto ||
    ' | Producto: ' || p.nombre_producto ||
    ' | Precio: $' || p.precio ||
    ' | Fabricante: ' || f.nombre_fabricante
    AS detalle_producto
FROM PRODUCTO_PRACTICA p
JOIN FABRICANTE_PRACTICA f
    ON p.codigo_fabricante = f.codigo_fabricante;

-- ============================================================
-- EXPLICACION
-- ============================================================
--
-- Podemos unir textos y valores numericos utilizando ||.
--
-- Por ejemplo:
--
-- 'Precio: $' || p.precio
--
-- Si p.precio = 350000
--
-- el resultado sera:
--
-- Precio: $350000
--
-- ============================================================
-- PARTE 9 - JOIN + WHERE
-- ============================================================
--
-- Tambien podemos combinar JOIN con WHERE.
--
-- En este caso queremos mostrar solamente los productos
-- cuyo precio sea mayor o igual a 600000.
--
-- ============================================================

SELECT
    p.nombre_producto,
    p.precio,
    f.nombre_fabricante
FROM PRODUCTO_PRACTICA p
JOIN FABRICANTE_PRACTICA f
    ON p.codigo_fabricante = f.codigo_fabricante
WHERE p.precio >= 600000;

-- ============================================================
-- EXPLICACION
-- ============================================================
--
-- JOIN
-- Une las tablas.
--
-- ON
-- Indica como se relacionan.
--
-- WHERE
-- Filtra los registros que queremos mostrar.
--
-- Aqui solamente aparecen productos con precio >= 600000.
--
-- ============================================================
-- PARTE 10 - JOIN + WHERE + ORDER BY + CONCATENACION
-- ============================================================
--
-- Este ejemplo junta varios conceptos.
--
-- Queremos:
-- 1. Relacionar productos con fabricantes.
-- 2. Filtrar productos con precio mayor a 300000.
-- 3. Ordenarlos de mayor a menor precio.
-- 4. Mostrar una frase concatenada.
--
-- ============================================================

SELECT
    'Producto: ' || p.nombre_producto ||
    ' | Fabricante: ' || f.nombre_fabricante ||
    ' | Precio: $' || p.precio AS detalle
FROM PRODUCTO_PRACTICA p
JOIN FABRICANTE_PRACTICA f
    ON p.codigo_fabricante = f.codigo_fabricante
WHERE p.precio > 300000
ORDER BY p.precio DESC;

-- ============================================================
-- EXPLICACION FINAL
-- ============================================================
--
-- En esta consulta:
--
-- SELECT
-- Indica la informacion que queremos mostrar.
--
-- ||
-- Concatena textos y valores.
--
-- FROM
-- Indica la primera tabla.
--
-- JOIN
-- Relaciona la segunda tabla.
--
-- ON
-- Indica la condicion de relacion.
--
-- WHERE
-- Filtra los datos.
--
-- ORDER BY
-- Ordena el resultado.
--
-- DESC
-- Ordena de mayor a menor.
--
-- ============================================================
-- ASOCIACIONES PARA ESTUDIAR
-- ============================================================
--
-- Cuando el enunciado diga:
--
-- "unir", "concatenar", "combinar texto"
--
-- Piensa:
--
-- ||
--
-- ------------------------------------------------------------
--
-- Cuando el enunciado diga:
--
-- "relacionar dos tablas"
--
-- Piensa:
--
-- JOIN
--    ON
--
-- ------------------------------------------------------------
--
-- Cuando diga:
--
-- "relacionar mediante una columna"
--
-- Busca las columnas que tengan el mismo dato relacionado.
--
-- Ejemplo:
--
-- p.codigo_fabricante = f.codigo_fabricante
--
-- ------------------------------------------------------------
--
-- Cuando diga:
--
-- "mostrar solamente los que cumplen..."
--
-- Piensa:
--
-- WHERE
--
-- ------------------------------------------------------------
--
-- Cuando diga:
--
-- "ordenar"
--
-- Piensa:
--
-- ORDER BY
--
-- ============================================================
-- NOTA PARA VOLVER A EJECUTAR
-- ============================================================
--
-- CREATE TABLE solo debe ejecutarse una vez.
--
-- Si quieres comenzar nuevamente desde cero:
--
-- DROP TABLE PRODUCTO_PRACTICA;
-- DROP TABLE FABRICANTE_PRACTICA;
--
-- Luego vuelve a ejecutar el script completo.
--
-- ============================================================
