##################################
#Rachel Blum and Christoper Parker#
#Figures from 2016 ANES#
#Note: all necessary information for making figures listed in file#
#Output can be produced using Stata files#
#Prepared for Perspectives on Politics, 2019#
####################################

##Order:##
#A. Marginal effects plots (paper)
#B. Bar plots (appendix)

#Load necessary libraries
library(ggplot2)
library(ggthemes)

###
#A. Marginal effects plots (paper)
###

#Groups and response values for DVs with 2-point scales#

var2 = as.factor(c("Non-Trump Supporters", "Trump Supporters"))
val2 = 1:2

#Groups and response values for DVs with 7 point scales#

var7 = as.factor(c(rep("Non-Trump Supporters",7), rep("Trump Supporters", 7)))
val7	<-rep(1:7,2)

###
##1. Isolationism plots##

##Paper model: marginal effects with low and high confidence bands (from Stata)#

iso1.est	<-c(0.16, 0.291)
iso1.lo	<-c(0.12, 0.242)
iso1.hi	<-c(0.2, 0.341)

##Appendix models:
#Model 2 marginal effects with low and high confidence bands (from Stata)#

iso2.est <-c(0.152, 0.265)
iso2.lo <-c(0.11, 0.211)
iso2.hi<-c(0.195, 0.319)

#Model 3 marginal effects with low and high confidence bands (from Stata)#

iso3.est <-c(0.155, 0.278)
iso3.lo <-c(0.112, 0.224)
iso3.hi<-c(0.198, 0.333)

#Model 4 marginal effects with low and high confidence bands (from Stata)#

iso4.est <-c(0.157, 0.26)
iso4.lo <-c(0.113, 0.205)
iso4.hi<-c(0.201, 0.314)

#Combine all into data frame (this is a 2 response DV)#

prob.iso<-data.frame(var2, val2, response2, iso1.est, iso1.lo, iso1.hi, iso2.est, iso2.lo, iso2.hi, iso3.est, iso3.lo, iso3.hi, iso4.est, iso4.lo, iso4.hi)

#Plot Isolationism Model 1 (in paper)#

ggplot(prob.iso, aes(x=val2, y=iso1.est)) + geom_errorbar(aes(ymin=iso1.lo, ymax=iso1.hi, linetype=var2, color=var2, width=0.1), size=0.7)+ scale_color_manual(values=c("grey40", "black")) + geom_point(size=1.3, shape=19, color=c("grey40", "black")) + ylim(0,1) + theme_gdocs() + guides(fill=FALSE) + theme(legend.title=element_blank(), legend.text=element_text(size=10), legend.position="bottom", plot.title = element_text(size=14, hjust=0), axis.text.x = element_text(size=10), axis.text.y=element_text(size=8), axis.line = element_blank(), panel.background = element_blank(), panel.grid.major.x=element_blank()) + labs(title="Probability of Agreeing the U.S. Should Stay at Home",  x = "ANES GOP Primary Voters", y="\n Marginal Effects") + scale_x_discrete(labels=element_blank(), limits = val2)

#Plot Isolationism Models 2-4 (in appendix)#

ggplot(prob.iso, aes(x=val2, y=iso2.est)) + geom_errorbar(aes(ymin=iso2.lo, ymax=iso2.hi, linetype=var2, color=var2, width=0.1), size=0.7)+ scale_color_manual(values=c("grey40", "black")) + geom_point(size=1.3, shape=19, color=c("grey40", "black")) + ylim(0,1) + theme_gdocs() + guides(fill=FALSE) + theme(legend.title=element_blank(), legend.text=element_text(size=10), legend.position="bottom", plot.title = element_text(size=14, hjust=0), axis.text.x = element_text(size=10), axis.text.y=element_text(size=8), axis.line = element_blank(), panel.background = element_blank(), panel.grid.major.x=element_blank()) + labs(title="Probability of Agreeing the U.S. Should Stay at Home",  x = "ANES GOP Primary Voters", y="\n Marginal Effects", subtitle="Model 2") + scale_x_discrete(labels=element_blank(), limits = val2)

