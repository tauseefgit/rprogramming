# Variable Name	Description
# Survived	Survived (1) or died (0)
# Pclass	Passenger’s class
# Name	Passenger’s name
# Sex	Passenger’s sex
# Age	Passenger’s age
# SibSp	Number of siblings/spouses aboard
# Parch	Number of parents/children aboard
# Ticket	Ticket number
# Fare	Fare
# Cabin	Cabin
# Embarked	Port of embarkation
#library(InformationValue)  -- you can explore this package for your different accuracy measures to implement.

library (data.table)
library (plyr)
library (stringr)
   train <- fread("test.csv", na.strings = c(""," ",NA,"NA"))
   test <- fread("train.csv", na.strings = c(""," ",NA,"NA"))
  head(train)
  head(test)
  str(train)
 
  #check missing values
  colSums(is.na(alldata))
  colSums(is.na(test))
 
  #Quick Data Exploration
  summary(train$Age)
  summary(test$Age)
 
  train[,.N/nrow(train),Pclass]
  test[,.N/nrow(test),Pclass]
 
  train [,.N/nrow(train),Sex]
  test [,.N/nrow(test),Sex]
 
  train [,.N/nrow(train),SibSp]
  test [,.N/nrow(test),SibSp]
 
  train [,.N/nrow(train),Parch]
  test [,.N/nrow(test),Parch] #extra 9
 
  summary(train$Fare)
  summary(test$Fare)
 
  train [,.N/nrow(train),Cabin]
  test [,.N/nrow(test),Cabin]
 
  train [,.N/nrow(train),Embarked] 
  test [,.N/nrow(test),Embarked]
  
  #combine data
   alldata <- rbind(train,test,fill=TRUE)
  
   #New Variables
   #Extract passengers title
    alldata [,title := strsplit(Name,split = "[,.]")]
    alldata [,title := ldply(.data = title,.fun = function(x) x[2])]
    alldata [,title := str_trim(title,side = "left")]
   
   #combine titles
   alldata [,title := replace(title, which(title %in% c("Capt","Col","Don","Jonkheer","Major","Rev","Sir")), "Mr"),by=title]
   alldata [,title := replace(title, which(title %in% c("Lady","Mlle","Mme","Ms","the Countess","Dr","Dona")),"Mrs"),by=title]
   
   #ticket binary coding
   alldata [,abs_col := strsplit(x = Ticket,split = " ")]
   alldata [,abs_col := ldply(.data = abs_col,.fun = function(x)length(x))]
   alldata [,abs_col := ifelse(abs_col > 1,1,0)]
  
   #Impute Age with Median
    for(i in "Age")
     set(alldata,i = which(is.na(alldata[[i]])),j=i,value = median(alldata$Age,na.rm = T))
   
   #Remove rows containing NA from Embarked
    alldata <- alldata[!is.na(Embarked)]
   
   #Impute Fare with Median
    for(i in "Fare")
      set(alldata,i = which(is.na(alldata[[i]])),j=i,value = median(alldata$Fare,na.rm = T))
      
   #Replace missing values in Cabin with "Miss"
    alldata [is.na(Cabin),Cabin := "Miss"]
   
   #Log Transform Fare
    alldata$Fare <- log(alldata$Fare + 1)
   
   #Impute Parch 9 to 0
    alldata [Parch == 9L, Parch := 0]
  
    #Collect train and test
     train <- alldata[!(is.na(Survived))]
     train [,Survived := as.factor(Survived)]
    
     test <- alldata[is.na(Survived)]
     test [,Survived := NULL]
    
     #Logistic Regression
     finaltraindata <- subset(train, select = c("Survived","Pclass","Sex","Age","SibSp","Parch","Fare","Cabin","Embarked","title","abs_col"))
     model <- glm(Survived ~ ., family = binomial(link = 'logit'), data = finaltraindata)
     summary(model)  
    
     #checking variable importance
     library(caret) 
     varImp(model)
     
     #ANOVA Chi-square test to check the overall effect of variables on the dependent variable.
     #run anova
     anova(model, test = 'Chisq')
     
  ##Building another model
     model2 <- glm(Survived ~ Pclass + Sex + Age + SibSp + Fare + title, data = finaltraindata,family = binomial(link="logit"))
     summary(model2)
    
     #compare two models
     anova(model,model2,test = "Chisq")
     
     
# Since, we can't evaluate a model's performance on test data locally, we'll divide the train set and use model 2 for prediction
     #partition and create training, testing data
      library(caret)
      split <- createDataPartition(y = train$Survived,p = 0.6, list = FALSE)
      #if you don't use list=FALSE, split will return as a list and for getting index of each splited rows you have to give index of each row separately 
     
      new_train <- train[split] 
      new_test <- train[-split]
     
     #model training and prediction
      finalnewtrain <- subset(new_train, select = c("Survived","Pclass","Sex","Age","SibSp","Parch","Fare","Cabin","Embarked","title","abs_col"))
      log_model <- glm(Survived ~ Pclass + Sex + Age + SibSp + Fare + title, data = finalnewtrain, family = binomial(link="logit"))
      log_predict <- predict(log_model,newdata = new_test,type = "response")
      log_predict <- ifelse(log_predict > 0.5,1,0)     
      # your predicted result is in log_predict
      #you can create a 
      # predicted_output <- as.data.frame(log_predict)
      
      #plot ROC 
       library(ROCR) 
       library(Metrics)
       pr <- prediction(log_predict,new_test$Survived)
       perf <- performance(pr,measure = "tpr",x.measure = "fpr") 
       plot(perf)
       auc(new_test$Survived,log_predict) #0.8010509
       
       ##Let's try to change the cut off value and compare the result.
        log_predict <- predict(log_model,newdata = new_test,type = "response")
        log_predict <- ifelse(log_predict > 0.6,1,0)
       
        pr <- prediction(log_predict,new_test$Survived)
        perf <- performance(pr,measure = "tpr",x.measure = "fpr")
        plot(perf)
        auc(new_test$Survived,log_predict) #0.7926907
    # Higher the AUC-ROC score, better the model    
      