# 🧩UNIDAD 8. BASES DE DATOS NO RELACIONALES

## 📌 1. Introducción a las Bases de Datos No Relacionales

### 💡 ¿Qué es una base de datos NoSQL?

Una base de datos NoSQL (Not Only SQL) es un sistema de almacenamiento de datos que **no sigue el modelo tradicional de tablas relacionadas** como en las bases de datos relacionales.

En lugar de trabajar con filas y columnas, estas bases de datos utilizan **estructuras más flexibles**, como documentos, clave-valor, grafos o columnas.

👉 La idea principal es sencilla: adaptarse mejor a aplicaciones modernas donde los datos pueden cambiar mucho o no tienen una estructura fija.

### 🔄 Diferencias básicas con bases de datos relacionales

Las bases de datos relacionales (como MySQL) organizan la información en tablas con una estructura fija. En cambio, las NoSQL son mucho más flexibles.

📍 Algunas diferencias clave:

- Las relacionales usan **tablas**, las NoSQL pueden usar **documentos (JSON)**  
- En SQL necesitas definir la estructura antes, en NoSQL **puede cambiar fácilmente**  
- Las relacionales usan relaciones (JOIN), en NoSQL se intenta **evitar ese tipo de operaciones**  
- NoSQL está pensada para manejar **grandes volúmenes de datos** de forma eficiente  

💭 En resumen: las bases NoSQL sacrifican algo de control estructural a cambio de **flexibilidad y rendimiento**.

### 🌍 Casos de uso

Las bases de datos NoSQL no sustituyen a las relacionales, sino que se utilizan cuando encajan mejor.

📌 Algunos ejemplos reales:

- Aplicaciones web con muchos usuarios (redes sociales, apps móviles)  
- Sistemas con datos que cambian constantemente  
- Aplicaciones que manejan grandes volúmenes de información (Big Data)  
- APIs que trabajan con datos en formato JSON  


### 🚀 Conclusión: trabajaremos con MongoDB

En este tema vamos a utilizar MongoDB, una de las bases de datos NoSQL más utilizadas.

📦 MongoDB almacena la información en **documentos tipo JSON**, lo que permite trabajar de forma muy parecida a como lo hacemos en muchos lenguajes de programación.

👉 En los siguientes apartados aprenderás paso a paso:

- Cómo instalar MongoDB  
- Cómo crear bases de datos  
- Cómo insertar, consultar y modificar datos  

### 📝 RECUERDA

- NoSQL ≠ “sin SQL”, significa “no solo SQL”  
- Mayor flexibilidad en los datos  
- Muy útil en aplicaciones modernas  

## ⚙️ 2. Preparación del entorno de trabajo con MongoDB

Antes de empezar a trabajar con datos, necesitamos preparar nuestro entorno. Vamos a hacerlo paso a paso.

### 💾 Instalación de MongoDB

MongoDB se puede instalar de forma local en tu equipo.

👉 Pasos generales:

1. Accede a la web oficial de MongoDB  
2. Descarga la versión Community Server  
3. Ejecuta el instalador  
4. Sigue la instalación con las opciones por defecto  

📌 Durante la instalación:
- Se instalará también el servicio de MongoDB
- En algunos casos se añadirá automáticamente al sistema

💡 Consejo: no cambies rutas ni configuraciones si no tienes experiencia previa.

### 🧰 Compass / Shell

MongoDB se puede usar de dos formas principales:

🔹 **MongoDB Compass** (interfaz gráfica)  
Es una aplicación visual que permite trabajar con bases de datos sin escribir comandos.

👉 Ideal para empezar:
- Ver datos fácilmente  
- Crear colecciones  
- Insertar documentos con formularios  

🔹 **MongoDB Shell (mongosh)**  
Es la consola de comandos de MongoDB.

👉 Permite:
- Ejecutar consultas  
- Automatizar tareas  
- Tener un mayor control  

💭 Lo habitual es combinar ambos:  
usar Compass para visualizar y el Shell para practicar comandos.


### ▶️ Puesta en marcha del servidor

MongoDB funciona como un servicio que debe estar en ejecución.

👉 En la mayoría de instalaciones:

- En **Windows**, se inicia automáticamente como servicio  
- En **Linux/Mac**, puede ser necesario iniciarlo manualmente  

Ejemplo en Linux/Mac:

```bash
sudo systemctl start mongod
```
Para comprobar que está funcionando:

```bash
sudo systemctl status mongod
```

🔌 Primera conexión

Una vez el servidor está en marcha, podemos conectarnos.

✔️ Con MongoDB Compass
Abre MongoDB Compass
Usa la conexión por defecto:

mongodb://localhost:27017

Pulsa en Connect

👉 Si todo va bien, verás las bases de datos disponibles.

✔️ Con MongoDB Shell

Abre una terminal y escribe:


```bash
mongosh
```

📌 Si la conexión es correcta, verás algo como:


```bash
test>
```

Eso indica que ya estás dentro de MongoDB.

🧪 Comprueba que todo funciona

Una vez conectado, prueba este comando:
```mongo
show dbs
```

