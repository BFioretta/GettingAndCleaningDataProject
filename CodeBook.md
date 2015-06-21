## Getting and Cleaning Data Project Code Book
Describes the variables, the data, and any transformations or work that you performed to clean up the data
### Script
run_Analysis.R

### Variables
x_train Training set

x_test  Test set

x_MergedDataSet Merged x data set

label_train Training labels

label_test  Test labels

label_MergedDataSet Merged label data set

subject_train Training subject identifiers

subject_test  Test subject identifiers

subject_MergedDataSet Merged subject identifiers data set

meanStdCols mean and std columns

all_data bind all the data in a single data set

Tidy_Data <- ddply(all_data, .(Subject, Activity), function(x) colMeans(x[, 1:66]))

