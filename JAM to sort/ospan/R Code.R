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

fsg_3<-scale(data$fsg_3, scale = F)
ospan<-scale(data$ospan, scale = F)
ravens<-scale(data$ravens, scale=F)

null<-gls(answer~1, data=data, method="ML", na.action=na.omit)
nullnested<-lmer(answer~1+(1|part_no)+(1|cue), data=data, REML=FALSE, na.action=na.omit)
summary(null)
summary(nullnested)

model<-lmer(answer~1+fsg_3+ospan+ravens+fsg_3*ospan*ravens+(1|part_no)+(1|cue), data=data, REML=FALSE, na.action=na.omit)
summary(model)
out1 <- summary(model)
coef1 <- coef(out1)
tvalue1 <- coef1[,"t value"]
pnorm(abs(tvalue1), lower.tail=FALSE) * 2
confint(model,method="profile") 

plotSlopes.mlm(model, "ravens", "ospan")

scatter <- ggplot(data, aes(fsg_3, ospan))
scatter + geom_point() + labs(x = "fsg_3", y = "ospan")

#####Experiment 2 
null<-gls(scores~1, data=data, method="ML", na.action=na.omit)
nullnest<-lmer(scores~(1|part_no)+(1|word), data=data, REML=FALSE, na.action=na.omit)
summary(null)
summary(nullnest)
model<-lmer(scores~ospan*ravens*associates+math+(1|part_no)+(1|word), data=data, REML=FALSE, na.action=na.omit)
summary(model)
confint(model, method="profile")

modelstrict<-lmer(scores~strict*ravens*associates+math+(1|part_no)+(1|word), data=data, REML=FALSE, na.action=na.omit)
summary(modelstrict)
confint(modelstrict, method="profile", na.action=na.omit)
