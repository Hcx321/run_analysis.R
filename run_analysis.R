## Read file

filename <- "getdata_projectfiles_UCI HAR Dataset"
FileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,filename)
unzip(filename)

x_test <- read.table("UCI HAR Dataset/train/X_test.txt")
y_test <- read.table("UCI HAR Dataset/train/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/train/subject_test.txt")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")


## step1: Merges the training and the test sets to create one data set

merge_test <- cbind(x_test,y_test,subject_test)
merge_train <- cbind(x_train,y_train,subject_train)
merge_all <- rbind(merge_test,merge_train)


## step2: Extracts only the measurements on the mean and standard deviation for each measurement

features <- read.table("UCI HAR Dataset/features.txt")
features_meanstdev <- merge_all[grep("mean","std"),features]
data_meanstdev = features_meanstdev

## step3: Uses descriptive activity names to name the activities in the data set

activity_labels = read.table("UCI HAR Dataset/activity_labels.txt")
data_activity = activity_labels


## step4: Approximately labels the data set with descriptive variable names

features_activity <-merge(data_meanstdev, data_activity)


## step5: From the data set in step 4, creates a second, independently tidy data set with the average
## of each variable for each activity and each subject.

data_second <-features_activity(activity2=features(merge_all),subject2=features(merge_all))


write.table("tidydata.txt")
