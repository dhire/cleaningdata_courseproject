## Filename: CodeBook.md
This file details the creation and naming of the tidy datasets created by the run_analysis.R script.

The complete set of 561 variables names associated with columns contained in both the test and training UCI HAR accelerometer datasets is located in file features.txt. Per project specifications only columns for mean and standard deviation are of interest and thus output datasets contain a select subset of columns.

Files used for test subjects are located in the folder C:\couresa\UCI HAR Dataset\test
X_test.txt contains the test subject accelerometry metrics for 561 variables
y_test.txt contains the subject’s activity for each row in X_test.txt
subject_test.txt contains the subject id (or identifier) for each row in X_test.txt
 
Files used for train subjects are located in the folder C:\couresa\UCI HAR Dataset\train
X_train.txt contains the test subject accelerometry metrics for 561 variables
y_train.txt contains the subject’s activity for each row in X_test.txt
subject_train.txt contains the subject id (or identifier) for each row in X_train.txt

Per project specifications, activity labels should be present in output datasets. 
The file C:\couresa\UCI HAR Dataset\activity_labels.txt contains the activity label corresponding to each activity id value. 

Processing flow for the run_analysis.R scripts follows:

1.	Read the activity labels ancillary data (activity_labels.txt)
2.	Read the accelerometry column names (features.txt ) and convert to a vector
3.	Create a vector of column names of column names containing mean() and std() 
4.	Read the test subject id file (subject_test.txt)
5.	Read the test subject activity file(y_test.txt)
6.	Column bind the subject subject id and activity id 
7.	Add the activity label to previous results
8.	Remove the activity id column from previous step
9.	Read the accelerometry variables (X_test.txt)
10.	Column bind the accelermetry variables with the subject id and activity label data to create complete test dataset
11.	Read the train subject id file (subject_train.txt)
12.	Read the train subject activity file(y_train.txt)
13.	Column bind the subject subject id and activity id 
14.	Add the activity label to previous results
15.	Remove the activity id column from previous step
16.	Read the accelerometry variables (X_train.txt)
17.	Column bind the accelermetry variables with the subject id and activity label data to create complete train dataset
18.	Create final data frame with both test and train data
19.	Read the colnames.csv file to create a vector of column names
20.	Write an output csv file from the final data frame using the column names input from above step
21.	The following steps create the summarized dataset
22.	Split the final dataset on subject id and activity label
23.	Calculate columns means on all accelerometry measures from split results
24.	Reformat results via transpose
25.	Create the subject id and activity label from the factors combination created in split function
26.	Combine the subject id and activity label and column means in a single data frame
27.	Remove any rownames and/or unneeded column
28.	Write an output csv file from the final means data frame using the column names input from step 19

