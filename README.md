# Cleaning Data Project 1

Welcome to the "Cleaning Data Project 1". In this project - part of the Coursera Getting and Cleaning Data Course - the students have to demonsstrate their ability to clean and make tidey data. 

The following files give you an overview of the implemented results:

### run_analysis.R:

This is the analysis file that contains the R source code and produces the data set (this dataset is as well included in the git in the file "activitySubjectSummaries.txt"). The file is structured based on the project questions [source: assignment page]:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The resulting tidy dataset has **180 observations (30 subjects with 6 acitivties -> 180 observations) and 82 variables** (**Note**: In this data set, the activity is contains 2 times, once as number and once as descriptive activity; purpose: the numerical value might be useful for further analysis.)

### Codebook.md

The codebook, as expected contains a description of the final, tidy data set and all the transformations, which have been performed with the data.

