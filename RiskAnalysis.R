class(risk)
class(risk$subid)

risk$subid <- factor(risk$subid)
class(risk$subid)
unique(risk$subid)
#Frequency Distribution
mytable<-table(risk$subid)
mytable

#Proportion
prop.table(mytable)


risk$gender<-factor(risk$gender, level = c(0,1), labels=c("female","male"))
risk$gender
class(risk$gender)

#Frequency Distribution
gendertable<-table(risk$gender)
gendertable
#Proportion
prop.table(gendertable)

risk$wvcat
class(risk$wvcat)
risk$wvcat<-factor(risk$wvcat, level = c(0,1,2,3))
risk$wvcat

mean(risk$risk,na.rm=TRUE)
median(risk$risk, na.rm=TRUE)

mean(risk$age) #Without using na.rm=TRUE, it wll return mean as NA
mean(risk$age,na.rm=TRUE)

#find mode
max(table(risk$risk))

#variance
var(risk$risk, na.rm=TRUE)
sd(risk$risk, na.rm=TRUE)

summary(risk)

install.packages("psych")
library(psych)
describe(risk) #download psych package

install.packages("dplyr")
library(dplyr)

?summarise


by.fn <- group_by(flight_times, origin)
by.fn


my.table <- table(flight_times$carrier)
barplot(my.table)

hist(flight_times$dep_delay)

boxplot(flight_times$dep_delay)
boxplot(risk$risk)
?boxplot
