install.packages("party")
library("party")
install.packages("rpart")

library("rpart")
# 
# for(i in 1:nrow(mydata))
# {
#   if(mydata$Sepal.Length[1] > 1)
#   {
#     
#   }
# }
View(kyphosis)
fit <- rpart(Kyphosis ~ Age + Number + Start, method="class", data=kyphosis)
printcp(fit)
plotcp(fit)
summary(fit)

plot(fit, uniform = TRUE, main="abc")
text(fit, use.n=TRUE, all=TRUE)
