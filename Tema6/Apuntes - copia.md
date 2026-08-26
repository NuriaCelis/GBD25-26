Perfecto, aquí tienes un conjunto de **ejercicios de procedimientos y funciones en MySQL** basados en la base de datos `concursoMusica`, diseñados específicamente para practicar las estructuras de control `IF`, `CASE`, `WHILE` y `REPEAT`.

---

## 🎼 Ejercicios de Procedimientos y Funciones – Base de datos `concursoMusica`

### 🧩 ESTRUCTURAS: `IF`, `CASE`, `WHILE`, `REPEAT`

---

### 🔁 1. **Función: Categorizar duración de una canción**

**Objetivo:** Crear una función que reciba la duración (en segundos) de una canción y devuelva una categoría (`"Corta"`, `"Media"` o `"Larga"`):

* `"Corta"`: menos de 180 segundos
* `"Media"`: entre 180 y 300
* `"Larga"`: más de 300

💡 **Instrucción a practicar:** `IF`

```sql
CREATE FUNCTION categoriaDuracion(duracionSegundos INT) RETURNS VARCHAR(10)
```

---

### 🎯 2. **Procedimiento: Clasificar componentes según su rol**

**Objetivo:** Crear un procedimiento que, dado el ID de un componente, muestre un mensaje personalizado según el rol que desempeña (`voz`, `guitarra`, `batería`, etc.).

💡 **Instrucción a practicar:** `CASE`

```sql
CALL clasificarComponente(5);
-- Resultado esperado (ejemplo): 'El componente es guitarrista del grupo.'
```

```sql
CREATE PROCEDURE clasificarComponente(idComp INT)
```

---

### 🔄 3. **Procedimiento: Contar canciones con bucle WHILE**

**Objetivo:** Crear un procedimiento que, dado un ID de grupo, recorra con un bucle `WHILE` las canciones de ese grupo y cuente cuántas hay.
**(Sin usar funciones agregadas)**

💡 **Instrucción a practicar:** `WHILE`

```sql
CREATE PROCEDURE contarCancionesGrupo(idGrupo INT)
```

---

### 🔁 4. **Procedimiento: Mostrar usuarios con REPEAT**

**Objetivo:** Crear un procedimiento que recorra los usuarios desde el ID 1 hasta el mayor ID y muestre sus nombres usando un bucle `REPEAT`.

💡 **Instrucción a practicar:** `REPEAT`

```sql
CREATE PROCEDURE mostrarUsuarios()
```

---

### ⚠️ 5. **Función: Validar si una canción es válida para concurso**

**Objetivo:** Crear una función que reciba el ID de una canción y devuelva `TRUE` si su duración está entre 120 y 300 segundos, `FALSE` en otro caso.

💡 **Instrucción a practicar:** `IF`

```sql
CREATE FUNCTION esCancionValida(idCancion INT) RETURNS BOOLEAN
```

---

¿Quieres que prepare también las soluciones de estos ejercicios o los vas a usar como práctica guiada con tus alumnos?
Genial. Aquí tienes **otros cinco ejercicios distintos** sobre **procedimientos y funciones** basados en la base de datos `concursoMusica`, también diseñados para practicar `IF`, `CASE`, `WHILE` y `REPEAT`. En este caso, los enunciados son más variados, con lógica combinada y más enfoque en situaciones realistas.

---

## 🎵 Nuevos Ejercicios – Procedimientos y Funciones (`concursoMusica`)

---

### 🧠 6. **Función: Indicar nivel de participación de un grupo**

**Objetivo:** Crear una función que reciba el ID de un grupo y devuelva un mensaje dependiendo del número de canciones registradas:

* `0 canciones`: `'Sin participación'`
* `1 a 2 canciones`: `'Baja participación'`
* `3 a 5 canciones`: `'Participación media'`
* `Más de 5`: `'Alta participación'`

💡 **Instrucción a practicar:** `CASE`

