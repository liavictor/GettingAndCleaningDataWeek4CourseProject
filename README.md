# Getting and Cleaning Data Course Week 4 Project

This repo is for Coursera's "Getting and Cleaning Data" Week 4 project. it includes R code, codebook, and tidy data set for the assignment.

## steps to execute the assignment
* download and unzip the data file into your R working directory. source datat:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* download the R source code "run_analysis.R" into your R working directory
* execute R source code "run_analysis.R" to generate tidy data file.

## Source Data Set Information:
The experimental data collected from a group of 30 volunteers. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## R code description
Follow assignment steps, download/unzip the source data, combined training and test datasets, extracted partial variables to create another dataset, apply descriptive activity names and appropriately labels, finally create the tidy dataset with the averages of each variable for each activity.

## New output dataset ( tidyData.txt)
The new generated dataset contained variables calculated based on the mean and standard deviation. Each row of the dataset is an average of each activity type for all 30 subjects.

