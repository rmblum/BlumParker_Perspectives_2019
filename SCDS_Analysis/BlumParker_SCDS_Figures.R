##################################
#Rachel Blum and Christoper Parker#
#Figures from 2016 SCDS#
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

#Groups and response values for DVs with 5-point scales#

var5 = as.factor(c(rep("Non-Trump Supporters",5), rep("Trump Supporters", 5)))

val5 = rep(1:5,2)

#Groups and response values for DVs with 7 point scales#

var7 = as.factor(c(rep("Non-Trump Supporters",7), rep("Trump Supporters", 7)))

val7 = rep(1:7,2)

###
##1. Isolationism plots##

##Paper model: marginal effects with low and high confidence bands (from Stata)#

iso1.est=c(0.362, 0.314, 0.096, 0.185, 0.044, 0.258, 0.303, 0.114, 0.256, 0.069)
iso1.lo=c(0.339, 0.294, 0.084, 0.167, 0.035, 0.219, 0.281, 0.098, 0.221, 0.052)
iso1.hi=c(0.384, 0.334, 0.109, 0.202, 0.052, 0.297, 0.325, 0.129, 0.29, 0.086)

#Appendix model: marginal effects with low and high confidence bands (from Stata)#

iso2.est=c(0.360, 0.315, 0.1, 0.185, 0.043, 0.262, 0.306, 0.114, 0.252, 0.067)
iso2.lo=c(0.338, 0.295, 0.084, 0.168, 0.035, 0.223, 0.284, 0.098, 0.218, 0.05)
iso2.hi=c(0.383, 0.336, 0.109, 0.202, 0.052, 0.302, 0.328, 0.129, 0.286, 0.083)

#Combine all into data frame (this is a 5 response DV)#

prob.iso<-data.frame(var5, val5, iso1.est, iso1.lo, iso1.hi, iso2.est, iso2.lo, iso2.hi)

#Plot Isolationism Model 1 (in paper)#

ggplot(prob.iso, aes(x=val5, y=iso1.est, color=var5)) + geom_line(aes(group=var5, linetype=var5), size=1) + geom_errorbar(aes(ymin=iso1.lo, ymax=iso1.hi, group=var5, width=0.1))+ geom_point(size=1.3, shape=19) + scale_color_manual(values=c("Non-Trump Supporters"="grey40", "Trump Supporters"="black"))  + ylim(0,1) + theme_gdocs() + guides(fill=FALSE) + theme(legend.title=element_blank(), legend.text=element_text(size=10), legend.position="bottom", plot.title = element_text(size=14, hjust=0), axis.text.x = element_text(size=10), axis.text.y=element_text(size=8), axis.line = element_blank(), panel.background = element_blank(), panel.grid.major.x=element_blank()) + labs(title="Probability of Agreeing the U.S. Should Stay at Home",  x = "\n GOP State Delegates", y="\n Marginal Effects")  + scale_x_discrete(limits=1:7, labels = c("1 \n Strongly Disagree", "2", "3 \n Neither", "4", "5 \n Strongly Agree"))

#Plot Isolationism Model 2 (in appendix)#

ggplot(prob.iso, aes(x=val5, y=iso2.est, color=var5)) + geom_line(aes(group=var5, linetype=var5), size=1) + geom_errorbar(aes(ymin=iso2.lo, ymax=iso2.hi, group=var5, width=0.1))+ geom_point(size=1.3, shape=19) + scale_color_manual(values=c("Non-Trump Supporters"="grey40", "Trump Supporters"="black"))  + ylim(0,1) + theme_gdocs() + guides(fill=FALSE) + theme(legend.title=element_blank(), legend.text=element_text(size=10), legend.position="bottom", plot.title = element_text(size=14, hjust=0), axis.text.x = element_text(size=10), axis.text.y=element_text(size=8), axis.line = element_blank(), panel.background = element_blank(), panel.grid.major.x=element_blank()) + labs(title="Probability of Agreeing the U.S. Should Stay at Home",  x = "\n GOP State Delegates", y="\n Marginal Effects", subtitle="Model 2")  + scale_x_discrete(limits=1:7, labels = c("1 \n Strongly Disagree", "2", "3 \n Neither", "4", "5 \n Strongly Agree"))

