### run_analysis.R  by Aiyu Li for assignment of Getting and Clearning data class.
### install.packages("dplyr")
### install.packages("data.table")
### install.packages("sqldf")

# Load packages
library(data.table)
library(dplyr)


## Prepare working directory, download data, unzip data and import data into R
# step prepare-1: Set your working directry, please update the working directry when necessary for your own.
setwd("c:/Users/Family/Documents/GitHub/GettingAndCleaningDataWeek4CourseProject")

# step prepare-2: Download UCI data files from the web, unzip the file into the working directory
URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
destFile <- "ucidataset.zip"
if (!file.exists(destFile)){
        download.file(URL, destfile = destFile, mode='wb')
}
if (!file.exists("./UCI HAR Dataset")){
        unzip(destFile)
}

# step prepare-3: read training data
xTrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
yTrain <- read.table("./UCI HAR Dataset/train/Y_train.txt")
sTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# step prepare-4: read test data
xTest <- read.table("./UCI HAR Dataset/test/X_test.txt")
yTest <- read.table("./UCI HAR Dataset/test/Y_test.txt")
sTest <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# step prepare-5: read data variable name from feature file
vNames <- read.table("./UCI HAR Dataset/features.txt")

# step prepare-6: read activity labels
aLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")


# step prepare-7: reename activity data by using column name: activityID & activity
names(aLabels) <- c("ActivityID", "Activity")

## 1. Merges the training and the test sets to create one data set.
## and combining with 3.Uses descriptive activity names to name the activities in the data set

# step 1-1 Merging training and test datasets 
xAll <- rbind(xTrain, xTest)
yAll <- rbind(yTrain, yTest)
sAll <- rbind(sTrain, sTest)

# step 1-2 Assigning variable names to the datasets
colnames(xAll) <- vNames[,2]
colnames(yAll) <- "ActivityID"
colnames(sAll) <- "SubjectID"

## step 1-3 for #3 to Use the descriptive activity names to name the activities in the data set

yAll_alabels <- left_join(yAll, aLabels, "ActivityID")
yAll_a <-yAll_alabels[2]

# step 1-3 Merging all datasets into one set
OneDataSet <-cbind(sAll, yAll_a, xAll)


## 2. Extracting only the measurements on the mean and sd for each measurement

# step 2-1 extracting the mean/sd column names plus additional two columns: subjectid/acitivitID
subVars <- vNames$V2[grep("mean\\(\\)|std\\(\\)", vNames$V2)]
mean_sd_vars <- c('SubjectID', 'Activity', as.character(subVars))

# step 2-2 creating the subset dataset with only mean and sd measurements
finalDataSet <- select(OneDataSet, mean_sd_vars)


## 4. Appropriately labels the data set with descriptive variable names
names(finalDataSet)<-gsub("^t", "time", names(finalDataSet))
names(finalDataSet)<-gsub("^f", "frequency", names(finalDataSet))
names(finalDataSet)<-gsub("Acc", "Accelerometer", names(finalDataSet))
names(finalDataSet)<-gsub("Gyro", "Gyroscope", names(finalDataSet))
names(finalDataSet)<-gsub("Mag", "Magnitude", names(finalDataSet))
names(finalDataSet)<-gsub("BodyBody", "Body", names(finalDataSet))

## 5. From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.

SecondDataSet<-aggregate(. ~SubjectID + Activity, OneDataSet, mean)
SecondDataSet<-SecondDataSet[order(SecondDataSet$SubjectID,SecondDataSet$Activity),]

# final step to save the tidy dataset in the local working folder
write.table(SecondDataSet, file = "tidydata.txt",row.name=FALSE)
