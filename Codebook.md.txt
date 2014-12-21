###Codebook for the tidydata.txt file

This codebook contains a description of the tidydata.txt dataset, which
contains the Means of the values obtained by a gyroscope used by a person
grouped by the Subject who performed the action and the activity done.

For further reading about the origins and contents of the data read the
README.MD file contained in this repo.

The data measures 3 variables:
-Subject: 
	Type: Integer
	Description: Subject that performed the activity, there are 30 subjects
	Values: 1-30
	
-Activity
	Type: Factor
	Description: Activity performed
	Levels: 1-6
	Labels: 1 WALKING
			2 WALKING_UPSTAIRS
			3 WALKING_DOWNSTAIRS
			4 SITTING
			5 STANDING
			6 LAYING
			
-mean(value)
	Type: numeric
	Description: Means of the values obtained in different measurements when grouped
	by Subject and Activity
