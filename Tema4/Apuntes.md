# UNIDAD 4. REALIZACIÓN DE CONSULTAS.

- [UNIDAD 4. REALIZACIÓN DE CONSULTAS.](#unidad-4-realización-de-consultas)
  - [1.- LA INSTRUCCIÓN SELECT 📝](#1--la-instrucción-select-)
    - [📌 Sintaxis completa de SELECT:](#-sintaxis-completa-de-select)
    - [📌 Sintaxis principal de SELECT:](#-sintaxis-principal-de-select)
    - [💡 Ejemplos de consultas SELECT sin FROM](#-ejemplos-de-consultas-select-sin-from)
    - [1.1.- Operadores en consultas SELECT ⚙️](#11--operadores-en-consultas-select-️)
    - [1.2.- Consultar todas las filas de una tabla 📊](#12--consultar-todas-las-filas-de-una-tabla-)
    - [1.3.- Ordenar resultados ⬆️⬇️](#13--ordenar-resultados-️️)
    - [1.4.- No repetir filas y limitar resultados 🚦](#14--no-repetir-filas-y-limitar-resultados-)
    - [1.5.- Consultar algunas filas de una tabla 🔍](#15--consultar-algunas-filas-de-una-tabla-)
  - [HOJAS DE EJERCICIOS 💻](#hojas-de-ejercicios-)
    - [1.6.- Seleccionar con IN, LIKE, BETWEEN y campos NULL 🔍](#16--seleccionar-con-in-like-between-y-campos-null-)
    - [1.7.- Operadores Lógicos ⚙️](#17--operadores-lógicos-️)
  - [HOJAS DE EJERCICIOS 💻](#hojas-de-ejercicios--1)
  - [2.- CONSULTAS SOBRE TABLAS COMBINADAS 🔗](#2--consultas-sobre-tablas-combinadas-)
    - [2.1.- La reunión interna. INNER JOIN 🔄](#21--la-reunión-interna-inner-join-)
  - [HOJAS DE EJERCICIOS 💻](#hojas-de-ejercicios--2)
    - [2.2.- El producto cartesiano 🎲](#22--el-producto-cartesiano-)
  - [HOJAS DE EJERCICIOS 💻](#hojas-de-ejercicios--3)
    - [2.3.- Las reuniones externas. LEFT JOIN y RIGHT JOIN ↔️](#23--las-reuniones-externas-left-join-y-right-join-️)
  - [HOJAS DE EJERCICIOS 💻](#hojas-de-ejercicios--4)
    - [2.4.- Consultas de resumen y agrupamiento de registros 📊](#24--consultas-de-resumen-y-agrupamiento-de-registros-)
  - [HOJAS DE EJERCICIOS](#hojas-de-ejercicios)
    - [2.5.- Subconsultas](#25--subconsultas)
  - [HOJAS DE EJERCICIOS](#hojas-de-ejercicios-1)
  - [3.- FUNCIONES EN MYSQL 8.0](#3--funciones-en-mysql-80)
    - [3.1.- Funciones matemáticas o numéricas.](#31--funciones-matemáticas-o-numéricas)
    - [3.2.- Funciones de cadena de caracteres](#32--funciones-de-cadena-de-caracteres)
  - [HOJAS DE EJERCICIOS](#hojas-de-ejercicios-2)
    - [3.3.- Funciones de fecha y hora](#33--funciones-de-fecha-y-hora)
    - [3.4.- Funciones de control de flujo](#34--funciones-de-control-de-flujo)
    - [3.5.- Otras funciones](#35--otras-funciones)
  - [HOJAS DE EJERCICIOS](#hojas-de-ejercicios-3)
  - [ACTIVIDAD GRUPAL](#actividad-grupal)

## 1.- LA INSTRUCCIÓN SELECT 📝

La instrucción SQL para consultar los datos almacenados en las tablas de una base de datos es **SELECT**. Normalmente es la instrucción más utilizada por los usuarios de una base de datos.

Cuando se ejecuta **SELECT**, si no tiene errores la instrucción, el SGBD devuelve una hoja de resultados que se muestra en forma de tabla en el cliente que estemos usando.

![Instrucción Select](img/Imagen1.png)

### 📌 Sintaxis completa de SELECT:

![Sintáxis select](img/Imagen2.png)

### 📌 Sintaxis principal de SELECT:

![Sintáxis select](img/Imagen3.png)

**Descripción de la sintaxis principal de SELECT:**

* 🔹 Entre **SELECT** y **FROM** se escriben separadas por comas las columnas o expresiones que se quieren consultar. Pueden consultarse datos que no pertenecen a tablas, como lo devuelto por una función.
* 🔹 **DISTINCT** permite que no se repitan filas de resultados iguales.
* 🔹 **FROM** permite indicar la tabla o las tablas de las que se extraen los datos.
* 🔹 **WHERE** permite seleccionar las filas de las que se extraen datos, poniendo condiciones sobre lo que se quiere consultar.
* 🔹 **GROUP BY** permite agrupar filas que tengan valores iguales en una o varias columnas para que salgan en una sola fila.
* 🔹 **HAVING** permite establecer condiciones sobre datos obtenidos de agrupamientos.
* 🔹 **ORDER BY** permite ordenar la hoja de resultados por una columna, por varias columnas o por una expresión.
* 🔹 **LIMIT** permite indicar que de las filas devueltas por una SELECT solo se muestre un número máximo de ellas.

### 💡 Ejemplos de consultas SELECT sin FROM

**Obtener la fecha y hora actuales:**

```sql
SELECT curdate(), curtime();
```

**Obtener el resultado de la división entre 7 y 2 y el resultado del cociente y resto de su división:**

```sql
SELECT 7/2, 7 div 2, 7 mod 2;
```

**Obtener el usuario actual y la versión de MySQL Server:**

```sql
SELECT current_user(), version();
```

### 1.1.- Operadores en consultas SELECT ⚙️

Como hemos visto anteriormente, en las expresiones que se escriben en **SELECT** se pueden usar operadores. También se pueden usar en otras instrucciones.

**Operadores aritméticos:**

* ➕ operador `+`: suma dos números o indica signo positivo.
* ➖ operador `-`: diferencia entre dos números o signo negativo.
* ✖ operador `*`: multiplicación.
* ➗ operador `/`: división que devuelve número con decimales.
* 🟰 operador `div`: división entera (solo cociente).
* 🟰 operadores `%` o `mod`: división que devuelve el resto entero.

**Operadores de comparación o relacionales:**

* `=` compara si es igual.
* `>` compara si mayor.
* `<` compara si menor.
* `<=` compara si menor o igual.
* `>=` compara si mayor o igual.
* `<>` compara si distinto.

**Modelo relacional de la Base de datos ALQUILERES, que vamos a usar en todos los ejemplos de esta unidad:**

![Base de datos Alquileres](img/Imagen4.png)

### 1.2.- Consultar todas las filas de una tabla 📊

Cuando se ejecuta **SELECT** **sin la cláusula WHERE**, se consultan todas las filas de la tabla.

Para obtener todos los datos de la tabla (todas las columnas) se puede usar el comodín `*`, salvo que queramos que las columnas se obtengan en orden diferente al de diseño de la tabla.

**Ejemplo:** Obtener todos los datos de la tabla automóviles:

```sql
SELECT * FROM automoviles;
```

![Consulta](img/Imagen5.png)

Cuando queramos obtener algunas columnas y/o expresiones habrá que escribirlas separadas por comas.

**Ejemplo:** Obtener todos los datos de la tabla automóviles representando como primera columna la columna `alquilado`:

```sql
SELECT alquilado, matricula, marca, modelo, color, precio, kilometros, extras
FROM automoviles;
```

![Consulta](img/Imagen6.png)

**Ejemplo:** Obtener las matrículas, marcas y modelos de todos los coches junto con el precio y el precio incrementado en un 10%:

```sql
SELECT matricula, marca, modelo, precio, precio*1.1
FROM automoviles;
```

![Consulta](img/Imagen7.png)


### 1.3.- Ordenar resultados ⬆️⬇️

Para ordenar la hoja de resultados por una o varias expresiones, se usa la cláusula **ORDER BY expr1, … [ASC|DESC]**.

**Ejemplo:** Obtener matrícula, marca, modelo y precio de alquiler de todos los automóviles ordenados ascendentemente por marca y como segundo criterio por modelo.

```sql
SELECT matricula, marca, modelo, precio 
FROM automoviles 
ORDER BY marca, modelo;
```

![Consulta](img/Imagen8.png)

**Ejemplo:** Obtener matrícula, marca, modelo y precio de todos los automóviles ordenados por precio de alquiler de mayor a menor.

```sql
SELECT matricula, marca, modelo, precio 
FROM automoviles 
ORDER BY precio DESC;
```

![Consulta](img/Imagen9.png)

**Ejemplo:** Obtener matrícula, marca, modelo y precio de todos los automóviles ordenados por marca ascendentemente y después por precio de alquiler de mayor a menor.

```sql
SELECT matricula, marca, modelo, precio 
FROM automoviles 
ORDER BY marca, precio DESC;
```

![Consulta](img/Imagen10.png)

### 1.4.- No repetir filas y limitar resultados 🚦

Para que no se repitan en la hoja de resultados filas exactamente iguales se usa la cláusula **DISTINCT**.

**Ejemplo:** Mostrar los colores de todos los coches (pueden mostrarse repetidos).

```sql
SELECT color FROM automoviles;
```

**Ejemplo:** Mostrar los colores disponibles de coches.

```sql
SELECT DISTINCT color 
FROM automoviles;
```

![Consulta](img/Imagen11.png)

**Ejemplo:** Obtener las marcas y modelos disponibles ordenados por marca y después por modelo.

```sql
SELECT DISTINCT marca, modelo 
FROM automoviles 
ORDER BY marca, modelo;
```

![Consulta](img/Imagen12.png)

La cláusula **LIMIT** de la instrucción SELECT permite limitar el número de filas de la hoja de resultados. La sintaxis es:

```sql
LIMIT [inicio,] numfilas
```

**Ejemplo:** Obtener matrícula, marca y modelo de los 5 primeros coches registrados.

```sql
SELECT matricula, marca, modelo 
FROM automoviles LIMIT 5;
```

![Consulta](img/Imagen13.png)

**Ejemplo:** Obtener matrícula, marca, modelo y precio de los 5 coches de precio de alquiler más alto.

```sql
SELECT matricula, marca, modelo, precio 
FROM automoviles 
ORDER BY precio DESC LIMIT 5;
```

![Consulta](img/Imagen14.png)

**Ejemplo:** Obtener matrícula, marca, modelo y precio de los 5 coches de precio de alquiler más alto exceptuando al más caro.

```sql
SELECT matricula, marca, modelo, precio 
FROM automoviles 
ORDER BY precio DESC LIMIT 1,5;
```

![Consulta](img/Imagen16.png)

**Ejemplo:** Obtener el nombre, apellidos y fecha de nacimiento del cliente más joven.

```sql
SELECT nombre, apellidos 
FROM clientes 
ORDER BY fnac DESC LIMIT 1;
```

![Consulta](img/Imagen17.png)

### 1.5.- Consultar algunas filas de una tabla 🔍

Para seleccionar filas que cumplen con una condición determinada se usa la cláusula **WHERE**.

**Ejemplo:** Obtener matrícula, modelo y precio de todos los automóviles de la marca SEAT.

```sql
SELECT matricula, modelo, precio 
FROM automoviles 
WHERE marca='seat';
```

![Consulta](img/Imagen18.png)

**Ejemplo:** Obtener marca, modelo y precio de todos los automóviles con precio ≥ 100€, ordenados por precio ascendente.

```sql
SELECT marca, modelo, precio 
FROM automoviles 
WHERE precio>=100 ORDER BY precio;
```

![Consulta](img/Imagen19.png)

**Ejemplo:** Obtener todos los contratos efectuados en 2017.

```sql
SELECT * FROM contratos 
WHERE fini>'2016-12-31' AND fini<'2018-01-01';

SELECT * FROM contratos 
WHERE YEAR(fini)=2017;
```

![Consulta](img/Imagen20.png)

**Ejemplo:** Obtener matrícula, marca y modelo de todos los automóviles disponibles.

```sql
SELECT matricula, marca, modelo 
FROM automoviles 
WHERE alquilado!=true; 

SELECT matricula, marca, modelo 
FROM automoviles 
WHERE alquilado=false; 
```

![Consulta](img/Imagen21.png)

**Ejemplo:** Obtener nombre y apellidos de todos los clientes llamados Alicia.

```sql
SELECT nombre, apellidos 
FROM clientes 
WHERE nombre='alicia';
```

![Consulta](img/Imagen22.png)

## HOJAS DE EJERCICIOS 💻

* Hoja de ejercicios 1.
* Hoja de ejercicios 2.


### 1.6.- Seleccionar con IN, LIKE, BETWEEN y campos NULL 🔍

La cláusula **BETWEEN** permite comprobar si un valor está dentro de un intervalo:

```sql
valor BETWEEN menor AND mayor
```

**Ejemplo:** Obtener todos los contratos entre el 24 de diciembre de 2016 y el 6 de enero de 2017.

```sql
SELECT * FROM contratos 
WHERE fini BETWEEN '2016-12-24' AND '2017-01-06';
```

![Consulta](img/Imagen23.png)

**Ejemplo:** Clientes cuyo primer apellido comienza por 'D'.

```sql
SELECT nombre, apellidos 
FROM clientes 
WHERE apellidos BETWEEN 'D' AND 'E';
```

(Saca también los que empiezan con E)

![Consulta](img/Imagen24.png)

La cláusula **IN** comprueba si un valor coincide con alguno de un conjunto:

```sql
expresión IN (valor1, valor2, valor3, …)
```

**Ejemplo:** Automóviles de marcas SEAT, AUDI, HYUNDAI o TOYOTA.

```sql
SELECT * FROM automoviles 
WHERE marca IN ('seat','audi','hyundai','toyota');
```

![Consulta](img/Imagen25.png)

La cláusula **LIKE** permite comprobar si una cadena coincide con un patrón:

```sql
expresión LIKE 'patron'
```

* `%` representa cualquier conjunto de caracteres.
* `_` representa un solo carácter.

**Ejemplo:** Clientes cuyo apellido comienza con D.

```sql
SELECT nombre, apellidos 
FROM clientes 
WHERE apellidos LIKE 'D%';
```

![Consulta](img/Imagen26.png)

**Ejemplo:** Automóviles cuya matrícula termina con NT.

```sql
SELECT matricula, marca, modelo 
FROM automoviles 
WHERE matricula LIKE '%NT';
```

![Consulta](img/Imagen27.png)

**Ejemplo:** Clientes nacidos en enero.

```sql
SELECT nombre, apellidos, fnac 
FROM clientes 
WHERE fnac LIKE '%-01-%';
```

![Consulta](img/Imagen28.png)

**Ejemplo:** Clientes nacidos en los años 80.

```sql
SELECT nombre, apellidos, fnac 
FROM clientes 
WHERE fnac LIKE '198%';
```

![Consulta](img/Imagen29.png)

**Ejemplo:** Automóviles cuyo segundo dígito de matrícula sea 2 y primera letra J.

```sql
SELECT matricula, marca, modelo 
FROM automoviles 
WHERE matricula LIKE '_2__J__';
```

![Consulta](img/Imagen30.png)

Para comprobar campos nulos:

```sql
expresión IS NULL
expresión IS NOT NULL
```

**Ejemplo:** Matrículas de automóviles actualmente contratados.

```sql
SELECT matricula, fini 
FROM contratos 
WHERE ffin IS NULL;
```

![Consulta](img/Imagen31.png)

**Ejemplo:** Contratos finalizados.

```sql
SELECT numcontrato, matricula, kfin - kini 
FROM contratos 
WHERE ffin IS NOT NULL;
```

![Consulta](img/Imagen32.png)

### 1.7.- Operadores Lógicos ⚙️

| Operador | Función                                      |
| -------- | -------------------------------------------- |
| AND      | TRUE si todas las condiciones son verdaderas |
| OR       | TRUE si al menos una condición es verdadera  |
| NOT      | Invierte el valor de la condición            |

Prevalencia: 1. Comparación, 2. NOT, 3. AND, 4. OR

**Ejemplo:** Precio entre 80 y 90 €.

```sql
SELECT matricula, marca, modelo, precio 
FROM automoviles 
WHERE precio>=80 AND precio<=90;
```

![Consulta](img/Imagen33.png)

**Ejemplo:** Precio entre 80-90 € o 100-120 €.

```sql
SELECT matricula, marca, modelo, precio 
FROM automoviles 
WHERE (precio>=80 AND precio<=90) OR (precio>=100 AND precio<=120);
```

![Consulta](img/Imagen34.png)

**Ejemplo:** Automóviles de marcas SEAT, AUDI, HYUNDAI, TOYOTA.

```sql
SELECT matricula, marca, modelo 
FROM automoviles 
WHERE marca='seat' OR marca='audi' OR marca='hyundai' OR marca='toyota';
```

![Consulta](img/Imagen35.png)

**Ejemplo:** Contratos iniciados en 2017 y finalizados.

```sql
SELECT * 
FROM contratos 
WHERE ffin IS NOT NULL AND fini LIKE '2017%';
```

![Consulta](img/Imagen36.png)

**Ejemplo:** Automóviles que no son SEAT ni AUDI.

```sql
SELECT matricula, marca, modelo 
FROM automoviles 
WHERE marca!='seat' AND marca!='audi';

SELECT matricula, marca, modelo 
FROM automoviles 
WHERE NOT (marca='seat' OR marca='audi');
```

![Consulta](img/Imagen37.png)

## HOJAS DE EJERCICIOS 💻

* Hoja de ejercicios 3.
* Hoja de ejercicios 4.
* Hoja de ejercicios 5.
* Hoja de ejercicios 6 (opcional).

## 2.- CONSULTAS SOBRE TABLAS COMBINADAS 🔗

Hasta ahora hemos visto consultas sobre una única tabla. A menudo necesitamos combinar tablas para obtener datos de varias tablas o aplicar condiciones sobre varias tablas.

Por ejemplo, en la base de datos de alquileres, para obtener nombre y apellidos de los clientes que han alquilado coches en enero, necesitamos combinar las tablas **clientes** y **contratos**.

![Consulta](img/Imagen36b.png)

En MySQL podemos usar:

* Producto cartesiano o CROSS JOIN
* Combinación INNER JOIN
* Combinación LEFT JOIN
* Combinación RIGHT JOIN

### 2.1.- La reunión interna. INNER JOIN 🔄

La operación **INNER JOIN** empareja filas de dos tablas a través de una relación entre columnas (normalmente clave primaria y clave ajena).

En la BD alquileres, la tabla **contratos** tiene un campo `dnicliente`. Al hacer un INNER JOIN entre **contratos** y **clientes**, obtenemos un listado de todos los clientes con sus contratos.

![inner Join](img/Imagen38b.png)

Sintaxis general:

```sql
SELECT ...... 
FROM tabla1 
INNER JOIN tabla2 
ON columna1 condicion_relacion columna2;
```

* Las columnas a unir deben tener tipos de datos compatibles.
* Condición de relación normalmente es igualdad.
* Se pueden combinar más de dos tablas usando varios INNER JOIN.

Si los nombres de columna son iguales, se puede usar:

```sql
SELECT ...... 
FROM tabla1 
INNER JOIN tabla2 
USING (columna);
```

![ejemplo](img/Imagen44.png)

**Ejemplo 1:**

```sql
SELECT * FROM empleado
INNER JOIN departamento 
ON empleado.IDDepartamento = departamento.IDDepartamento;
```

**Ejemplo 2:**

```sql
SELECT * FROM empleado
INNER JOIN departamento 
USING (IDDepartamento);
```

**Pruebas en BD empresa:**

```sql
SELECT * FROM empleados 
INNER JOIN departamentos 
ON empleados.numde = departamentos.numde;
```

(Salen datos de las dos tablas, campo numde duplicado)

```sql
SELECT * FROM empleados 
INNER JOIN departamentos USING(numde);
```

(Sacamos los datos que nos interesan)

```sql
SELECT empleados.numde, numem, nomem, nomde 
FROM empleados 
INNER JOIN departamentos USING(numde);
```

(El número de registros es el mismo)

**Pruebas en BD alquileres:**

**Ejemplo:** Número de contrato y matrícula, marca y modelo de automóviles actualmente contratados.

```sql
SELECT numcontrato, automoviles.matricula, marca, modelo 
FROM contratos 
INNER JOIN automoviles ON contratos.matricula = automoviles.matricula 
WHERE ffin IS NULL;
```

![ejemplo](img/Imagen39.png)

**Ejemplo:** Número de contrato y nombre/apellidos de clientes con contrato activo.

```sql
SELECT numcontrato, nombre, apellidos 
FROM clientes 
INNER JOIN contratos ON dnicliente = dni 
WHERE ffin IS NULL;
```

![ejemplo](img/Imagen40.png)

**Ejemplo:** Contratos finalizados: matrícula, marca, modelo, nombre, apellidos y kilómetros recorridos.

```sql
SELECT numcontrato, automoviles.matricula, marca, modelo, nombre, apellidos, kfin - kini 
FROM (contratos INNER JOIN automoviles ON contratos.matricula = automoviles.matricula) 
INNER JOIN clientes ON dnicliente = dni 
WHERE ffin IS NOT NULL;
```

![ejemplo](img/Imagen41.png)

**Ejemplo:** Clientes que han contratado automóviles de la marca Seat.

```sql
SELECT DISTINCT nombre, apellidos 
FROM (contratos INNER JOIN automoviles ON contratos.matricula = automoviles.matricula) 
INNER JOIN clientes ON dnicliente = dni 
WHERE marca='seat';
```

![ejemplo](img/Imagen43.png)

## HOJAS DE EJERCICIOS 💻

* Hoja de ejercicios 7.

### 2.2.- El producto cartesiano 🎲

El producto cartesiano de dos tablas genera una tabla con todas las combinaciones posibles de filas entre ambas tablas. Si una tabla tiene 6 filas y la otra 8, el resultado tiene 48 filas. Si las tablas son muy grandes, puede generar millones de filas y ocupar mucho espacio en memoria.

![Producto Cartesiano](img/Imagen45.png)

Para obtener el producto cartesiano total:

```sql
SELECT * FROM automoviles, contratos;
```

![Producto Cartesiano](img/Imagen47.png)

Para limitar el resultado a combinaciones lógicas, usamos **WHERE**:

```sql
SELECT * FROM automoviles, contratos 
WHERE automoviles.matricula = contratos.matricula;
```

**Ejemplo 1:** Obtener matrícula, marca, modelo, fecha inicial y final del contrato número 1.

```sql
SELECT contratos.matricula, marca, modelo, fini, ffin 
FROM automoviles, contratos 
WHERE numcontrato = 1 
AND contratos.matricula = automoviles.matricula;
```

![Producto Cartesiano](img/Imagen48.png)

Se pueden usar alias para simplificar:

```sql
SELECT c.matricula, marca, modelo, fini, ffin 
FROM automoviles AS a, contratos AS c 
WHERE numcontrato = 1 
AND c.matricula = a.matricula;
```

**Ejemplo 2:** Obtener todas las combinaciones posibles de alumnos y módulos del curso DAM1.

```sql
SELECT numalumn, codmodulo 
FROM alumnos, modulos 
ORDER BY codmodulo;
```

![Producto Cartesiano](img/Imagen49.png)
![Producto Cartesiano](img/Imagen50.png)

**Ejemplo 3:** Marca y modelo de automóviles contratados en diciembre de 2017 (sin repetir).

```sql
SELECT DISTINCT marca, modelo 
FROM automoviles, contratos 
WHERE automoviles.matricula = contratos.matricula 
AND fini LIKE '2017-12%';
```

![Producto Cartesiano](img/Imagen51.png)

**Ejemplo 4:** Datos del contrato número 10: cliente, coche y duración del contrato.

```sql
SELECT apellidos, nombre, contratos.matricula, marca, modelo, fini, ffin 
FROM automoviles, contratos, clientes 
WHERE automoviles.matricula = contratos.matricula 
AND contratos.dnicliente = clientes.dni 
AND numcontrato = 10;
```

![Producto Cartesiano](img/Imagen52.png)

**Ejemplo 5:** Enfrentamientos posibles entre equipos de la división central (NBA).

```sql
SELECT a.nombre AS local, b.nombre AS visitante 
FROM equipos AS a, equipos AS b 
WHERE a.division = 'central' 
AND b.division = 'central' 
AND a.nombre <> b.nombre;
```

![Producto Cartesiano](img/Imagen53.png)

**IMPORTANTE:**

* Evitar el producto cartesiano cuando sea posible usar otra combinación, especialmente con tablas grandes.
* Algunos casos, como los ejemplos 2 y 5, son usos correctos donde se desea combinar todas las filas de ambas tablas.

## HOJAS DE EJERCICIOS 💻

* Hoja de ejercicios 8.
* Hoja de ejercicios 9.
* Hoja de ejercicios 10.

### 2.3.- Las reuniones externas. LEFT JOIN y RIGHT JOIN ↔️

#### La reunión externa por la izquierda. LEFT JOIN ⬅️

Permite emparejar filas de dos tablas como INNER JOIN, pero incluye todas las filas de la tabla izquierda aunque no tengan correspondencia en la tabla derecha, rellenando con NULL.

```sql
AUTOMOVILES LEFT JOIN CONTRATOS ON automoviles.matricula = contratos.matricula
```

Para automóviles nunca contratados, los datos de contrato serán NULL.

![Left Join](img/Imagen54.png)

**Ejemplo:** Obtener matrícula, marca y modelo de todos los automóviles con datos de contratos (incluso automóviles sin contratos).

```sql
SELECT automoviles.matricula, marca, modelo, contratos.* 
FROM automoviles 
LEFT JOIN contratos USING (matricula);
```

![Left Join](img/Imagen55.png)

**Ejemplo:** Automóviles nunca contratados.

```sql
SELECT automoviles.* 
FROM automoviles 
LEFT JOIN contratos USING (matricula) 
WHERE numcontrato IS NULL;
```

![Left Join](img/Imagen56.png)

#### La reunión externa por la derecha. RIGHT JOIN ➡️

Refleja LEFT JOIN, pero garantiza incluir todos los registros de la tabla derecha.

![Right Join](img/Imagen57.png)

**Ejemplo:** Clientes con datos de contratos, incluyendo los que no han hecho ninguno.

```sql
SELECT clientes.dni, nombre, apellidos, contratos.* 
FROM contratos 
RIGHT JOIN clientes ON dni = dnicliente;
```

![Right Join](img/Imagen58.png)

**Ejemplo:** Clientes sin contratos.

```sql
SELECT clientes.* 
FROM contratos 
RIGHT JOIN clientes ON dni = dnicliente 
WHERE numcontrato IS NULL;
```

![Right Join](img/Imagen59.png)

## HOJAS DE EJERCICIOS 💻

* Hoja de ejercicios 11.

### 2.4.- Consultas de resumen y agrupamiento de registros 📊

Las consultas de agregado permiten realizar cálculos sobre filas que comparten un valor común.

Funciones de agregado:

* **COUNT(expresión)**: Cuenta filas con valor no nulo.
* **SUM(expresión)**: Suma valores numéricos ignorando NULL.
* **MIN(expresión)**: Valor mínimo.
* **MAX(expresión)**: Valor máximo.
* **AVG(expresión)**: Media aritmética ignorando NULL.
* **GROUP_CONCAT(expresión)**: Concatenación de todos los valores no nulos.

**Ejemplos:**

```sql
SELECT count(*) FROM contratos;
SELECT count(ffin) FROM contratos;
SELECT count(*) FROM automoviles;
SELECT count(DISTINCT marca) FROM automoviles;
SELECT avg(kfin-kini), max(kfin-kini), min(kfin-kini) FROM contratos;
SELECT group_concat(nombre) FROM clientes WHERE localidad='toledo';
SELECT sum(kfin-kini) FROM contratos INNER JOIN clientes ON dnicliente=dni WHERE localidad='madrid';
```

**Agrupamiento con GROUP BY:**

```sql
SELECT marca, modelo 
FROM automoviles 
INNER JOIN contratos ON contratos.matricula = automoviles.matricula 
WHERE year(ffin)=2018 
GROUP BY marca, modelo;

SELECT localidad FROM clientes GROUP BY localidad;

SELECT nombre, apellidos 
FROM clientes 
INNER JOIN contratos ON dnicliente=dni 
WHERE fini >= '2017-12-24' 
GROUP BY dnicliente 
ORDER BY apellidos, nombre;

SELECT marca, count(*) FROM automoviles GROUP BY marca;
SELECT nombre, apellidos, count(*) 
FROM clientes INNER JOIN contratos ON dnicliente=dni 
WHERE fini >= '2016-12-27' 
GROUP BY dnicliente 
ORDER BY apellidos, nombre;

SELECT marca, avg(precio) AS medio, max(precio), min(precio) 
FROM automoviles 
GROUP BY marca 
ORDER BY medio DESC;

SELECT avg(precio), max(precio), min(precio) 
FROM automoviles 
WHERE marca='SEAT';
```

**Cláusula HAVING:**
Permite filtrar resultados basados en funciones de agregación o agrupamiento.

**Ejemplo:** Obtener el número de clientes de cada localidad siempre que en la localidad haya más de tres clientes.

```sql
SELECT localidad,count(*) 
FROM clientes 
GROUP BY localidad 
HAVING count(*)>3;
```

**Ejemplo:** Obtener las marcas de coches cuyo precio medio de alquiler sea inferior a 105 Euros.

```sql
SELECT marca FROM automoviles 
GROUP BY marca 
HAVING avg(precio)<105;
```

![Agrupamiento](img/Imagen71.png)

**Ejemplo:** Obtener las marcas de coches y su precio medio de alquiler siempre que se cumpla que ese precio medio está comprendido entre 75 y 100 euros.

```sql
SELECT marca,avg(precio) AS media 
FROM automoviles 
GROUP BY marca 
HAVING media >=75 AND media<=100;
```

![Agrupamiento](img/Imagen72.png)

## HOJAS DE EJERCICIOS

💻 Hoja de ejercicios 12.

### 2.5.- Subconsultas

Una subconsulta es una consulta SELECT que se hace dentro de otra consulta SELECT. Los datos que se obtienen de la subconsulta se usan en la consulta en la que se incluye.

También se pueden usar subconsultas dentro de las instrucciones INSERT, UPDATE y DELETE.

Si no existieran las subconsultas, para obtener las matrículas, marcas, modelos y precios de alquiler de los automóviles que tienen un precio de alquiler superior al automóvil de matrícula 5031JHL, posiblemente plantearíamos esto con dos instrucciones:

1.- Obtener el precio de alquiler del automóvil de matrícula 5031JHL

```sql
SELECT precio FROM automoviles 
WHERE matricula='5031JHL';
```

2.- Obtener ahora las matrículas, marcas, modelos y precios de los automóviles con precio de alquiler superior a 116,45 Euros.

```sql
SELECT matricula, marca, modelo, precio 
FROM automoviles 
WHERE precio > 116.45;
```

En el anterior ejemplo, lo que hemos hecho realmente es esto:

![Subconsultas](img/Imagen73.png)

Podemos modificar la instrucción segunda para que, en lugar del precio, use una subconsulta para obtener el precio del automóvil de la matrícula indicada.

```sql
SELECT matricula, marca, modelo FROM automoviles 
WHERE precio>(SELECT precio FROM automoviles 
              WHERE matricula = '5031JHL');
```

**Ejemplo:** Obtener las matrículas, marcas, modelos y precios de alquiler de los automóviles que tienen un precio de alquiler superior al automóvil de matrícula 5031JHL.

```sql
SELECT matricula, marca, modelo 
FROM automoviles 
WHERE precio>(SELECT precio FROM automoviles 
                                WHERE matricula = '5031JHL');
```

![Subconsultas](img/Imagen74.png)

MUY IMPORTANTE: En subconsultas como esta anterior, que se usan para comparar con un valor, las subconsultas deben devolver únicamente un valor.

**Ejemplo:** Obtener las matrículas, marcas, modelos y precios de alquiler de los automóviles de color rojo que tienen un precio de alquiler superior al automóvil de matrícula 5031JHL.

```sql
SELECT matricula, marca, modelo FROM automoviles 
WHERE precio>(SELECT precio FROM automoviles 
              WHERE matricula = '5031JHL') AND color='rojo';
```

![Subconsultas](img/Imagen75.png)

**Ejemplo:** Obtener las marcas y sus precios medios de alquiler siempre que se cumpla que ese precio medio es inferior al precio de alquiler del automóvil de matrícula 5031JHL.

```sql
SELECT marca, avg(precio) 
FROM automoviles 
GROUP BY marca 
HAVING avg(precio) < (SELECT precio 
                      FROM automoviles 
                      WHERE matricula = '5031JHL');
```

![Subconsultas](img/Imagen76.png)

**Ejemplo:** Obtener la marca y modelo del coche de precio de alquiler más alto.

```sql
SELECT marca,modelo,precio 
FROM automoviles 
WHERE precio = (SELECT max(precio) FROM automoviles);
```

![Subconsultas](img/Imagen77.png)

**Ejemplo:** Obtener la marca y modelo del coche correspondiente al contrato número 10.

```sql
SELECT marca,modelo 
FROM automoviles 
WHERE matricula = (SELECT matricula FROM contratos 
                    WHERE numcontrato=10);
```

Pero esto se puede hacer de la siguiente forma, y es más adecuado, ya que la consulta consume menos tiempo. En general las instrucciones que usan subconsultas llevan más tiempo que las que no las usan, aunque esto no siempre es así.

```sql
SELECT marca,modelo FROM automoviles 
INNER JOIN contratos USING (matricula) 
WHERE numcontrato=10;
```

![Subconsultas](img/Imagen78.png)

**UNION:**

UNION se usa para combinar los resultados de varias sentencias en un único conjunto de resultados. Las columnas del resultado de ambas consultas deben ser del mismo tipo. El resultado final tendrá el nombre de columnas de la primera consulta. Por defecto solo muestra las filas que son distintas (como si pusiéramos la cláusula DISTINCT). Podemos evitar esto con la cláusula ALL.

**Ejemplo:** Obtener el DNI de los clientes de la tabla contratos y de la tabla contratos2.

```sql
SELECT DISTINCT dnicliente FROM contratos 
UNION ALL 
SELECT DISTINCT dnicliente FROM contratos2;
```

El resultado será una tabla con los DNI de los clientes de ambas tablas. Si hay clientes con contratos en las dos tablas saldrán dos veces.

**Ejemplo:**  Obtener la matrícula de los coches actualmente alquilados (ffin=NULL) y de los coches de marca Renault sin repetir matrículas.

```sql
SELECT matricula FROM contratos 
WHERE ffin IS NULL 
UNION 
SELECT matricula FROM automoviles WHERE marca="Renault";
```

Hasta ahora hemos usado las subconsultas dentro de las cláusulas WHERE y HAVING. También se pueden usar en la cláusula FROM para obtener una hoja de resultados a partir de la que construimos una consulta. 

**Ejemplo:** Obtener los datos de los clientes que tienen contratos en las dos tablas de contratos (contratos y contratos 2).

```sql
SELECT * FROM clientes 
INNER JOIN (SELECT DISTINCT dnicliente FROM contratos 
            UNION ALL SELECT DISTINCT dnicliente FROM contratos2) 
AS t ON t.dnicliente=clientes.dni 
GROUP BY dni HAVING count(*)=2;
```

![Subconsultas](img/Imagen79.png)

**Ejemplo:** En la base de datos ligatercera, obtener cuantos equipos han metido goles en la jornada 1.

Lo que vamos a hacer es una subconsulta con la unión de contar cuantos equipos locales han metido goles y cuantos equipos visitantes han metido goles. Esa unión la renombramos para tratarla como si fuera una tabla. De ese tabla, sumamos los valores que contiene, es decir, los equipos locales que han marcado goles y los visitantes que han marcado goles.

```sql
SELECT sum(marcaron) 
FROM (SELECT count(*) AS marcaron 
      FROM partidos WHERE golesloc>0 AND numjornada=1 
      UNION ALL  
      SELECT count(*) AS marcaron 
      FROM partidos 
      WHERE golesvis>0 AND numjornada=1) AS t;
```

![Subconsultas](img/Imagen80.png)

Para comprobar si un dato está incluido en varios valores devueltos por una subconsulta no se pueden usar el operador de igualdad (=) ni otros operadores relacionales para comparar con subconsultas que devuelven más de un valor. Si queremos comprobar que un valor está incluido dentro del conjunto de valores devueltos por la subconsulta, usaremos el **operador IN**.

**Ejemplo:** Obtener las matrículas, marcas y modelos de los coches alquilados desde el 1 de enero de 2018.

```sql
SELECT matricula,marca,modelo 
FROM automoviles 
WHERE matricula IN (SELECT matricula 
                    FROM contratos 
                    WHERE fini>='2018-01-01');
```

![Subconsultas](img/Imagen81.png)

**Ejemplo:** Obtener la marca y modelo de todos los coches que ha alquilado Ismael Poza Rincón.

```sql
SELECT marca,modelo FROM automoviles 
WHERE matricula IN (SELECT matricula FROM contratos 
                    WHERE dnicliente =  (SELECT dni FROM clientes 
                                          WHERE nombre='Ismael' 
                                          AND apellidos='Poza Rincón'));
```

![Subconsultas](img/Imagen82.png)

**Ejemplo:** Obtener los datos de los clientes que no han realizado ningún contrato.

```sql
SELECT * FROM clientes 
WHERE dni NOT IN (SELECT DISTINCT dnicliente 
                  FROM contratos);
```

![Subconsultas](img/Imagen83.png)

En subconsultas que devuelven varios valores, el **cuantificador ALL** permite seleccionar las filas que cumplan con una determinada condición respecto de todos los valores devueltos por la subconsulta.
 
**Ejemplo:** Obtener las marcas de coches de las que no se ha alquilado ningún coche en 2018.

```sql
SELECT marca FROM automoviles 
where marca <> ALL (SELECT DISTINCT marca 
                    FROM contratos 
                    INNER JOIN automoviles USING (matricula) 
                    WHERE year(fini)=2018);
```

![Subconsultas](img/Imagen84.png)

En subconsultas que devuelven varios valores, el **cuantificador ANY** permite seleccionar las filas que cumplan con una determinada condición para al menos uno de los valores devueltos por la subconsulta.
 
**Ejemplo:** Obtener los datos de los coches con precio de alquiler menor que el de alguno de los coches SEAT.

```sql
SELECT * FROM automoviles 
WHERE precio < ANY (SELECT precio 
                    FROM automoviles 
                    WHERE marca='seat');
```

![Subconsultas](img/Imagen85.png)

## HOJAS DE EJERCICIOS

💻 Hoja de ejercicios 13.

💻 Hoja de ejercicios 14.

💻 Hoja de ejercicios 15.

## 3.- FUNCIONES EN MYSQL 8.0

Todos los SGBD incluyen un conjunto de funciones que pueden ser usadas para obtener fácilmente determinados resultados.

Cada SGBD incluye un conjunto propio de funciones. Las funciones no forman parte del lenguaje SQL.

La llamada a una función puede realizarse en las sentencias SELECT, INSERT, UPDATE y DELETE.

Toda función devuelve un valor y opera con unos datos recibidos o parámetros.

Para llamar a una función siempre se usa la sintáxis:

```
Nombre_funcion(param1, param1,…)
```

Como parámetros pueden darse valores constantes, nombres de columnas, llamadas a otras funciones y operaciones entre los anteriores.

Las funciones MySQL pueden clasificarse en función de los tipos de datos con los que trabajan o del tipo de operación que realizan en:

- Funciones matemáticas o numéricas
- Funciones de cadena de caracteres
- Funciones de fecha y hora
- Funciones de busqueda de texto
- Funciones de control de flujo
- Funciones de conversión
- Funciones de agregado o agrupación
- Otras funciones

### 3.1.- Funciones matemáticas o numéricas.

- pow(X,Y) : Devuelve el resultado X elevado a Y
- sqrt(X) : Devuelve la raiz cuadrada de X
- ceil(X) : Redondea al entero más cercano por arriba
- floor(X): Redondea al entero más cercano por abajo
- round(X) : Redondea al entero más cercano. 
- round(X,D) : Redondea al número más cercano usando D decimales
- truncate(X,D): Obtiene el número X truncado a D decimales
- rand() : Devuelve un número coma flotante aleatorio mayor o igual que cero y menor que 1.0.

### 3.2.- Funciones de cadena de caracteres

- char_length(cadena) : Devuelve el número de caracteres que tiene el contenido de la cadena.
- concat(cad1, cad2,…) : Devuelve la cadena resultado de concatenar todas las cadenas pasadas. Se pueden pasar otros tipos de datos en cuyo caso los trata como cadenas de caracteres.
- left(cad, N) : Devuelve los N primeros caracteres de cad
- right(cad, N) : Devuelve los N últimos caracteres de cad
- insert(cadena, posicion, longitud, nueva_cadena): Devuelve el resultado de sustituir con la nueva cadena los caracteres de cadena expresados en longitud desde la posición indicada.

**Ejemplo:** Obtener los nombres y apellidos de todos los clientes en una sola columna con el formato apellidos, nombre.

```sql
SELECT concat(apellidos,", ",nombre) AS nombrecompleto FROM clientes;
```

**Ejemplo:** Suponiendo que la columna localidad de CLIENTES contiene erróneamente SANTRDER para todos los alumnos de Santander, hacer lo necesario para modificar el valor de esa columna usando la función insert.

```sql
UPDATE clientes SET localidad= insert(localidad, 5, 1, 'AN')   
WHERE localidad='SANTANDER'
```
Aunque, por lógica, esto cualquiera lo haría así:

```sql
UPDATE clientes SET localidad= 'SANTANDER’ WHERE localidad='SANTANDER';
```

- locate(subcadena,cadena): Devuelve la posición a partir de la cual se encuentra subcadena en cadena, cero si no la encuentra.
- locate(subcadena, cadena, pos): igual que la anterior buscando a partir de la posición pos.
- lcase(cadena): Devuelve la cadena en minúsculas
- ucase(cadena): Devuelve cadena en mayúsculas.
- lpad(cadena,N,subcadena): Devuelve cadena ocupando N caracteres, rellenando por la izquierda con subcadena si fuese necesario.
- rpad(cadena,N,subcadena): igual que la anterior por la derecha
- ltrim(cadena): Devuelve cadena tras eliminarle los espacios por la izquierda si los tuviera.
- rtrim(cadena): igual que la anterior por la derecha.
- trim(subcadena FROM  cadena): Devuelve la cadena tras eliminarle las apariciones de subcadena por la izquierda y por la derecha. Esta función admite otras sintaxis.

**Ejemplo:** Obtener la calle en la que vive cada cliente. No hay que escribir otros datos de la dirección.

```sql
SELECT LEFT(direccion,LOCATE(',',direccion)-1) FROM clientes;
```

**Ejemplo:** Obtener las matrículas y precios de los automóviles de forma que los precios ocupen 20 posiciones rellenando las sobrantes con ‘+.’

```sql
SELECT matricula, LPAD(precio, 20, '+.') FROM automoviles;
```

## HOJAS DE EJERCICIOS

💻 Hoja de ejercicios 16.

### 3.3.- Funciones de fecha y hora

- adddate(fecha, INTERVAL  N tipo_intervalo):  Devuelve la fecha incrementada en N el tipo de intervalo indicado.
El tipo de intervalo para fechas puede ser DAY, WEEK, MONTH, QUARTER, YEAR

**Ejemplo:** Suponiendo que todas las fechas de los contratos tienen como año el 2007, modificarlas para que tengan como año el 2017.

```sql
UPDATE contratos SET finicial=adddate(finicial,INTERVAL 10 YEAR), ffinal=adddate(ffinal,INTERVAL 10 YEAR);
```

- addtime(tiempo1, tiempo2):  Devuelve el resultado de sumar los dos tiempos.
- subtime(tiempo1, tiempo2): Devuelve el resultado de tiempo1-tiempo2.
- curtime(): Devuelve la hora actual.

**Ejemplo:** Obtener la hora que será dentro de 1 hora y 20 minutos y la que era hace 3 horas y 15 minutos.

```sql
SELECT addtime(curtime(),'1:20:0'), subtime(curtime(),'3:15:0');
```

- datediff(fecha1, fecha2):  Devuelve los días transcurridos entre fecha2 y fecha1.
- subdate(fecha, INTERVAL  N tipo_periodo): Devuelve la fecha resultado de restarle a fecha el tipo de periodo Nveces.
- curdate(): Devuelve la fecha actual.

**Ejemplo:** Obtener la fecha que era hace dos trimestres y cuantos días han transcurrido desde esa fecha.

```sql
SELECT subdate(curdate(), INTERVAL 2 QUARTER), datediff( curdate(), subdate(curdate(), INTERVAL 2 QUARTER));
```
- date(fechahora):  Devuelve la fecha de una dato DATETIME.
- time(fechahora):  Devuelve la parte TIME de una dato DATETIME.
- year(fecha): Devuelve el año de una fecha.
- quarter(fecha): Devuelve el trimestre de una fecha.
- month(fecha): Devuelve el mes numérico de una fecha.
- monthname(fecha): Devuelve el nombre del mes de una fecha.
- day(fecha): Devuelve el día del mes de una fecha.
- dayname(fecha): Devuelve el nombre del día de la semana de una fecha.
- dayofweek(fecha): Devuelve el número de día de la semana de una fecha. Semana comienza en Domingo con número 1.
- dayofyear(fecha): Devuelve el número de día del año de una fecha.
- weekofyear(fecha): Devuelve el número de semana del año de la fecha dada. Las semanas comienzan en domingo y la primera del año es la primera con comienzo en domingo.
- now():  Devuelve la fecha y hora actuales.
- hour(tiempo):  Devuelve la parte horas de tiempo.
- minute(tiempo): Devuelve la parte minutos de tiempo.
- second(tiempo): Devuelve la parte segundos de tiempo.
- sec_to_time(segundos): Convierte los segundos pasados a dato TIME
- time_to_sec(tiempo): Opuesta a la anterior

**Ejemplo:** Obtener la hora actual y cuantos minutos faltan para la siguiente hora en punto.

```sql
SELECT curtime();
SELECT 60-minute(curtime());
```

### 3.4.- Funciones de control de flujo

- CASE valor WHEN [valor1] THEN resultado1 [WHEN [valor2] THEN resultado2 ...] [ELSE resultado] END: devuelve el resultado correspondiente al primer valorN que coincida con valor. Si ningún valorN coincide con valor se devuelve el resultado que hay tras la cláusula ELSE, y si no tuviera esta cláusula se devuelve NULL. 

**Ejemplo:** Obtener el día de la semana que es hoy en español.

```sql
SELECT case dayofweek(curdate()) 
when 1 then 'domingo' 
when 2 then 'lunes' 
when 3 then 'martes' 
when 4 then 'miercoles' 
when 5 then 'jueves'
when 6 then 'viernes' 
when 7 then 'sabado' end;	
```

- CASE WHEN [condicion1] THEN resultado1 [WHEN [condicion2] THEN resultado2 ...] [ELSE resultado] END: devuelve el resultado correspondiente a la primera condición que se cumpla.

**Ejemplo:** Obtener la calificación de los alumnos en formato alfanumérico. Debe preverse una calificación incorrecta.

```sql
SELECT nombre, apellidos, 
case when nota>=0 and nota<5 then 'suspenso'  
when nota<6 then 'aprobado' 
when nota<7 then 'bien' 
when nota<9 then 'notable' 
when nota<10 then 'sobresaliente' 
else 'calificacion incorrecta' end 
FROM alumnos;	
```

- IF(expr1,expr2,expr3): Si expr1 es verdadera (expr1 <> 0 and expr1 <> NULL), devuelve  expr2, si no devuelve expr3.

**Ejemplo:** Obtener la matrícula marca y modelo de los automóviles junto con su estado (escribiendo alquilado o disponible).

```sql
SELECT matricula, marca, modelo, if(alquilado, 'alquilado', 'disponible') 
FROM automoviles;	
```

### 3.5.- Otras funciones

- aes_encrypt(texto,clave):Permite encriptar información usando una clave de encriptación. Utiliza la técnica AES
- aes_decrypt(texto,clave): Para desencriptar.
- md5(texto): Para encriptar con algoritmo MD5. NO es reversible , es decir, no hay una función para desencriptar.
- connection_id(): Devuelve el número de identificador de la conexión cliente MySQL al servidor.
- current_user(): Devuelve el nombre del usuario y del equipo donde éste ha sido autenticado.
- last_insert_id(): Devuelve el último valor insertado en una columna AUTO_INCREMENT.
- row_count(): Devuelve el número de filas que se vieron afectadas por la operación precedente de borrado, inserción o modificación.
- version(): Devuelve la versión del servidor MySQL

## HOJAS DE EJERCICIOS

💻 Hoja de ejercicios 17.

💻 Hoja de ejercicios 18. (Repaso)

💻 Hoja de ejercicios 19. (Repaso)

## ACTIVIDAD GRUPAL

💻 The SQL Murder Mystery. (https://mystery.knightlab.com/#experienced)