## Filename: README.md
## Github repo: cleaningdata_courseproject
## Author: Don Hire
## Date: August 23, 2014

#Files found in the cleaningdata_courseproject repository

README.md – this file 
run_analysis.R – a R script for managing the of the UCI HAR Dataset and outputting tidy datasets
CodeBook.md – documentation of data variables and data management methods
colnames.csv – comma separated file assigning variable labels (or names)

#
#Goals and Purpose
#
Create a single tidy dataset from test and training UCI HAR datasets for accelerometer variables representing means or standard deviation.

Create a single summarized tidy dataset from the assembled test and training data for each combination of subject and subject activity. Means (averages) are the summarized metric for each accelerometer variables.

#
# Pre execution requirements
#
Data to be processed was acquired from the following zip file
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The contents of the zip file are extracted to the folder c:\coursera\

#
# General processing methods
#
Datasets for subjects in the training cohort are found in three files; a file of subject identifiers, a file of activity identifiers, and a file containing all accelerometer measures. A complete training dataset results when all three files are assembled.  The test subject process is identical with file location and file names reflecting their test population affiliation. A complete subject dataset is created by appending the train and test datasets into a single dataset. 

Three ancillary/non subject specific datasets are utilized during processing. Two files are found within the UCI HAR Dataset; a file containing the variable (column) names of the accelerometer variables and a file of activity descriptions. A third (and optional file found in this repository) was used to rename the accelerometer variables in order to improve readability and naming standards.

#
# Misc/Other
#
The environment used in development was Microsoft Windows 7 and R (64 bit) 3.1.1

#
# execution
#
The run_analysis.R script define a function named tidy. Source the file and invoke with command > tidy().
If the function is invoked with assigment, ie. meansdataframe <- tidy(). The meansdataframe object is created as
a dataframe with of means for all columns labeled as either a mean or standard deviation. The summarization is for 
subject and activity. 

Invoking the tidy() function also outputs two CSV files. See CodeBook.md and comments in the run_analysis.R file for detail.