ggplot(prob.iso, aes(x=val2, y=iso3.est)) + geom_errorbar(aes(ymin=iso3.lo, ymax=iso3.hi, linetype=var2, color=var2, width=0.1), size=0.7)+ scale_color_manual(values=c("grey40", "black")) + geom_point(size=1.3, shape=19, color=c("grey40", "black")) + ylim(0,1) + theme_gdocs() + guides(fill=FALSE) + theme(legend.title=element_blank(), legend.text=element_text(size=10), legend.position="bottom", plot.title = element_text(size=14, hjust=0), axis.text.x = element_text(size=10), axis.text.y=element_text(size=8), axis.line = element_blank(), panel.background = element_blank(), panel.grid.major.x=element_blank()) + labs(title="Probability of Agreeing the U.S. Should Stay at Home",  x = "ANES GOP Primary Voters", y="\n Marginal Effects", subtitle="Model 3") + scale_x_discrete(labels=element_blank(), limits = val2)

ggplot(prob.iso, aes(x=val2, y=iso4.est)) + geom_errorbar(aes(ymin=iso4.lo, ymax=iso4.hi, linetype=var2, color=var2, width=0.1), size=0.7)+ scale_color_manual(values=c("grey40", "black")) + geom_point(size=1.3, shape=19, color=c("grey40", "black")) + ylim(0,1) + theme_gdocs() + guides(fill=FALSE) + theme(legend.title=element_blank(), legend.text=element_text(size=10), legend.position="bottom", plot.title = element_text(size=14, hjust=0), axis.text.x = element_text(size=10), axis.text.y=element_text(size=8), axis.line = element_blank(), panel.background = element_blank(), panel.grid.major.x=element_blank()) + labs(title="Probability of Agreeing the U.S. Should Stay at Home",  x = "ANES GOP Primary Voters", y="\n Marginal Effects", subtitle="Model 4") + scale_x_discrete(labels=element_blank(), limits = val2)

###
##2. Syria plots##

#Paper model: marginal effects with low and high confidence bands (from Stata)#

syr1.est	<-c(0.028, 0.039, 0.018, 0.23, 0.4, 0.209, 0.436, 0.009, 0.0113, 0.006, 0.098, 0.021, 0.142, 0.711)
syr1.lo	<-c(0.014, 0.022, 0.006, 0.189, 0.023, 0.174, 0.383, 0.004, 0.007, 0.002, 0.074, 0.012, 0.114, 0.662)
syr1.hi	<-c(0.043, 0.056, 0.03, 0.272, 0.057, 0.244, 0.49, 0.014, 0.019, 0.011, 0.122, 0.031, 0.169, 0.759)

##Appendix models:

#Model 2 marginal effects with low and high confidence bands (from Stata)#

syr2.est=c(0.022, 0.028, 0.016, 0.216, 0.039, 0.228, 0.453, 0.008, 0.011, 0.006, 0.102, 0.022, 0.162, 0.688)
syr2.lo=c(0.01, 0.013, 0.005, 0.172, 0.031, 0.188, 0.393, 0.003, 0.005, 0.002, 0.075, 0.011, 0.129, 0.634)
syr2.hi=c(0.034, 0.042, 0.027, 0.259, 0.057, 0.267, 0.512, 0.013, 0.017, 0.011, 0.13, 0.033, 0.195, 0.743)

#Model 3 marginal effects with low and high confidence bands (from Stata)#

syr3.est=c(0.028, 0.034, 0.018, 0.231, 0.039, 0.216, 0.434, 0.009, 0.012, 0.007, 0.1, 0.021, 0.149, 0.703)
syr3.lo=c(0.013, 0.016, 0.006, 0.187, 0.021, 0.178, 0.377, 0.004, 0.005, 0.002, 0.074, 0.011, 0.118, 0.65)
syr3.hi=c(0.044, 0.051, 0.031, 0.275, 0.057, 0.254, 0.492, 0.015, 0.018, 0.011, 0.127, 0.031, 0.179, 0.755)

#Model 4 marginal effects with low and high confidence bands (from Stata)#

syr4.est=c(0.022, 0.028, 0.016, 0.217, 0.04, 0.228, 0.45, 0.008, 0.011, 0.006, 0.102, 0.022, 0.162, 0.688)
syr4.lo=c(0.01, 0.014, 0.005, 0.173, 0.021, 0.188, 0.39, 0.003, 0.005, 0.002, 0.075, 0.011, 0.129, 0.633)
syr4.hi=c(0.035, 0.043, 0.027, 0.261, 0.058, 0.268, 0.509, 0.013, 0.017, 0.011, 0.129, 0.033, 0.195, 0.743)

