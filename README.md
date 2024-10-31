
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

1. [Contexto del Proyecto](#contexto-del-proyecto)
2. [Modelo Conceptual a Relacional](#modelo-conceptual-a-relacional)
   - [Matriz de Relaciones](#matriz-de-relaciones)
3. [Comandos SQL Útiles](#comandos-sql-útiles)
4. [Instalación](#instalación)
   - [Guía para XAMPP](#usando-xampp)
   - [Guía para MySQL Workbench](#usando-mysql-workbench)
5. [Tablas y Entidades](#tablas-y-entidades)
6. [📜 DDL y DML - Definición de Tablas y Datos](#ddl-y-dml)

---

## 🎯 Contexto del Proyecto

### ¿Por qué DataConnect?

En muchas PYMEs, los datos están dispersos en diferentes plataformas como hojas de cálculo, aplicaciones y sistemas de correos, dificultando la coherencia y accesibilidad de la información.

**Objetivo del Proyecto**: DataConnect busca centralizar estos datos en una plataforma única que simplifique la consulta, administración y análisis de la información.

---

## 🏗️ Modelo Conceptual a Relacional

### 📊 Matriz de Relaciones

| Entidad        | Atributos Principales                                  | Relaciones                                                |
|----------------|--------------------------------------------------------|-----------------------------------------------------------|
| **Cliente**    | `idcliente` (PK), `dni`, `nombre`, `teléfono`, `dirección` | Usuario (N:1), Factura (1:N)                              |
| **Producto**   | `codproducto` (PK), `descripción`, `precio`, `existencia` | Proveedor (N:1), Factura (N:M a través de Detallefactura) |
| **Factura**    | `nofactura` (PK), `fecha`, `usuario`, `codcliente`, `totalfactura` | Cliente (N:1), Detallefactura (1:N)                      |
| **Proveedor**  | `codproveedor` (PK), `proveedor`, `contacto`, `teléfono`, `dirección` | Producto (1:N)                                            |
| **Usuario**    | `idusuario` (PK), `nombre`, `correo`, `usuario`, `clave` | Rol (N:1), Factura (1:N)                                  |
| **Rol**        | `idrol` (PK), `rol_descripcion`                        | Usuario (1:N)                                             |
| **Detallefactura** | `nodetalle` (PK), `nofactura` (FK), `codproducto` (FK), `cantidad`, `precio` | Factura (N:1), Producto (N:1) |

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
SELECT f.nofactura, c.nombre 
FROM factura f
JOIN cliente c ON f.codcliente = c.idcliente;

-- Actualizar el precio de un producto específico
UPDATE producto SET precio = 18000 WHERE codproducto = 2;

-- Eliminar un registro de un proveedor específico
DELETE FROM proveedor WHERE codproveedor = 5;
```
---

### 🚀 Instalación

A continuación, se detallan los pasos para la instalación de DataConnect utilizando XAMPP o MySQL Workbench:

### 💻 Usando XAMPP

1. **Paso 1**: Instala XAMPP y asegúrate de tener MySQL y Apache activos.
2. **Paso 2**: Descarga los archivos de este repositorio y copia la carpeta en `C:\xampp\htdocs`.
3. **Paso 3**: Importa la base de datos:
   - Abre phpMyAdmin y crea una nueva base de datos llamada `DataConnect`.
   - En la nueva base de datos, selecciona la opción de importación y carga el archivo `DataConnect.sql`.
4. **Paso 4**: Verifica que las tablas y datos se hayan cargado correctamente.

### 💾 Usando MySQL Workbench

1. **Paso 1**: Instala MySQL Workbench y abre una conexión.
2. **Paso 2**: En el menú, selecciona File > Open SQL Script y carga el archivo `DataConnect.sql`.
3. **Paso 3**: Ejecuta el script completo y verifica que las tablas y datos hayan sido creados correctamente.

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

---

Este `README.md` cubre el contexto, instalación, estructura de la base de datos y detalles del sistema **DataConnect**, diseñado para simplificar y centralizar la gestión de datos para pequeñas y medianas empresas.
