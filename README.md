
## Getting and Cleaning Data Course Project
The complete requirments for this project is as follows. 

1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement. 
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive activity names. 
5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Initial Setup and environment
This applies to R studio running on a Windows 7 OS
* First you need to ensure that the working directory is set to UCI HAR Dataset, e.g.
the following code sets the working dir to C:/Coursera/CleaningData/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset
setwd("C:/Coursera/CleaningData/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset")

* This code uses the plyr library, heres an example from to add this lib from my set up.
library("plyr", lib.loc="C:/cygwin/R/win-library/3.0")

* Code file named run_analysis.R needs to be in the working dir., then execution of the script 
source("run_analysis.R") will run the program

## Details of Code Execution
I have documented my assumptions and methodolgy for each requiement in the following sections.
The code is in the file named run_analysis.R and is split into steps 1-6 for convenience purposes.
I decided it was better to duplicate some of the operations carried out on the test and train data 
as it was easier to follow in a sequencial manner in my opinion


## 1. Merge the training and the test sets to create one data set.
This occurs in step 3, the training and test data sets are rbind'ed together. 
I decided it was best for carry out the operations on Test and Training data prior to joining the datasets.

## 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
All features with a description of mean() or std() were extracted for these subsets. The relevent code is in 
Step 2 for the test data and Step 3 for the Training data.  I did not extract the meanFreq() features 
as it referred to a weighted average and I did not consider that a "mean" for the purposes of this assignment.



##3.Uses descriptive activity names to name the activities in the data set

This occurs in Step 1 for the Test data and Step 2 for the Training Data.
This uses the join function from the plyr package, and the program will fail if this package os not added.





##4.Appropriately labels the data set with descriptive activity names. 
I believe that it is not advisable to have excessiviyl long names, so I have kept the original data set names and used them for the tidy data set, however I have 
cleaned up the column names a little. 
In Step 5 the column names are all converted to lower case, the brackets are removed and the first 2 columns have been assigned the column names "subject" and "activity



##5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

This occurs in step 4, where a data set named avgBySubject is created.
In Step 5 this data set is writted to file and a file named output.csv is created in the working directory.
Please note ,  the code writing the file has been disabled.  The data set and displayed to the console


