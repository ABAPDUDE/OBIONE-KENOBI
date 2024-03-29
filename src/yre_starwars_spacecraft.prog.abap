*&---------------------------------------------------------------------*
*& Report yre_starwars_spacecraft
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT yre_starwars_spacecraft.

INCLUDE y_spacecraft_class_sup1.
INCLUDE y_spacecraft_class_sup2.
INCLUDE y_spacecraft_class_sup3.
INCLUDE y_spacecraft_sel.
INCLUDE y_spacecraft_class.

DATA go_spacecraft TYPE REF TO lcl_spacecraft.

START-OF-SELECTION.

  go_spacecraft = NEW lcl_spacecraft( episode      = p_episod
                                      origin       = p_origin
                                      design       = p_design
                                      delete_flag  = p_delete
                                      create_flag  = p_create
                                      alvlist_flag = p_sslist
                                      ).

  go_spacecraft->engage( display_list = abap_true ).
