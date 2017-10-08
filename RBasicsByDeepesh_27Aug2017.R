x=c(1,5,11,NA,6, NA)
mean(x)
mean(x, na.rm=T)
x[is.na(x)]
x==5


#Which function. It always returns the index of the particular value
which(x==5)
which(is.na(x)) #Get the indexes of NA


x[length(x)] #last element of the vector
max(x)
max(x, na.rm=T)

which(x==max(x, na.rm=T)) #find index which has max value. 
#Use the next function which is much simpler
which.max(x) #find index using which.max function
which.min(x) #find index using which.min function

mtcars
dim(mtcars)
which.max(mtcars$mpg)
row.names(mtcars[which.max(mtcars$mpg),])


mtcars$carname=row.names(mtcars)
mtcars[which.max(mtcars$mpg),"carname"]

is.na(mtcars)
#find the # of missing values in mtcars
sum(is.na(mtcars))
sum(c(T,T))

table(mtcars$cyl)
table(mtcars$gear)


#How many cars have 5 gears and 4 cylinders
nrow(mtcars[mtcars$gear==5 & mtcars$cyl==4,])
sum(mtcars$gear==5 & mtcars$cyl==4)

#Whats the name of the cars
mtcars[mtcars$gear==5 & mtcars$cyl==4, "carname"]
row.names(mtcars[mtcars$gear==5 & mtcars$cyl==4,])
row.names(mtcars[which(mtcars$gear==5 & mtcars$cyl==4),])


#mileage of the car with max hp
mtcars$mpg[which.max(mtcars$hp)]
mtcars[which.max(mtcars$hp),]
mtcars[which.max(mtcars$hp),"mpg"]


hist(mtcars$mpg, breaks=50, col="blue")
boxplot(mtcars$mpg)


plot(mtcars$mpg, mtcars$hp)


#Standard Deviation: Root mean square of deviations from average


#cor
cor(mtcars$mpg, mtcars$hp)

data() #Shows all the data sets available in R
cor(iris) 
cor(iris[,-5]) #Removes the 5th column for the correlation calculation
cor(iris[-5])
cor(iris[,c(1:4)])
cor(iris[,c(1,2,3,4)])



pnorm(90,mean=80,sd=16,lower.tail = FALSE)
pnorm(780,mean=580,sd=sqrt(10000))
pnorm(500,mean=580,sd=sqrt(10000),lower.tail = FALSE)
pnorm(600,mean=580,sd=sqrt(10000)) - pnorm(500,mean=580,sd=sqrt(10000))
pnorm(500,mean=580,sd=sqrt(10000),lower.tail = FALSE)-pnorm(600,mean=580,sd=sqrt(10000),lower.tail = FALSE)


qnorm(0.95,mean=580,sd=sqrt(10000))


#G.S Keller
#Data Mining for Business Intelligence,