```sql
CREATE FUNCTION nivelParticipacionGrupo(idGrupo INT) RETURNS VARCHAR(50)
```

---

### 🔄 7. **Procedimiento: Eliminar canciones demasiado largas**

**Objetivo:** Crear un procedimiento que elimine con un bucle `WHILE` todas las canciones cuya duración sea mayor de 600 segundos (una a una, sin `DELETE WHERE`). Mostrar por pantalla cuántas se han eliminado.

💡 **Instrucción a practicar:** `WHILE` + `DELETE`

```sql
CREATE PROCEDURE eliminarCancionesLargas()
```

---

### 🔂 8. **Procedimiento: Generar mensaje para cada componente de un grupo**

**Objetivo:** Crear un procedimiento que, dado un ID de grupo, utilice un bucle `REPEAT` para recorrer todos sus componentes y mostrar un mensaje personalizado tipo:
`"Componente X (rol: guitarra) pertenece al grupo Y."`

💡 **Instrucción a practicar:** `REPEAT`

```sql
CREATE PROCEDURE infoComponentesGrupo(idGrupo INT)
```

---

### ❓ 9. **Función: Comprobar si un usuario ha registrado canciones válidas**

**Objetivo:** Crear una función que, dado el ID de un usuario, devuelva `TRUE` si ha registrado canciones cuya duración está entre 150 y 400 segundos.
Si no ha registrado ninguna o todas son inválidas, devolver `FALSE`.

💡 **Instrucción a practicar:** `IF` + subconsulta

```sql
CREATE FUNCTION usuarioTieneCancionesValidas(idUsuario INT) RETURNS BOOLEAN
```

---

### 🔢 10. **Procedimiento: Sumar duración total de canciones de todos los grupos**

**Objetivo:** Crear un procedimiento que calcule la suma total de la duración de todas las canciones, pero usando un bucle `WHILE` que recorra los grupos uno a uno y sume sus duraciones.

💡 **Instrucción a practicar:** `WHILE` + acumulador

```sql
CREATE PROCEDURE duracionTotalPorGrupos()
```

---

¿Quieres que prepare un documento con estos ejercicios en formato Markdown o algún formato específico para repartir en clase?
Claro, aquí tienes solo las **soluciones de los 5 primeros ejercicios** (funciones y procedimientos) para la base de datos `concursoMusica`, centrados en el uso de `IF`, `CASE`, `WHILE` y `REPEAT`.

---

## ✅ Soluciones – Ejercicios 1 a 5 (`concursoMusica`)

---

### 1. **Función: Categorizar duración de una canción (`IF`)**

```sql
DELIMITER //
CREATE FUNCTION categoriaDuracion(duracionSegundos INT)
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
    DECLARE resultado VARCHAR(10);
    IF duracionSegundos < 180 THEN
        SET resultado = 'Corta';
    ELSEIF duracionSegundos <= 300 THEN
        SET resultado = 'Media';
    ELSE
        SET resultado = 'Larga';
    END IF;
    RETURN resultado;
END;
//
DELIMITER ;
```

---

### 2. **Procedimiento: Clasificar componentes según su rol (`CASE`)**

```sql
DELIMITER //
CREATE PROCEDURE clasificarComponente(idComp INT)
BEGIN
    DECLARE rolComp VARCHAR(50);
    SELECT rol INTO rolComp FROM componentes WHERE id = idComp;

    CASE rolComp
        WHEN 'voz' THEN SELECT 'El componente es vocalista del grupo.' AS mensaje;
        WHEN 'guitarra' THEN SELECT 'El componente es guitarrista del grupo.' AS mensaje;
        WHEN 'bateria' THEN SELECT 'El componente es baterista del grupo.' AS mensaje;
        ELSE SELECT CONCAT('El componente tiene el rol de ', rolComp) AS mensaje;
    END CASE;
END;
//
DELIMITER ;
```