###
##2. Immigration plots##

#Paper model: marginal effects with low and high confidence bands (from Stata)#

imm1.est=c(0.07, 0.171, 0.139, 0.381, 0.24,
 0.021, 0.061, 0.065, 0.325, 0.529)
imm1.lo=c(0.059, 0.154, 0.122, 0.357, 0.22, 0.015, 0.047, 0.051, 0.292, 0.474)
imm1.hi=c(0.081, 0.189, 0.155, 0.404, 0.26, 0.026, 0.075, 0.078, 0.357, 0.584)

#Appendix model: marginal effects with low and high confidence bands (from Stata)#

imm2.est=c(0.062, 0.171, 0.144, 0.39, 0.233, 0.02, 0.065, 0.071, 0.347, 0.496)
imm2.lo=c(0.052, 0.153, 0.126, 0.368, 0.213, 0.014, 0.051, 0.057, 0.315, 0.441)
imm2.hi=c(0.072, 0.189, 0.161, 0.415, 0.253, 0.025, 0.08, 0.086, 0.38, 0.552)

#Combine all into data frame (this is a 5 response DV)#

prob.imm<-data.frame(var5, val5, imm1.est, imm1.lo, imm1.hi, imm2.est, imm2.lo, imm2.hi)

#Plot immigration model 1 (in paper)#

ggplot(prob.imm, aes(x=val5, y=imm1.est, color=var5)) + geom_line(aes(group=var5, linetype=var5), size=1) + geom_errorbar(aes(ymin=imm1.lo, ymax=imm1.hi, group=var5, width=0.1))+ geom_point(size=1.3, shape=19) + scale_color_manual(values=c("Non-Trump Supporters"="grey40", "Trump Supporters"="black"))  + ylim(0,1) + theme_gdocs() + guides(fill=FALSE) + theme(legend.title=element_blank(), legend.text=element_text(size=10), legend.position="bottom", plot.title = element_text(size=14, hjust=0), axis.text.x = element_text(size=10), axis.text.y=element_text(size=8), axis.line = element_blank(), panel.background = element_blank(), panel.grid.major.x=element_blank()) + labs(title="Probability of Agreeing U.S. Should Bar Immigrants from Muslim Countries",  x = "\n GOP State Delegates", y="\n Marginal Effects")  + scale_x_discrete(limits=1:5, labels = c("1 \n Strongly Disagree", "2", "3 \n Neither", "4", "5 \n Strongly Agree"))

#Plot immigration model 2 (in appendix)#

ggplot(prob.imm, aes(x=val5, y=imm2.est, color=var5)) + geom_line(aes(group=var5, linetype=var5), size=1) + geom_errorbar(aes(ymin=imm2.lo, ymax=imm2.hi, group=var5, width=0.1))+ geom_point(size=1.3, shape=19) + scale_color_manual(values=c("Non-Trump Supporters"="grey40", "Trump Supporters"="black"))  + ylim(0,1) + theme_gdocs() + guides(fill=FALSE) + theme(legend.title=element_blank(), legend.text=element_text(size=10), legend.position="bottom", plot.title = element_text(size=14, hjust=0), axis.text.x = element_text(size=10), axis.text.y=element_text(size=8), axis.line = element_blank(), panel.background = element_blank(), panel.grid.major.x=element_blank()) + labs(title="Probability of Agreeing U.S. Should Bar Immigrants from Muslim Countries",  x = "\n GOP State Delegates", y="\n Marginal Effects", subtitle="Model 2")  + scale_x_discrete(limits=1:5, labels = c("1 \n Strongly Disagree", "2", "3 \n Neither", "4", "5 \n Strongly Agree"))

####
##3. Trade plots##

#Model 1 marginal effects with low and high confidence bands (from Stata)#

