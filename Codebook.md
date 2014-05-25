
 ##File Name run_analysis.R
 

The code is in the file named run_analysis.R and is split into steps 1-6 for convenience purposes.
I decided it was better to duplicate some of the operations carried out on the test and train data 
as it was easier to follow in a sequencial manner in my opinion

## Step 1  and Step 2 have the following variables and datasets. 
Step 1 gets the TEST data and processes it.
Step 2 gets the TRAINING data and processes it.
They use the following variables 
* features  : Holds the data from csv file features.txt
* measures :  Holds the data from x_test.txt
* activity  : Holds the data from y_test.txt
* activity_labels : Holds the data from activity_labels.txt
* md : This is a utility dataset used to join the activity and activity_labels datasets 
* subjects : Holds the data from subject_test.txt
* subsetMeanData  :  A utility subset holding the "mean" data points from the measures dataset
* subsetMeanData  :  A utility subset holding the "standard dev. data points from the measures dataset
* dfTestData : A  data frame  combining the extracted datasets subsetMeanData and subsetMeanData, the subject id's from subjects and activity details from activity 
are added to this set.
* dfTrainData : A  data frame  combining the extracted datasets subsetMeanData and subsetMeanData, the subject id's from subjects and activity details from activity 
are added to this set.



## Step 3
* completeDF : this variable combines the two datasets dfTestData and  dfTrainData.


## Step 4 and 5
* avgBySubject : This data frame  has the tidy data set, it has the mean and standard dev. for each subject for each activity.
Step 5 cleans up this data.