👉 Si aparece una lista (aunque esté vacía), todo está funcionando correctamente.

📝 RECUERDA
- MongoDB necesita un servidor en ejecución
- Puedes trabajar con interfaz gráfica (Compass) o consola (mongosh)
- La conexión local usa: mongodb://localhost:27017

🧠 Nuestro escenario: instalamos MongoDB en una máquina virtual en Windows 10 o Windows 11 y usamos el cliente desde la máquina real.

Para la instalación, ponemos la máquina virtual en Adaptador-puente, descargar el fichero correspondiente y lo instalas.
Después de la descarga, vuelves a modo solo-anfitrión e intentas conectarte desde la máquina real, pero antes hay que hacer lo siguiente:

1. 🧾 Modificar el archivo de configuración de MongoDB

En la máquina virtual (Windows 10), busca el archivo:

C:\Program Files\MongoDB\Server\<versión>\bin\mongod.cfg

Busca esta parte:

net:
  bindIp: 127.0.0.1

👉 Cámbiala por:

net:
  bindIp: 0.0.0.0

📌 Esto permite que MongoDB escuche en todas las interfaces de red.

2. 🔁 Reiniciar el servicio de MongoDB

En Windows:

Abre services.msc
Busca MongoDB Server
Pulsa en Reiniciar

3. 🌐 Comprobar conectividad desde la máquina real

Desde tu máquina física prueba:

ping 192.168.56.106


4. 🔌 Conexión correcta en MongoDB

Te conectas desde Mongo Compass desde tu máquina real.

## 🖥️ 3. Comandos básicos desde la consola (MongoDB Shell)

Una vez dentro de MongoDB usando `mongosh`, podemos empezar a trabajar con comandos básicos para gestionar bases de datos y consultar información.

Para entrar en la consola:

mongosh


### 📚 Gestión de bases de datos

Para ver todas las bases de datos disponibles en el servidor:

```mongo
show dbs
```

Este comando muestra únicamente las bases de datos que contienen datos.

Para ver en qué base de datos estamos trabajando en este momento:

```mongo
db
```

Para cambiar de base de datos o crear una nueva:

```mongo
use nombreBaseDatos
```

📌 Si la base de datos no existe, se creará automáticamente cuando insertes el primer dato.

Ejemplo:

```mongo
use tienda
```

### 📁 Gestión de colecciones

Las colecciones son el equivalente a las tablas en bases de datos relacionales.

Para ver las colecciones de la base de datos actual:

```mongo
show collections
```
### 📄 Consulta de datos

Para consultar todos los documentos de una colección:

```mongo
db.nombreColeccion.find()
```

Ejemplo:

```mongo
db.productos.find()
```

Para ver los resultados con un formato más legible:

```mongo
db.nombreColeccion.find().pretty()
```

Para limitar el número de resultados:

```mongo
db.nombreColeccion.find().limit(5)
```

## 🧰 4. Operaciones básicas en MongoDB Compass

MongoDB Compass es la herramienta gráfica de MongoDB que permite trabajar con bases de datos sin necesidad de usar comandos. Es muy útil para visualizar datos, hacer consultas y gestionar colecciones de forma intuitiva.

### 🔌 Conexión al servidor

Al abrir Compass, lo primero es conectarse al servidor.

En el campo de conexión se introduce:

mongodb://localhost:27017

Después se pulsa en **Connect** para acceder al servidor.

Si la conexión es correcta, aparecerán las bases de datos disponibles en el panel lateral.

### 📚 Visualizar bases de datos

En la interfaz principal, en la parte izquierda, se muestran todas las bases de datos existentes.

Desde ahí puedes:
- Ver las bases de datos disponibles  
- Entrar en una base de datos haciendo clic sobre su nombre  
- Ver el tamaño y número de colecciones  

### 📁 Ver colecciones

Dentro de cada base de datos aparecen sus colecciones.

Al hacer clic en una colección puedes:
- Ver los documentos almacenados  
- Navegar por los registros  
- Ver la estructura de los datos (formato JSON)  

### 📄 Consultar datos

Dentro de una colección puedes ver los documentos directamente en pantalla.

Además, Compass permite filtrar datos usando la barra de **Filter**.

Ejemplos de filtros:

- Buscar todos los documentos:
  {}

- Buscar por campo:
  { "nombre": "Juan" }

- Buscar por condiciones:
  { "edad": { "$gt": 18 } }

También puedes:
- Ordenar resultados  
- Limitar la visualización de campos  
- Aplicar filtros avanzados sin escribir código complejo  

### ➕ Insertar documentos

Compass permite insertar datos de forma visual:

1. Entra en una colección  
2. Pulsa en **Add Data**  
3. Selecciona **Insert Document**  
4. Escribe el documento en formato JSON  
5. Guarda los cambios  

Ejemplo de documento:

{
  "nombre": "Ana",
  "edad": 25,
  "ciudad": "Lugo"
}

### ✏️ Editar y eliminar datos

Desde cada documento puedes:

- Editar campos directamente  
- Guardar cambios con un clic  
- Eliminar documentos individuales  

Esto facilita mucho el trabajo sin necesidad de comandos.

