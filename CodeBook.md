# CodeBook

This code book describes the transformation and variable (feature) descriptions for the Project Assignment 1 of the Coursera Course Getting and Cleaning Data. 

### Data Transformation

The following transformation have been made:

1. Test and training data has been merged to one big dataset (source: x_test.txt, x_train.txt)
2. Variables have been selected that contain mean (first variables in the data) and std (last variables in the data) (source: features.txt)
3. Descriptive variable names have been assigned to the data set (source: features.txt).
4. The activity of the persons (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) has been assigned to the dataset. Here, both, the activity number and the activity name was assigned (Source files: activity_labels.txt, y_train.txt, y_test.txt)
5. The subjects have been assigned to the dataset as well (source: subject_train.txt, subject_test.txt)

### Variable/Feature description

The final data set contains 180 observations (one per subject (30) in relation to her activity(6)). For each observation, we have 82 variables:

1. First the subject. values 1-30
2. Then the activity name (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
3. Then 46 mean measuremenet parameters from the mean values in the data set
4. Then 33 mean measurement parameters from the std values in the data set.
5. The activity number (relation to the activity name)

For more information about the measurements, please consult the assocaiated publication:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