---

### 3. **Procedimiento: Contar canciones con bucle `WHILE`**

```sql
DELIMITER //
CREATE PROCEDURE contarCancionesGrupo(idGrupo INT)
BEGIN
    DECLARE contador INT DEFAULT 0;
    DECLARE total INT;
    DECLARE i INT DEFAULT 0;

    SELECT COUNT(*) INTO total FROM canciones WHERE grupo_id = idGrupo;

    WHILE i < total DO
        SET contador = contador + 1;
        SET i = i + 1;
    END WHILE;

    SELECT CONCAT('Número de canciones del grupo: ', contador) AS resultado;
END;
//
DELIMITER ;
```

---

### 4. **Procedimiento: Mostrar usuarios con `REPEAT`**

```sql
DELIMITER //
CREATE PROCEDURE mostrarUsuarios()
BEGIN
    DECLARE idActual INT DEFAULT 1;
    DECLARE maxId INT;

    SELECT MAX(id) INTO maxId FROM usuarios;

    REPEAT
        IF EXISTS (SELECT 1 FROM usuarios WHERE id = idActual) THEN
            SELECT CONCAT('Usuario ID: ', idActual, ' - Nombre: ', nombre) 
            FROM usuarios WHERE id = idActual;
        END IF;
        SET idActual = idActual + 1;
    UNTIL idActual > maxId
    END REPEAT;
END;
//
DELIMITER ;
```

---

### 5. **Función: Validar si una canción es válida para concurso (`IF`)**

```sql
DELIMITER //
CREATE FUNCTION esCancionValida(idCancion INT)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE duracion INT;
    SELECT duracion INTO duracion FROM canciones WHERE id = idCancion;

    IF duracion >= 120 AND duracion <= 300 THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END;
//
DELIMITER ;
```

---

¿Quieres que te los ponga también en formato `.sql` o `.md` para descargar?
Por supuesto, aquí tienes las **soluciones del ejercicio 6 al 10** para la base de datos `concursoMusica`, todos diseñados para practicar `IF`, `CASE`, `WHILE` y `REPEAT` como corresponde:

---

## ✅ Soluciones – Ejercicios 6 a 10 (`concursoMusica`)

---

### 6. **Función: Nivel de participación de un grupo (`CASE`)**

```sql
DELIMITER //
CREATE FUNCTION nivelParticipacionGrupo(idGrupo INT)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    DECLARE total INT;
    SELECT COUNT(*) INTO total FROM canciones WHERE grupo_id = idGrupo;

    RETURN CASE
        WHEN total = 0 THEN 'Sin participación'
        WHEN total <= 2 THEN 'Baja participación'
        WHEN total <= 5 THEN 'Participación media'
        ELSE 'Alta participación'
    END;
END;
//
DELIMITER ;
```

---

### 7. **Procedimiento: Eliminar canciones demasiado largas (`WHILE`)**

```sql
DELIMITER //
CREATE PROCEDURE eliminarCancionesLargas()
BEGIN
    DECLARE contador INT DEFAULT 0;
    DECLARE existe BOOL;

    SELECT EXISTS(SELECT 1 FROM canciones WHERE duracion > 600) INTO existe;

    WHILE existe DO
        DELETE FROM canciones WHERE duracion > 600 LIMIT 1;
        SET contador = contador + 1;
        SELECT EXISTS(SELECT 1 FROM canciones WHERE duracion > 600) INTO existe;
    END WHILE;

    SELECT CONCAT('Canciones eliminadas: ', contador) AS mensaje;
END;
//
DELIMITER ;
```

---

### 8. **Procedimiento: Mensaje personalizado para componentes de un grupo (`REPEAT`)**

