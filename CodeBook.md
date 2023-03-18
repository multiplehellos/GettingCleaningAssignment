1. Load dplyr and data.table packages 
2. Read in the dataset (can be found in README.md) for both training and test data
		a. featureNames: dataframe with the features.txt data
		b. activityLabels: datafframe with the activity_labels.txt data
		c. subjectTrain and subjectTest: data from the subject variable for training and test data, respectively
		d. activityTrain and activityTest: data from the y variable for training and test data, respectively
		e. featuresTrain and featuresTests: data from the x variable for the training and test data, respectively
3. Combine the training and test datasets into one data set
		a. completeData: merged dataset
4. Extract from the combined dataset (completeData) the mean and standard deviation from each measurement
		a. extractedData: new, smaller dataset with the means and standard deviation
5. Rename acronyms with full, comprehensive labels:
		a. Acc - Accelerometer
		b. Gyro - Gyroscope
		c. BodyBody - Body
		d. Mag - Magnitude
		e. ^t - Time
		f. ^f - Frequency
		g. tBody - TimeBody
		h. -mean() - Mean
		i. -std() - STD
		j. -freq() - Frequency
		k. angle - Angle
		l. gravity - Gravity
6. Create a second, independent tidy data set
		a. tidyData: create the tidy data set
		b. Tidy.txt - the independent file, in .txt format, of the R script
	
	
