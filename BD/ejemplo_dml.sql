-- Insertar datos en una tabla con múltiples filas
INSERT INTO empleados (id, nombre, puesto, salario, departamento_id)
VALUES 
    (1, 'Carlos López', 'Analista', 50000, 1),
    (2, 'Maria Pérez', 'Desarrolladora', 60000, 2),
    (3, 'Juan Gómez', 'Gerente', 90000, 1),
    (4, 'Ana Rojas', 'Soporte', 40000, 3);

INSERT INTO departamentos (departamento_id, nombre)
VALUES 
    (1, 'Finanzas'),
    (2, 'IT'),
    (3, 'Atención al Cliente');

-- Actualizar el salario de un empleado en específico
UPDATE empleados
SET salario = salario * 1.1
WHERE nombre = 'Carlos López';

-- Eliminar empleados con un salario inferior a 45000
DELETE FROM empleados
WHERE salario < 45000;

-- Consulta de todos los empleados con sus respectivos departamentos utilizando JOIN
SELECT e.nombre AS nombre_empleado, e.puesto, e.salario, d.nombre AS nombre_departamento
FROM empleados e
JOIN departamentos d ON e.departamento_id = d.departamento_id;

-- LEFT JOIN para obtener todos los empleados y sus proyectos (incluso si no tienen proyectos asignados)
SELECT e.nombre AS nombre_empleado, e.puesto, p.nombre AS nombre_proyecto
FROM empleados e
LEFT JOIN proyectos p ON e.id = p.empleado_id;

-- Consulta con agregación para obtener el salario promedio por departamento
SELECT d.nombre AS nombre_departamento, AVG(e.salario) AS salario_promedio
FROM empleados e
JOIN departamentos d ON e.departamento_id = d.departamento_id
GROUP BY d.nombre;

-- Crear un procedimiento almacenado para incrementar el salario de los empleados en un departamento específico
DELIMITER //
CREATE PROCEDURE IncrementarSalarioPorDepto(IN depto_id INT, IN incremento DECIMAL(5, 2))
BEGIN
    UPDATE empleados
    SET salario = salario * incremento
    WHERE departamento_id = depto_id;
END //
DELIMITER ;

-- Llamar al procedimiento almacenado
CALL IncrementarSalarioPorDepto(1, 1.10);  -- Incrementa el salario en un 10% para el departamento de Finanzas

-- Crear un trigger que se active antes de insertar un nuevo empleado para verificar el salario mínimo
DELIMITER //
CREATE TRIGGER VerificarSalarioMinimo
BEFORE INSERT ON empleados
FOR EACH ROW
BEGIN
    IF NEW.salario < 30000 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El salario es inferior al mínimo permitido';
    END IF;
END //
DELIMITER ;

-- Crear un trigger que registre en una tabla de auditoría cada vez que se actualice el salario de un empleado
CREATE TABLE auditoria_salarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    empleado_id INT,
    salario_anterior DECIMAL(10, 2),
    salario_nuevo DECIMAL(10, 2),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //
CREATE TRIGGER RegistroAuditoriaSalarios
AFTER UPDATE ON empleados
FOR EACH ROW
BEGIN
    IF OLD.salario <> NEW.salario THEN
        INSERT INTO auditoria_salarios (empleado_id, salario_anterior, salario_nuevo)
        VALUES (OLD.id, OLD.salario, NEW.salario);
    END IF;
END //
DELIMITER ;

-- Uso de subconsultas: obtener el nombre de empleados cuyo salario es superior al promedio general
SELECT nombre
FROM empleados
WHERE salario > (SELECT AVG(salario) FROM empleados);

-- Consultar empleados cuyo salario es superior al promedio en su departamento
SELECT e.nombre, e.salario, d.nombre AS nombre_departamento
FROM empleados e
JOIN departamentos d ON e.departamento_id = d.departamento_id
WHERE e.salario > (SELECT AVG(salario) FROM empleados WHERE departamento_id = e.departamento_id);

-- Crear una transacción que inserte un empleado y luego actualice su salario si ambas operaciones son exitosas
START TRANSACTION;
INSERT INTO empleados (id, nombre, puesto, salario, departamento_id) 
VALUES (5, 'Luis Torres', 'Ingeniero de Software', 75000, 2);

UPDATE empleados 
SET salario = 80000 
WHERE id = 5;

-- Confirmar la transacción
COMMIT;

-- Rollback en caso de error en la transacción
ROLLBACK;
