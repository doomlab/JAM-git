library (car); library (mlogit)
library(lme4)
library(nlme)
library(psych)
library(Matrix);library(lattice)
library (memisc)
library(ggplot2)
library(phia); library(rockchalk)
library(rockchalkMultilevel)
options(scipen=999)


data=read.csv("C:/Users/Kayla/OneDrive/projects/JAM/ospan/analysis 9.1.14/exp2.csv", header=TRUE) 

associates<-scale(data$associates, scale = F)
ospan<-scale(data$ospan, scale = F)
ravens<-scale(data$ravens, scale=F)
strict<-scale(data$strict, scale=F)

#####Experiment 2 

###Null Models
null<-gls(scores~1, data=data, method="ML", na.action=na.omit)
nullnest<-lmer(scores~(1|part_no)+(1|word), data=data, REML=FALSE, na.action=na.omit)
summary(null)
summary(nullnest)

###Model with ospan. Significant main effects but no interactions
model<-lmer(scores~ospan*ravens*associates+math+(1|part_no)+(1|word), data=data, REML=FALSE, na.action=na.omit)
summary(model)
confint(model, method="profile", na.action=na.omit)


###Excluding bad math scores
data2<-subset(data, part_no!="p59")

###No bad math score data. Model with ospan. No significant interactions. 
modelsubset<-lmer(scores~ospan*ravens*associates+math+(1|part_no)+(1|word), data=data2, REML=FALSE, na.action=na.omit)
summary(modelsubset)
confint(modelsubset, method="profile", na.action=na.omit)

###No bad math scores. Model with strict ospan. Marginally significant interaction of ospan and ravens. 
##Best model
modelstrict<-lmer(scores~strict*ravens*associates+math+(1|part_no)+(1|word), data=data2, REML=FALSE, na.action=na.omit)
summary(modelstrict)
confint(modelstrict, method="profile", na.action=na.omit)

###All data. Excluding math covariate. No signficant effects. 
modelnomath<-lmer(scores~strict*ravens*associates+(1|part_no)+(1|word), data=data, REML=FALSE, na.action=na.omit)
summary(modelnomath)
###No bad math scores. Excluding math covariate. No significant effects. 
modelnomath<-lmer(scores~strict*ravens*associates+(1|part_no)+(1|word), data=data2, REML=FALSE, na.action=na.omit)
summary(modelnomath)
