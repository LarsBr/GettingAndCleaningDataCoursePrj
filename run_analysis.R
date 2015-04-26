# 
# You should create one R script called run_analysis.R that does the following. 

# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, 
#    creates a second, independent tidy data set 
#     with the average of each variable 
#                         for each activity and e
#                         ach subject.


library(reshape2)

# get activity_labels
activity_labels <- read.table("./activity_labels.txt",
                              col.names=c("activity_id", "activity_name"))

# read features and get names of features
features <- read.table("features.txt")
featureNames <- features[,2]

# read xtest data and assign feature names to columns
test <- read.table("./test/X_test.txt")
colnames(test) <- featureNames

# read xtrain data and assign feature names to columns
train <- read.table("./train/X_train.txt")
colnames(train) <- featureNames

# read subject training data and set column name
train_subject_id <- read.table("./train/subject_train.txt")
colnames(train_subject_id) <- "subject_id"

# read subject test data and set column name
test_subject_id <- read.table("./test/subject_test.txt")
colnames(test_subject_id) <- "subject_id"

# read activity training data and set column name
train_activity_id <- read.table("./train/y_train.txt")
colnames(train_activity_id) <- "activity_id"

# read activity test data and set column name
test_activity_id <- read.table("./test/y_test.txt")
colnames(test_activity_id) <- "activity_id"

# glue test data together
testData <- cbind(test_subject_id , test_activity_id , test)

# glue training data togehter
trainData <- cbind(train_subject_id , train_activity_id , train)

# Merge train and test data
tnt_data <- rbind(testData, trainData)

# get column names that contain "mean"
# create index vector for those columns
meanCol <- grep("mean",names(tnt_data), ignore.case=TRUE)
meanNames <- names(tnt_data)[meanCol]

# get column names that contain "std"
# create index vector for those columns
sdCol <- grep("std", names(tnt_data), ignore.case=TRUE)
sdNames <- names(tnt_data)[sdCol]

# select only the data from the mean and std columns
tnt_means_sd <- tnt_data[,c("subject_id", "activity_id",
                      meanNames, sdNames)]

# join the activity labels to the data
act_means_sd <- merge(activity_labels   , tnt_means_sd, 
                      by.x="activity_id", by.y="activity_id", all=TRUE)

# select subset of columns for requirement 5
avg_data <- melt(act_means_sd, id=c("activity_id", "activity_name", "subject_id"))

# turn data around
avg_data <- dcast(avg_data, activity_id + activity_name + subject_id ~ variable, mean)

write.table(avg_data,"./tidy_data.txt")