CLASS zcl_productos_02 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS:

    insertar IMPORTING
             i_producto TYPE ztablaproducto02
             EXPORTING
             o_valido TYPE abap_bool,

    buscarID IMPORTING i_producto TYPE ztablaproducto02-productoid " El ID a buscar
               EXPORTING o_producto    TYPE ztablaproducto02            " La estructura completa
                         o_encontrado  TYPE abap_bool,

    modificar IMPORTING i_producto TYPE ztablaproducto02
             EXPORTING o_valido TYPE abap_bool,

    borrar IMPORTING i_producto TYPE ztablaproducto02
             EXPORTING o_valido TYPE abap_bool.




  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_productos_02 IMPLEMENTATION.


    METHOD insertar.

    INSERT ztablaproducto02 FROM @i_producto.
     " Esta comprobación indica si ha ido bien o mal
    IF sy-subrc = 0. " Ha ido bien
      o_valido = abap_true.
    ELSE.
      o_valido = abap_false.
    ENDIF.
    ENDMETHOD.

    METHOD buscarID.
      SELECT SINGLE *
        FROM ztablaproducto02
        WHERE productoid = @i_producto
        INTO @o_producto.
        IF sy-subrc = 0. " Ha ido bien
        o_encontrado = abap_true.
        ELSE.
        o_encontrado = abap_false.
        ENDIF.
    ENDMETHOD.

    METHOD modificar.
        UPDATE ztablaproducto02 FROM @i_producto.
         " Esta comprobación indica si ha ido bien o mal
        IF sy-subrc = 0. " Ha ido bien
          o_valido = abap_true.
        ELSE.
          o_valido = abap_false.
        ENDIF.
    ENDMETHOD.

    METHOD borrar.
        DELETE FROM ztablaproducto02 WHERE productoid = @i_producto-productoid.
         " Esta comprobación indica si ha ido bien o mal
        IF sy-subrc = 0. " Ha ido bien
          o_valido = abap_true.
        ELSE.
          o_valido = abap_false.
        ENDIF.
    ENDMETHOD.



ENDCLASS.
