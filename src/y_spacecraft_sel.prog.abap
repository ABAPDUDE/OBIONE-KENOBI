*&---------------------------------------------------------------------*
*& Include y_spacecraft_sel
*&---------------------------------------------------------------------*

SELECTION-SCREEN: BEGIN OF BLOCK bl1 WITH FRAME TITLE TEXT-001.

  SELECTION-SCREEN BEGIN OF LINE.
    SELECTION-SCREEN COMMENT (16) TEXT-002.
    PARAMETERS p_episod TYPE ystarwars_ships-episode.
    PARAMETERS p_desc01 TYPE ddtext MODIF ID sg1.
  SELECTION-SCREEN END OF LINE.

  SELECTION-SCREEN BEGIN OF LINE.
    SELECTION-SCREEN COMMENT (16) TEXT-003.
    PARAMETERS p_origin TYPE ystarwars_ships-origin.
    PARAMETERS p_desc02 TYPE ddtext MODIF ID sg1.
  SELECTION-SCREEN END OF LINE.

  SELECTION-SCREEN BEGIN OF LINE.
    SELECTION-SCREEN COMMENT (16) TEXT-004.
    PARAMETERS p_design TYPE ystarwars_ships-design.
    PARAMETERS p_desc03 TYPE ddtext MODIF ID sg1.
  SELECTION-SCREEN END OF LINE.

SELECTION-SCREEN: END OF BLOCK bl1.

SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME.
  PARAMETERS p_sslist AS CHECKBOX USER-COMMAND flag.
  PARAMETERS p_delete AS CHECKBOX USER-COMMAND flag.
  PARAMETERS p_create AS CHECKBOX USER-COMMAND flag.
SELECTION-SCREEN END OF BLOCK b2.

AT SELECTION-SCREEN.

  DATA lo_domain_text TYPE REF TO lcl_domain_desc .

  lo_domain_text = NEW lcl_domain_desc( ).
  DATA(lv_description01) = lo_domain_text->get_domain_descr( p_episod ).
  p_desc01 =  lv_description01.

  lo_domain_text = NEW lcl_domain_desc( ).
  DATA(lv_description02) = lo_domain_text->get_domain_descr( p_origin ).
  p_desc02 =  lv_description02.

  lo_domain_text = NEW lcl_domain_desc( ).
  DATA(lv_description03) = lo_domain_text->get_domain_descr( p_design ).
  p_desc03 =  lv_description03.

AT SELECTION-SCREEN OUTPUT.

  LOOP AT SCREEN INTO DATA(ls_screen).
    IF ls_screen-group1 = 'SG1'.
      CASE ls_screen-name.
        WHEN 'P_DESC01'.
          IF p_desc01 IS INITIAL.
            ls_screen-active = '0'.
          ELSE.
            ls_screen-active = '1'.
          ENDIF.
          ls_screen-input  = '0'.
        WHEN 'P_DESC02'.
          IF p_desc02 IS INITIAL.
            ls_screen-active = '0'.
          ELSE.
            ls_screen-active = '1'.
          ENDIF.
          ls_screen-input  = '0'.
        WHEN 'P_DESC03'.
          IF p_desc03 IS INITIAL.
            ls_screen-active = '0'.
          ELSE.
            ls_screen-active = '1'.
          ENDIF.
          ls_screen-input  = '0'.
        WHEN OTHERS.
      ENDCASE.
    ENDIF.
    MODIFY SCREEN FROM ls_screen.
  ENDLOOP.

INITIALIZATION.
