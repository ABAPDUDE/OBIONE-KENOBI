*&---------------------------------------------------------------------*
*& Include y_spacecraft_class_sup1
*&---------------------------------------------------------------------*

*----------------------------------------------------------------------*
*       CLASS lcl_domain_desc DEFINITION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_domain_desc  DEFINITION.
  PUBLIC SECTION.
    METHODS : get_domain_descr
      IMPORTING
        i_field       TYPE any
        i_langu       TYPE  syst-langu DEFAULT sy-langu
      RETURNING
        VALUE(return) TYPE ddtext .
ENDCLASS.                    "lcl_domain_desc DEFINITION

*----------------------------------------------------------------------*
*       CLASS lcl_domain_desc IMPLEMENTATION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_domain_desc IMPLEMENTATION .
  METHOD get_domain_descr.

    DATA : lo_element TYPE REF TO cl_abap_elemdescr,
           li_values  TYPE ddfixvalues,
           ls_value   TYPE ddfixvalue.

    lo_element ?= cl_abap_typedescr=>describe_by_data( i_field ) .
    li_values =  lo_element->get_ddic_fixed_values( i_langu ) .
    READ TABLE li_values INTO ls_value WITH KEY low = i_field .
    IF sy-subrc = 0 .
      return = ls_value-ddtext .
    ENDIF.
  ENDMETHOD.                    "GET_DOMAIN_DESCR
ENDCLASS .                    "lcl_domain_desc IMPLEMENTATION
