library(data.table)
library(plyr)

# Task 1 --> Merge the training and the test sets to create one data set
## X
XTrain<-read.table("train/X_train.txt")
XTest<-read.table("test/X_test.txt")
XAll<-rbind(XTrain,XTest)
## Y
YTrain<-read.table("train/y_train.txt")
YTest<-read.table("test/y_test.txt")
YAll<-rbind(YTrain,YTest)
## Subject
STrain<-read.table("train/subject_train.txt")
STest<-read.table("test/subject_test.txt")
SAll<-rbind(STrain,STest)


# Task 2 --> Extract only the measurements on the mean and standard deviation for each measurement
## Load Features
features<-read.table("features.txt")
## Search for mean and standard deviation in the second column
relevantmeasurements<-grep("-(mean|std)\\(\\)", features[,2])
## Subset relevant data
XAll<-XAll[,relevantmeasurements]


# Task 3 --> Use descriptive activity names to name the activities in the data set
## Load Labels
activitylables<-read.table("activity_labels.txt")
## Label activities
YAll[,1]<-activitylables[YAll[,1],2]


#Task 4 --> Appropriately label the data set with descriptive variable names
## name activities and subject column correctly
names(YAll)<-"activity"
names(SAll)<-"subject"
## Put all the data together
ALL<-cbind(XAll,YAll,SAll)


#Task 5 --> From the data set in step 4, create a second, independent tidy data set with the average of 
##each variable for each activity and each subject
tidyAverage<- ddply(ALL, .(subject, activity), function(x) colMeans(x[,1:66]))
##write tidy data
write.table(tidyAverage, "tidyAverage.txt", row.names =FALSE)
