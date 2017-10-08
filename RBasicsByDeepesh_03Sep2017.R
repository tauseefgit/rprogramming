setwd("C:/Users/TAUSEEF/Desktop/DSP_R")
data1<-read.csv("wine.csv")

head(data1)
dim(data1)
str(data1)
summary(data1)

linreg=lm(Price~Year+WinterRain+AGST+HarvestRain+Age+FrancePop, data=data1)

linereg1=lm(Price~.,data=data1)  #To build a model with all variables
#Age has a NA becoz it has a perfect correlation
#With year i.e r=1
#lets exclude Year and include only Age as this makes more sense
linereg2=lm(Price~.-Year,data=data1) #Removing Year...included Age alone

summary(linreg) #To see the results of the model
summary(linereg1)

summary(linereg2)
#now again, contrary to our logic
#It concludes that Age variable is not important. this is shown b very high P Values
#Why is this happening?

cor(data1)
#due to FrancePop and Age being hihly correlated
#so we will exclude FrancePop from the Model

linereg3= lm(Price~.-Year-FrancePop,data=data1)
summary(linereg3)

pred=predict(linereg3, data=data1)
actual=data1$Price

SSE = sum((actual - pred)^2)
SSE

meanOfPrice= mean(data1$Price)
meanOfPrice


TSS = sum((data1$Price - meanOfPrice)^2)
TSS

rSquare = (1 -(SSE/TSS))
rSquare



RMSE = sqrt(SSE/length(data1$Price))
RMSE

MAPE= sum(abs(actual - pred)/actual)/length(data1$Price)
MAPE

data2<-read.csv("wine_test.csv")

pred=predict(linereg3, newdata=data2)
pred
actual=data2$Price
actual-pred

linereg3$coefficients #The co-efficients which form the equation
linereg3$residuals #Errors on train data
linereg3$fitted.values #Predicted values on train data
plot(linereg3)