#Combine all into data frame (this is a 7 response DV)#

prob.syria<-data.frame(var7, val7, response7, syr1.est, syr1.lo, syr1.hi, syr2.est, syr2.lo, syr2.hi, syr3.est, syr3.lo, syr3.hi, syr4.est, syr4.lo, syr4.hi)

#Plot Syria model 1 (in paper)#

ggplot(prob.syria, aes(x=val7, y=syr1.est, color=var7)) + geom_line(aes(group=var7, linetype=var7), size=1) + geom_errorbar(aes(ymin=syr1.lo, ymax=syr1.hi, group=var7, width=0.1))+ geom_point(size=1.3, shape=19) + scale_color_manual(values=c("Non-Trump Supporters"="grey40", "Trump Supporters"="black"))  + ylim(0,1) + theme_gdocs() + guides(fill=FALSE) + theme(legend.title=element_blank(), legend.text=element_text(size=10), legend.position="bottom", plot.title = element_text(size=14, hjust=0), axis.text.x = element_text(size=10), axis.text.y=element_text(size=8), axis.line = element_blank(), panel.background = element_blank(), panel.grid.major.x=element_blank()) + labs(title="Probability of Opposing Syrian Refugees",  x = "\n ANES GOP Primary Voters", y="\n Marginal Effects")  + scale_x_discrete(limits=1:7, labels = c("1 \n Strongly Favor", "2", "3", "4 \n Neither", "5", "6", "7 \n Strongly Oppose"))

#Plot Syria models 2-4 (in appendix)#

ggplot(prob.syria, aes(x=val7, y=syr2.est, color=var7)) + geom_line(aes(group=var7, linetype=var7), size=1) + geom_errorbar(aes(ymin=syr2.lo, ymax=syr2.hi, group=var7, width=0.1))+ geom_point(size=1.3, shape=19) + scale_color_manual(values=c("Non-Trump Supporters"="grey40", "Trump Supporters"="black"))  + ylim(0,1) + theme_gdocs() + guides(fill=FALSE) + theme(legend.title=element_blank(), legend.text=element_text(size=10), legend.position="bottom", plot.title = element_text(size=14, hjust=0), axis.text.x = element_text(size=10), axis.text.y=element_text(size=8), axis.line = element_blank(), panel.background = element_blank(), panel.grid.major.x=element_blank()) + labs(title="Probability of Opposing Syrian Refugees",  x = "\n ANES GOP Primary Voters", y="\n Marginal Effects", subtitle="Model 2")  + scale_x_discrete(limits=1:7, labels = c("1 \n Strongly Favor", "2", "3", "4 \n Neither", "5", "6", "7 \n Strongly Oppose"))

ggplot(prob.syria, aes(x=val7, y=syr3.est, color=var7)) + geom_line(aes(group=var7, linetype=var7), size=1) + geom_errorbar(aes(ymin=syr3.lo, ymax=syr3.hi, group=var7, width=0.1))+ geom_point(size=1.3, shape=19) + scale_color_manual(values=c("Non-Trump Supporters"="grey40", "Trump Supporters"="black"))  + ylim(0,1) + theme_gdocs() + guides(fill=FALSE) + theme(legend.title=element_blank(), legend.text=element_text(size=10), legend.position="bottom", plot.title = element_text(size=14, hjust=0), axis.text.x = element_text(size=10), axis.text.y=element_text(size=8), axis.line = element_blank(), panel.background = element_blank(), panel.grid.major.x=element_blank()) + labs(title="Probability of Opposing Syrian Refugees",  x = "\n ANES GOP Primary Voters", y="\n Marginal Effects", subtitle="Model 3")  + scale_x_discrete(limits=1:7, labels = c("1 \n Strongly Favor", "2", "3", "4 \n Neither", "5", "6", "7 \n Strongly Oppose"))

