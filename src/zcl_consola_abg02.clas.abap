CLASS zcl_consola_abg02 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_consola_abg02 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*  Hago la llamada a la clase bombilla
*    DATA lo_bombilla TYPE REF TO zcl_bombilla02.

*   BOMBILLA

*   DATA(lo_bombilla) = NEW zcl_bombilla02( 'Salon' ).
*   DATA lv_estado TYPE abap_bool.
*
*    lo_bombilla->get_estado( IMPORTING o_estado = lv_estado ).
*    out->write( lv_estado ).
*
*    lo_bombilla->encender( ).
*
*    lo_bombilla->get_estado( IMPORTING o_estado = lv_estado ).
*    out->write( lo_bombilla->estado ).
*
*    lo_bombilla->apagar( ).
*
*    lo_bombilla->get_estado( IMPORTING o_estado = lv_estado ).
*    out->write( lv_estado ).

*CUADRO

*    DATA(lo_cuadro1) = NEW zcl_cuadro_00(
*        i_titulo = 'La maja desnuda'
*        i_anyo = 1800 ).
*
*    DATA lv_ficha TYPE string.
*    lo_cuadro1->mostrar_ficha( IMPORTING o_ficha = lv_ficha ).
*    out->write( lv_ficha ).
*
*    lo_cuadro1->set_anyo( 1801 ).
*    lo_cuadro1->mostrar_ficha( IMPORTING o_ficha = lv_ficha ).
*    out->write( lv_ficha ).


*DIVISION

DATA(lo_calculadora) = NEW zcl_calculadora02( i_valor = 0 i_nombre = 'Manolo' ).

DATA lv_valor TYPE i.
DATA lv_nombre TYPE string.

*INICIO
lo_calculadora->get_valor( IMPORTING o_valor = lv_valor ).
lo_calculadora->get_nombre( IMPORTING o_nombre = lv_nombre ).
out->write(  |CALCULADORA DE { lv_nombre } con Valor { lv_valor }| ).

*SUMAR 100
lo_calculadora->sumar( 100 ).
lo_calculadora->get_valor( IMPORTING o_valor = lv_valor ).
out->write(  |CALCULADORA DE { lv_nombre } con Valor { lv_valor }| ).
*mulltiplicar 3
lo_calculadora->multiplicar( 3 ).
lo_calculadora->get_valor( IMPORTING o_valor = lv_valor ).
out->write(  |CALCULADORA DE { lv_nombre } con Valor { lv_valor }| ).
*Restar 50
lo_calculadora->restar( 50 ).
lo_calculadora->get_valor( IMPORTING o_valor = lv_valor ).
out->write(  |CALCULADORA DE { lv_nombre } con Valor { lv_valor }| ).
*Dividir
*lo_calculadora->dividir( 5 ).

TRY.
    lo_calculadora->dividir( 0 ).
    out->write( |División realizada con éxito.| ).
CATCH cx_sy_zerodivide.
    out->write( |ERROR: No se puede dividir entre 0. El valor no cambia.| ).
ENDTRY.
lo_calculadora->get_valor( IMPORTING o_valor = lv_valor ).
out->write(  |CALCULADORA DE { lv_nombre } con Valor { lv_valor }| ).
*Reset
lo_calculadora->reset( 0 ).
lo_calculadora->get_valor( IMPORTING o_valor = lv_valor ).
out->write(  |CALCULADORA DE { lv_nombre } con Valor { lv_valor }| ).






  ENDMETHOD.
ENDCLASS.
