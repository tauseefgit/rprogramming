#Vectors (One dimension)

x=c(1,2,3)
x
x[2]
length(x)
x[4]
x=c(1,2,"BLR")
x[1]


#All the 3 syntax return 1 to 10
x=1:10
x
x=c(1:10)
x
x=seq(1,10)
x

x=seq(1,10,2)
x
x=seq(10,1,-2)
x
x=seq(10,1,3)


#Matrix (Two dimension)
x=matrix(1:10,nrow=5) #Column is based on the number of elements divided by number of rows
x
x=matrix(1:10,nrow=5, byrow = T)
x
x=matrix(1:10, nrow=5, ncol=3, byrow = F)
x

#Accessing two dimension x[row#, col#]
#Both the below syntax return the same result
x[,1] 
x[1:5, 1]

x[c(2,3,4),2] #Row 2,3,4 and Column 2



#Data Frame 
country=c("Ind","SL")
gdp=c(7,8)
class(country)
class(gdp)
df=data.frame(country,gdp)
df
class(df)

#Accessing data frame
df$country
df$gdp

df[,1]
df[,2]

df[1,]
df[2,]

#------------------------------
pop=c(1.3,0.01)
govt=c("D","D")
new2=data.frame(pop, govt)
df_new=data.frame(df,new2)
df_new
df_new2=cbind(df,new2) #rbind row binding
df_new2
df_new2$test=c(1,2)
df_new2


#Number of rows 
nrow(df_new2)
#Number of cols
ncol(df_new2)
#Dimension
dim(df_new2)
dim(df_new2)[1] #Accessing only the row count
dim(df_new2)[2] #Accessing only the column count


#Calculating average
mean(df_new2$country)

#Summary
summary(df_new2)
class(summary(df_new2))
summary(df_new2)[2,2]

#Median - 50th percentile

#1st Quantile/Quartile - 25th percentile
#3rd Quantile/Quartile - 75th percentile


#Mean is not the right representation of population
#3+5+11+20+80

#Histogram
hist(new2$pop, col="red", main="Histogram of gdp", xlab="GDP")
iris
hist(iris$Sepal.Length)
hist(iris$Sepal.Length,breaks = 30) 
#number of bars is breaks-1
hist(iris$Sepal.Length,breaks = 50)
str(iris)     


#box plot or box & Whisker plot


#outlayers - exceptions/less frequency

#IQR - Inter Quantile Range = Difference between 1st Quantile and 3rd Quantile

# 3rd Quantile + 1.5 IQR
# 1st Quantile - 1.5 IQR

boxplot(iris$Sepal.Width)
x=c(20,50,110,330,500)
x>110 #Initial Approach
x[x>110] #condition inside index to filter out values less than 110

x[(x>200)|(x<50)] # two conditions with OR condition
x[(x<200)&(x>50)] # two conditions with AND conditons

iris
iris[iris$Species=="versicolor" & iris$Sepal.Width>3,] # applying filters on a dataframe
nrow(iris[iris$Species=="versicolor" & iris$Sepal.Width>3,]) # df(cond1&cond2|cond3, columns we want)
iris[iris$Species=="versicolor" & iris$Sepal.Width>3, c(2,4)] # Selective columns 
iris[iris$Species=="versicolor" & iris$Sepal.Width>3, c("Species","Sepal.Width")] # same selection as above using column name


x=c(1,11,31)
mean(x)
x=c(1,11,31,NA)
mean(x)
