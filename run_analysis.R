#
# This script merges the data into a single data frame
#

library(dplyr);

######################
# General preperations
#####################

# capture the name of the source directory
dataDirectory <- "UCI HAR Dataset"

# folder for the tidy data output
dir.create("tidy_data", showWarnings = F)

# read names of the features, rename the columns
features <- read.table(paste(dataDirectory, "/features.txt", sep=""))
names(features) <- c("id", "name")

################################
# 1. Loading and merge test data 
################################

### read TEST data

# load xTest, rename columns, add id column
testData <- read.table(paste(dataDirectory, "/test/X_test.txt", sep=""))
names(testData) <- features$name
testData$id <- seq(along=testData$`tBodyAcc-mean()-X`)

# load  subjects
testSubjects <- read.table(paste(dataDirectory, "/test/subject_test.txt", sep=""))
names(testSubjects) <- c("subject_id")
testSubjects$id <- seq(along=testSubjects$subject_id)

# load activities
testActivities <- read.table(paste(dataDirectory, "/test/y_test.txt", sep=""))
names(testActivities) <- c("activity_id")
testActivities$id <- seq(along=testActivities$activity_id)

# merge
tempTestDF <- merge(testSubjects, testData, by.x = "id", by.y = "id")
tests   <- merge(testActivities, tempTestDF, by.x = "id", by.y = "id")
tests$data_kind  <- rep("tests", length(tests$id))


###  read TRAIN data

# load xTest, rename columns, add id column
trainData <- read.table(paste(dataDirectory, "/train/X_train.txt", sep=""))
names(trainData) <- features$name
trainData$id <- seq(along=trainData$`tBodyAcc-mean()-X`)

# load  subjects
trainSubjects <- read.table(paste(dataDirectory, "/train/subject_train.txt", sep=""))
names(trainSubjects) <- c("subject_id")
trainSubjects$id <- seq(along=trainSubjects$subject_id)

# load activities
trainActivities <- read.table(paste(dataDirectory, "/train/y_train.txt", sep=""))
names(trainActivities) <- c("activity_id")
trainActivities$id <- seq(along=trainActivities$activity_id)

# merge
tempTrainDF <- merge(trainSubjects, trainData, by.x = "id", by.y = "id")
training    <- merge(trainActivities, tempTrainDF, by.x = "id", by.y = "id")

# add origin identifier
training$data_kind  <- rep("training", length(training$id))

### Merge and clean TRAIN and TEST data

# merging test
trainingWithoutId <- select(training, -(id))
testsWithoutId    <- select(tests, -(id))

unified <- rbind(trainingWithoutId, testsWithoutId)

# Add unique id
unified$id <- seq(along=unified$activity_id)


############################################################################
# 2. Extract mean and standard deviation for each measurement 
############################################################################

# grep columns that contain 'mean', 'std', o 'Mean'
meanAndStd <- grep("id|mean|Mean|std|kind", names(unified))
extracted <- unified[, meanAndStd]

############################################################################
# 3.  Use descriptive activity names to name the activities in the data set
############################################################################

# load activity names and rename columns
activityNames <- read.table(paste(dataDirectory, "/activity_labels.txt", sep=""))
names(activityNames) <- c("id", "name")

# create the legible activity name
extracted$activity <- activityNames[extracted$activity_id,]$name


############################################################################
# 4. Appropriately label the data set with descriptive variable names.  
############################################################################

# I have been renaming the columns with readable columns from the first step
# Line 98 is an exmaple of my renaming columns.

# At this point calling names(extracted) returns 

