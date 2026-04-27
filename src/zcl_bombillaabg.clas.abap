CLASS zcl_bombillaabg DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_bombillaabg IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

  DATA lv_ubicacion TYPE string.
  DATA lv_estado TYPE abap_boolean.

  DATA(lv_bombilla) = NEW zcl_demo_bombillaabg(
                            i_ubicacion = 'Salon'
                            i_estado    = abap_false ).

*Mostrar informacion
 lv_bombilla->get_ubicacion( IMPORTING o_Ubicacion = lv_ubicacion ).
 lv_bombilla->get_estado( IMPORTING o_estado = lv_estado ).

 out->write( | La bombilla está en el { lv_ubicacion } ademas está { COND string( WHEN lv_estado = abap_true THEN 'encendida' ELSE 'apagada' ) } | ).
*Mostrar informacion
 lv_bombilla->encender( ).
* Debo de llamar al metodo estado para cambiarlo
 lv_bombilla->get_estado( IMPORTING o_estado = lv_estado ).
 out->write( | La bombilla está en el { lv_ubicacion } ademas está { COND string( WHEN lv_estado = abap_true THEN 'encendida' ELSE 'apagada' ) } | ).
*Mostrar informacion
 lv_bombilla->encender( ).
* Debo de llamar al metodo estado para cambiarlo
 lv_bombilla->get_estado( IMPORTING o_estado = lv_estado ).
 out->write( | La bombilla está en el { lv_ubicacion } ademas está { COND string( WHEN lv_estado = abap_true THEN 'encendida' ELSE 'apagada' ) } | ).
*Mostrar informacion
 lv_bombilla->apagar( ).
* Debo de llamar al metodo estado para cambiarlo
 lv_bombilla->get_estado( IMPORTING o_estado = lv_estado ).
 out->write( | La bombilla está en el { lv_ubicacion } ademas está { COND string( WHEN lv_estado = abap_true THEN 'encendida' ELSE 'apagada' ) } | ).


  ENDMETHOD.

ENDCLASS.
