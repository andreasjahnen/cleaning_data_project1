###################################################
## Course project 1 - run_analysis.R
##########
##
## This script focuses on the data cleaning and processing of wearable 
## computing data. It is the project 1 of the data cleaning course.
## Please see for details the commented code below.
##
####################################################
# 0 Init the script with the data and the required packages:
# load the dplyr package, was we will need it later:
library(dplyr)

# Download and unzip the data:
setwd("/home/jahnen/Dropbox/Learning/Data Science Degree/3 - Getting and Cleaning Data/week 3/project/")

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "HARDataset.zip", method="curl")
unzip("HARDataset.zip")

# Questions from the course project: 

# 1. Merges the training and the test sets to create one data set.
# ----------------------------------------------------------------
# load test data:
testData <- read.table("UCI HAR Dataset/test/X_test.txt")
# load the training data:
trainData <- read.table("UCI HAR Dataset/train/X_train.txt")
# merge:
mergedData <- rbind(testData, trainData)
    
# 2. Extract only the measurements on the mean and standard deviation for each measurement. 
# ----------------------------------------------------------------
# Read the column names from the "features.txt" file:
colNames <- read.table("UCI HAR Dataset/features.txt")

# get all column numbers from all column names with "mean" and "std":
colNumbers <- as.numeric(colNames[grep("mean", colNames$V2), ]$V1)
colNumbers <- append(colNumbers,as.numeric(colNames[grep("std", colNames$V2), ]$V1))

# store new dataset in selectedColumnsData
selectedColumnsData <- mergedData[, colNumbers]

# 3. Uses descriptive activity names to name the activities in the data set
# ----------------------------------------------------------------
# load the activity names:
activityNames <- read.table("UCI HAR Dataset/activity_labels.txt")

# add the activity nr to the selectedColumnsData set:
test_activity <- read.table("UCI HAR Dataset/test/y_test.txt")
train_activity <- read.table("UCI HAR Dataset/train/y_train.txt")
activity <- rbind(test_activity, train_activity)
selectedColumnsData$activityNr <- activity$V1

# now, give the activity Names to the different observations:
selectedColumnsData$activityNames <- activityNames$V2[selectedColumnsData$activityNr]


# 4. Appropriately labels the data set with descriptive variable names. 
# ----------------------------------------------------------------
# In the variable colNames, he have already the column names. We have to select
# the selected columns:
colNames <- colNames[colNumbers, ]

# We need to add the activity Nr and Name.
V1 <- c(1:2)
V2 <- c("activityNr", "activityNames")
newNames <- cbind(V1, V2)
selectedColumnNames <- rbind(colNames, newNames)

colnames(selectedColumnsData) <- selectedColumnNames$V2

# 5. From the data set in step 4, creates a second, independent tidy data set with the average 
#    of each variable for each activity and each subject.
# ----------------------------------------------------------------
# load and add the subjects to the dataset of 4:
test_subjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
train_subjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
subjects <- rbind(test_subjects, train_subjects)
selectedColumnsData$subject <- subjects$V1

# calculate now the means for each activity and subject:
dg <- group_by(selectedColumnsData, subject, activityNames)
activitySubjectSummaries <- summarise_each(dg, funs(mean))
write.table(activitySubjectSummaries, file = "activitySubjectSummaries.txt",  row.name=FALSE)