```sql
DELIMITER //
CREATE PROCEDURE infoComponentesGrupo(idGrupo INT)
BEGIN
    DECLARE idComp INT;
    DECLARE rolComp VARCHAR(50);
    DECLARE nombreGrupo VARCHAR(100);
    DECLARE fin BOOL DEFAULT FALSE;

    DECLARE cur CURSOR FOR 
        SELECT id, rol FROM componentes WHERE grupo_id = idGrupo;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin = TRUE;

    SELECT nombre INTO nombreGrupo FROM grupos WHERE id = idGrupo;

    OPEN cur;

    REPEAT
        FETCH cur INTO idComp, rolComp;
        IF NOT fin THEN
            SELECT CONCAT('Componente ', idComp, ' (rol: ', rolComp, ') pertenece al grupo ', nombreGrupo) AS mensaje;
        END IF;
    UNTIL fin END REPEAT;

    CLOSE cur;
END;
//
DELIMITER ;
```

---

### 9. **Función: ¿El usuario tiene canciones válidas? (`IF` + subconsulta)**

```sql
DELIMITER //
CREATE FUNCTION usuarioTieneCancionesValidas(idUsuario INT)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE existeValida BOOL;

    SELECT EXISTS(
        SELECT 1 FROM canciones 
        WHERE usuario_id = idUsuario AND duracion BETWEEN 150 AND 400
    ) INTO existeValida;

    RETURN existeValida;
END;
//
DELIMITER ;
```

---

### 10. **Procedimiento: Sumar duración total de canciones por grupo (`WHILE`)**

```sql
DELIMITER //
CREATE PROCEDURE duracionTotalPorGrupos()
BEGIN
    DECLARE totalDuracion INT DEFAULT 0;
    DECLARE idGrupo INT DEFAULT 1;
    DECLARE maxGrupo INT;
    DECLARE durGrupo INT;

    SELECT MAX(id) INTO maxGrupo FROM grupos;

    WHILE idGrupo <= maxGrupo DO
        SELECT IFNULL(SUM(duracion), 0) INTO durGrupo FROM canciones WHERE grupo_id = idGrupo;
        SET totalDuracion = totalDuracion + durGrupo;
        SET idGrupo = idGrupo + 1;
    END WHILE;

    SELECT CONCAT('Duración total de canciones en todos los grupos: ', totalDuracion, ' segundos') AS resultado;
END;
//
DELIMITER ;
```

---

Si lo deseas, puedo empaquetar estos 5 procedimientos y funciones en un archivo `.sql` o `.md`. ¿Quieres que te lo prepare?

# 📝 Apuntes: Cursores en MySQL

## 📌 ¿Qué es un cursor?

Un **cursor** en MySQL es un mecanismo que permite **recorrer fila a fila** el resultado de una consulta. Es útil cuando necesitas aplicar una lógica procedural sobre múltiples filas dentro de un procedimiento almacenado.

---

## ✅ Fases para usar un cursor

1. **Declarar el cursor**
2. **Declarar el manejador para el final de los datos**
3. **Abrir el cursor**
4. **Leer fila a fila con `FETCH` dentro de un bucle**
5. **Cerrar el cursor**

---

## ⚠️ Reglas importantes

- Los cursores **solo pueden usarse en procedimientos almacenados**.
- **No se pueden usar en funciones**.
- Es obligatorio **cerrar el cursor** después de usarlo.
- Se recomienda usar `DECLARE CONTINUE HANDLER` para detectar el final del cursor y evitar errores.

---

## 📌 Sintaxis básica

