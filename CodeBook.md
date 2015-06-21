# CodeBook 
## Getting and Cleaning Data, Coursera course getdata-015
## Course Project
## Prepared by Hugo Estrada

### Summary

The dataset presented in this project is a table that presents the means of the means and standard deviations of measurements obtained through experiments conducted for the Human Activity Recognition Using Smartphones Data Dataset.

The original data was obtained by recording 30 subjects ages 19-48 doing different dayly activities while reading a smartphone (samsung Galaxy S II) on their wait. Six activities were recorded,  WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING). The measurements were obtained by reading the accelerometer and gyrospoce sensors.

The original data has 561-feature vector that gives time and frequency domain variables for each measurement.

The current data set summarizes this data by presenting a table by subject and activity and collecting the means of the different means and standard deviation measurements. 

### Selecting the measurements
The requirements for the dataset was to present the feature vectors that represented the means and standard deviations of reach activity. The author chose to collect all of the features that had the word "mean" and "std" in their name. This gave 86 measurements. 

To these two more columns have been added, "subject_id", which represents the test subject, and "activity", which describes what activity the subject was doing.

### Transformations performed on the data
After grouping each row by subject_id and activity, each group was summarized applying the mean() function on each measurement.

### Source of the data
You can find the raw data and detail descriptions of the experiments in the [Human Activity Recognization Using Smartphones Data Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) page.

### Description of the data
The data can be divided in two. subject_id and activity identify the measurements and the rest of the columns show the means of the measurements on those activities. 

#### Subject Id and activity
The subject id is a plain integer. The activy column contains the following categories  WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING. 

#### Units of the numeric data
The measurements are meansfor sensors measuring acceleration. The signal were obtained at a constant rate of 50 Hz. As described in feautures_info.txt, the original data was processed through filters to eliminate noise. 

For more details on the features measurements, please read "UCI HAR Dataset/features_info.txt".

### attributes
"subject_id"
"activity"
"tBodyAcc_mean_X"
"tBodyAcc_mean_Y"
"tBodyAcc_mean_Z"
"tBodyAcc_std_X"
"tBodyAcc_std_Y"
"tBodyAcc_std_Z"
"tGravityAcc_mean_X"
"tGravityAcc_mean_Y"
"tGravityAcc_mean_Z"
"tGravityAcc_std_X"
"tGravityAcc_std_Y"
"tGravityAcc_std_Z"
"tBodyAccJerk_mean_X"
"tBodyAccJerk_mean_Y"
"tBodyAccJerk_mean_Z"
"tBodyAccJerk_std_X"
"tBodyAccJerk_std_Y"
"tBodyAccJerk_std_Z"
"tBodyGyro_mean_X"
"tBodyGyro_mean_Y"
"tBodyGyro_mean_Z"
"tBodyGyro_std_X"
"tBodyGyro_std_Y"
"tBodyGyro_std_Z"
"tBodyGyroJerk_mean_X"
"tBodyGyroJerk_mean_Y"
"tBodyGyroJerk_mean_Z"
"tBodyGyroJerk_std_X"
"tBodyGyroJerk_std_Y"
"tBodyGyroJerk_std_Z"
"tBodyAccMag_mean"
"tBodyAccMag_std"
"tGravityAccMag_mean"
"tGravityAccMag_std"
"tBodyAccJerkMag_mean"
"tBodyAccJerkMag_std"
"tBodyGyroMag_mean"
"tBodyGyroMag_std"
"tBodyGyroJerkMag_mean"
"tBodyGyroJerkMag_std"
"fBodyAcc_mean_X"
"fBodyAcc_mean_Y"
"fBodyAcc_mean_Z"
"fBodyAcc_std_X"
"fBodyAcc_std_Y"
"fBodyAcc_std_Z"
"fBodyAcc_meanFreq_X"
"fBodyAcc_meanFreq_Y"
"fBodyAcc_meanFreq_Z"
"fBodyAccJerk_mean_X"
"fBodyAccJerk_mean_Y"
"fBodyAccJerk_mean_Z"
"fBodyAccJerk_std_X"
"fBodyAccJerk_std_Y"
"fBodyAccJerk_std_Z"
"fBodyAccJerk_meanFreq_X"
"fBodyAccJerk_meanFreq_Y"
"fBodyAccJerk_meanFreq_Z"
"fBodyGyro_mean_X"
"fBodyGyro_mean_Y"
"fBodyGyro_mean_Z"
"fBodyGyro_std_X"
"fBodyGyro_std_Y"
"fBodyGyro_std_Z"
"fBodyGyro_meanFreq_X"
"fBodyGyro_meanFreq_Y"
"fBodyGyro_meanFreq_Z"
"fBodyAccMag_mean"
"fBodyAccMag_std"
"fBodyAccMag_meanFreq"
"fBodyBodyAccJerkMag_mean"
"fBodyBodyAccJerkMag_std"
"fBodyBodyAccJerkMag_meanFreq"
"fBodyBodyGyroMag_mean"
"fBodyBodyGyroMag_std"
"fBodyBodyGyroMag_meanFreq"
"fBodyBodyGyroJerkMag_mean"
"fBodyBodyGyroJerkMag_std"
"fBodyBodyGyroJerkMag_meanFreq"
"angle_tBodyAccMean_gravity"
"angle_tBodyAccJerkMean_gravityMean"
"angle_tBodyGyroMean_gravityMean"
"angle_tBodyGyroJerkMean_gravityMean"
"angle_X_gravityMean"
"angle_Y_gravityMean"
"angle_Z_gravityMean"
