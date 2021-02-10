### Loading data


features <- read.table("UCI HAR Dataset/features.txt", col.names = c("serial", "functions"))
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = c("subject"))
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = c("code"))

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = c("subject"))
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = c("code"))


### Merging data

X_data <- rbind(x_train, x_test)
Y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)
Merged_data <- cbind(X_data, Y_data, subject_data)

### Making Tidy data
#Extracting only the measurements on mean and standard deviation

tidy_data <- select(Merged_data, subject, code, contains("mean"), contains("std"))

#Setting up descriptive activity names

tidy_data$code <- activity_labels[tidy_data$code, 2]

#Setting up appropriate labels to the tidy data set

names(tidy_data)[2] <- "activity"
names(tidy_data) <- gsub("Acc", "Accleration", names(tidy_data))
names(tidy_data) <- gsub("Gyro", "Gyroscope", names(tidy_data))
names(tidy_data) <- gsub("Mag", "Magnitude", names(tidy_data))
names(tidy_data) <- gsub("BodyBody", "Body", names(tidy_data))
names(tidy_data) <- gsub("^t", "Time", names(tidy_data))
names(tidy_data) <- gsub("^f", "Frequency", names(tidy_data))
names(tidy_data) <- gsub("-mean()", "Mean", names(tidy_data), ignore.case = T)
names(tidy_data) <- gsub("-std()", "STD", names(tidy_data), ignore.case = T)
names(tidy_data) <- gsub("-freq()", "Frequency", names(tidy_data), ignore.case = T)
names(tidy_data) <- gsub("angle", "Angle", names(tidy_data))

### Creating a second independent data set with 

final_data <- tidy_data %>% group_by(activity, subject) %>% summarise_all(funs(mean))
write.table(final_data, "FinalData.txt")



