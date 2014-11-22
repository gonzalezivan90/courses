courses
=======

Material for several courses

In this section you will fount the code 'run_anallisys.r". With it you can use the information from the next link to generate a tidy data set.
You only need to download de data and put yor folder path into 'rootDir' variable.

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The code have seven (7) steps and are described bellow:

1. Set the 'rootDir' variable indicating where are the 'UCI HAR Dataset' folder
2. Indicate the required .txt files to be loaded in R 
3. Load the requiered files 
4. Merge and sorting 'train' and 'test' files. Add the 'actName' variable in a equivalent to activity ID
5. Select he variables fom X files that contain the measurements on the mean and standard deviation for each measurement. In this case we only select the variables BodyAcc and GravityAcc (for mean and sd in each axis) due these are direct measurements.
6. Binding 'train' and 'test' datasets with selected variables. This step will generate de 'dataset' variable with all information
7. Generate a second tidy dataset for step 5 in the course project called 'tidydataset' that will be exported as .txt file in rootDir path
