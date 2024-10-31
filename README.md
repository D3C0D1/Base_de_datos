
# DataConnect - Plataforma de Integración y Gestión de Datos para PYMEs

![DataConnect Logo](https://via.placeholder.com/600x150?text=DataConnect+Logo)

**DataConnect** es una solución diseñada para ayudar a las PYMEs a centralizar, gestionar y analizar datos de diversas fuentes en un solo lugar, facilitando la toma de decisiones a partir de información consolidada.

---

## Funcionalidades Clave

- **Integración de Datos**: Unifica información de clientes, productos, proveedores y transacciones.
- **Gestión de Información**: Controla y actualiza los datos de la empresa de forma segura y eficiente.
- **Análisis Optimizado**: Facilita la extracción de información valiosa y estructurada para decisiones rápidas.

---

## Índice

1. [Contexto del Proyecto](#contexto-del-proyecto)
2. [Modelo Conceptual a Relacional](#modelo-conceptual-a-relacional)
   - [Matriz de Relaciones](#matriz-de-relaciones)
3. [Comandos SQL Útiles](#comandos-sql-útiles)
4. [Instalación](#instalación)
   - [Guía para XAMPP](#usando-xampp)
   - [Guía para MySQL Workbench](#usando-mysql-workbench)
5. [Tablas y Entidades](#tablas-y-entidades)

---

## Contexto del Proyecto

### ¿Por qué DataConnect?

En muchas PYMEs, los datos están dispersos en diferentes plataformas como hojas de cálculo, aplicaciones y sistemas de correos, dificultando la coherencia y accesibilidad de la información.

**Objetivo del Proyecto**: DataConnect busca centralizar estos datos en una plataforma única que simplifique la consulta, administración y análisis de la información.

---

## Modelo Conceptual a Relacional

### Matriz de Relaciones

A continuación se presenta la matriz de relaciones con las cardinalidades entre entidades del sistema DataConnect:

| Entidad        | Atributos Principales                                  | Relaciones                                                |
|----------------|--------------------------------------------------------|-----------------------------------------------------------|
| **Cliente**    | `idcliente` (PK), `dni`, `nombre`, `teléfono`, `dirección` | Usuario (N:1), Factura (1:N)                              |
| **Producto**   | `codproducto` (PK), `descripción`, `precio`, `existencia` | Proveedor (N:1), Factura (N:M a través de Detallefactura) |
| **Factura**    | `nofactura` (PK), `fecha`, `usuario`, `codcliente`, `totalfactura` | Cliente (N:1), Detallefactura (1:N)                      |
| **Proveedor**  | `codproveedor` (PK), `proveedor`, `contacto`, `teléfono`, `dirección` | Producto (1:N)                                            |
| **Usuario**    | `idusuario` (PK), `nombre`, `correo`, `usuario`, `clave` | Rol (N:1), Factura (1:N)                                  |
| **Rol**        | `idrol` (PK), `rol_descripcion`                        | Usuario (1:N)                                             |
| **Detallefactura** | `nodetalle` (PK), `nofactura` (FK), `codproducto` (FK), `cantidad`, `precio` | Factura (N:1), Producto (N:1) |

### Ejemplo de Conversión al Modelo Relacional

**Cliente**
- Atributos: `idcliente` (PK), `dni`, `nombre`, `teléfono`, `dirección`, `usuario_id` (FK)
- Relacionado con: Usuario (N:1) y Factura (1:N) mediante `usuario_id` y `codcliente`.

**Producto-Proveedor**
- Atributo principal: `codproducto` (PK)
- Relación con Proveedor a través de `codproveedor`.

---

## Comandos SQL Útiles

Ejemplos de consultas y comandos que podrían resultar útiles para la administración de la base de datos:

```sql
-- Obtener clientes activos
SELECT * FROM cliente WHERE estado = 1;

-- Actualizar precio de un producto
UPDATE producto SET precio = 20000 WHERE codproducto = 1;

-- Eliminar proveedor específico
DELETE FROM proveedor WHERE codproveedor = 5;
```

---

## Instalación

A continuación, se detallan los pasos para la instalación de DataConnect utilizando XAMPP o MySQL Workbench:

### Usando XAMPP

1. **Paso 1**: Instala XAMPP y asegúrate de tener MySQL y Apache activos.
2. **Paso 2**: Descarga los archivos de este repositorio y copia la carpeta en `C:\xampp\htdocs`.
3. **Paso 3**: Importa la base de datos:
   - Abre phpMyAdmin y crea una nueva base de datos llamada `DataConnect`.
   - En la nueva base de datos, selecciona la opción de importación y carga el archivo `DataConnect.sql`.
4. **Paso 4**: Verifica que las tablas y datos se hayan cargado correctamente.

### Usando MySQL Workbench

1. **Paso 1**: Instala MySQL Workbench y abre una conexión.
2. **Paso 2**: En el menú, selecciona File > Open SQL Script y carga el archivo `DataConnect.sql`.
3. **Paso 3**: Ejecuta el script completo y verifica que las tablas y datos hayan sido creados correctamente.

---

## Tablas y Entidades

- **Cliente**: Almacena información de clientes como nombre, teléfono y dirección.
- **Producto**: Registra información de productos, incluyendo precio y existencia.
- **Factura**: Detalla transacciones realizadas, vinculadas con clientes y productos.
- **Usuario**: Controla la información de los usuarios del sistema, asociándolos a roles específicos.

---

Este `README.md` cubre el contexto, instalación y estructura de la base de datos de **DataConnect**, diseñado para simplificar y centralizar la gestión de datos para pequeñas y medianas empresas.
