# GettingCleaningAssignment
Repo for the Getting and Cleaning Data Course Project

Data for this repo can be found at: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  with full explanation of the raw data at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Files included in this repo:

run_analysis.R -- the R script used to perform the data preparation as described in the course assignment, with the following 5 steps:
      1. Merges the training and the test sets to create one data set.
      2. Extracts only the measurements on the mean and standard deviation for each measurement. 
      3. Uses descriptive activity names to name the activities in the data set
      4. Appropriately labels the data set with descriptive variable names. 
      5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Tidy.txt -- resulting tidy dataset when performing the steps in run_analysis.R

CodeBook.md -- the codebook that describes the data and it's variables


