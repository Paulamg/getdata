#run_analysis.R is a script for the solution of the course project of the Cleaning data course
#Load the packages required
library(plyr)
library(dplyr)
library(reshape2)

#download and unzip the file
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
download.file(fileurl, destfile="./data.zip", mode="wb")
datedownloaded <- date()
unzip("data.zip")
setwd("./UCI HAR Dataset")

#load the features files that contains the names of the variables
features <- read.table("features.txt")

#substract the variables that contain "mean" or "std
subset <- as.data.frame(grep("mean|std", features$V2))
subset <- setNames(subset, "V1")


#create a subset of the names of the columns of interest
features2 <- features[unlist(subset), 2]


#create the datasets
train <- read.table("train/X_train.txt")
train <- train[, unlist(subset)]
colnames(train) <- features2
trainlab <- read.table("train/y_train.txt", col.names="Activity", colClasses="factor")
trainsub <- read.table("train/subject_train.txt", col.names="Subject")
training <- cbind(subject = trainsub, activity= trainlab, train)

test <- read.table("test/X_test.txt")
test <- test[, unlist(subset)]
colnames(test) <- features2
testlab <- read.table("test/y_test.txt", col.names="Activity", colClasses="factor")
testsub <- read.table("test/subject_test.txt", col.names="Subject")
testing <- cbind(testsub, testlab, test)

#Merge the datasets into one
data <- rbind(training, testing)

#Label activities
Activity <- read.table("activity_labels.txt")
levels(data$Activity) <- Activity$V2

#Create a new tidy data set that stores the values taking the Subject and the Activity as ID variables
tidy <- tbl_df(data)
a <- melt(tidy, id=c("Subject", "Activity"), measure.vars=features2)

#Calcule the mean of the values by Subject and Activity
a <- summarize(group_by(a, Subject, Activity), mean(value))
     