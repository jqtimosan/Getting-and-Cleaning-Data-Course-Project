library(dplyr)

##############################################################################
# Downloading zip file dataset from the source UCI 
#############################################################################

#download the data from the source, if the file does not exists
source <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
uci_zipfile <- "UCI Har Dataset.zip"

if (!file.exists(uci_zipfile)) {
        download.file(source, uci_zipfile, mode = "rt")
}

# unzip the zip file containing data in the specified datapath, if the if the file does not exists.
dataPath <- "E:/MY Files/UCI Har Dataset/"
if (!file.exists(dataPath)) {
        unzip(uci_zipFile)
}

##############################################################################
# Read the tables from the unzip files 
##############################################################################

# read training and test data
training_Subjects <- read.table(file.path(dataPath, "train", "subject_train.txt"))
test_Subjects <- read.table(file.path(dataPath, "test", "subject_test.txt"))

training_Values <- read.table(file.path(dataPath, "train", "X_train.txt"))
test_Values <- read.table(file.path(dataPath, "test", "X_test.txt"))

training_Activity <- read.table(file.path(dataPath, "train", "y_train.txt"))
test_Activity <- read.table(file.path(dataPath, "test", "y_test.txt"))


##############################################################################
# Task #1 - Merge the training and the test sets to create one data set
##############################################################################

# concatenate the two individual data tables to make single data table
contatenated <- rbind(
        cbind(training_Subjects, training_Values, training_Activity),
        cbind(test_Subjects, test_Values, test_Activity))

# read features, don't convert text labels to factors
features <- read.table(file.path(dataPath, "features.txt"), as.is = TRUE)

# read activity labels
activities <- read.table(file.path(dataPath, "activity_labels.txt"))
colnames(activities) <- c("activityId", "activityLabel")

# assign column names
colnames(contatenated) <- c("subject", features[, 2], "activity")


##############################################################################
# Task #2 - Extract only the measurements on the mean and standard deviation
#          for each measurement
##############################################################################

# extract columns with names Measurements on the Mean and Standard deviation
columnsOfInterest <- grepl("subject|activity|mean|std", colnames(contatenated))

# ... and keep data in these columns only
contatenated <- contatenated[, columnsOfInterest]


##############################################################################
# Task #3 - Use descriptive activity names to name the activities in the data
#          set
##############################################################################

# replace activity values with named factor levels
contatenated$activity <- factor(contatenated$activity, 
                                 levels = activities[, 1], labels = activities[, 2])


##############################################################################
# Task #4 - Appropriately label the data set with descriptive variable names
##############################################################################

# extract column names
contatenatedCols <- colnames(contatenated)

# remove special characters from the data set
contatenatedCols <- gsub("[\\(\\)-]", "", contatenatedCols)

# expand abbreviations and clean up names
contatenatedCols <- gsub("^f", "frequencyDomain", contatenatedCols)
contatenatedCols <- gsub("^t", "timeDomain", contatenatedCols)
contatenatedCols <- gsub("Acc", "Accelerometer", contatenatedCols)
contatenatedCols <- gsub("Gyro", "Gyroscope", contatenatedCols)
contatenatedCols <- gsub("Mag", "Magnitude", contatenatedCols)
contatenatedCols <- gsub("Freq", "Frequency", contatenatedCols)
contatenatedCols <- gsub("mean", "Mean", contatenatedCols)
contatenatedCols <- gsub("std", "StandardDeviation", contatenatedCols)

# correct typo
contatenatedCols <- gsub("BodyBody", "Body", contatenatedCols)

# use new labels as column names
colnames(contatenated) <- contatenatedCols


##############################################################################
# Task #5 - Create a second, independent tidy set with the average of each
#          variable for each activity and each subject
##############################################################################

# group by subject and activity and summarise using mean
contatenatedMeans <- contatenated %>% 
        group_by(subject, activity) %>%
        summarise_each(funs(mean))

# output to file "tidy_data.txt"
write.table(contatenatedMeans, "tidy_data.txt", row.names = FALSE, 
            quote = FALSE)

contatenatedCols <- gsub("BodyBody", "Body", contatenatedCols)

# use new labels as column names
colnames(contatenated) <- contatenatedCols

# group by subject and activity and summarise using mean
contatenatedMeans <- contatenated %>% 
        group_by(subject, activity) %>%
        summarise_each(funs(mean))

# output to file "tidy_data.txt"
write.table(contatenatedMeans, "tidy_data.txt", row.names = FALSE, 
            quote = FALSE)