__#Code Book for the Getting and Cleaning Data Course Project__
This code book contains relevant information of the variables used in the Course Project in formulating **tidy.txt**.

##__Attributes__
* _subject_ - ID of the test subject
* _activity_ - TYPE of the activity performed when the measurements were taken

##__Activity Labels__
* _WALKING (1)_ : during the test the subject was walking
* _WALKING_UPSTAIRS (2)_: during the test the subject was walking up a stair
* _WALKING_DOWNSTAIRS (3)_: during the test the subject was walking down a stair
* _SITTING (4)_: during the test the subject was sitting
* _STANDING (5)_: during the test the subject was standing
* _LAYING (6)_: during the test the subject was laying down

##__Measurements__
* _tBodyAccMeanX_
* _tBodyAccMeanY_
* _tBodyAccMeanZ_
* _tBodyAccStdX_
* _tBodyAccStdY_
* _tBodyAccStdZ_
* _tGravityAccMeanX_
* _tGravityAccMeanY_
* _tGravityAccMeanZ_
* _tGravityAccStdX_
* _tGravityAccStdY_
* _tGravityAccStdZ_
* _tBodyAccJerkMeanX_
* _tBodyAccJerkMeanY_
* _tBodyAccJerkMeanZ_
* _tBodyAccJerkStdX_
* _tBodyAccJerkStdY_
* _tBodyAccJerkStdZ_
* _tBodyGyroMeanX_
* _tBodyGyroMeanY_
* _tBodyGyroMeanZ_
* _tBodyGyroStdX_
* _tBodyGyroStdY_
* _tBodyGyroStdZ_
* _tBodyGyroJerkMeanX_
* _tBodyGyroJerkMeanY_
* _tBodyGyroJerkMeanZ_
* _tBodyGyroJerkStdX_
* _tBodyGyroJerkStdY_
* _tBodyGyroJerkStdZ_
* _tBodyAccMagMean_
* _tBodyAccMagStd_
* _tGravityAccMagMean_
* _tGravityAccMagStd_
* _tBodyAccJerkMagMean_
* _tBodyAccJerkMagStd_
* _tBodyGyroMagMean_
* _tBodyGyroMagStd
* _tBodyGyroJerkMagMean_
* _tBodyGyroJerkMagStd_
* _fBodyAccMeanX_
* _fBodyAccMeanY_
* _fBodyAccMeanZ_
* _fBodyAccStdX_
* _fBodyAccStdY_
* _fBodyAccStdZ_
* _fBodyAccMeanFreqX_
* _fBodyAccMeanFreqY_
* _fBodyAccMeanFreqZ_
* _fBodyAccJerkMeanX_
* _fBodyAccJerkMeanY_
* _fBodyAccJerkMeanZ_
* _fBodyAccJerkStdX_
* _fBodyAccJerkStdY_
* _fBodyAccJerkStdZ_
* _fBodyAccJerkMeanFreqX_
* _fBodyAccJerkMeanFreqY_
* _fBodyAccJerkMeanFreqZ_
* _fBodyGyroMeanX_
* _fBodyGyroMeanY_
* _fBodyGyroMeanZ_
* _fBodyGyroStdX_
* _fBodyGyroStdY_
* _fBodyGyroStdZ_
* _fBodyGyroMeanFreqX_
* _fBodyGyroMeanFreqY_
* _fBodyGyroMeanFreqZ_
* _fBodyAccMagMean_
* _fBodyAccMagStd_
* _fBodyAccMagMeanFreq_
* _fBodyBodyAccJerkMagMean_
* _fBodyBodyAccJerkMagStd_
* _fBodyBodyAccJerkMagMeanFreq_
* _fBodyBodyGyroMagMean_
* _fBodyBodyGyroMagStd_
* _fBodyBodyGyroMagMeanFreq_
* _fBodyBodyGyroJerkMagMean_
* _fBodyBodyGyroJerkMagStd_
* _fBodyBodyGyroJerkMagMeanFreq_

##__Transformations__

The zip file containing the source data is located at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

The following transformations were applied to the source data:

* The training and test sets were merged to create one data set.
* The measurements on the mean and standard deviation (i.e. signals containing the strings mean and std) were extracted for each measurement, and the others were discarded.
* The activity identifiers (originally coded as integers between 1 and 6) were replaced with descriptive activity names.
* The variable names were replaced with descriptive variable names .
* The final data __(tidy_data.txt)__ set was created with the average of each variable for each activity and each subject.