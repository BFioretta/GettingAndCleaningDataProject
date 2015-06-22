## Getting and Cleaning Data Project Code Book
Describes the variables, the data, and any transformations or work that you performed to clean up the data
### Script
run_Analysis.R

Accomplishes the following tasks:

1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for 
each measurement. 

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names. 

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Variables
x_train - Training set

x_test - Test set

x_MergedDataSet - Merged x data set

label_train - Training labels

label_test  - Test labels

label_MergedDataSet - Merged label data set

subject_train - Training subject identifiers

subject_test  - Test subject identifiers

subject_MergedDataSet - Merged subject identifiers data set

meanStdCols - mean and std columns

all_data bind all the data in a single data set

Tidy_Data <- ddply(all_data, .(Subject, Activity), function(x) colMeans(x[, 1:66]))

### Data

Output file - Tidy_Data.txt

Clean file grouped by Subject and activity showing averages for each variable
