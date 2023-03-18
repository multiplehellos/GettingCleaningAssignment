#load packages
library(dplyr)
library(data.table)

#read in the appropriate data
featureNames <- read.table("UCI HAR Dataset/features.txt")
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)

#read in the training data
subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)
activityTrain <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE)
featuresTrain <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)


#read in the test data
subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)
activityTest <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE)
featuresTest <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)

####STEP 1: Merges the training and the test sets to create one data set#### 

#combine both sets of data corresponding to subject, activity, and features
subject <- rbind(subjectTrain, subjectTest)
activity <- rbind(activityTrain, activityTest)
features <- rbind(featuresTrain, featuresTest)

#rename the columns; "features" to that found in the "featureNames" metadata
colnames(features) <- t(featureNames[2])
colnames(activity) <- "Activity"
colnames(subject) <- "Subject"

#finally merge the subject, activity, and featues into one dataset
completeData <- cbind(features,activity,subject)

####STEP 2: Extracts only the measurements on the mean and standard deviation for each measurement####

#extract column indices with either mean or std
columnsWithMeanSTD <- grep(".*Mean.*|.*Std.*", names(completeData), ignore.case=TRUE)

#add activity and subject columns
requiredColumns <- c(columnsWithMeanSTD, 562, 563)

#check dimensions
dim(completeData)

#extract data with the selected columns in "requiredColumns"
extractedData <- completeData[,requiredColumns]

#check dimensions
dim(extractedData)

####STEP 3: Uses descriptive activity names to name the activities in the data set####

#change activity class type to character so that it can accept acivity names
extractedData$Activity <- as.character(extractedData$Activity)
for (i in 1:6){
  extractedData$Activity[extractedData$Activity == i] <- as.character(activityLabels[i,2])
}
extractedData$Activity <- as.factor(extractedData$Activity)

####STEP 4: Appropriately labels the data set with descriptive variable names####

#check the names of the variables
names(extractedData)

#replace acronyms with full, comprehensive labels
names(extractedData)<-gsub("Acc", "Accelerometer", names(extractedData))
names(extractedData)<-gsub("Gyro", "Gyroscope", names(extractedData))
names(extractedData)<-gsub("BodyBody", "Body", names(extractedData))
names(extractedData)<-gsub("Mag", "Magnitude", names(extractedData))
names(extractedData)<-gsub("^t", "Time", names(extractedData))
names(extractedData)<-gsub("^f", "Frequency", names(extractedData))
names(extractedData)<-gsub("tBody", "TimeBody", names(extractedData))
names(extractedData)<-gsub("-mean()", "Mean", names(extractedData), ignore.case = TRUE)
names(extractedData)<-gsub("-std()", "STD", names(extractedData), ignore.case = TRUE)
names(extractedData)<-gsub("-freq()", "Frequency", names(extractedData), ignore.case = TRUE)
names(extractedData)<-gsub("angle", "Angle", names(extractedData))
names(extractedData)<-gsub("gravity", "Gravity", names(extractedData))

#check the names of the variables
names(extractedData)

####STEP 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject####

#set "Subject" as a factor variable
extractedData$Subject <- as.factor(extractedData$Subject)
extractedData <- data.table(extractedData)

#tidy the data and write it into a .txt data file
tidyData <- aggregate(. ~Subject + Activity, extractedData, mean)
tidyData <- tidyData[order(tidyData$Subject,tidyData$Activity),]
write.table(tidyData, file = "Tidy.txt", row.names = FALSE)

