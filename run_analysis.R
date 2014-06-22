    
# Load data files
rm(list=ls())
ls()
# -----------TEST DATA-------------------------------------------
# Data Frame for X_test 
destfile_TSTX <-".\\test\\X_test.txt"
X_test_DF <- read.table(destfile_TSTX,  colClasses = "numeric", nrows=2947)


# Data Frame for Y_test 
destfile_TSTY <-".\\test\\Y_test.txt"
Y_test_DF <- read.table(destfile_TSTY,  colClasses = "numeric", nrows=2947)


# Data Frame for suject_test
destfile_subj <-".\\test\\subject_test.txt"
subject_test_DF <- read.table(destfile_subj,  colClasses = "numeric", nrows=2947)
 
# combine X_test_DF & Y_test_DF & subject_DF
XY_test_DF <-  cbind(X_test_DF,Y_test_DF,subject_test_DF)

#-----------------------------------------------------------------
# -----------TRAIN DATA-------------------------------------------
# Data Frame for X_train 
destfile_TRNX <- ".\\train\\X_train.txt"
X_train_DF <- read.table(destfile_TRNX,  colClasses = "numeric", nrows=7352)

# Data Frame for Y_train
destfile_TRNY <- ".\\train\\Y_train.txt"
Y_train_DF <- read.table(destfile_TRNY,  colClasses = "numeric", nrows=7352)

# Data Frame for suject_train
destfile_subjT <-".\\train\\subject_train.txt"
subject_train_DF <- read.table(destfile_subjT,  colClasses = "numeric", nrows=7352)

# combine X_train_DF & Y_train_DF 
XY_train_DF <-  cbind(X_train_DF,Y_train_DF,subject_train_DF)

# Bind the rows of Test and  Train datasets
combined_DF <- rbind(XY_test_DF,XY_train_DF)

## Chose column #s features which measures mean or std values
destfileFea <-".\\features.txt"
features_DF <- read.table(destfileFea, colClasses ="character", nrow=561)

feature_chosen_mean <- grep("-mean()",features_DF$V2,  fixed = TRUE)
feature_chosen_std <- grep("-std()",features_DF$V2,  fixed = TRUE)

# Combine the vectors and sort them 
features_chosen <- sort(c(feature_chosen_mean, feature_chosen_std))

#-----------------------------------------------------------------

## Read Activity labels
destfile_Act <-".\\activity_labels.txt"
activity_DF <- read.table(destfile_Act,  nrow=6)

## create a column to represent actual activity that represent activity code
combined_DF[,c(564)] <- NA  # first create a row filled with 'NA'
combined_DF[,c(564)][combined_DF[,c(562)] == 1] <-  as.character(activity_DF[1,2])
combined_DF[,c(564)][combined_DF[,c(562)] == 2] <-  as.character(activity_DF[2,2])
combined_DF[,c(564)][combined_DF[,c(562)] == 3] <-  as.character(activity_DF[3,2])
combined_DF[,c(564)][combined_DF[,c(562)] == 4] <-  as.character(activity_DF[4,2])
combined_DF[,c(564)][combined_DF[,c(562)] == 5] <-  as.character(activity_DF[5,2])
combined_DF[,c(564)][combined_DF[,c(562)] == 6] <-  as.character(activity_DF[6,2])
#------------------------------------------------------------------------------------
# select those 66 features and ACTIVITY for Tidy Data

combined_DF_selected <- combined_DF[,c(features_chosen[1:66],563,564)]

