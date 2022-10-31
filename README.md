# Manorial-Documents-Register

Front end: https://discovery.nationalarchives.gov.uk/manor-search

The most recent access databases are kept in Q:\HMC\HMC Legacy. They arrive as an attachment (zipped format) then unzipped becoming an mdb file. The queries mentioned below are run against the data and any errors are corrected before the mdb is assumed to hold clean data. It is then ready to be processed by the SSIS package. Use MDR Proforma 2016.mdb as the proforma database

Backoutsqlrecords.sql is used to restore the HMCAdmin database (ensure that date, countyname and username are correct) after a failed attempt to update the data

If any of the follwing queries show records send to ASD for error correction

Date Error Query
DOCUMENTS Without Matching MANORS
Find duplicates for DOCUMENTS
Find duplicates for MANORS
Find duplicates for Parish
Find duplicates for Variants
MANORS Without Matching ManorCountyLink
MANORS Without Matching Parish
MANORS Without Matching Variants

Parish Without Matching MANORS (even if records  are listed they may not be errors - show to ASD anyway)

At the end tidy up the data by running

qryUpdateManorName  Appends the word MANOR to the end of the manor name. If this query fails check you are using the latest utilities module