The following lists the mapping of the column names found in the features.txt and variable names used in the tidy datasets created. 
ORIGINAL_NAME		NEWNAME
subjectid			subject_id
activity			activity_description
tBodyAcc-mean()-X		Xaxis_mean_tBodyAcc
tBodyAcc-mean()-Y		Yaxis_mean_tBodyAcc
tBodyAcc-mean()-Z		Zaxis_mean_tBodyAcc
tGravityAcc-mean()-X		Xaxis_mean_tGravityAcc
tGravityAcc-mean()-Y		Yaxis_mean_tGravityAcc
tGravityAcc-mean()-Z		Zaxis_mean_tGravityAcc
tBodyAccJerk-mean()-X		Xaxis_mean_tBodyAccJerk
tBodyAccJerk-mean()-Y		Yaxis_mean_tBodyAccJerk
tBodyAccJerk-mean()-Z		Zaxis_mean_tBodyAccJerk
tBodyGyro-mean()-X		Xaxis_mean_tBodyGyro
tBodyGyro-mean()-Y		Yaxis_mean_tBodyGyro
tBodyGyro-mean()-Z		Zaxis_mean_tBodyGyro
tBodyGyroJerk-mean()-X		Xaxis_mean_tBodyGyroJerk
tBodyGyroJerk-mean()-Y		Yaxis_mean_tBodyGyroJerk
tBodyGyroJerk-mean()-Z		Zaxis_mean_tBodyGyroJerk
tBodyAccMag-mean()		mean_tBodyAccMag
tGravityAccMag-mean()		mean_tGravityAccMag
tBodyAccJerkMag-mean()		mean_tBodyAccJerkMag
tBodyGyroMag-mean()		mean_tBodyGyroMag
tBodyGyroJerkMag-mean()		mean_tBodyGyroJerkMag
fBodyAcc-mean()-X		Xaxis_mean_fBodyAcc
fBodyAcc-mean()-Y		Yaxis_mean_fBodyAcc
fBodyAcc-mean()-Z		Zaxis_mean_fBodyAcc
fBodyAccJerk-mean()-X		Xaxis_mean_fBodyAccJerk
fBodyAccJerk-mean()-Y		Yaxis_mean_fBodyAccJerk
fBodyAccJerk-mean()-Z		Zaxis_mean_fBodyAccJerk
fBodyGyro-mean()-X		Xaxis_mean_fBodyGyro
fBodyGyro-mean()-Y		Yaxis_mean_fBodyGyro
fBodyGyro-mean()-Z		Zaxis_mean_fBodyGyro
fBodyAccMag-mean()		mean_fBodyAccMag
fBodyBodyAccJerkMag-mean()	mean_fBodyBodyAccJerkMag
fBodyBodyGyroMag-mean()		mean_fBodyBodyGyroMag
fBodyBodyGyroJerkMag-mean()	mean_fBodyBodyGyroJerkMag
tBodyAcc-std()-X		Xaxis_std_tBodyAcc
tBodyAcc-std()-Y		Yaxis_std_tBodyAcc
tBodyAcc-std()-Z		Zaxis_std_tBodyAcc
tGravityAcc-std()-X		Xaxis_std_tGravityAcc
tGravityAcc-std()-Y		Yaxis_std_tGravityAcc
tGravityAcc-std()-Z		Zaxis_std_tGravityAcc
tBodyAccJerk-std()-X		Xaxis_std_tBodyAccJerk
tBodyAccJerk-std()-Y		Zaxis_std_tBodyAccJerk
tBodyAccJerk-std()-Z		Yaxis_std_tBodyAccJerk
tBodyGyro-std()-X		Xaxis_std_tBodyGyro
tBodyGyro-std()-Y		Yaxis_std_tBodyGyro
tBodyGyro-std()-Z		Zaxis_std_tBodyGyro
tBodyGyroJerk-std()-X		Xaxis_std_tBodyGyroJerk
tBodyGyroJerk-std()-Y		Yaxis_std_tBodyGyroJerk
tBodyGyroJerk-std()-Z		Zaxis_std_tBodyGyroJerk
tBodyAccMag-std()		std_tBodyAccMag
tGravityAccMag-std()		std_tGravityAccMag
tBodyAccJerkMag-std()		std_tBodyAccJerkMag
tBodyGyroMag-std()		std_tBodyGyroMag
tBodyGyroJerkMag-std()		std_tBodyGyroJerkMag
fBodyAcc-std()-X		Xaxis_std_fBodyAcc
fBodyAcc-std()-Y		Yaxis_std_fBodyAcc
fBodyAcc-std()-Z		Zaxis_std_fBodyAcc
fBodyAccJerk-std()-X		Xaxis_std_fBodyAccJerk
fBodyAccJerk-std()-Y		Zaxis_std_fBodyAccJerk
fBodyAccJerk-std()-Z		Yaxis_std_fBodyAccJerk
fBodyGyro-std()-X		Xaxis_std_fBodyGyro
fBodyGyro-std()-Y		Yaxis_std_fBodyGyro
fBodyGyro-std()-Z		Zaxis_std_fBodyGyro
fBodyAccMag-std()		std_fBodyAccMag
fBodyBodyAccJerkMag-std()	std_fBodyBodyAccJerkMag
fBodyBodyGyroMag-std()		std_fBodyBodyGyroMag
fBodyBodyGyroJerkMag-std()	std_fBodyBodyGyroJerkMag


