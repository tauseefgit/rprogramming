setwd("C:/Users/TAUSEEF/Desktop/DSP_R/Titanic_Data")
library(data.table)
library(plyr)
library(stringr)
library(rpart)
#install.packages("rpart.plot")
library(rpart.plot)
data2<-read.csv("train.csv")

dtree = rpart(Survived~Sex+Age+Fare+Embarked, data=data2, method = "class")
prp(dtree)
?prp
pred = predict(dtree, data=data2, type="prob")
pred



data(iris)
head(iris)
dtree = rpart(Species~., data=iris, method = "class")
prp(dtree)
pred = predict(dtree, data=iris, type="class")
table(iris$Species, pred)
error = 6/nrow(iris)
error
accuracy=1-error
accuracy