```sql
DELIMITER //

CREATE PROCEDURE ejemplo_cursor()
BEGIN
    DECLARE fin INT DEFAULT FALSE;
    DECLARE nombreGrupo VARCHAR(100);

    -- 1. Declarar cursor
    DECLARE cur CURSOR FOR SELECT nombre FROM grupos;

    -- 2. Manejador para el final del cursor
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin = TRUE;

    -- 3. Abrir cursor
    OPEN cur;

    -- 4. Bucle de lectura
    lectura: REPEAT
        FETCH cur INTO nombreGrupo;
        IF NOT fin THEN
            -- Aquí va la lógica con cada fila
            SELECT CONCAT('Nombre del grupo: ', nombreGrupo);
        END IF;
    UNTIL fin END REPEAT;

    -- 5. Cerrar cursor
    CLOSE cur;
END;
//

DELIMITER ;
Claro, aquí tienes **todo el contenido en formato Markdown** incluyendo los apuntes, explicaciones y ejemplos sobre cursores en MySQL:

---

````markdown
# 📝 Apuntes: Cursores en MySQL

## 📌 ¿Qué es un cursor?

Un **cursor** en MySQL es un mecanismo que permite **recorrer fila a fila** el resultado de una consulta.  
Es útil cuando necesitas aplicar lógica procedural sobre varias filas dentro de un **procedimiento almacenado**.

---

## ✅ Fases para usar un cursor

1. **Declarar el cursor**
2. **Declarar el manejador para detectar el final de los datos**
3. **Abrir el cursor**
4. **Leer fila a fila con `FETCH` dentro de un bucle (`WHILE` o `REPEAT`)**
5. **Cerrar el cursor**

---

## ⚠️ Reglas importantes

- Los cursores **solo pueden usarse en procedimientos almacenados**.
- **No pueden usarse en funciones**.
- Se deben **cerrar siempre** después de usarlos.
- Es recomendable usar `DECLARE CONTINUE HANDLER FOR NOT FOUND` para evitar errores al terminar de leer filas.

---

## 🧩 Sintaxis básica de uso de cursor

```sql
DELIMITER //

CREATE PROCEDURE ejemplo_cursor()
BEGIN
    DECLARE fin INT DEFAULT FALSE;
    DECLARE nombreGrupo VARCHAR(100);

    -- 1. Declarar el cursor
    DECLARE cur CURSOR FOR SELECT nombre FROM grupos;

    -- 2. Declarar manejador para detectar final de datos
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin = TRUE;

    -- 3. Abrir el cursor
    OPEN cur;

    -- 4. Bucle REPEAT con FETCH
    REPEAT
        FETCH cur INTO nombreGrupo;
        IF NOT fin THEN
            SELECT CONCAT('Nombre del grupo: ', nombreGrupo) AS mensaje;
        END IF;
    UNTIL fin END REPEAT;

    -- 5. Cerrar el cursor
    CLOSE cur;
END;
//

DELIMITER ;
````

---

## 🔁 Ejemplo con bucle WHILE

```sql
DELIMITER //

CREATE PROCEDURE recorrerComponentes()
BEGIN
    DECLARE fin INT DEFAULT FALSE;
    DECLARE nombreComp VARCHAR(100);
    DECLARE rolComp VARCHAR(50);

    -- Declarar cursor
    DECLARE cur CURSOR FOR 
        SELECT nombre, rol FROM componentes;

    -- Manejador para final de datos
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin = TRUE;

    -- Abrir cursor
    OPEN cur;

    -- Leer primera fila
    FETCH cur INTO nombreComp, rolComp;

    -- Bucle WHILE
    WHILE NOT fin DO
        SELECT CONCAT(nombreComp, ' - ', rolComp) AS infoComponente;
        FETCH cur INTO nombreComp, rolComp;
    END WHILE;

    -- Cerrar cursor
    CLOSE cur;
END;
//

DELIMITER ;
```

---

## 🧠 Buenas prácticas

* Usa **nombres claros** para cursores y variables (`cur`, `fin`, `nombreGrupo`, etc.).
* Declara siempre un **manejador para NOT FOUND**.
* Cierra el cursor con `CLOSE cur;` al final del procedimiento.
* Usa `REPEAT` cuando no necesites leer antes de entrar al bucle, o `WHILE` cuando necesites controlar antes de entrar.

---

```

¿Quieres que te lo guarde como archivo `.md` listo para descargar o imprimir?
```

