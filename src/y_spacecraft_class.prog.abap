*&---------------------------------------------------------------------*
*& Include y_spacecraft_class
*&---------------------------------------------------------------------*

CLASS lcl_spacecraft DEFINITION.

  PUBLIC SECTION.
    METHODS constructor IMPORTING episode TYPE ystarwars_episode
                                  origin  TYPE ystarwars_origin
                                  design  TYPE ystarwars_design.

    METHODS engage IMPORTING display_list TYPE boolean.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA mv_origin  TYPE ystarwars_origin.
    DATA mv_design  TYPE ystarwars_design.
    DATA mv_episode TYPE ystarwars_episode.
    CLASS-DATA gv_n_o_spacecraft TYPE i.

ENDCLASS.

CLASS lcl_spacecraft IMPLEMENTATION.

  METHOD constructor.

    mv_origin = origin.
    mv_design = design.
    ADD 1 TO gv_n_o_spacecraft.

  ENDMETHOD.


  METHOD engage.

  ENDMETHOD.

ENDCLASS.
