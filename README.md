# SAP Code Style Guides

[**Continuous Release**](#continuous-release)
&nbsp;·&nbsp;
[**Open Source**](#open-source)
&nbsp;·&nbsp;
[**Grassroots Project**](#grassroots-project)
&nbsp;·&nbsp;
[**Optional**](#optional)

This repository provides SAP's style guides for coding.

Programming languages enable us to say the same thing in different ways.
While all of them may be correct, some may be more efficient,
easier to understand, and more robust than others.

Our style guides want to show up differences and guide you
towards code that has a healthy balance between all of these qualities.

## Style Guides

- [**Clean ABAP**](clean-abap/CleanABAP.md)

## Continuous Release

These guides are updated **continuously**,
meaning any change is reviewed and immediately put "live",
without special publication versions.

As programming languages and our understanding of them evolve,
we believe that these guides are "work in progress"
and will probably never see a status "finished";
as agile developers, we welcome this.

## Open Source

This repository is **open source**,
meaning it is written by a loose community of interested persons,
and anybody from within and without SAP is invited to contribute.


@EndUserText.label : 'Table Booking'
@AbapCatalog.enhancementCategory : #NOT_EXTENSIBLE
@AbapCatalog.tableCategory : #TRANSPARENT
@AbapCatalog.deliveryClass : #A
@AbapCatalog.dataMaintenance : #LIMITED
define table zsamplebooking {
  key client         : abap.clnt not null;
  key booking        : abap.int4 not null;
  customername       : abap.char(50);
  numberofpassengers : abap.int2;
  emailaddress       : abap.char(50);
  country            : abap.char(50);
  dateofbooking      : timestampl;
  dateoftravel       : timestampl;
  @Semantics.amount.currencyCode : 'ztbooking_id.currencycode'
  cost               : abap.curr(15,2);
  currencycode       : abap.cuky;
  lastchangedat      : timestampl;

}
