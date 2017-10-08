setwd("C:/Users/TAUSEEF/Desktop/DSP_R/Titanic_Data")
library(data.table)
library(plyr)
library(stringr)
#data2 <- fread("train.csv", na.strings = c(""," ",NA,"NA"))
data2<-read.csv("train.csv")
dim(data2)
table(data2$Survived)
prop.table(table(data2$Survived))

table(data2$Survived,data2$Sex)

prop.table(table(data2$Survived,data2$Sex),1)
prop.table(table(data2$Survived,data2$Sex),2)



summary(data2)
colSums(is.na(data2))
table(data2$Embarked)
which(data2$Embarked=='')
data2$Embarked[data2$Embarked==''] <- 'S'

hist(data2$Age, breaks = 50)
median(data2$Age, na.rm=T)
which(data2$Embarked=='')
data2$Age[is.na(data2$Age)] <- median(data2$Age, na.rm=T)
colSums(is.na(data2))


logreg = glm ( Survived ~ Age + Fare + Sex + Embarked, data=data2, family="binomial")
summary(logreg)

pred = predict(logreg, data=data2, type = "response")

table1<-table(data2$Survived, pred)
table1

accuracy = (460+236)/(460+89+106+236)
accuracy
sensitivity = 236/(106+236)
sensitivity
specificity = 460/(460+89)
specificity
precision = 236/(89+236)
precision


logreg = glm ( Survived ~ Age + Sex + Embarked, data=data2, family="binomial")
summary(logreg)

library(ROCR)
ROCR = prediction(pred, data2$Survived)
ROC_curve=performance(ROCR, "tpr", "fpr")
plot(ROC_curve, colorize=T)

install.packages("pROC")
library(pROC)
pred = ifelse(pred > 0.5,1,0)
AUC=auc(data2$Survived, pred)
AUC