trade1.est=c(0.14, 0.21, 0.166, 0.146, 0.146, 0.13, 0.062, 
0.065, 0.121, 0.125, 0.142, 0.188, 0.224, 0.135)
trade1.lo=c(0.123, 0.19, 0.148, 0.129, 0.13, 0.114, 0.052, 0.05, 0.099, 0.106, 0.125, 0.167, 0.192, 0.107)
trade1.hi=c(0.157, 0.23, 0.184, 0.163, 0.163, 0.145, 0.072, 0.079, 0.143, 0.144, 0.16, 0.209, 0.256, 0.164)

#Model 2 marginal effects with low and high confidence bands (from Stata)#

trade2.est=c(0.138, 0.211, 0.167, 0.148, 0.147, 0.128, 0.061, 0.065, 0.125, 0.129, 0.146, 0.189, 0.218, 0.129)
trade2.lo=c(0.121, 0.191, 0.149, 0.131, 0.13, 0.113, 0.051, 0.05, 0.102, 0.109, 0.128, 0.167, 0.186, 0.102)
trade2.hi=c(0.154, 0.231, 0.186, 0.165, 0.164, 0.143, 0.072, 0.08, 0.147, 0.148, 0.164, 0.21, 0.25, 0.157)

#Combine all into data frame (this is a 7 response DV)#

prob.trade<-data.frame(var7, val7, trade1.est, trade1.lo, trade1.hi, trade2.est, trade2.lo, trade2.hi)

#Plot trade model 1 (in paper)#

ggplot(prob.trade, aes(x=val7, y=trade1.est, color=var7)) + geom_line(aes(group=var7, linetype=var7), size=1) + geom_errorbar(aes(ymin=trade1.lo, ymax=trade1.hi, group=var7, width=0.1))+ geom_point(size=1.3, shape=19) + scale_color_manual(values=c("Non-Trump Supporters"="grey40", "Trump Supporters"="black"))  + ylim(0,1) + theme_gdocs() + guides(fill=FALSE) + theme(legend.title=element_blank(), legend.text=element_text(size=10), legend.position="bottom", plot.title = element_text(size=14, hjust=0), axis.text.x = element_text(size=10), axis.text.y=element_text(size=8), axis.line = element_blank(), panel.background = element_blank(), panel.grid.major.x=element_blank()) + labs(title="Probability of Opposing Free Trade Agreements",  x = "\n GOP State Delegates", y="\n Marginal Effects")  + scale_x_discrete(limits=1:7, labels = c("1 \n Strongly Favor", "2", "3", "4 \n Neither", "5", "6", "7 \n Strongly Oppose"))

#Plot trade model 2 (in appendix)#

ggplot(prob.trade, aes(x=val7, y=trade2.est, color=var7)) + geom_line(aes(group=var7, linetype=var7), size=1) + geom_errorbar(aes(ymin=trade2.lo, ymax=trade2.hi, group=var7, width=0.1))+ geom_point(size=1.3, shape=19) + scale_color_manual(values=c("Non-Trump Supporters"="grey40", "Trump Supporters"="black"))  + ylim(0,1) + theme_gdocs() + guides(fill=FALSE) + theme(legend.title=element_blank(), legend.text=element_text(size=10), legend.position="bottom", plot.title = element_text(size=14, hjust=0), axis.text.x = element_text(size=10), axis.text.y=element_text(size=8), axis.line = element_blank(), panel.background = element_blank(), panel.grid.major.x=element_blank()) + labs(title="Probability of Opposing Free Trade Agreements",  x = "\n GOP State Delegates", y="\n Marginal Effects", subtitle="Model 2")  + scale_x_discrete(limits=1:7, labels = c("1 \n Strongly Favor", "2", "3", "4 \n Neither", "5", "6", "7 \n Strongly Oppose"))

###
#B. Bar plots (appendix)
###

#Groups and response values for DVs with 5-point scales#

nominees5=c(rep("Cruz", 5), rep("Kasich", 5), rep("Rubio", 5), rep("Trump", 5)) 
response5.n=as.factor(rep(1:5,4))

#Groups and response values for DVs with 7-point scales#

