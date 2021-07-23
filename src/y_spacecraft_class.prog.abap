*&---------------------------------------------------------------------*
*& Include y_spacecraft_class
*&---------------------------------------------------------------------*

CLASS lcl_spacecraft DEFINITION.

  PUBLIC SECTION.

    DATA lo_msg TYPE REF TO lcl_messages_spaceship.

    METHODS constructor IMPORTING episode      TYPE ystarwars_episode
                                  origin       TYPE ystarwars_origin
                                  design       TYPE ystarwars_design
                                  delete_flag  TYPE flag
                                  create_flag  TYPE flag
                                  alvlist_flag TYPE flag.

    METHODS engage IMPORTING display_list TYPE boolean.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA mv_create  TYPE flag.
    DATA mv_delete  TYPE flag.
    DATA mv_alvlist TYPE flag.
    DATA mv_origin  TYPE ystarwars_origin.
    DATA mv_design  TYPE ystarwars_design.
    DATA mv_episode TYPE ystarwars_episode.
    CLASS-DATA gv_nr_spaceship TYPE i.

ENDCLASS.

CLASS lcl_spacecraft IMPLEMENTATION.

  METHOD constructor.

    me->mv_episode = episode.
    me->mv_origin  = origin.
    me->mv_design  = design.
    me->mv_delete  = delete_flag.
    me->mv_create  = create_flag.
    me->mv_alvlist = alvlist_flag.

    ADD 1 TO gv_nr_spaceship.



  ENDMETHOD.


  METHOD engage.

    me->lo_msg = NEW lcl_messages_spaceship( ).

    IF me->mv_delete EQ abap_true.

      me->lo_msg->popup_2_confirm(
        EXPORTING
          title    = text-005
          question = text-006
        RECEIVING
          return   = data(lv_answer)
      ).
      DELETE FROM ystarwars_ships.   "all entries in DDIC table YSTARWARS_SHIPS will be deleted!
    ENDIF.

    if me->mv_create EQ abap_true.

    endif.


  ENDMETHOD.

ENDCLASS.
