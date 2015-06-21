# Step 1 - Merges the training and test sets to create one data set
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")              #Training set
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")                 #Test set
x_MergedDataSet <- rbind(x_train, x_test)                               #Merged x data set

label_train <- read.table("UCI HAR Dataset/train/y_train.txt")          #Training labels
label_test <- read.table("UCI HAR Dataset/test/y_test.txt")             #Test labels
label_MergedDataSet <- rbind(label_train, label_test)                   #Merged label data set

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")  #Training subject identifiers
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")     #Test subject identifiers
subject_MergedDataSet <- rbind(subject_train, subject_test)             #Merged subject identifiers data set

# Step 2 -  Extracts only the measurements on the mean and standard deviation for each measurement
features <- read.table("UCI HAR Dataset/features.txt")

meanStdCols <- grep("-(mean|std)\\(\\)", features[, 2])                 #mean and std columns
x_MergedDataSet <- x_MergedDataSet[, meanStdCols]                       #subset the desired columns 
names(x_MergedDataSet) <- features[meanStdCols, 2]                      #change column names to match features.txt

# Step 3 - Use descriptive activity names to name the activities in the data set
ActivityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
y_MergedDataSet[, 1] <- ActivityLabels[y_MergedDataSet[, 1], 2]         #Update values with descriptive names from Activity_labels.txt
names(y_MergedDataSet) <- "Activity"                                    #Update column name

# Step 4 - Appropriately label the data set with descriptive variable names
names(subject_MergedDataSet) <- "Subject"
all_data <- cbind(x_MergedDataSet, y_MergedDataSet, subject_MergedDataSet)  #bind all the data in a single data set

# Step 5 - Create a second, independent tidy data set with the average of each variable for each activity and each subject
Tidy_Data <- ddply(all_data, .(Subject, Activity), function(x) colMeans(x[, 1:66]))
write.table(Tidy_Data, "Tidy_Data.txt", row.name=FALSE)
