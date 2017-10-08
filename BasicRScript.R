#Set Working Directory
setwd("C:/Users/TAUSEEF/Desktop/DSP_R")

#Get Working Directory
getwd()

#Read wbdata.csv and assign it to data object
data<-read.csv("wbdata.csv")

#View the data object using 'View' function
View(data)

#Another way to view the wbdata.csv directly
View(read.csv("wbdata.csv"))

dim(data)

class(data)



#Vector
fruits<-c("orange","apple","grapes","mango")
c(fruits)

age<-c(35, 40, 22, 18)
c(age)
class(age)
length(age)

ageaschar<-c("38","44","22","18")
c(ageaschar)
class(ageaschar)
length(ageaschar)

agewithmixofnumandchar<-c(35, 40, 22,"22","18")
c(agewithmixofnumandchar)
class(agewithmixofnumandchar)
length(agewithmixofnumandchar)

rm(fruits)
fruits<-c("a","p","b")
length(fruits)
class(fruits)
fruits<-c(fruits,"c","d")
fruits
is.na(fruits)
fruits<-c(fruits,"0", NA)
is.na(fruits)


rm(age)
rm(age1)
age<-c(20,30,40,50,60)
age
mean(age)
age1<-c(age, NA)
age1
mean(age1)
mean(age1, na.rm=TRUE)
mean(age1, na.rm=T)
mean(age1, na.rm=FALSE)
mean(age1, na.rm=F)
age1

age2<-c(20,30,40,50,60,"apple")
#class(age2)
mis<-"apple"
age2[!age2%in%mis]

age2<-as.numeric(age2)
age2
mean(age2, na.rm=T)


?matrix

vectorv1<-c(20,30,40,50,60,70)
x<-matrix(vectorv1, nrow=3)
x
x[2,2]
x[2,]
y<-matrix(vectorv1, nrow=2, ncol=3)
y
z<-matrix(vectorv1)
z

vectorv2<-c(20,30,40,50,60)
x1<-matrix(vectorv2, nrow=3)
x1


x2<-matrix(c(1,2,3,4,5,NA,7,8,9),nrow=3, byrow=T)
x2
#Try to remove NA and display the matrix



x3<-matrix(c(1,2,3,4,5,6,7,8,NA),nrow=6, ncol=6, byrow=T)
y3<-matrix(c(1,2,3,4,5,6,7,8,9),nrow=3, byrow=F)
x4<-matrix(c(1,2,3,4,5,6,7,8,NA),nrow=3, byrow=T)
x3
x3<-na.omit(x3)
y3

z3<-x3*y3
z3

index1 <- seq(from = 1, to = 30)
index1

index2 <- seq(from = 1, length = 30, by = 2.5)
index2

index3 <- seq(from = 5, length = 11)
index3
?seq

index4 <- seq(7, by=3, along=index3) #take the length from previous variable
index4

R1 <- rep (c(7,10,9), times=5)
R1


m1 <- c(1, 2, NaN, NA, 4)
is.na(m1)
is.nan(m1)


gender<-c("males"=20,"females"=50)
gender

frequencies<-c(20,30,40,50,60)
fruits1<-c("orange","apple","grapes","mango")
names(frequencies)<-fruits1
frequencies

#Logical Vector
R2 <-1:10
R2
log <- R2>3
log


#Character vector
labs <-paste(c("X","Y"), 1:10, sep="-")
labs
?paste

#Assignment
max
min
sum
mean
median
range
var
cor(x, y)
sort
rank
order

#select column age and find mean using the data frame
sam<-read.csv("wbdata.csv")
mean(sam$age)
mean(sam[,2])
maximum<-max(sam$age)
maximum
minimum<-min(sam$age)
minimum
sumofages<-sum(sam$age)
sumofages
medianofages<-median(sam$age)
medianofages
rangeofages<-range(sam$age)
rangeofages
varianceofages<-var(sam$age)
varianceofages
sorted<-sort(sam$age)
sorted
ranked<-rank(sam$age)
ranked
ordered<-order(sam$age)
ordered

x5<-matrix(c(1,2,3,4,5,6,7,8,9),nrow=3, ncol=6, byrow=T)
y5<-matrix(c(11,22,33,44,55,66,77,88,99),nrow=3, ncol=6, byrow=T)
correlation<-cor(x5,y5)
correlation


?apply


mat6<-matrix(c(1,2,3,4,5,6,7,8,NA),nrow=6, ncol=6, byrow=T)
mat6[!mat6%in%NA]
mat7<-mat6[-1,]
mat6
mat7


str(data)

