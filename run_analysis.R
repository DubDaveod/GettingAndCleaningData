#
#	File Name	: run_analysis.R
#	Date		: 23 May 2014
#	Purpose		: Peer evaluation assesment for Coursera course Getting and Cleaning Data	
#
# Instructions for Assignment

# 1) a tidy data set as described below, 
# 2) a link to a Github repository with your script for performing the analysis, and 
# 3) a code book that describes the variables, the data, and any transformations or work that you 
# performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts
#
#


#You should create one R script called run_analysis.R that does the following. 
#1.Merges the training and the test sets to create one data set.
#2.Extracts only the measurements on the mean and standard deviation for each measurement. 
#3.Uses descriptive activity names to name the activities in the data set
#4.Appropriately labels the data set with descriptive activity names. 
#5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 


setwd("C:/R_Coursera/CleaningData/Project/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset")

# add the plyr library
#library("plyr", lib.loc="C:/cygwin/R/win-library/3.0")


##########################################################
#       STEP 1
# This is the section which gets the TEST data.
# The program operates initially on the test data, 
# then on the Training data and finally the two sets
# are joined.
##########################################################

## get the Test data initially 
# test measures

features<- read.csv("./features.txt", sep="", header=FALSE)
colnames(features) <- c( "idx", "description")
#//
# test measures
measures<- read.csv("./test/x_test.txt", sep="", header=FALSE)
colnames(measures) <- features$description
#//
# test activity
activity<- read.csv("./test/y_test.txt", sep="", header=FALSE)
colnames(activity) <- c( "activity_id")

# get the activity text names
activity_labels<- read.csv("./activity_labels.txt", sep="", header=FALSE)
colnames(activity_labels) <- c( "activity_id", "activity")

# join the text names to numbers
md<- join(activity , activity_labels ,  by="activity_id")


# test subject ID's
subjects<- read.csv("./test/subject_test.txt", sep="", header=FALSE)
colnames(subjects) <- c( "subject")

#//
# Extract the stddev() and mean() data points 

# identify the columns which are mean() attributes for the measures and 
# extract into a subset
subsetMeanData<-measures[, grep("[A-Z,a-z]-mean\\()" , colnames(measures)) ]


# identify the columns which are std() attributes for the measures and 
# extract into a subset
subsetStdData<-measures[, grep("[A-Z,a-z]-std\\()" , colnames(measures)) ]
#//

# create anew data set with just mean() and std() column data
dfTestData <- cbind(subsetMeanData, subsetStdData)
# add the subject ids as columns
dfTestData <- cbind(dfTestData, subjects)
# add the activity names  as columns
dfTestData <- cbind(dfTestData, md$activity)



##########################################################
#  STEP 2
# This is the section which cleans up the TRAINING data.
# It operates in the same way as the previous section. 
##########################################################
# train measures
measures<- read.csv("./train/x_train.txt", sep="", header=FALSE)
colnames(measures) <- features$description
#//

# train activity
activity<- read.csv("./train/y_train.txt", sep="", header=FALSE)
colnames(activity_labels) <- c( "activity_id", "activity")

colnames(activity) <- c( "activity_id")

# merge the activity ids and text names
md<- join(activity , activity_labels ,  by="activity_id")



# train subject ID's
subjects<- read.csv("./train/subject_train.txt", sep="", header=FALSE)
colnames(subjects) <- c( "subject")

#//
# identify the columns which are mean() attributes for the measures and 
# extract into a subset
subsetMeanData<-measures[, grep("[A-Z,a-z]-mean\\()" , colnames(measures)) ]

# identify the columns which are std() attributes for the measures and 
# extract into a subset
subsetStdData<-measures[, grep("[A-Z,a-z]-std\\()" , colnames(measures)) ]


  
# now we have the training data, add the subject and activity columns
dfTrainData <- cbind(subsetMeanData, subsetStdData)
dfTrainData <- cbind(dfTrainData, subjects)
dfTrainData <- cbind(dfTrainData, md$activity)


####################################
#   STEP 3 Combine the 2 datasets into 
#   a dataset named completeDF
#
#####################################


# now we have the training and test data combined
completeDF <- rbind(dfTrainData, dfTestData)


##########################################
#   STEP 4
#   Get the new tidy data set subset
#   this is named avgBySubject
#########################################

# get the average of each metric per subject per activity
avgBySubject<-aggregate(completeDF[,1:66],by=list(completeDF[,68] ,completeDF$subject ), mean)

##########################################
#   STEP 5
#   clean up the column names
#########################################

colnames(avgBySubject) = tolower(colnames(avgBySubject))
colnames(avgBySubject)= gsub("\\(\\)", "", names(avgBySubject))
colnames(avgBySubject)= gsub("group.1", "activity", names(avgBySubject))
colnames(avgBySubject)= gsub("group.2", "subject", names(avgBySubject))


##########################################
#   STEP 6
#   OUTPUT Formats, console and write file 
#   named output.csv to working directory
#########################################
# disabled, to write file to working dir enable the following code
#write.csv(avgBySubject,file="./output.txt", row.names = FALSE )

print (avgBySubject)

