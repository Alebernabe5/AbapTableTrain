CLASS zcl_cuentabancaria DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_cuentabancaria IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA(lo_titular) = NEW zcl_demo_cuentabancaria( i_titular = 'Carlos'
                                                      i_saldo = 1000 ).
    DATA lv_titular TYPE string.

*    Muestra la informacion
    lo_titular->get_titular( IMPORTING o_titular = lv_titular ).
    lo_titular->get_saldo( IMPORTING o_saldo = DATA(lv_saldo) ).

    out->write( | La cuenta de { lo_titular->titular } tiente { lo_titular->saldo }€| ).

*    lo_titular->set_titular( 'Alejandro' ).
*    lo_titular->set_titular( EXPORTING i_titular = 'Alvaro' ).

    lo_titular->get_titular( IMPORTING o_titular = lv_titular ).

*    lo_titular->set_saldo( 1000 ).
    lo_titular->get_saldo( IMPORTING o_saldo = lv_saldo ).

*    out->write( lv_titular ).
*    out->write( lv_saldo ).

    lo_titular->ingresar( 500 ).

    lo_titular->get_saldo( IMPORTING o_saldo = DATA(lv_saldo_actualizado) ).

*    out->write( lv_titular ).
*    out->write( lv_saldo_actualizado ).

    lo_titular->retirar( 200 ).
    lo_titular->get_saldo( IMPORTING o_saldo = DATA(lv_saldo_actualizado2) ).

    out->write( lv_titular ).
    out->write( lv_saldo_actualizado2 ).
  ENDMETHOD.
ENDCLASS.
