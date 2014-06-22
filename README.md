Data was obtained from
		http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data files from folders test and train folders were used for creating Tidy Data. Have the "test" and "train" folders are in working directory for "run_analysis.R to read necessary  data files
Have Files activity_labels.txt,features.txt in working directory 

X_train.txt  has 7352 records with 561 columns
Y_train.txt  has 7352 records with one column for activity code

X_test.txt  has 2947 records with 561 columns
Y_test.txt  has 2947 records with one column for activity code

1. Created a Data frame for X_test.txt and Y_test.txt
2. Import the column of Activity from Dataframe of Y_test.txt and suject_test.txt into Dataframe of X_test.txt

3. Created a Data frame for X_train.txt and Y_train.txt
4. Import the column of Activity from Dataframe of Y_train.txt and suject_train.txt into Dataframe of X_train.txt

5. Combine data frames of X_train.txt and X_test.txt

6. change activity code in combined data frame of Training and Test Data set are changed to reflect activity labels

7 On investigating features.txt document found in folder UCIHAR Dataset, it was realized documents X_train.txt and X_Test.txt documents carry 561 attributes related to measurements from accelerometer and gyroscope.

8. Dataset required for the current study requires only following attributes: (identified using grep() to search for mean() and std() from features.txt.
	Corresponding meaningful labels assigned to them are listed on right hand side.

1 tBodyAcc-mean()-X 	 TBACCMEANX
2 tBodyAcc-mean()-Y	 TBACCMEANY
3 tBodyAcc-mean()-Z	 TBACCMEANZ
4 tBodyAcc-std()-X	 TBACCSTDX
5 tBodyAcc-std()-Y	 TBACCSTDY
6 tBodyAcc-std()-Z	 TBACCSTDZ
41 tGravityAcc-mean()-X	 TGACCMEANX
42 tGravityAcc-mean()-Y	 TGACCMEANY
43 tGravityAcc-mean()-Z	 TGACCMEANZ
44 tGravityAcc-std()-X	 TGACCSTDX
45 tGravityAcc-std()-Y	 TGACCSTDY
46 tGravityAcc-std()-Z	 TGACCSTDZ
81 tBodyAccJerk-mean()-X	 TBACCJRKMNX
82 tBodyAccJerk-mean()-Y	 TBACCJRKMNY
83 tBodyAccJerk-mean()-Z	 TBACCJRKMNZ
84 tBodyAccJerk-std()-X	 TBACCJRKSTX
85 tBodyAccJerk-std()-Y	 TBACCJRKSTY
86 tBodyAccJerk-std()-Z	 TBACCJRKSTZ
121 tBodyGyro-mean()-X	 TBACCGYRMNX
122 tBodyGyro-mean()-Y	 TBACCGYRMNY
123 tBodyGyro-mean()-Z	 TBACCGYRMNZ
124 tBodyGyro-std()-X	 TBACCGYRSTX
125 tBodyGyro-std()-Y	 TBACCGYRSTY
126 tBodyGyro-std()-Z	 TBACCGYRSTZ
161 tBodyGyroJerk-mean()-X	 TBACCGYRJRKMNX
162 tBodyGyroJerk-mean()-Y	 TBACCGYRJRKMNY
163 tBodyGyroJerk-mean()-Z	 TBACCGYRJRKMNZ
164 tBodyGyroJerk-std()-X	 TBACCGYRJRKSTX
165 tBodyGyroJerk-std()-Y	 TBACCGYRJRKSTY
166 tBodyGyroJerk-std()-Z	 TBACCGYRJRKSTZ
201 tBodyAccMag-mean()	 TBACCMAGMEAN
202 tBodyAccMag-std()	 TBACCMAGSTD
214 tGravityAccMag-mean()	 TGACCMAGMEAN
215 tGravityAccMag-std()	 TGACCMAGMEAN
227 tBodyAccJerkMag-mean()	 TBACCJRKMAGMEAN
228 tBodyAccJerkMag-std()	 TBACCJRKMAGSTD
240 tBodyGyroMag-mean()	 TBACCGYRMAGMEAN
241 tBodyGyroMag-std()	 TBACCGYRMAGSTD
253 tBodyGyroJerkMag-mean()	 TBACCGYRJRKMAGMEAN
254 tBodyGyroJerkMag-std()	 TBACCGYRJRKMAGMEAN
266 fBodyAcc-mean()-X	 FBACCMEANX
267 fBodyAcc-mean()-Y	 FBACCMEANY
268 fBodyAcc-mean()-Z	 FBACCMEANZ
269 fBodyAcc-std()-X	 FBACCSTDX
270 fBodyAcc-std()-Y	 FBACCSTDY
271 fBodyAcc-std()-Z	 FBACCSTDZ
345 fBodyAccJerk-mean()-X	 FBACCJRKMNX
346 fBodyAccJerk-mean()-Y	 FBACCJRKMNY
347 fBodyAccJerk-mean()-Z	 FBACCJRKMNZ
348 fBodyAccJerk-std()-X	 FBACCGYRJRKSTX
349 fBodyAccJerk-std()-Y	 FBACCGYRJRKSTY
350 fBodyAccJerk-std()-Z	 FBACCGYRJRKSTZ
424 fBodyGyro-mean()-X	 FBACCGYRMNX
425 fBodyGyro-mean()-Y	 FBACCGYRMNY
426 fBodyGyro-mean()-Z	 FBACCGYRMNZ
427 fBodyGyro-std()-X	 FBACCGYRSTX
428 fBodyGyro-std()-Y	 FBACCGYRSTY
429 fBodyGyro-std()-Z	 FBACCGYRSTZ
503 fBodyAccMag-mean()	 FBACCMAGMEAN
504 fBodyAccMag-std()	 FBACCMAGSTD
516 fBodyBodyAccJerkMag-mean()	 FBBACCJRKMAGMEAN
517 fBodyBodyAccJerkMag-std()	 FBBACCJRKMAGSTD
529 fBodyBodyGyroMag-mean()	 FBBACCGYRMAGMEAN
530 fBodyBodyGyroMag-std()	 FBBACCGYRMAGSTD
542 fBodyBodyGyroJerkMag-mean()	 FBBACCGYRJRKMAGMEAN
543 fBodyBodyGyroJerkMag-std()	 FBBACCGYRJRKMAGSTD
