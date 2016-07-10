This Code Book is meant for describing how the script run_analysis.R works.

As described in the instructions of this programming assignment there are five tasks performed in the script run_analysis.R

1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement.
3. Use descriptive activity names to name the activities in the data set
4. Appropriately label the data set with descriptive variable names.
5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

Variables:

XTrain, XTest, YTrain, YTest, STrain, STest, contain the data from the file, which was provided for this programming assignment.
XALL, YALL and SALL are the variables for the merged data
features contains descriptions for the XALL data, which are then used to extract only mean and std values
activitylables contains activity descriptions, which is used to lable the dataset
ALL is the result of merging XALL, YALL and SALL
tidyAverage contains the mean aggregation of all columns by the columns subject and activity.
