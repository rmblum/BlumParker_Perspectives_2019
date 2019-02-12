***********************************
*Rachel Blum and Christoper Parker*
*Coding/Analysis of 2016 SCDS*
*Prepared for Perspectives on Politics, 2019*
***********************************

*use "/BlumParker_SCDS_Subset.dta"
set more off

***********
*Contents:
**A. Descriptive statistics
**B. Regression models
************

***
*A. Descriptive statistics*
***


**1. Table 1** 

**Table 1**

*Average age*
sum age

*Average education*
sum educ

*Percent female*
tab female

*Average ideology*
sum ideo

*Average income*
sum income

*Average party identification*
sum pid

*Percent white*
table white
***


**2. Table 2: Candidate Preference**
tabulate prim
***

**3. Appendix: cross-tabs of dependent variables**
*Against GOP primary candidates*
tabulate isolate prim, chi2 col 
tabulate immban prim, chi2 col 
tabulate trade prim, chi2 col 

*Against Trump support*
tabulate isolate trumpprim, chi2 col
tabulate immban trumpprim, chi2 col
tabulate trade trumpprim, chi2 col
***

**4. Appendix: by state**
*GOP primary preferences by state*
tabulate primall SPID, chi2 col
tabulate primall SPID, chi2 col nofreq

*Trump primary support by state*
tabulate trumpprim SPID, chi2 col
tabulate trumpprim SPID, chi2 col nofreq

*Descriptive statistics by state*
table SPID, content (mean age n age)
table SPID, content (mean educ n educ)
table SPID, content (mean female n female)
table SPID, content (mean ideo n ideo)
table SPID, content (mean income n income)
table SPID, content (mean pid n pid)
table SPID, content (mean white n white)
***

**************************
***
*B. Models*
***

**1. In Paper**

ologit isolate i.trumpprim ideo educ income female age notwhite
margins i.trumpprim, atmeans

ologit immban i.trumpprim ideo educ income female age notwhite
margins i.trumpprim, atmeans 

ologit trade i.trumpprim ideo educ income female age notwhite
margins i.trumpprim, atmeans



**2. In Appendix**
*With national identity/english variable*

ologit isolate i.trumpprim ideo eng educ income female age notwhite
margins i.trumpprim, atmeans

ologit immban i.trumpprim ideo eng educ income female age notwhite
margins i.trumpprim, atmeans 

ologit trade i.trumpprim ideo eng educ income female age notwhite
margins i.trumpprim, atmeans
