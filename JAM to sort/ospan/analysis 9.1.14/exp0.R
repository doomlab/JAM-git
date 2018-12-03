setwd("C:/Users/Doom-Lab/OneDrive/projects/JAM/ospan/analysis 9.1.14")

ospan_8.31 <- read.csv("C:/Users/Doom-Lab/OneDrive/projects/JAM/ospan/analysis 9.1.14/ospan_8.31.csv")

library("lme4")
library("lmerTest")

attach(ospan_8.31)

fsg_32<-scale(fsg_3, scale = F)
ospan2<-scale(ospan, scale = F)
ravens2<-scale(ravens, scale = F)

fun <-lmer(answer~fsg_32+ospan2+ravens2+fsg_32*ospan2*ravens2+(1|part_no)+(1|cue), REML=FALSE, na.action=na.omit)
summary(fun)

sd(ospan, na.rm = TRUE)
mean(ospan, na.rm = TRUE)

###create low groups by adding a SD
LO = ospan2+sd(ospan, na.rm = TRUE)

##create high groups by subtracting a SD
HI = ospan2-sd(ospan, na.rm = TRUE)

###low groups interaction ospan
fun <-lmer(answer~fsg_32+LO+ravens2+fsg_32*LO*ravens2+(1|part_no)+(1|cue), REML=FALSE, na.action=na.omit)
summary(fun)

###high groups interaction
fun <-lmer(answer~fsg_32+HI+ravens2+fsg_32*HI*ravens2+(1|part_no)+(1|cue), REML=FALSE, na.action=na.omit)
summary(fun)

LOR = ravens2+sd(ravens2,na.rm = TRUE)
HIR = ravens2 - sd(ravens2,na.rm = TRUE)

##low ospan
####low ravens
fun <-lmer(answer~fsg_32+LO+LOR+fsg_32*LO*LOR+(1|part_no)+(1|cue), REML=FALSE, na.action=na.omit)
summary(fun)
###high ravens
fun <-lmer(answer~fsg_32+LO+HIR+fsg_32*LO*HIR+(1|part_no)+(1|cue), REML=FALSE, na.action=na.omit)
summary(fun)

##avg ospan
####low ravens
fun <-lmer(answer~fsg_32+ospan2+LOR+fsg_32*ospan2*LOR+(1|part_no)+(1|cue), REML=FALSE, na.action=na.omit)
summary(fun)
###high ravens
fun <-lmer(answer~fsg_32+ospan2+HIR+fsg_32*ospan2*HIR+(1|part_no)+(1|cue), REML=FALSE, na.action=na.omit)
summary(fun)

##hi ospan
####low ravens
fun <-lmer(answer~fsg_32+HI+LOR+fsg_32*HI*LOR+(1|part_no)+(1|cue), REML=FALSE, na.action=na.omit)
summary(fun)
###high ravens
fun <-lmer(answer~fsg_32+HI+HIR+fsg_32*HI*HIR+(1|part_no)+(1|cue), REML=FALSE, na.action=na.omit)
summary(fun)