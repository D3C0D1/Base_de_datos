# 🌐 DataConnect - Plataforma de Integración y Gestión de Datos para PYMEs

![DataConnect Logo](https://via.placeholder.com/600x150?text=DataConnect+Logo)

**DataConnect** es una solución diseñada para ayudar a las PYMEs a centralizar, gestionar y analizar datos de diversas fuentes en un solo lugar, facilitando la toma de decisiones a partir de información consolidada.

---

## 💡 Funcionalidades Clave

- 🔗 **Integración de Datos**: Unifica información de clientes, productos, proveedores y transacciones.
- 🔍 **Gestión de Información**: Controla y actualiza los datos de la empresa de forma segura y eficiente.
- 📊 **Análisis Optimizado**: Facilita la extracción de información valiosa y estructurada para decisiones rápidas.

---

## 🧭 Índice

1. [🎯 Contexto del Proyecto](#🎯-contexto-del-proyecto)
2. [🏗️ Modelo Conceptual a Relacional](#🏗️-modelo-conceptual-a-relacional)
   - [📊 Matriz de Relaciones](#📊-matriz-de-relaciones)
3. [🔧 Comandos SQL Útiles](#🔧-comandos-sql-útiles)
4. [🚀 Instalación](#🚀-instalación)
   - [💻 Guía para XAMPP](#💻-usando-xampp)
   - [💾 Guía para MySQL Workbench](#💾-usando-mysql-workbench)
5. [🗂️ Tablas y Entidades](#🗂️-tablas-y-entidades)
6. [📜 DDL y DML - Definición de Tablas y Datos](#📜-ddl-y-dml)

---

## 🎯 Contexto del Proyecto

### ¿Por qué DataConnect? 🤔

En muchas PYMEs, los datos están dispersos en diferentes plataformas como hojas de cálculo, aplicaciones y sistemas de correos, dificultando la coherencia y accesibilidad de la información.

**Objetivo del Proyecto**: DataConnect busca centralizar estos datos en una plataforma única que simplifique la consulta, administración y análisis de la información.

---

## 🏗️ Modelo Conceptual a Relacional

### 📊 Matriz de Relaciones (modelo relacional)

| Entidad         | Atributos Principales                                  | Relaciones                                                |
|-----------------|--------------------------------------------------------|-----------------------------------------------------------|
| **Cliente**     | `idcliente` (PK), `dni`, `nombre`, `teléfono`, `dirección` | Usuario (N:1), Factura (1:N)                              |
| **Producto**    | `codproducto` (PK), `descripción`, `precio`, `existencia` | Proveedor (N:1), Factura (N:M a través de Detallefactura) |
| **Factura**     | `nofactura` (PK), `fecha`, `usuario`, `codcliente`, `totalfactura` | Cliente (N:1), Detallefactura (1:N)                      |
| **Proveedor**   | `codproveedor` (PK), `proveedor`, `contacto`, `teléfono`, `dirección` | Producto (1:N)                                            |
| **Usuario**     | `idusuario` (PK), `nombre`, `correo`, `usuario`, `clave` | Rol (N:1), Factura (1:N)                                  |
| **Rol**         | `idrol` (PK), `rol_descripcion`                        | Usuario (1:N)                                             |
| **Detallefactura** | `nodetalle` (PK), `nofactura` (FK), `codproducto` (FK), `cantidad`, `precio` | Factura (N:1), Producto (N:1) |

--- 
## Matriz de Relaciones (modelo conceptual)

|                | cliente | configuracion | detallefactura | detalle_temp | entradas | factura | producto | proveedor | rol | usuario |
|----------------|---------|---------------|----------------|--------------|----------|---------|----------|-----------|-----|---------|
| cliente        |         |               | 1:N            |              |          | N:1     |          |           |     | 1:N     |
| configuracion  |         |               |                |              |          |         |          |           |     |         |
| detallefactura | N:1     |               |                |              |          | N:1     | N:1      |           |     |         |
| detalle_temp   |         |               |                |              |          |         | N:1      |           |     |         |
| entradas       |         |               |                |              |          |         | N:1      |           |     | N:1     |
| factura        | N:1     |               | 1:N            |              |          |         |          |           |     | 1:N     |
| producto       |         |               | 1:N            | 1:N          | 1:N      |         |          | N:1       |     | N:1     |
| proveedor      |         |               |                |              |          |         | 1:N      |           |     |         |
| rol            |         |               |                |              |          |         |          |           | 1:N |         |
| usuario        | 1:N     |               |                |              |          |         | 1:N      |           |     |         |

---





## 🔧 Comandos SQL Útiles

Ejemplos de consultas y comandos SQL útiles para la administración de la base de datos:

```sql
-- Obtener todos los clientes activos
SELECT * FROM cliente WHERE estado = 1;

-- Consultar el inventario de productos con menos de 10 unidades
SELECT * FROM producto WHERE existencia < 10;

-- Sumar el total de ventas realizadas por un cliente específico
SELECT SUM(totalfactura) FROM factura WHERE codcliente = 1;

-- Consultar productos y su proveedor respectivo
SELECT p.descripcion, prov.proveedor 
FROM producto p
JOIN proveedor prov ON p.proveedor = prov.codproveedor;

-- Obtener facturas y el nombre del cliente asociado
SELECT f.nofactura, c.nombre -
FROM factura f
JOIN cliente c ON f.codcliente = c.idcliente;

-- Actualizar el precio de un producto específico
UPDATE producto SET precio = 18000 WHERE codproducto = 2;

-- Eliminar un registro de un proveedor específico
DELETE FROM proveedor WHERE codproveedor = 5;
```
---

### 🚀 Instalación

A continuación, se detallan los pasos para la instalación de DataConnect utilizando XAMPP o MySQL Workbench: usuario y contraseña:admin

### 💻 Usando XAMPP

1. **Paso 1**: Instala XAMPP y asegúrate de tener MySQL y Apache activos.
2. **Paso 2**: Descarga los archivos de este repositorio y copia la carpeta en `C:\xampp\htdocs`.
3. **Paso 3**: Importa la base de datos:
   - Abre phpMyAdmin y crea una nueva base de datos llamada `sis_venta`.
   - En la nueva base de datos, selecciona la opción de importación y carga el archivo `sis_venta.sql`.
4. **Paso 4**: Verifica que las tablas y datos se hayan cargado correctamente.
5. **Paso 5**: Clona el repositorio en la carpeta htdocs`/opt/lampp/htdocs`
 para ubuntu y para windows `C:\xampp\htdocs`
 .

### 💾 Usando MySQL Workbench

1. **Paso 1**: Instala MySQL Workbench y abre una conexión.
2. **Paso 2**: En el menú, selecciona File > Open SQL Script y carga el archivo `sis_venta.sql`.
3. **Paso 3**: Ejecuta el script completo y verifica que las tablas y datos hayan sido creados correctamente.
4. **Paso 4**: Clona el repositorio en la carpeta htdocs `/opt/lampp/htdocs`
 para ubuntu y para windows `C:\xampp\htdocs`
---

## 🗂️ Tablas y Entidades

DataConnect cuenta con **12 tablas** que abarcan diferentes aspectos de la gestión de datos de PYMEs.

- **Cliente**: Almacena información de clientes como nombre, teléfono y dirección.
- **Producto**: Registra información de productos, incluyendo precio y existencia.
- **Factura**: Detalla transacciones realizadas, vinculadas con clientes y productos.
- **Usuario**: Controla la información de los usuarios del sistema, asociándolos a roles específicos.
- **Proveedor**: Información sobre proveedores de productos para la empresa.
- **Rol**: Describe roles de los usuarios en el sistema.

---
# Guía de Transformación de Modelos

## 1. Del Modelo Conceptual al Modelo Entidad-Relación (ER)

En el modelo conceptual, definimos las entidades principales y las relaciones entre ellas sin entrar en detalles de implementación. En este caso, identificamos entidades como `cliente`, `producto`, `factura`, `detallefactura`, entre otros, y establecemos relaciones de negocio (como `cliente` realiza `factura` o `producto` se incluye en `detallefactura`).

**Pasos para convertir al modelo ER:**
- **Identificación de Entidades:** Extraemos las entidades del modelo conceptual, tales como `cliente`, `producto`, y `factura`.
- **Identificación de Relaciones:** Determinamos las relaciones entre entidades y sus cardinalidades. Por ejemplo, un `cliente` puede tener varias `facturas`, mientras que cada `factura` corresponde a un único `cliente` (relación 1:N).
- **Incorporación de Atributos:** Añadimos atributos importantes a cada entidad, como el `nombre` y `dni` en `cliente`, o `precio` y `existencia` en `producto`.
- **Asignación de Cardinalidades:** Definimos la cantidad de ocurrencias permitidas entre entidades para completar el modelo ER.

## 2. Del Modelo ER al Modelo Relacional

Para convertir el modelo ER en el modelo relacional (tablas SQL):
- **Transformación de Entidades en Tablas:** Cada entidad se convierte en una tabla. Por ejemplo, la entidad `cliente` se convierte en una tabla con atributos como `idcliente`, `dni`, `nombre`, etc.
- **Definición de Llaves Primarias y Foráneas:** Asignamos llaves primarias a cada tabla y, cuando corresponde, llaves foráneas para mantener las relaciones. Por ejemplo, en la tabla `factura`, `codcliente` actúa como una llave foránea que referencia a `cliente`.
- **Implementación de Relaciones con Llaves Foráneas:** Las relaciones 1:N se implementan usando llaves foráneas. Por ejemplo, `detallefactura` tiene una relación 1:N con `producto` y `factura`, por lo que incluye `codproducto` y `nofactura` como llaves foráneas.

---

### Ejemplo de Transformación de Entidad y Relación en SQL

La relación entre `cliente` y `factura`:
- **Entidad `cliente`**:
  ```sql
  CREATE TABLE cliente (
      idcliente INT PRIMARY KEY,
      dni INT NOT NULL,
      nombre VARCHAR(100),
      telefono INT,
      direccion VARCHAR(200)
  );
  ```

- **Entidad `factura`** con relación a `cliente`:
  ```sql
  CREATE TABLE factura (
      nofactura INT PRIMARY KEY,
      fecha DATETIME,
      usuario INT,
      codcliente INT,
      totalfactura DECIMAL(10,2),
      FOREIGN KEY (codcliente) REFERENCES cliente(idcliente)
  );
  ```

Esta guía explica cómo crear y estructurar la base de datos desde el modelo conceptual hasta el relacional.
---
## 📜 DDL y DML - Definición de Tablas y Datos

A continuación se muestran los comandos DDL y DML del sistema DataConnect, provenientes del archivo `sis_venta.sql`:

### 🌐 Estructura de Tablas (DDL)

```sql
-- Tabla Cliente
CREATE TABLE `cliente` (
  `idcliente` int(11) NOT NULL,
  `dni` int(8) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `telefono` int(15) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Tabla Configuracion
CREATE TABLE `configuracion` (
  `id` int(11) NOT NULL,
  `dni` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `razon_social` varchar(100) NOT NULL,
  `telefono` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `direccion` text NOT NULL,
  `igv` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
```

### 🌍 Procedimientos Almacenados (DML)

```sql
-- Procedimiento para actualizar precio de producto
CREATE PROCEDURE `actualizar_precio_producto` (IN `n_cantidad` INT, IN `n_precio` DECIMAL(10,2), IN `codigo` INT) 
BEGIN
  DECLARE nueva_existencia int;
  DECLARE nuevo_total decimal(10,2);
  DECLARE nuevo_precio decimal(10,2);
  ...
END$$

-- Procedimiento para agregar detalle temporal
CREATE PROCEDURE `add_detalle_temp` (`codigo` INT, `cantidad` INT, `token_user` VARCHAR(50))  
BEGIN
  DECLARE precio_actual decimal(10,2);
  ...
END$$
```

# Descripción de Triggers y JOINs en sis_venta.sql

## 1. Triggers
Los triggers (o disparadores) son bloques de código que se ejecutan automáticamente en respuesta a eventos específicos (como INSERT, UPDATE, o DELETE) en una tabla.

### Ejemplos de Triggers:
- *actualizar_existencia_producto*: Este trigger se activa después de que se inserte un registro en detallefactura. Reduce la cantidad de existencia del producto vendido.
- *verificar_existencia*: Antes de agregar un detalle temporal en detalle_temp, este trigger verifica que haya suficiente existencia en el inventario para la venta. Si la cantidad es insuficiente, muestra un mensaje de error y evita la operación.
- *restablecer_existencia*: Si se elimina una venta en detallefactura, este trigger restaura la cantidad de productos eliminados al inventario.

## 2. Consultas JOIN
Las consultas JOIN permiten unir datos de diferentes tablas según criterios específicos.

### Ejemplos de JOIN:
- *INNER JOIN*: Usado para obtener solo los registros que coinciden en ambas tablas. En la consulta de ejemplo, obtenemos todas las facturas por cliente.
- *LEFT JOIN*: Devuelve todos los registros de la tabla izquierda, incluso si no hay coincidencias en la derecha. En este ejemplo, se muestran los productos y sus ventas, incluyendo productos sin ventas.
- *RIGHT JOIN*: Similar al LEFT JOIN, pero devuelve todos los registros de la tabla derecha. Aquí se usa para ver todas las ventas y también los usuarios sin ventas.

Estas consultas y triggers mejoran la integridad y funcionalidad de la base de datos en el sistema sis_venta.
---

Este `README.md` cubre el contexto, instalación, estructura de la base de datos y detalles del sistema **DataConnect**, diseñado para simplificar y centralizar la gestión de datos para pequeñas y medianas empresas.
