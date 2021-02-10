1. First download the dataset from the following Link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Unzip it. Then set the working directory to the root of folder "UCI HAR Dataset"

The file run_analysis.R then performs the following steps described in the course project description

2. Loading the data to variables with appropriate names
    features <- features.txt
    activity_labels <- activity_labels.txt
    subject_train <- train/subject_train.txt
    x_train <- train/X_train.txt
    y_train <- train/y_train.txt
    subject_test <- test/subject_test.txt
    x_test <- test/X_test.txt
    y_test <- test/y_test.txt

3. Then Merging the train and test data into Merged_data using rbind and cbind.

4. Making dataset tidy by selecting subject and code from Merged_data and only applying on only mean and standard deviations(std).

5. All the code values on tidy_data is then replaced by descriptive names.

6. Applied various column name updates to update the column names with descriptive names.

7. From the data set obtained from last step, created a new tidy, independent data set with the average of each variable for each activity and each subject. 