# Change column names to meaningful names
colnames(combined_DF_selected) <- c("TBACCMEANX","TBACCMEANY","TBACCMEANZ","TBACCSTDX","TBACCSTDY","TBACCSTDZ","TGACCMEANX","TGACCMEANY","TGACCMEANZ","TGACCSTDX","TGACCSTDY","TGACCSTDZ","TBACCJRKMNX","TBACCJRKMNY","TBACCJRKMNZ","TBACCJRKSTX","TBACCJRKSTY","TBACCJRKSTZ","TBACCGYRMNX","TBACCGYRMNY","TBACCGYRMNZ","TBACCGYRSTX","TBACCGYRSTY","TBACCGYRSTZ","TBACCGYRJRKMNX","TBACCGYRJRKMNY","TBACCGYRJRKMNZ","TBACCGYRJRKSTX","TBACCGYRJRKSTY","TBACCGYRJRKSTZ","TBACCMAGMEAN","TBACCMAGSTD","TGACCMAGMEAN","TGACCMAGMEAN","TBACCJRKMAGMEAN","TBACCJRKMAGSTD","TBACCGYRMAGMEAN","TBACCGYRMAGSTD","TBACCGYRJRKMAGMEAN","TBACCGYRJRKMAGMEAN","FBACCMEANX","FBACCMEANY","FBACCMEANZ","FBACCSTDX","FBACCSTDY","FBACCSTDZ","FBACCJRKMNX","FBACCJRKMNY","FBACCJRKMNZ","FBACCGYRJRKSTX","FBACCGYRJRKSTY","FBACCGYRJRKSTZ","FBACCGYRMNX","FBACCGYRMNY","FBACCGYRMNZ","FBACCGYRSTX","FBACCGYRSTY","FBACCGYRSTZ","FBACCMAGMEAN","FBACCMAGSTD","FBBACCJRKMAGMEAN","FBBACCJRKMAGSTD","FBBACCGYRMAGMEAN","FBBACCGYRMAGSTD","FBBACCGYRJRKMAGMEAN","FBBACCGYRJRKMAGSTD","SUBJECT","ACTIVITY")

# check for NA values
all(colSums(is.na(combined_DF_selected))==0)
# Returns TRUE; it means there are no "NA"
# Hence the data is tidy

# Save the data as TidyData.txt
write.csv(combined_DF_selected, file='TidyData.txt',row.names = FALSE)


######## Question 5 ########
by1 <- as.factor(combined_DF_selected$SUBJECT)
by2 <- as.factor(combined_DF_selected$ACTIVITY) 

#Trim tidy data to measured variables
combined_DF_minus_subj_activ <- combined_DF_selected[,c(1:66)]

# Carry out grouping
TidyDataMean<- aggregate(combined_DF_minus_subj_activ,  by= list(by1,by2), FUN = "mean")
# change column names to be meaning ful
colnames(TidyDataMean) <- c("SUBJECT","ACTIVITY","TBACCMEANX","TBACCMEANY","TBACCMEANZ","TBACCSTDX","TBACCSTDY","TBACCSTDZ","TGACCMEANX","TGACCMEANY","TGACCMEANZ","TGACCSTDX","TGACCSTDY","TGACCSTDZ","TBACCJRKMNX","TBACCJRKMNY","TBACCJRKMNZ","TBACCJRKSTX","TBACCJRKSTY","TBACCJRKSTZ","TBACCGYRMNX","TBACCGYRMNY","TBACCGYRMNZ","TBACCGYRSTX","TBACCGYRSTY","TBACCGYRSTZ","TBACCGYRJRKMNX","TBACCGYRJRKMNY","TBACCGYRJRKMNZ","TBACCGYRJRKSTX","TBACCGYRJRKSTY","TBACCGYRJRKSTZ","TBACCMAGMEAN","TBACCMAGSTD","TGACCMAGMEAN","TGACCMAGMEAN","TBACCJRKMAGMEAN","TBACCJRKMAGSTD","TBACCGYRMAGMEAN","TBACCGYRMAGSTD","TBACCGYRJRKMAGMEAN","TBACCGYRJRKMAGMEAN","FBACCMEANX","FBACCMEANY","FBACCMEANZ","FBACCSTDX","FBACCSTDY","FBACCSTDZ","FBACCJRKMNX","FBACCJRKMNY","FBACCJRKMNZ","FBACCGYRJRKSTX","FBACCGYRJRKSTY","FBACCGYRJRKSTZ","FBACCGYRMNX","FBACCGYRMNY","FBACCGYRMNZ","FBACCGYRSTX","FBACCGYRSTY","FBACCGYRSTZ","FBACCMAGMEAN","FBACCMAGSTD","FBBACCJRKMAGMEAN","FBBACCJRKMAGSTD","FBBACCGYRMAGMEAN","FBBACCGYRMAGSTD","FBBACCGYRJRKMAGMEAN","FBBACCGYRJRKMAGSTD")

# Save the data as TidyData.txt
write.csv(TidyDataMean, file='TidyDataMean.txt',row.names = FALSE)

