CLASS zcl_calculadora02 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  DATA:
      valor TYPE i,
      nombre TYPE string.

    METHODS:
        constructor
        IMPORTING
                i_valor TYPE i
                i_nombre TYPE string,

    get_valor EXPORTING o_valor TYPE i,
    get_nombre EXPORTING o_nombre TYPE string,

    set_nombre IMPORTING i_nombre TYPE string,

    sumar IMPORTING i_valor TYPE i,
    restar IMPORTING i_valor TYPE i,
    multiplicar IMPORTING i_valor TYPE i,
    dividir IMPORTING i_valor TYPE i,
    reset IMPORTING i_valor TYPE i.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_calculadora02 IMPLEMENTATION.

    METHOD constructor.
        valor = i_valor.
        nombre = i_nombre.
    ENDMETHOD.

    METHOD get_valor.
        o_valor = valor.
    ENDMETHOD.

    METHOD get_nombre.
        o_nombre = nombre.
    ENDMETHOD.

    METHOD set_nombre.
        nombre = i_nombre.
    ENDMETHOD.

    METHOD sumar.
    valor = valor + i_valor.
    ENDMETHOD.

    METHOD restar.
    valor = valor - i_valor.
    ENDMETHOD.

    METHOD multiplicar.
    valor = valor * i_valor.
    ENDMETHOD.

    METHOD dividir.
    TRY.

    valor = valor / i_valor.

    CATCH cx_sy_zerodivide.

    ENDTRY.
    ENDMETHOD.

    METHOD reset.
     valor = 0.
    ENDMETHOD.



ENDCLASS.
