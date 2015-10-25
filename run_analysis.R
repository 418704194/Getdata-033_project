
#download file 
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","getdata-projectfiles-UCI HAR Dataset.zip")
#Unzip the file
system("unzip getdata-projectfiles-UCI HAR Dataset.zip")
#read table
train.data <- read.table("UCI HAR Dataset/train/X_train.txt",header = F)
train.label <- read.table("UCI HAR Dataset/train/Y_train.txt",header = F)
train.subject <- read.table("UCI HAR Dataset/train/subject_train.txt",header = F)

test.data <- read.table("UCI HAR Dataset/test/X_test.txt",header = F)
test.label <- read.table("UCI HAR Dataset/test/Y_test.txt",header = F)
test.subject <- read.table("UCI HAR Dataset/test/subject_test.txt",header = F)

#read features and edit colnames
features <- read.table("UCI HAR Dataset/features.txt",stringsAsFactors = F)
dim(features)
colnames(train.data) <- features[,2]
colnames(test.data) <- features[,2]

#read activity and edit labels
activity.labels<-read.table("UCI HAR Dataset/activity_labels.txt",stringsAsFactors = F)
train.label$labels=activity.labels[train.label$V1,2]
test.label$labels=activity.labels[test.label$V1,2]

#merge train and test
cbind(train.subject,train.label$labels,train.data)->train.data;colnames(train.data)[2]<-"activity"
cbind(test.subject,test.label$labels,test.data)->test.data;colnames(test.data)[2]<-"activity"
rbind(train.data,test.data)->tidy.data
colnames(tidy.data)[1]=c("subject")

#Extracts only the measurements on the mean and standard deviation for each measurement
featMSIndex=features[grep("mean\\(\\)|std\\(\\)", features[, 2]),2]
tidy.data[,c("subject","activity",featMSIndex)]->dat


#new data set with the average of each variable for each activity and each subject.
if (!require(data.table)){install.packages("data.table");library("data.table")}
