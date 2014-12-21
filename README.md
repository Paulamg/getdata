============================
#Welcome to the
##Get data repo
============================

This is the github repository that contains all the files required
for the coursera Obtaining and cleaning Data course project.

The raw dataset used for the assignment is a Human Activity Recognition database 
built from the recordings of 30 subjects performing activities of daily living 
(ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

The database is available here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

A full description of the data is available at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The repository contains 4 files:
	- Codebook.md: Contains the basic information about the dataset "tidydata.txt"
	- README.MD
	- run_analysis.R: contains a script build up in R language using Rstudio 
	version 3.1.1. 
	- tidydata.txt: tidy data set obtained from the script explained above. 
	
#About the script run_analysis.R:
This code has all the steps required for obtaining the raw data of the course project
and processing it to obtain a tidy dataset as required.

At the beginning of the script the R packages required are loaded, however the required
packages are:
-plyr
-dplyr
-reshape2

The code performes the following steps:
1- Loads the packages required
2- Downloads the dataset from the url source, unzips it and sets the folder as the 
new working directory. Also it creates a vector called "datedownloaded" that stores
the date of download
3- loads the features files that contains the names of the measurement variables
4- Creates a subset with the number of row of the variables that measure means ("mean") or
standart deviation ("std")
5- Subsets the names of the target columns
6- Loads the datasets of the train and test groups data in 3 sets for each one:
 -The table with the measured variables, of which a subset is created with the variables
  that measure mean and std (train)
  -The data of the activity performed in each measurement (trainlab)
  -The list of subjects (trainsub)
  Finally the data is cbinded in one dataset for each group
7- The two datasets created are merged in one
8- The labels of the variable "Activity" are assigned
9- Create a new dataset by assigning the variables "Subject" and "Activity" as ID variables
and all the rest as measure variables (this is done by calling the list from the
vector created previously)
10-Summarize the tidy data set in a new one that displays the means of the values
grouped by "Subject" and "Activity"

The previous steps cover all the actions included in the assignment, i hope this is
understandable enough for whoever coursemate reads it!


==================================
Merry Christmas!



