
CREATE DATABASE IF NOT EXISTS municipalidad;

USE municipalidad;


CREATE TABLE ciudadanos (
    id_ciudadano INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    telefono VARCHAR(20)
);



CREATE TABLE equipos_trabajo (
    id_equipo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    especialidad VARCHAR(100) NOT NULL
);



CREATE TABLE empleados (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    id_equipo INT NOT NULL,

    FOREIGN KEY (id_equipo)
        REFERENCES equipos_trabajo(id_equipo)
);



CREATE TABLE reclamos (
    id_reclamo INT AUTO_INCREMENT PRIMARY KEY,
    id_ciudadano INT NOT NULL,
    id_equipo INT,
    ubicacion VARCHAR(255) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    fecha DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_resolucion DATETIME NULL,
    descripcion TEXT NOT NULL,

    estado ENUM(
        'pendiente',
        'en proceso',
        'resuelto'
    ) NOT NULL DEFAULT 'pendiente',

    FOREIGN KEY (id_ciudadano)
        REFERENCES ciudadanos(id_ciudadano),

    FOREIGN KEY (id_equipo)
        REFERENCES equipos_trabajo(id_equipo),

    CHECK (
        fecha_resolucion IS NULL
        OR fecha_resolucion >= fecha
    ),

    CHECK (
        (estado = 'resuelto' AND fecha_resolucion IS NOT NULL)
        OR
        (estado <> 'resuelto' AND fecha_resolucion IS NULL)
    )
);


CREATE TABLE intervenciones (
    id_intervencion INT AUTO_INCREMENT PRIMARY KEY,
    id_reclamo INT NOT NULL,
    fecha DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    descripcion_trabajo TEXT NOT NULL,

    FOREIGN KEY (id_reclamo)
        REFERENCES reclamos(id_reclamo)
);



CREATE TABLE intervencion_empleados (
    id_intervencion INT NOT NULL,
    id_empleado INT NOT NULL,

    PRIMARY KEY (id_intervencion, id_empleado),

    FOREIGN KEY (id_intervencion)
        REFERENCES intervenciones(id_intervencion),

    FOREIGN KEY (id_empleado)
        REFERENCES empleados(id_empleado)
);