nominees7=c(rep("Cruz", 7), rep("Kasich", 7), rep("Rubio", 7), rep("Trump", 7)) 
response7.n=as.factor(rep(1:7,4))


##1. Isolationism Bar Plots##

#Proportions (from Stata cross tabs)#

isopr=as.numeric(c(33.9, 30.9, 11.2, 21.4, 2.7, 49.6, 30.2, 8.5, 8.5, 3.3, 41, 34.6, 10.1, 13.8, 0.5, 28, 29, 10.7, 25.2, 7.1))

#Combine into data frame for 5-response DV#

isoprdta=data.frame(nominees5, isopr, response5.n)

#Bar Plot of isolationism attitudes by primary candidate support#

ggplot(data=isoprdta, aes(x=response5.n,y=isopr))+ geom_bar(stat="identity") + scale_y_continuous(limits=c(0,100)) +   facet_wrap(~nominees5, ncol=2) + theme_gdocs() + guides(fill=FALSE) + theme(plot.title = element_text(size=14, hjust=0), axis.text.y=element_text(size=8), axis.text.x=element_text(size=10), axis.line = element_blank(),panel.background = element_blank(), panel.grid.major.x=element_blank()) + labs(title="Opinion on Whether the US Stay at Home", subtitle="GOP State Delegates",  x = "Strongly Disagree (1) - Strongly Agree (5)", y="Proportion") + scale_x_discrete(breaks=1:5, labels=1:5)

###
##2. Immigration Bar Plots##

#Proportions (from Stata cross tabs)#

immpr=c(4.4, 11.8, 11.3, 36.1, 36.4, 23.2, 32.7, 17.3, 21,5.9, 14.4, 25, 11.2, 36.2, 13.3, 4.3, 5.3, 5.5, 27.7, 57.2)

#Combine into data frame for 5-response DV#

immprdta=data.frame(nominees5, immpr, response5.n)

#Bar plot of immigration attitudes by primary candidate support#

ggplot(data=immprdta, aes(x=response5.n,y=immpr))+ geom_bar(stat="identity") + scale_y_continuous(limits=c(0,100)) +   facet_wrap(~nominees5, ncol=2) + theme_gdocs() + guides(fill=FALSE) + theme(plot.title = element_text(size=14, hjust=0), axis.text.y=element_text(size=8), axis.text.x=element_text(size=10), axis.line = element_blank(),panel.background = element_blank(), panel.grid.major.x=element_blank()) + labs(title="Opinion on Whether the US Should Bar Immigrants from Muslim Countries", subtitle="GOP State Delegates",  x = "Strongly Disagree (1) - Strongly Agree (5)", y="Proportion") + scale_x_discrete(breaks=1:5, labels=1:5)

###
##3. Trade bar plots##

#Proportions (from Stata cross tabs)#

tradepr=c(12.4, 20.4, 13.9, 14.9, 16.5, 15.1, 6.9, 16.2, 23.7, 26.8, 14.5, 11, 6.1, 1.8, 18.7, 22.6, 21.9, 12.3, 14.8, 6.5, 3.2, 6.7, 14.1, 10.3, 9.7, 16.6, 22.5, 17.2)

#Combine into dataframe for 7-response DV#

tradeprdta=data.frame(tradepr, nominees7, response7.n)

#Bar plot of trade attitudes by primary candidate support#

ggplot(data=tradeprdta, aes(x=response7.n,y=tradepr))+ geom_bar(stat="identity") + scale_y_continuous(limits=c(0,100)) +   facet_wrap(~nominees7, ncol=2) + theme_gdocs() + guides(fill=FALSE) + theme(plot.title = element_text(size=14, hjust=0), axis.text.y=element_text(size=10), axis.text.x=element_text(size=12), axis.line = element_blank(),panel.background = element_blank(), panel.grid.major.x=element_blank()) + labs(title="Opinion on Free Trade Agreements", subtitle="GOP State Delegates",  y = "Proportion", x="Strongly Favor (1) - Strongly Oppose (7)") + scale_x_discrete(breaks=1:7, labels=1:7)
###




 