ggplot(prob.syria, aes(x=val7, y=syr4.est, color=var7)) + geom_line(aes(group=var7, linetype=var7), size=1) + geom_errorbar(aes(ymin=syr4.lo, ymax=syr4.hi, group=var7, width=0.1))+ geom_point(size=1.3, shape=19) + scale_color_manual(values=c("Non-Trump Supporters"="grey40", "Trump Supporters"="black"))  + ylim(0,1) + theme_gdocs() + guides(fill=FALSE) + theme(legend.title=element_blank(), legend.text=element_text(size=10), legend.position="bottom", plot.title = element_text(size=14, hjust=0), axis.text.x = element_text(size=10), axis.text.y=element_text(size=8), axis.line = element_blank(), panel.background = element_blank(), panel.grid.major.x=element_blank()) + labs(title="Probability of Opposing Syrian Refugees",  x = "\n ANES GOP Primary Voters", y="\n Marginal Effects", subtitle="Model 4")  + scale_x_discrete(limits=1:7, labels = c("1 \n Strongly Favor", "2", "3", "4 \n Neither", "5", "6", "7 \n Strongly Oppose"))

###
##3. Trade plots##

#Paper model: marginal effects with low and high confidence bands (from Stata)#
trade1.est <-c(0.112, 0.283, 0.052, 0.339, 0.03, 0.108, 0.074, 0.068, 0.205, 0.045, 0.362, 0.04, 0.157, 0.123)
trade1.lo <-c(0.082, 0.24, 0.033, 0.3, 0.017, 0.082, 0.053, 0.05, 0.167, 0.028, 0.322, 0.023, 0.123, 0.091)
trade1.hi<-c(0.143, 0.326, 0.071, 0.379, 0.044, 0.134, 0.1, 0.09, 0.243, 0.061, 0.402, 0.057, 0.192, 0.155)

##Appendix models:

#Model 2 marginal effects with low and high confidence bands (from Stata)#

trade2.est=c(0.11, 0.278, 0.053, 0.343, 0.031, 0.11, 0.076, 0.069, 0.206, 0.045, 0.363, 0.04, 0.156, 0.121)
trade2.lo=c(0.08, 0.234, 0.034, 0.303, 0.018, 0.083, 0.053, 0.048, 0.167, 0.029, 0.323, 0.023, 0.122, 0.089)
trade2.hi=c(0.14, 0.321, 0.072, 0.382, 0.044, 0.137, 0.098, 0.09, 0.244, 0.062, 0.404, 0.057, 0.19, 0.153)

#Model 3 marginal effects with low and high confidence bands (from Stata)#

trade3.est=c(0.109, 0.277, 0.053, 0.344, 0.031, 0.11, 0.076, 0.068, 0.206, 0.046, 0.365, 0.041, 0.155, 0.121)
trade3.lo=c(0.079, 0.233, 0.034, 0.304, 0.018, 0.083, 0.054, 0.047, 0.167, 0.029, 0.324, 0.023, 0.12, 0.09)
trade3.hi=c(0.139, 0.32, 0.072, 0.384, 0.045, 0.136, 0.099, 0.089, 0.243, 0.062, 0.405, 0.058, 0.189, 0.153)

#Model 4 marginal effects with low and high confidence bands (from Stata)#

trade4.est=c(0.108, 0.272, 0.053, 0.347, 0.031, 0.111, 0.077, 0.069, 0.205, 0.046, 0.366, 0.04, 0.154, 0.12)
trade4.lo=c(0.078, 0.229, 0.034, 0.306, 0.018, 0.084, 0.055, 0.048, 0.166, 0.029, 0.325, 0.024, 0.12, 0.088)
trade4.hi=c(0.138, 0.316, 0.072, 0.387, 0.045, 0.138, 0.1, 0.09, 0.243, 0.063, 0.407, 0.058, 0.189, 0.152)

#Combine all into data frame (this is a 7 response DV)#
prob.trade<-data.frame(var7, val7, response7, trade1.est, trade1.lo, trade1.hi, trade2.est, trade2.lo, trade2.hi, trade2.est, trade2.lo, trade2.hi, trade2.est, trade2.lo, trade2.hi)

#Plot trade model 1 (in paper)#

