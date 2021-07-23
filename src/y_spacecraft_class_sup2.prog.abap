*&---------------------------------------------------------------------*
*& Include y_spacecraft_class_sup2
*&---------------------------------------------------------------------*

*----------------------------------------------------------------------*
*       CLASS lcl_numberrange_spaceship DEFINITION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_numberrange_spaceship  DEFINITION.
  PUBLIC SECTION.
    METHODS : constructor.
    METHODS : set_new_number.
    METHODS : get_new_number
      RETURNING
        VALUE(return) TYPE ystarwars_ship_id.

  PRIVATE SECTION.
    DATA mv_id TYPE ystarwars_ship_id.

ENDCLASS.                    "lcl_numberrange_spaceship DEFINITION

*----------------------------------------------------------------------*
*       CLASS lcl_numberrange_spaceship IMPLEMENTATION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_numberrange_spaceship IMPLEMENTATION .
  METHOD constructor.
     me->set_new_number( ).
  ENDMETHOD.                "CONSTRUCTOR

  METHOD get_new_number.

    return = me->mv_id.

  ENDMETHOD.                    "GET_NEW_NUMBER

  METHOD set_new_number.

    DATA lv_next_number  TYPE num10.
    CONSTANTS lco_prefix TYPE ystarship_id_prefix VALUE 'NCC-'.
    CONSTANTS lco_object TYPE nrobj               VALUE 'YSWSHIP_ID'.

    CALL FUNCTION 'NUMBER_GET_NEXT'
      EXPORTING
        nr_range_nr             = '01'
        object                  = lco_object
      IMPORTING
        number                  = lv_next_number
      EXCEPTIONS
        interval_not_found      = 1
        number_range_not_intern = 2
        object_not_found        = 3
        quantity_is_0           = 4
        quantity_is_not_1       = 5
        interval_overflow       = 6
        buffer_overflow         = 7
        OTHERS                  = 8.
    IF sy-subrc <> 0.
      MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
        WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
    ELSE.

      CONCATENATE lco_prefix lv_next_number
      INTO DATA(new_id_number).
      me->mv_id = new_id_number.

    ENDIF.

  ENDMETHOD.
ENDCLASS .                    "lcl_numberrange_spaceship IMPLEMENTATION
