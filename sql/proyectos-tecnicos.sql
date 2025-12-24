CREATE DATABASE IF NOT EXISTS proyectos_tecnicos;
USE proyectos_tecnicos;

GRANT ALL PRIVILEGES ON proyectos_tecnicos.* TO 'osvaldo'@'%';
FLUSH PRIVILEGES;

-- Proyectos
CREATE TABLE proyectos(
	id INT AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(20) NOT NULL,
	descripcion TEXT,
	fecha_inicio DATE,
	fecha_fin DATE,
	estado VARCHAR(30),
	salon VARCHAR(20)
	);

-- Alumnos
CREATE TABLE alumnos(
	id INT AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(20) NOT NULL ,
	apellido VARCHAR(20) NOT NULL,
	email VARCHAR(20) UNIQUE,
	dni VARCHAR(20),
	salon VARCHAR(10),
	proyecto_id INT,
	FOREIGN KEY (proyecto_id) REFERENCES proyectos(id));

-- profesores
CREATE  TABLE profesores(
	id INT AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(20) NOT NULL,
	apellido VARCHAR(20) NOT NULL,
	email VARCHAR(20) UNIQUE,
	especialidad VARCHAR(50));

-- TABLA RELACION PROFESORES Y PROYECTOS--
CREATE TABLE proyectos_profesores (
  id INT AUTO_INCREMENT PRIMARY KEY,
  proyecto_id INT NOT NULL,
  profesor_id INT NOT NULL,
  FOREIGN KEY (proyecto_id) REFERENCES proyectos(id),
  FOREIGN KEY (profesor_id) REFERENCES profesores(id)
);

-- Inserto de datos en las tablas -----
INSERT INTO proyectos(nombre, descripcion, fecha_inicio, fecha_fin, estado, salon)
VALUES 
('Gestor de Estudiantes', 'Como equipo creamos un proyecto pa la organizacion de la entrada de estudiantes a la secu', '2025-04-01', '2025-11-18', 'Finalizado', '7mo 2da TECIP'),
('Hongito', 'Durante el transcurso del año utilizando metodos de nuestra carrera (Alimentos), desarrollamos hongos comestibles cultivables', '2025-04-01', '2025-04-10', 'Finalizado', '7mo 1ra Alimentos'),
('Robot de Pelea, Tito', 'Tito es un robot con el que venimos comprando componentes y su base esta hecha en la placa ESP32', '2025-04-05', '2025-10-10', 'En curso', '6to 1ra TECIP'),
('Robot General, CUCO', 'El CUCO de E.E.S.T 5, es el robot ganador la competencia Bonarence y hemos llegado muy lejos gracias a estos años invertidos en el, un gran proyecto que a todos nos emociono y legaremos a nuestros hermanos de unos años anteriores', '2023-05-11', '2025-11-11', 'Finalizado', '7mo 2da TECIP'),
('Gestion de Proyectos, Sistema GP', 'Como egresado de la Técnicatura en Informatica mostrare mi habilidad con este proyecto para una prueba tecnica para x sujeto en x reunion realizada x dia.', '2025-12-10', '2025-12-27', 'En curso', '7mo 2da TECIP');


-- Inserto de datos en la tabla ALumnos----

INSERT INTO alumnos (nombre, apellido, email, dni, salon, proyecto_id)
VALUES
('Juan', 'Pérez', 'juan.perez@example.com', '40111111', '7mo 2da TECIP', 1),
('María', 'Gómez', 'maria.gomez@example.com', '40111112', '7mo 2da TECIP', 1),
('Carlos', 'López', 'carlos.lopez@example.com', '40111113', '7mo 1ra Alimentos', 2),
('Lucía', 'Martínez', 'lucia.martinez@example.com', '40111114', '7mo 1ra Alimentos', 2),
('Pedro', 'Fernández', 'pedro.fernandez@example.com', '40111115', '6to 1ra TECIP', 3),
('Ana', 'Rodríguez', 'ana.rodriguez@example.com', '40111116', '6to 1ra TECIP', 3),
('Sofía', 'Hernández', 'sofia.hernandez@example.com', '40111117', '7mo 2da TECIP', 4),
('Diego', 'Torres', 'diego.torres@example.com', '40111118', '7mo 2da TECIP', 4),
('Valentina', 'Ramírez', 'valentina.ramirez@example.com', '40111119', '7mo 2da TECIP', 4),
('Martín', 'Flores', 'martin.flores@example.com', '40111120', '7mo 2da TECIP', 4),
('Agustina', 'Silva', 'agustina.silva@example.com', '40111121', '7mo 2da TECIP', 5),
('Nicolás', 'Morales', 'nicolas.morales@example.com', '40111122', '7mo 2da TECIP', 5),
('Camila', 'Suárez', 'camila.suarez@example.com', '40111123', '7mo 2da TECIP', 5),
('Mateo', 'Castro', 'mateo.castro@example.com', '40111124', '7mo 2da TECIP', 5),
('Florencia', 'Vega', 'florencia.vega@example.com', '40111125', '7mo 1ra Alimentos', 2),
('Tomás', 'Navarro', 'tomas.navarro@example.com', '40111126', '6to 1ra TECIP', 3),
('Julieta', 'Ríos', 'julieta.rios@example.com', '40111127', '7mo 2da TECIP', 1),
('Franco', 'Domínguez', 'franco.dominguez@example.com', '40111128', '7mo 2da TECIP', 1),
('Milagros', 'Mendoza', 'milagros.mendoza@example.com', '40111129', '7mo 1ra Alimentos', 2),
('Ezequiel', 'Ortiz', 'ezequiel.ortiz@example.com', '40111130', '6to 1ra TECIP', 3);

-- de datos para la tabla profesores-----
INSERT INTO profesores (nombre, apellido, email, especialidad)
VALUES
('Roberto', 'Sánchez', 'roberto.sanchez@example.com', 'Robótica'),
('Laura', 'Martínez', 'laura.martinez@example.com', 'Alimentos'),
('Jorge', 'Fernández', 'jorge.fernandez@example.com', 'Bases de Datos'),
('Carolina', 'Gómez', 'carolina.gomez@example.com', 'Programación'),
('Andrés', 'López', 'andres.lopez@example.com', 'Electrónica'),
('Marta', 'Ramírez', 'marta.ramirez@example.com', 'Gestión de Proyectos'),
('Diego', 'Torres', 'diego.torres@example.com', 'Inteligencia Artificial');

-- Inserto de datos para la tabla de proyectos_profesores

INSERT INTO proyectos_profesores (proyecto_id, profesor_id)
VALUES
(1, 1), -- Proyecto 1 con Profesor 1 (Informática)
(1, 4), -- Proyecto 1 con Profesor 4 (Informática)

(2, 2), -- Proyecto 2 con Profesor 2 (Alimentos)
(2, 5), -- Proyecto 2 con Profesor 5 (Alimentos)

(3, 3), -- Proyecto 3 con Profesor 3 (Turismo)
(3, 6), -- Proyecto 3 con Profesor 6 (Turismo)

(4, 1), -- Proyecto 4 con Profesor 1 (Informática)
(4, 7), -- Proyecto 4 con Profesor 7 (Informática)

(5, 4), -- Proyecto 5 con Profesor 4 (Informática)
(5, 2); -- Proyecto 5 con Profesor 2 (Alimentos)
