*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations


CLASS zcl_demo_bombillaabg DEFINITION.

  PUBLIC SECTION.
    " Definición de atributos
    DATA:
      ubicacion TYPE string,
      estado    TYPE  abap_boolean.


    " Definición de métodos
    METHODS:

      constructor
        IMPORTING i_ubicacion TYPE string
                  i_estado    TYPE abap_bool,

      get_ubicacion EXPORTING o_ubicacion TYPE string,
      get_estado EXPORTING o_estado TYPE abap_bool,

      set_ubicacion IMPORTING i_ubicacion TYPE string,
      set_estado IMPORTING i_estado TYPE abap_bool,

      encender,
      apagar.


  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS zcl_demo_bombillaabg IMPLEMENTATION.
  METHOD constructor.
    ubicacion = i_ubicacion.
    estado = i_estado.
  ENDMETHOD.

  METHOD get_Ubicacion.
    o_Ubicacion = ubicacion.
  ENDMETHOD.

  METHOD get_estado.
    o_estado = estado.
  ENDMETHOD.

  METHOD set_ubicacion.
    ubicacion = i_Ubicacion.
  ENDMETHOD.

  METHOD set_estado.
    Estado = i_estado.
  ENDMETHOD.

  METHOD encender.
    IF estado = abap_false.
      estado = abap_true.
    ENDIF.
  ENDMETHOD.

  METHOD apagar.
    IF estado = abap_true.
      estado = abap_false.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
