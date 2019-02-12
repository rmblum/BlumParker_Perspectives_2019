***********************************
*Rachel Blum and Christoper Parker*
*Coding/Analysis of 2016 ANES Time Series*
*Prepared for Perspectives on Politics, 2019*
***********************************

*use "/anes_timeseries_2016_Stata12.dta"
set more off

***********
*Contents:
**A. Variable coding
**B. Descriptive statistics
**C. Regression models
************

***
*A. Variable coding (alphabetical)*
***

**1. Age**
tab V161267
gen age=V161267 if V161267>=19
tab age
***

**2. Education**
*Recoded so 1 is highschool but no diploma (4-8),*
*2 is HS grad (9), 3 is some college (10-12),*
*4 is college degress (13), 5 is post grad (14-16)*

tab V161270
gen education=.
replace education=1 if V161270>=4 & V161270<=8
replace education=2 if V161270==9
replace education=3 if V161270>=10 & V161270<=12
replace education=4 if V161270==13
replace education=5 if V161270>=14 & V161270<=16
tab education
***

**3. Ethnocentrism Scale using hardworking stereotype**
*(In appendix models only)**

*Blacks*
tab V162346
gen black_resent=V162346 if V162346>=1 
tab black_resent

*Latinos*
tab V162347
gen latino_resent=V162347 if V162347>=1 
tab latino_resent

* Asians*
tab V162348
gen asian_resent=V162348 if V162348>=1 
tab asian_resent

* Whites*
tab V162345
gen white_resent=V162345 if V162345>=1 
tab white_resent

*Scale (positive means others are lazier than whites)*
gen ethnobl=black_resent-white_resent
gen ethnola=latino_resent-white_resent
gen ethnoas=asian_resent-white_resent
gen ethnocentrism=(ethnobl+ethnola+ethnoas)/3

*Alpha=0.65*
alpha black_resent latino_resent asian_resent, item
***

**4. Female**
tab V161342
gen female=.
replace female=1 if V161342==2
replace female=0 if V161342==1
tab female
***

**5. Ideology and Conservatism**
tab V161126
gen ideo=.
replace ideo=1 if V161126==1
replace ideo=2 if V161126==2
replace ideo=3 if V161126==3
replace ideo=4 if V161126==4
replace ideo=5 if V161126==5
replace ideo=6 if V161126==6
replace ideo=7 if V161126==7
tab ideo

gen conserv=.
replace conserv=1 if ideo==4
replace conserv=2 if ideo==5
replace conserv=3 if ideo==6
replace conserv=4 if ideo==7
tab conserv
***

**6. Income**
tab V161361x
gen income=V161361x if V161361x>=1
tab income
***

**7.Isolationism/Stay at home (agree)**
*Dependent Variable*
tab V161153
gen isolate=.
replace isolate=1 if V161153==1
replace isolate=0 if V161153==2
***

**8. Nationalism/neo-conservatism scale**
*(In appendix models only)**

tab V162271
gen born=.
replace born=1 if V162271==4
replace born=2 if V162271==3
replace born=3 if V162271==2
replace born=4 if V162271==1

gen ancestr=.
replace ancestr=1 if V162272==4
replace ancestr=2 if V162272==3
replace ancestr=3 if V162272==2
replace ancestr=4 if V162272==1

gen english=.
replace english=1 if V162273==4
replace english=2 if V162273==3
replace english=3 if V162273==2
replace english=4 if V162273==1

gen trad=.
replace trad=1 if V162274==4
replace trad=2 if V162274==3
replace trad=3 if V162274==2
replace trad=4 if V162274==1

gen nationalism=(born+ancestr+english+trad)/4

*Alpha=0.70*
alpha born ancestr english trad, item
***

**9. Party identification**
*Used in descriptive statistics only*
tab V161158x
gen pid=.
replace pid=1 if V161158x==1
replace pid=2 if V161158x==2
replace pid=3 if V161158x==3
replace pid=4 if V161158x==4
replace pid=5 if V161158x==5
replace pid=6 if V161158x==6
replace pid=7 if V161158x==7
tab pid
***

**10. Primary choice: restricts to Republicans**
tab V161021a
rename V161021a primary
keep if primary >=1

*For comparison purposes (Note: 4=Trump, 5=Cruz, 6=Kasich, 7=Rubio, 8=other)*
gen primarygop=primary
keep if primarygop>=4 & primarygop<=8
***

**11.Syrian refugees (oppose)**
*Dependent Variable*
tab V161214x
gen refugee=V161214x if V161214x>=1
tab refugee
***

**12. Trade agreements (oppose)**
*Dependent Variable*
tab V162176x
gen free_trade=V162176x if V162176x>=1
tab free_trade
***

**13. Trump primary support**
*Key Independent Variable*
gen trumpgop=.
replace trumpgop=1 if primarygop==4
replace trumpgop=0 if primarygop>=5
tab trumpgop
***

**14. White/Not white**
*Not white used in models*
tab V161310x
gen white=.
replace white=1 if V161310x==1
replace white=0 if V161310x>=2
tab white

gen notwhite=.
replace notwhite=1 if white==0
replace notwhite=0 if white==1
***

**************************
***
*B. Descriptive statistics*
***

**1. Table 1**
*Restricted to 2016 GOP primary voters through primarygop variable*

*Average age*
sum age

*Average education*
sum education

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

***
**2. Table 2: Candidate Preference**
tabulate primarygop
***

**3. Appendix: cross-tabs of dependent variables**
*Against GOP primary candidates*
tabulate refugee primarygop, chi2 col 
tabulate isolate primarygop, chi2 col 
tabulate free_trade primarygop, chi2 col 

*Against Trump support*
tabulate refugee trumpgop, chi2 col
tabulate isolate trumpgop, chi2 col
tabulate free_trade trumpgop, chi2 col
***

**************************
***
*C. Models*
***

**1. In Paper**
*Note: use of conserv or ideo for ideology produce nearly identical results*

*Isolationism*
logit isolate i.trumpgop conserv education income age female white
margins trumpgop, atmeans

*Syria Refugees*
ologit refugee i.trumpgop conserv education income age female notwhite
margins trumpgop, atmeans

*Trade*
ologit free_trade i.trumpgop conserv education income age female white
margins trumpgop, atmeans
***

**2.In Appendix**
*Model 2: With nationalism*
logit isolate i.trumpgop conserv nationalism education income age female notwhite
margins trumpgop, atmeans

ologit refugee i.trumpgop conserv nationalism education income age female notwhite
margins trumpgop, atmeans

ologit free_trade i.trumpgop conserv nationalism education income age female white
margins trumpgop, atmeans

*Model 3: With ethnocentrism
logit isolate i.trumpgop conserv ethnocentrism education income age female notwhite
margins trumpgop, atmeans

ologit refugee i.trumpgop conserv ethnocentrism education income age female notwhite
margins trumpgop, atmeans

ologit free_trade i.trumpgop conserv ethnocentrism education income age female white
margins trumpgop, atmeans

*Model 4:With nationalism and ethnocentrism 
logit isolate i.trumpgop conserv nationalism ethnocentrism education income age female notwhite
margins trumpgop, atmeans

ologit refugee i.trumpgop conserv nationalism ethnocentrism education income age female notwhite
margins trumpgop, atmeans

ologit free_trade i.trumpgop conserv nationalism ethnocentrism education income age female white
margins trumpgop, atmeans
***
