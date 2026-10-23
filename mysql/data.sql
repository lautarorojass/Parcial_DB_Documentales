
USE municipalidad;


INSERT INTO ciudadanos (nombre, apellido, telefono)
VALUES
('Juan', 'Perez', '2284123456'),
('Maria', 'Gomez', '+5492284567890'),
('Lucas', 'Fernandez', '2284987654');



INSERT INTO equipos_trabajo (nombre, especialidad)
VALUES
('Equipo de Obras Publicas', 'Baches y calles'),
('Equipo de Alumbrado', 'Luminarias'),
('Equipo de Redes de Agua', 'Perdidas de agua');



INSERT INTO empleados (nombre, apellido, id_equipo)
VALUES
('Carlos', 'Lopez', 1),
('Ana', 'Martinez', 1),
('Pedro', 'Sanchez', 2),
('Sofia', 'Diaz', 2),
('Diego', 'Torres', 3),
('Laura', 'Ruiz', 3);

INSERT INTO reclamos (
    id_ciudadano,
    id_equipo,
    ubicacion,
    categoria,
    fecha,
    descripcion,
    estado,
    fecha_resolucion
)
VALUES
(
    1,
    1,
    'Av. San Martin 450',
    'bache',
    '2026-10-20 09:00:00',
    'Bache profundo que dificulta el transito.',
    'resuelto',
    '2026-10-22 16:00:00'
),
(
    2,
    2,
    'Calle Belgrano 320',
    'luminaria',
    '2026-10-21 18:30:00',
    'Luminaria apagada durante la noche.',
    'en proceso',
    NULL
),
(
    3,
    3,
    'Calle Rivadavia 125',
    'perdida_agua',
    '2026-10-22 10:15:00',
    'Perdida de agua sobre la vereda.',
    'pendiente',
    NULL
);



INSERT INTO intervenciones (
    id_reclamo,
    fecha,
    descripcion_trabajo
)
VALUES
(
    1,
    '2026-10-20 11:00:00',
    'Inspeccion inicial del bache.'
),
(
    1,
    '2026-10-22 14:00:00',
    'Reparacion y verificacion del bache.'
),
(
    2,
    '2026-10-22 08:30:00',
    'Inspeccion de la luminaria.'
);


INSERT INTO intervencion_empleados (
    id_intervencion,
    id_empleado
)
VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(3, 3),
(3, 4);
