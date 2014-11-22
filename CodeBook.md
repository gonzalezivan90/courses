## CodeBook 
#################

The script 'run_analisys' take a raw data and process it into a tidy data

The variables generated are:

- dataset: dataframe with 10299 observations and 16 variables:
  - recordID: An unique ID for each observation 
  - subID: An unique ID for each person
  - actID: A number representing the ativity
  - actName: The activity name derived from 'activity_labels.txt' file
  - tBodyAcc: The body mean and standart deviation acceleration. This name is repeated for each axis (X,Y, Z). That means that there six variables associated to this name.
  - tGravityAcc: The gravity mean and standart deviation acceleration. This name is repeated for each axis (X,Y, Z). That means that there six variables associated to this name.

- tidydataset: dataframe with 180 observations and 14 variables. This is a mean of each measuremenn by person by activity.
  - subID: An unique ID for each person
  - actName: The activity name derived from 'activity_labels.txt' file
  - tBodyAcc: The mean for each activity by person of the body mean and standart deviation acceleration original observations. This name is repeated for each axis (X,Y, Z). That means that there six variables associated to this name.
  - tGravityAcc: The mean for each activity by person of the gravity mean and standart deviation acceleration original observations. This name is repeated for each axis (X,Y, Z). That means that there six variables associated to this name. 

