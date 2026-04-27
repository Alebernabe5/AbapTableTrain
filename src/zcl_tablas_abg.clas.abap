CLASS zcl_tablas_abg DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_tablas_abg IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
*
**    Declaracion de tipo
*    TYPES:BEGIN OF ty_alumnos,
*            nombre   TYPE string,
*            apellido TYPE string,
*            edad     TYPE i,
*            ciudad   TYPE string,
*          END OF ty_ALUMNOS.
*
*    DATA ls_alumnos TYPE ty_alumnos.
*    DATA lt_alumnos TYPE TABLE OF ty_alumnos.
*    DATA lt_alumnos_aux TYPE TABLE OF ty_alumnos.
*
*    ls_alumnos-nombre = 'Juan'.
*    ls_alumnos-apellido = 'Perez'.
*    ls_alumnos-edad = 23.
*    ls_alumnos-ciudad = 'Madrid'.
*    APPEND ls_alumnos TO lt_alumnos.
*
*    ls_alumnos-nombre = 'Maria'.
*    ls_alumnos-apellido = 'Gomez'.
*    ls_alumnos-edad = 25.
*    ls_alumnos-ciudad = 'Barcelona'.
*    APPEND ls_alumnos TO lt_alumnos.
*
*    ls_alumnos-nombre = 'Jose'.
*    ls_alumnos-apellido = 'Lopez'.
*    ls_alumnos-edad = 27.
*    ls_alumnos-ciudad = 'Valencia'.
*    APPEND ls_alumnos TO lt_alumnos.
*
**    Hacer consulta de tabla interna con condicional
*    LOOP AT lt_alumnos INTO ls_alumnos.
*      IF ls_alumnos-edad <= 25.
*        APPEND ls_alumnos TO lt_alumnos_aux.
*      ENDIF.
*    ENDLOOP.
*
*    out->write( ls_alumnos ).
*
*
** Declaro de una tabla INTERNA de tipo entero
*    DATA lt_numeros TYPE TABLE OF i.
*
*    APPEND 1 TO lt_numeros.
*    APPEND 2 TO lt_numeros.
*    APPEND 3 TO lt_numeros.
*    APPEND 4 TO lt_numeros.
*    APPEND 5 TO lt_numeros.
*    APPEND 6 TO lt_numeros.
*    APPEND 7 TO lt_numeros.
*    APPEND 8 TO lt_numeros.
*    APPEND 9 TO lt_numeros.
*    APPEND 10 TO lt_numeros.

*    data  lt_vuelos Type table of /dmo/flight.
*    SELECT * FROM /dmo/flight INTO TABLE @lt_vuelos.
**    out->write( lt_vuelos ).
*
*    DATA lv_totalPrecios TYPE /dmo/flight_price.
*
*    loop at lt_vuelos INTO DATA(ls_vuelo).
*       lv_totalPrecios = lv_totalPrecios + ls_vuelo-price.
*    endloop.
*    out->write( |El precio total de todos los vuelo sin tener en cuenta el tipo de moneda es :{ lv_totalprecios }| ).
*

*1. Crear un tipo que tenga al menos 5 campos. Puedes elegir la tematica que quieras
*
*Añade con APPEND al menos 10 registros
*
*Muestralos por pantalla

*TYPES: BEGIN OF ty_empleados,
*          Nombre   TYPE string,
*          Apellido TYPE string,
*          Edad     TYPE i,
*          Ciudad   TYPE string,
*          Sueldo   TYPE i,
*          End OF ty_EMPLEADOS.
*
*DATA ls_empleados TYPE ty_empleados.
*DATA lt_empleados TYPE TABLE OF ty_empleados.
*
*do 10 TIMES.
*  ls_empleados-nombre   = 'Nombre' && sy-index.
*  ls_empleados-apellido = 'Apellido' && sy-index.
*  ls_empleados-edad     = 20 + sy-index.
*  ls_empleados-ciudad   = 'Ciudad' && sy-index.
*  ls_empleados-sueldo   = 1000 * sy-index.
*
*APPEND ls_empleados TO lt_empleados.
*
*ENDDO.
*
* out->write( lt_empleados ).



*2. Selecciona datos de una tabla /DMO, la que quieras
*
*Muestra la tabla por pantalla

    DATA lt_aeropuertos TYPE TABLE OF /dmo/airport.
    SELECT * FROM /dmo/airport INTO TABLE @lt_aeropuertos.

    IF sy-subrc = 0.
      LOOP AT lt_aeropuertos INTO DATA(ls_aeropuerto)
        WHERE city = 'Madrid'.
        out->write( ls_aeropuerto ).
      ENDLOOP.

    ENDIF.



*3. Coge los datos de la tabla y recorre con un LOOP para hacer un acumulador de lo que quieras




  ENDMETHOD.
ENDCLASS.
