##################################
#Rachel Blum and Christoper Parker#
#Variable Coding of 2016 SCDS#
#Note: additional coding/analyses in Stata#
#Prepared for Perspectives on Politics, 2019#
####################################

library(car)

##Note: this file describes the coding of the SCDS variables used in these analyses. The replication version of these data is written at the end of these files (BlumParker_SCDS_Subset.dta)##

#Read in full Republican dataset# 
reps=read.csv("SCDS_Reps.csv", na.strings=c(""," ","NA"))


###################
##Variables listed alphabetically##
##Note: some variables did not require recoding## 
###################

##1. Age##
table(reps$age)
###

##2. Education##
table(reps$Q54)
reps$educ=as.numeric(reps$Q54)
reps$educ<-recode(reps$educ, "2=1; 4=2; 1=3; 5=4; 3=5")
table(reps$educ)
###

##3. Female##
table(reps$Q50)
reps$female<-recode(reps$Q50, "'Female'=1; else=0")
table(reps$female)
###

##4. Ideology##
summary(reps$Q17_1)
reps$ideo=reps$Q17_1
summary(reps$ideo)
###

##5. Income##
table(reps$Q64)
reps$income=as.numeric(reps$Q64)
reps$income<-recode(reps$income, "2=1; 3=2; 4=3; 5=4; 1=5; 6=6")
table(reps$income)
###

##6. Islamic Immigrant Ban (agree)##
table(reps$Q27_5)
reps$immban=as.numeric(reps$Q27_5)
reps$immban<-recode(reps$immban, "4=1; 3=2; 5=3; 1=4; 2=5")
table(reps$immban)
###

##7. Isolationism/Stay at home (agree)
table(reps$Q27_3)
reps$isolate=as.numeric(reps$Q27_3)
reps$isolate<-recode(reps$isolate, "4=1; 3=2; 5=3; 1=4; 2=5")
table(reps$isolate)
###

##8. National identity/English language##
#Appendix only, agree strongly high#
table(reps$Q27_4)
reps$eng=as.numeric(reps$Q27_4)
reps$eng<-recode(reps$eng, "1=4; 2=3; 3=5; 4=1; 5=2")
table(reps$eng)
###

##9. Party identification##
summary(reps$Q5_1)
reps$pid=reps$Q5_1
summary(reps$pid)
###

##10. Primary choice##
table(reps$Q49)
reps$prim<-recode(reps$Q49, "'Ted Cruz'=1; 'John Kasich'=2; 'Marco Rubio'=3; 'Donald Trump'=4; else=0")
table(reps$prim)

##And keeping all##
reps$primall=reps$Q49
table(reps$primall)
###

##11. State of Delegate##
table(reps$SPID)
###

##12. Trade (decrease)##
#Rescale#
table(reps$Q117_1)
reps$trade<-recode(reps$Q117_1, "0:1.4=1; 1.5:2.4=2; 2.5:3.4=3; 3.5:4.4=4; 4.5:5.4=5; 5.5:6.4=6; 6.5:7=7")
table(reps$trade)
###

##13. Trump primary support##
table(reps$Q49)
reps$trumpprim<-recode(reps$Q49, "'Donald Trump'=1; else=0")
table(reps$trumpprim)
###

##14. White/Not white##
table(reps$Q51)
reps$white=as.numeric(reps$Q51)
reps$white<-recode(reps$white, "12:22=1; 1:11=0")
table(reps$white)

reps$notwhite<-recode(reps$white, "1=0; 0=1")
table(reps$notwhite)
###

###
##Subset of SCDS for variables used in analysis##
reps2=subset(reps, select=c("age", "educ", "female", "ideo", "income", "immban", "isolate", "eng", "pid", "prim", "primall", "trade", "trumpprim", "white", "notwhite", "SPID"))

library(readstata13)
save.dta13(reps2, file="BlumParker_SCDS_Subset.dta")

###



