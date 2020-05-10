CLASS zcl_booking_data_generator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS insert_data  RETURNING VALUE(r_result) TYPE  abap_bool.
ENDCLASS.



CLASS zcl_booking_data_generator IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA(lv_flag) = insert_data(  ).

    DATA(lv_out) = cond #(
        when lv_flag EQ abap_true then out->write( |Inserted { sy-dbcnt } records successfully!| )
        else out->write( |Failed to insert data into the Database!| )
    ).
  ENDMETHOD.


  METHOD insert_data.
    DATA:it_bookings TYPE TABLE OF ztbooking_id.

*    read current timestamp
    GET TIME STAMP FIELD DATA(zv_tsl).
*   fill internal table (itab)
    it_bookings = VALUE #(
        ( booking  = '1' customername = 'Buchholm' numberofpassengers = '3' emailaddress = 'tester1@flight.example.com'
          country = 'Germany' dateofbooking ='20180213125959' dateoftravel ='20180213125959' cost = '546' currencycode = 'EUR' lastchangedat = zv_tsl )
        ( booking  = '2' customername = 'Jeremias' numberofpassengers = '1' emailaddress = 'tester2@flight.example.com'
          country = 'USA' dateofbooking ='20180313125959' dateoftravel ='20180313125959' cost = '1373' currencycode = 'USD' lastchangedat = zv_tsl )
     ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM zsamplebooking.
*   insert the new table entries
    INSERT zsamplebooking FROM TABLE @it_bookings.

*   check the result
    SELECT * FROM zsamplebooking INTO TABLE @it_bookings.
    r_result = xsdbool( sy-subrc = 0 ).

  ENDMETHOD.

ENDCLASS.
