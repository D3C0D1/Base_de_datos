-- Crear una base de datos
CREATE DATABASE nombre_base_datos;

-- Seleccionar la base de datos (esto depende del sistema de gestión de bases de datos)
USE nombre_base_datos;

-- Crear un esquema
CREATE SCHEMA nombre_esquema;

-- Crear una tabla con llaves primaria y foránea, y varias restricciones
CREATE TABLE nombre_tabla (
    id INT PRIMARY KEY,                -- Llave primaria
    nombre VARCHAR(100) NOT NULL,       -- Columna con restricción NOT NULL
    edad INT CHECK (edad >= 18),        -- Restricción CHECK para valores mayores o iguales a 18
    email VARCHAR(255) UNIQUE,          -- Restricción de unicidad
    id_referencia INT,                  -- Columna para llave foránea
    CONSTRAINT fk_id_referencia FOREIGN KEY (id_referencia) REFERENCES otra_tabla(id)  -- Llave foránea
);

-- Crear otra tabla referenciada
CREATE TABLE otra_tabla (
    id INT PRIMARY KEY,
    descripcion VARCHAR(255)
);

-- Crear una vista para seleccionar ciertas columnas y condiciones
CREATE VIEW nombre_vista AS
SELECT nombre, edad
FROM nombre_tabla
WHERE edad > 18;

-- Crear un índice en la tabla
CREATE INDEX idx_nombre ON nombre_tabla (nombre);

-- Modificar una tabla para agregar una nueva columna
ALTER TABLE nombre_tabla
ADD direccion VARCHAR(255);

-- Modificar una tabla para eliminar una columna
ALTER TABLE nombre_tabla
DROP COLUMN direccion;

-- Modificar una tabla para cambiar el tipo de datos de una columna
ALTER TABLE nombre_tabla
MODIFY COLUMN edad SMALLINT;

-- Renombrar una columna
ALTER TABLE nombre_tabla
RENAME COLUMN email TO correo_electronico;

-- Renombrar una tabla
ALTER TABLE nombre_tabla
RENAME TO nueva_tabla;

-- Eliminar una vista
DROP VIEW nombre_vista;

-- Eliminar un índice
DROP INDEX idx_nombre;

-- Eliminar una tabla
DROP TABLE nombre_tabla;

-- Eliminar otra tabla
DROP TABLE otra_tabla;

-- Eliminar un esquema
DROP SCHEMA nombre_esquema;

-- Eliminar la base de datos
DROP DATABASE nombre_base_datos;
