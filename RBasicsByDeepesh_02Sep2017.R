
sum(pbinom(16:20, 20, 0.5,lower.tail =F))

mtcars

myfirstlm=lm(mpg~ cyl+hp+wt,data=mtcars)
summary(myfirstlm)