#[1] "activity_id"                          "subject_id"                          
#[3] "tBodyAcc-mean()-X"                    "tBodyAcc-mean()-Y"                   
#[5] "tBodyAcc-mean()-Z"                    "tBodyAcc-std()-X"                    
#[7] "tBodyAcc-std()-Y"                     "tBodyAcc-std()-Z"                    
#[9] "tGravityAcc-mean()-X"                 "tGravityAcc-mean()-Y"                
#[11] "tGravityAcc-mean()-Z"                 "tGravityAcc-std()-X"                 
#[13] "tGravityAcc-std()-Y"                  "tGravityAcc-std()-Z"                 
#[15] "tBodyAccJerk-mean()-X"                "tBodyAccJerk-mean()-Y"               
#3[17] "tBodyAccJerk-mean()-Z"                "tBodyAccJerk-std()-X"                
#[19] "tBodyAccJerk-std()-Y"                 "tBodyAccJerk-std()-Z"                
#[21] "tBodyGyro-mean()-X"                   "tBodyGyro-mean()-Y"                  
#[23] "tBodyGyro-mean()-Z"                   "tBodyGyro-std()-X"                   
#[25] "tBodyGyro-std()-Y"                    "tBodyGyro-std()-Z"                   
#[27] "tBodyGyroJerk-mean()-X"               "tBodyGyroJerk-mean()-Y"              
#[29] "tBodyGyroJerk-mean()-Z"               "tBodyGyroJerk-std()-X"               
#[31] "tBodyGyroJerk-std()-Y"                "tBodyGyroJerk-std()-Z"               
#[33] "tBodyAccMag-mean()"                   "tBodyAccMag-std()"                   
#[35] "tGravityAccMag-mean()"                "tGravityAccMag-std()"                
#[37] "tBodyAccJerkMag-mean()"               "tBodyAccJerkMag-std()"               
#[39] "tBodyGyroMag-mean()"                  "tBodyGyroMag-std()"                  
#[41] "tBodyGyroJerkMag-mean()"              "tBodyGyroJerkMag-std()"              
#[43] "fBodyAcc-mean()-X"                    "fBodyAcc-mean()-Y"                   
#[45] "fBodyAcc-mean()-Z"                    "fBodyAcc-std()-X"                    
#[47] "fBodyAcc-std()-Y"                     "fBodyAcc-std()-Z"                    
#[49] "fBodyAcc-meanFreq()-X"                "fBodyAcc-meanFreq()-Y"               
#[51] "fBodyAcc-meanFreq()-Z"                "fBodyAccJerk-mean()-X"               
#[53] "fBodyAccJerk-mean()-Y"                "fBodyAccJerk-mean()-Z"               
#[55] "fBodyAccJerk-std()-X"                 "fBodyAccJerk-std()-Y"                
#[57] "fBodyAccJerk-std()-Z"                 "fBodyAccJerk-meanFreq()-X"           
#[59] "fBodyAccJerk-meanFreq()-Y"            "fBodyAccJerk-meanFreq()-Z"           
#[61] "fBodyGyro-mean()-X"                   "fBodyGyro-mean()-Y"                  
#[63] "fBodyGyro-mean()-Z"                   "fBodyGyro-std()-X"                   
#[65] "fBodyGyro-std()-Y"                    "fBodyGyro-std()-Z"                   
#[67] "fBodyGyro-meanFreq()-X"               "fBodyGyro-meanFreq()-Y"              
#[69] "fBodyGyro-meanFreq()-Z"               "fBodyAccMag-mean()"                  
#[71] "fBodyAccMag-std()"                    "fBodyAccMag-meanFreq()"              
#[73] "fBodyBodyAccJerkMag-mean()"           "fBodyBodyAccJerkMag-std()"           
#[75] "fBodyBodyAccJerkMag-meanFreq()"       "fBodyBodyGyroMag-mean()"             
#[77] "fBodyBodyGyroMag-std()"               "fBodyBodyGyroMag-meanFreq()"         
#[79] "fBodyBodyGyroJerkMag-mean()"          "fBodyBodyGyroJerkMag-std()"          
#[81] "fBodyBodyGyroJerkMag-meanFreq()"      "angle(tBodyAccMean,gravity)"         
#[83] "angle(tBodyAccJerkMean),gravityMean)" "angle(tBodyGyroMean,gravityMean)"    
#[85] "angle(tBodyGyroJerkMean,gravityMean)" "angle(X,gravityMean)"                
#[87] "angle(Y,gravityMean)"                 "angle(Z,gravityMean)"                
#[89] "data_kind"                            "id"                                  
#[91] "activity"    




############################################################################
# 5. Create a second, independent tidy data set with the average of each 
#   variable for each activity and each subject.
############################################################################

# summarize the data
grouped <- group_by(extracted, subject_id, activity)
result <- summarise_each(grouped, funs(mean), -id, -subject_id, -activity_id, -data_kind, -activity)

# cleaning up the column names before writing
firstPass <- gsub("[-\\-\\(\\),]+", "_", names(result))
cleanNames <- gsub("_$", "", firstPass)
names(result) <- cleanNames


# write to output folder
write.table(result, "tidy_data/tidy.txt", row.names = FALSE)