ggplot(prob.trade, aes(x=val7, y=trade1.est, color=var7)) + geom_line(aes(group=var7, linetype=var7), size=1) + geom_errorbar(aes(ymin=trade1.lo, ymax=trade1.hi, group=var7, width=0.1))+ geom_point(size=1.3, shape=19) + scale_color_manual(values=c("Non-Trump Supporters"="grey40", "Trump Supporters"="black"))  + ylim(0,1) + theme_gdocs() + guides(fill=FALSE) + theme(legend.title=element_blank(), legend.text=element_text(size=10), legend.position="bottom", plot.title = element_text(size=14, hjust=0), axis.text.x = element_text(size=10), axis.text.y=element_text(size=8), axis.line = element_blank(), panel.background = element_blank(), panel.grid.major.x=element_blank()) + labs(title="Probability of Opposing Free Trade Agreements",  x = "\n ANES GOP Primary Voters", y="\n Marginal Effects")  + scale_x_discrete(limits=1:7, labels = c("1 \n Strongly Agree", "2", "3", "4 \n Neither", "5", "6", "7 \n Strongly Disagree"))

#Plot trade models 2-4 (in appendix)#

ggplot(prob.trade, aes(x=val7, y=trade2.est, color=var7)) + geom_line(aes(group=var7, linetype=var7), size=1) + geom_errorbar(aes(ymin=trade2.lo, ymax=trade2.hi, group=var7, width=0.1))+ geom_point(size=1.3, shape=19) + scale_color_manual(values=c("Non-Trump Supporters"="grey40", "Trump Supporters"="black"))  + ylim(0,1) + theme_gdocs() + guides(fill=FALSE) + theme(legend.title=element_blank(), legend.text=element_text(size=10), legend.position="bottom", plot.title = element_text(size=14, hjust=0), axis.text.x = element_text(size=10), axis.text.y=element_text(size=8), axis.line = element_blank(), panel.background = element_blank(), panel.grid.major.x=element_blank()) + labs(title="Probability of Opposing Free Trade Agreements",  x = "\n ANES GOP Primary Voters", y="\n Marginal Effects", subtitle="Model 2")  + scale_x_discrete(limits=1:7, labels = c("1 \n Strongly Favor", "2", "3", "4 \n Neither", "5", "6", "7 \n Strongly Oppose"))

ggplot(prob.trade, aes(x=val7, y=trade3.est, color=var7)) + geom_line(aes(group=var7, linetype=var7), size=1) + geom_errorbar(aes(ymin=trade3.lo, ymax=trade3.hi, group=var7, width=0.1))+ geom_point(size=1.3, shape=19) + scale_color_manual(values=c("Non-Trump Supporters"="grey40", "Trump Supporters"="black"))  + ylim(0,1) + theme_gdocs() + guides(fill=FALSE) + theme(legend.title=element_blank(), legend.text=element_text(size=10), legend.position="bottom", plot.title = element_text(size=14, hjust=0), axis.text.x = element_text(size=10), axis.text.y=element_text(size=8), axis.line = element_blank(), panel.background = element_blank(), panel.grid.major.x=element_blank()) + labs(title="Probability of Opposing Free Trade Agreements",  x = "\n ANES GOP Primary Voters", y="\n Marginal Effects", subtitle="Model 3")  + scale_x_discrete(limits=1:7, labels = c("1 \n Strongly Agree", "2", "3", "4 \n Neither", "5", "6", "7 \n Strongly Disagree"))

ggplot(prob.trade, aes(x=val7, y=trade4.est, color=var7)) + geom_line(aes(group=var7, linetype=var7), size=1) + geom_errorbar(aes(ymin=trade4.lo, ymax=trade4.hi, group=var7, width=0.1))+ geom_point(size=1.3, shape=19) + scale_color_manual(values=c("Non-Trump Supporters"="grey40", "Trump Supporters"="black"))  + ylim(0,1) + theme_gdocs() + guides(fill=FALSE) + theme(legend.title=element_blank(), legend.text=element_text(size=10), legend.position="bottom", plot.title = element_text(size=14, hjust=0), axis.text.x = element_text(size=10), axis.text.y=element_text(size=8), axis.line = element_blank(), panel.background = element_blank(), panel.grid.major.x=element_blank()) + labs(title="Probability of Opposing Free Trade Agreements",  x = "\n ANES GOP Primary Voters", y="\n Marginal Effects", subtitle="Model 4")  + scale_x_discrete(limits=1:7, labels = c("1 \n Strongly Agree", "2", "3", "4 \n Neither", "5", "6", "7 \n Strongly Disagree"))

###
#B. Bar plots (appendix)
###

#Candidate order: Cruz, Kasich, Rubio, Trump
#Groups and response values for DVs with 2-point scales#

nominees2=c(rep("Cruz", 2), rep("Kasich", 2), rep("Rubio", 2), rep("Trump", 2)) 
response2=c("Disagree", "Agree")

