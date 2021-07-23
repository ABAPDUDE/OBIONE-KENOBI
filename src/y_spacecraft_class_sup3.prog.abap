*&---------------------------------------------------------------------*
*& Include y_spacecraft_class_sup3
*&---------------------------------------------------------------------*

*----------------------------------------------------------------------*
*       CLASS lcl_messages_staceship DEFINITION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_messages_spaceship  DEFINITION.
  PUBLIC SECTION.
    METHODS : constructor.
    METHODS : popup_2_confirm
      IMPORTING
        title         TYPE itex132
        question      TYPE itex132
      RETURNING
        VALUE(return) TYPE char1.

  PRIVATE SECTION.

ENDCLASS.                    "lcl_messages_spaceship DEFINITION

*----------------------------------------------------------------------*
*       CLASS lcl_messages_spaceship IMPLEMENTATION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_messages_spaceship IMPLEMENTATION .
  METHOD constructor.

  ENDMETHOD.                "CONSTRUCTOR

  METHOD popup_2_confirm.

    DATA lv_answer TYPE c.

    CALL FUNCTION 'POPUP_TO_CONFIRM'
      EXPORTING
        titlebar       = title
*       diagnose_object       = space
        text_question  = question
        text_button_1  = TEXT-007
        icon_button_1  = 'ICON_REJECT'
        text_button_2  = TEXT-008
        icon_button_2  = 'ICON_CHECK'
*       default_button = '1'
*       display_cancel_button = 'X'
*       userdefined_f1_help   = space
        start_column   = 25
        start_row      = 6
*       popup_type     =
*       iv_quickinfo_button_1 = space
*       iv_quickinfo_button_2 = space
      IMPORTING
        answer         = lv_answer
*  TABLES
*       parameter      =
      EXCEPTIONS
        text_not_found = 1
        OTHERS         = 2.

    IF sy-subrc <> 0.
      MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
        WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
    ENDIF.

    return = lv_answer.

  ENDMETHOD.                    "POPUP_2_CONFIRM

ENDCLASS .                    "lcl_messages_spaceship IMPLEMENTATION
