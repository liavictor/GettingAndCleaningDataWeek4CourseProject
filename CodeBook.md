# Getting and Cleaning Data Course Week 4 Project codebook

## install.packages("data.table")
## install.packages("sqldf")

## Load packages
library(data.table)
library(dplyr)


## Prepare working directory, download data, unzip data and import data into R
* step prepare-1: Set your working directry
* step prepare-2: Download UCI data files from the web, unzip the file into the working directory
* step prepare-3: read training data
* step prepare-4: read test data
* step prepare-5: read data variable name from feature file
* step prepare-6: read activity labels
* step prepare-7: reename activity data by using column name: activityID & activity

## 1. Merges the training and the test sets to create one data set.
## and combining with 3.Uses descriptive activity names to name the activities in the data set

* step 1-1 Merging training and test datasets 
* step 1-2 Assigning variable names to the datasets
* step 1-3 for #3 to Use the descriptive activity names to name the activities in the data set
* step 1-4 Merging all datasets into one set

## 2. Extracting only the measurements on the mean and sd for each measurement

* step 2-1 extracting the mean/sd column names plus additional two columns: subjectid/acitivitID
* step 2-2 creating the subset dataset with only mean and sd measurements

## 3 to Use the descriptive activity names to name the activities in the data set
* see step 1-3

## 4. Appropriately labels the data set with descriptive variable names


## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## final step to save the tidy dataset in the local working folder