#Groups and response values for DVs with 7-point scales#
nominees7=c(rep("Cruz", 7), rep("Kasich", 7), rep("Rubio", 7), rep("Trump", 7)) 
response7=c("Favor a great deal", "Favor moderately", "Favor a little", "Neither", "Oppose a little","Oppose moderately", "Oppose a great deal")
response7.n=as.factor(rep(1:7, 4))
response2.n=as.factor(rep(1:2, 4))

##1. Isolationism Bar Plots##

#Proportions (from Stata cross tabs)#

isolatepr=c(85.7, 14.3, 80.4, 19.6, 77.4, 22.6, 68.2, 31.8))

#Combine into data frame for 2-response DV#

isolateprdta=data.frame(nominees2, isolatepr, response2, response2.n)

#Bar Plot of isolationism attitudes by primary candidate support#

ggplot(data=isolateprdta, aes(x=response2.n,y=isolatepr)) +
  geom_bar(stat="identity")+ scale_y_continuous(limits=c(0,100))+   facet_wrap(~nominees2, ncol=2) + theme_gdocs() + guides(fill=FALSE) + theme(plot.title = element_text(size=14, hjust=0), axis.text.x = element_text(size=10), axis.text.y=element_text(size=8), axis.line = element_blank(),panel.background = element_blank(), panel.grid.major.x=element_blank()) + labs(title="Opinion on Whether the US Stay at Home", subtitle="ANES GOP Primary Voters",  x = (""), y="Proportion")+ scale_x_discrete(breaks=c(1, 2), labels=response2)

###
##2. Syria Bar Plots##

#Proportions (from Stata cross tabs)#

syriapr=c(1.9, 1.9, 3.1, 18.8, 1.9, 17.5, 55, 7, 14, 3.5, 34.2, 7, 11.4, 22.8, 3.5, 2.4, 3.5,18.8, 4.7,21.2,45.9, 0.5, 1.8, 0, 11.4, 1.4, 15.9, 69.1)

#Combine into data frame for 7-response DV#

syriaprdta=data.frame(nominees7, syriapr, response7, response7.n)

#Bar plot of attitudes on Syria refugees by primary candidate support#

ggplot(data=syriaprdta, aes(x=response7.n,y=syriapr))+ geom_bar(stat="identity") + scale_y_continuous(limits=c(0,100)) +   facet_wrap(~nominees7, ncol=2) + theme_gdocs() + guides(fill=FALSE) + theme(plot.title = element_text(size=14, hjust=0), axis.text.y=element_text(size=8), axis.text.x=element_text(size=10), axis.line = element_blank(),panel.background = element_blank(), panel.grid.major.x=element_blank()) + labs(title="Opinion on Allowing Syrian Refugees", subtitle="ANES GOP Primary Voters",  x = "Strongly Favor (1) - Strongly Oppose (7)", y="Proportion") + scale_x_discrete(breaks=1:7, labels=1:7)

###
##3. Trade bar plots##

#Proportions (from Stata cross tabs)#

tradepr=c(12.3, 20.3, 6.5, 34.8, 2.2, 15.2, 8.7, 13.6, 33, 6.8, 31.1, 4.9, 5.8, 4.9, 7.5, 27.5, 2.5, 45, 0, 10, 7.5, 8.3, 18.8, 2.2, 36.3, 3.5, 17.2, 13.7)

#Combine into dataframe for 7-response DV#

tradeprdta=data.frame(nominees7, tradepr, response7, response7.n)

#Bar plot of trade attitudes by primary candidate support#

ggplot(data=tradeprdta, aes(x=response7.n, y=tradepr)) + geom_bar(stat="identity") + scale_y_continuous(limits=c(0,100))+   facet_wrap(~nominees7, ncol=2) + theme_gdocs() + guides(fill=FALSE) + theme(plot.title = element_text(size=14, hjust=0), axis.text.x = element_text(size=10), axis.text.y=element_text(size=8), axis.line = element_blank(),panel.background = element_blank(), panel.grid.major.x=element_blank()) + labs(title="Opinion on Free Trade Agreements", subtitle="ANES GOP Primary Voters",  x = "Strongly Favor (1) - Strongly Oppose (7)", y="Proportion")+ scale_x_discrete(breaks=1:7, labels=1:7)


