CLASS zcl_my_alv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS fetch_data
      IMPORTING
        iv_max_rows     TYPE i
      RETURNING
        VALUE(r_result) TYPE  REF TO object.
ENDCLASS.



CLASS zcl_my_alv IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA(lt_data) = fetch_data( iv_max_rows = 200 ).
  ENDMETHOD.


  METHOD fetch_data.

  ENDMETHOD.

ENDCLASS.
