CLASS LHC_ZR_JUGADORES_02 DEFINITION INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
  PRIVATE SECTION.
    METHODS:
      GET_GLOBAL_AUTHORIZATIONS FOR GLOBAL AUTHORIZATION
        IMPORTING
           REQUEST requested_authorizations FOR ZrJugadores02
        RESULT result,


      subir_gol FOR MODIFY
            IMPORTING keys FOR ACTION ZrJugadores02~subir_gol
            RESULT result,

      cambiar_nacionalidad FOR MODIFY
            IMPORTING keys FOR ACTION ZrJugadores02~cambiar_nacionalidad
            RESULT result.
ENDCLASS.

CLASS LHC_ZR_JUGADORES_02 IMPLEMENTATION.
  METHOD GET_GLOBAL_AUTHORIZATIONS.
  ENDMETHOD.

  METHOD subir_gol.

"  Leo los registro actual
    READ ENTITIES OF zr_jugadores_02 IN LOCAL MODE
      ENTITY ZrJugadores02
        FIELDS ( Goles )
        WITH CORRESPONDING #( keys )
      RESULT DATA(lt_goles)
      FAILED failed.

   "Modifico los registros

   MODIFY ENTITIES OF zr_jugadores_02 IN LOCAL MODE
      ENTITY ZrJugadores02
        UPDATE FIELDS ( Goles )
        WITH VALUE #(
          FOR ls_jug IN lt_goles
        (
            %tky    = ls_jug-%tky
            Goles = ls_jug-Goles + 1
          )
        )
        FAILED failed
      REPORTED reported.

    result = VALUE #(
      FOR ls_jug IN lt_goles
      (
        %tky   = ls_jug-%tky
        %param = ls_jug
      )
    ).

  ENDMETHOD.

  METHOD cambiar_nacionalidad.

    MODIFY ENTITIES OF zr_jugadores_02 IN LOCAL MODE
      ENTITY ZrJugadores02
        UPDATE FIELDS ( nacionalidad )
        WITH VALUE #(
          FOR key IN keys
          (
            %tky    = key-%tky
            nacionalidad = key-%param-Profesion
          )
        )
      FAILED failed
      REPORTED reported.

      READ ENTITIES OF zr_jugadores_02 IN LOCAL MODE
      ENTITY ZrJugadores02
        ALL FIELDS
        WITH CORRESPONDING #( keys )
      RESULT DATA(lt_nacionalidad).

    result = VALUE #(
      FOR ls_prof IN lt_nacionalidad
      (
        %tky   = ls_prof-%tky
        %param = ls_prof
      )
    ).


  ENDMETHOD.

ENDCLASS.
