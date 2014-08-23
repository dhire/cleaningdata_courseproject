## filename: run_analysis.R
## date: August 24,2014
## author: Don Hire


## defines a function tidy that assembles UCI HAR test and train datasets 
## creates 
## 1. a tidy dataset which is written as CSV format
## 2. a summarized tidy dataset in CSV format which is the means of columns by subject and activity
## function returns the summarized means dataset

## Note, although function accepts a directory for the location of the UCI HAR Datasets, the CSV output
## files are hadcoded, user should review file paths and setwd commands for compatiblity with enviroment


tidy <- function(directory="c:/coursera/UCI HAR Dataset") {

## set directory of project's "UCI HAR Dataset" data
setwd(directory)

## assembling data from the test area relies on 5 files  
## 
## X_test.txt contains measurment results
## subject_test.txt contains the subject id
## y_test.txt contains the subject activityx
## 
## processing of the above three files requires equal row counts
## 
## two additional files necessary to create a tidy dataset are
## features.txt contains the variables names for columns in X_test.txt
## activity_labels.txt contains the description for activity 


## read activity_labels.txt w name activity.id and activity_label

activity_labels<-read.table("activity_labels.txt",col.names=c("activity.id","activity.label"))

## read features_info.txt - note ignore the first column as only the names of the variables will be used

column_names <- read.table("features.txt",colClasses=c("NULL","character"),col.names=c("junk","measure"))

## subset the column_names vector to only include variables with "mean()" or "std()" in their names
## as these columns are the only one of interest
## this vector will be used to subset the column volumes

column_names <- as.vector(column_names[,1])
column_pos_touse <- c(grep("mean()",column_names,fixed=T),grep("std()",column_names,fixed=T))

## read from test folder the subject id file
setwd ("test")
subjectid_test <-read.table("subject_test.txt",col.names="subject.id")

## read for test folder the activity (y_test.txt) file
activity_test<-read.table("y_test.txt",col.names="activity.id")

# combine the subjects and their activity into single table

subjectid.activityid <- cbind(subjectid_test,activity_test)

# loop thru activity labels and add description
for (i in 1:nrow(activity_labels)) {
subjectid.activityid$activity.label[subjectid.activityid$activity.id==i] <- as.character(activity_labels[i,2])
}

subjectid.activityid <-subset(subjectid.activityid,select = -activity.id)

## read from the test folder the accelerometry measures (X_test.txt) uses column_names vector
x_test<-read.table("X_test.txt", col.names=column_names,check.names=F)

## subset test dataframe columns per requirments

x_test<-x_test[,column_pos_touse]

## combine x_test (the measures) with subjectid.activityid
test_final <- cbind(subjectid.activityid,x_test)


## REPEAT STEPS FOR TRAIN
setwd(directory)

## read from train folder the subject id file
setwd ("train")

subjectid_train <-read.table("subject_train.txt",col.names="subject.id")

## read for test folder the activity (y_test.txt) file
activity_train<-read.table("y_train.txt",col.names="activity.id")

# combine the subjects and their activity into single table

subjectid.activityid <- cbind(subjectid_train,activity_train)

# loop thru activity labels and add description
for (i in 1:nrow(activity_labels)) {
subjectid.activityid$activity.label[subjectid.activityid$activity.id==i] <- as.character(activity_labels[i,2])
}

subjectid.activityid <-subset(subjectid.activityid,select = -activity.id)

## read from the test folder the accelerometry measures (X_test.txt) uses column_names vector
x_train<-read.table("X_train.txt", col.names=column_names,check.names=F)

## subset training dataframe columns per requirments

x_train<-x_train[,column_pos_touse]



## combine x_train (the measures) with subjectid.activityid
train_final <- cbind(subjectid.activityid,x_train)

final <-rbind(test_final,train_final)

colnamesfile <- read.csv(file="c:/coursera/UCI HAR Dataset/colnames.csv")
tidycolnames <- colnamesfile[,2]

write.table(final,"c:/coursera/UCI HAR Dataset/tidy.csv",col.names=tidycolnames,sep=",",dec=".",row.names=F)

## create means of variables

s <- split(final, list(final$subject.id,final$activity.label), drop=TRUE) 
cols <- colnames(final)

final.means <- lapply(s,function(x) colMeans(x[,cols[3:68]], na.rm=T))

final.means <- data.frame(t(sapply(final.means,c)),check.names=F)

rnames <- rownames(final.means)

final.means <- cbind(rnames,final.means)

subjectid <-as.numeric(substring(final.means[,1],1,2))

activity <- substring(final.means[,1],3,100)
activity <- gsub(".","",activity,fixed=TRUE)
final.means <-cbind(subjectid,activity,final.means)
final.means <-subset(final.means,select = -rnames)
row.names(final.means)<-NULL

write.table(final.means,"c:/coursera/UCI HAR Dataset/tidymeans.csv",col.names=tidycolnames,sep=",",dec=".",row.names=F)

colnames(final.means) <- tidycolnames
final.means <- final.means
}
