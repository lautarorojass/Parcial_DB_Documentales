# Sistema de Reclamos Municipales

## Descripción del proyecto

Este proyecto consiste en el diseño de un sistema para gestionar reclamos realizados por ciudadanos sobre problemas en la vía pública, como pérdidas de agua, luminarias fuera de servicio y baches.

El sistema permite registrar ciudadanos, gestionar reclamos, asignar equipos de trabajo y registrar las intervenciones realizadas por los empleados.

## Estructura del repositorio

* `DER/`: diagrama entidad-relación de la base de datos relacional.
* `mysql/schema.sql`: creación de la base de datos y sus tablas.
* `mysql/data.sql`: datos de ejemplo para realizar pruebas.
* `mongodb/detalles_reclamos.json`: detalles específicos de los reclamos.
* `mongodb/observaciones_intervenciones.json`: observaciones y datos adicionales de las intervenciones.

## Distribución de los datos

## MySQL

La base relacional contiene las siguientes tablas:

* `ciudadanos`
* `equipos_trabajo`
* `empleados`
* `reclamos`
* `intervenciones`
* `intervencion_empleados`

Estas tablas permiten mantener la integridad de los datos y representar las relaciones entre las entidades.

### Explicacion de las tablas:

* Ciudadanos: esta tabla almacena los datos de los ciudadanos que se registran en el sistema de reporte de problemas.
* Equipos_trabajo: almacena el nombre y la especialidad de los distintos equipos.
* Empleados: almacena el nombre y el apellido de cada empleado y ademas indica a que equipo pertenece,
* Reclamos: almacena cada reclamo indicando quien lo hizo, cuando, el estado, la ubicacion, el equipo encargado y demas datos.
* Intervenciones: se relaciona con el reclamo al que pertenece y ademas se usa para relacionarse con las observaciones especificas de cada observacion individual y con que empleado participo en ella.
* Intervencion_empleado: esta tabla tiene una primary compuesta, ya que solo relaciona a cada empleado con intervencion en la que participa.

## MongoDB

Se utilizan dos colecciones:

* `detalles_reclamos`: almacena información específica según la categoría del reclamo.
* `observaciones_intervenciones`: almacena observaciones, fotografías y datos adicionales de las intervenciones.

## Relaciones entre la relacional y la documental

reclamos.id_reclamo <--> detalles_reclamos.id_reclamo: tiene una relacion 1:1 (uno a uno), ya que cada reclamo solo puede tener solo un archivo de detalles del mismo.

intervenciones.id_intervencion <--> observaciones_intervenciones.id_intervencion: tambien tienen una relacion 1:1 (uno a uno), ya que al igual que en la relacion anterior, una intervencion solo debe estar relacionada con un archivo de observaciones.

empleados.id_empleado --> observaciones_intervenciones.id_empleado: es una relacion 1:N (uno a muchos) ya que un empleado puede realizar varias observaciones distintas.

## Porque de cada base de datos

La base de datos relacion se utiliza para gestionar la información estructurada y las relaciones entre las entidades.

La base de datos documental se utiliza para almacenar información que puede variar según el tipo de reclamo o la intervención realizada.
