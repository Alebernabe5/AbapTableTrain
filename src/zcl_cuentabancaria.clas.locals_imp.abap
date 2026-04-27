*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations


CLASS zcl_demo_cuentabancaria DEFINITION.

  PUBLIC SECTION.
    DATA:
      titular TYPE string,
      saldo   TYPE i.


    METHODS:

      constructor
        IMPORTING i_titular TYPE string OPTIONAL
                  i_saldo   TYPE i,


*    Getter y setter de titular
      get_titular EXPORTING o_titular TYPE string,

      set_titular IMPORTING i_titular TYPE string,

*    Getter y setter de saldo
      get_saldo EXPORTING o_saldo TYPE i,

      set_saldo IMPORTING i_saldo TYPE i.

    METHODS ingresar IMPORTING cantidad TYPE i.

    METHODS retirar IMPORTING i_cantidad TYPE i.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS zcl_demo_cuentabancaria IMPLEMENTATION.

  METHOD constructor.
    titular = i_titular.
    saldo = i_saldo.
  ENDMETHOD.

  METHOD set_titular.
    titular = i_titular.
  ENDMETHOD.

  METHOD get_titular.
    o_titular = titular.
  ENDMETHOD.

  METHOD set_saldo.
    saldo = i_saldo.
  ENDMETHOD.

  METHOD get_saldo.
    o_saldo = saldo.
  ENDMETHOD.

  METHOD ingresar.
    saldo = saldo + cantidad.
  ENDMETHOD.

  METHOD retirar.
    IF saldo >= i_cantidad.
      saldo = saldo - i_cantidad.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
