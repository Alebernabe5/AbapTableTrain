CLASS zcl_test_productos_02 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_test_productos_02 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA(lo_productos) = NEW zcl_productos_02( ).
    DATA: lv_valido   TYPE abap_bool,
*          lt_productos TYPE TABLE OF ztablaproducto02,
          ls_producto  TYPE ztablaproducto02.

          ls_producto = VALUE ztablaproducto02(
            productoid = '00000005'
            nombre = 'Router'
            categoria   = 'IT'
*            cuky_field  = 'EUR'
            precio      = 20
            stock       = 100
            activo      = abap_true ).

     lo_productos->insertar(
      EXPORTING
        i_producto = ls_producto
      IMPORTING
        o_valido   = lv_valido ).
*      3. Mostramos el resultado de cada inserción
      IF lv_valido = abap_true.
        out->write( |Inserción de { ls_producto-productoid } correcta| ).
      ELSE.
        out->write( |Inserción de { ls_producto-productoid } incorrecta (posible duplicado)| ).
      ENDIF.

*    " 1. Preparamos la lista de productos en una tabla interna
*    lt_productos = VALUE #(
*      ( productoid = '00000001'
*        nombre = 'Teclado'
*        categoria = 'IT'
*        precio = 100
*        stock = 10
*        activo = abap_true )
*      ( productoid = '00000002'
*      nombre = 'Monitor'
*      categoria = 'IT'
*      precio = 250
*      stock = 5
*      activo =
*      abap_true )
*
*      ( productoid = '00000003'
*      nombre = 'Mouse'
*      categoria = 'IT'
*      precio = 25
*      stock = 20
*      activo = abap_true )
*    ).
*
*    " 2. Recorremos la tabla e insertamos cada uno
*    LOOP AT lt_productos INTO ls_producto.
*
*      lo_productos->insertar(
*        EXPORTING
*          i_producto = ls_producto
*        IMPORTING
*          o_valido   = lv_valido
*      ).
*
*      " 3. Mostramos el resultado de cada inserción
*      IF lv_valido = abap_true.
*        out->write( |Inserción de { ls_producto-productoid } correcta| ).
*      ELSE.
*        out->write( |Inserción de { ls_producto-productoid } incorrecta (posible duplicado)| ).
*      ENDIF.
*
*    ENDLOOP.


  ENDMETHOD.
ENDCLASS.
