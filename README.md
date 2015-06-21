README.md

Script Name: run_analysis.R
Author: H. Culver
Created: 6/20/2015
Purpose: Operate on the smartphone dataset in the zip file 
"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
 (project dataset) to produce a tidy dataset.

Execution: 
1 - download and unzip the project dataset
2 - place a copy of the script "run_analysis.R" in the unzipped directory 
    named "UCI HAR Dataset"
3 - using a R runtime environment like RStudio, open the script source
4 - edit line 6 to reflect the base pathing to the "UCI HAR Dataset" location
5 - execute the modified R script (e.g. > source("run_analysis.R"))
6 - the resulting tidy dataset will be written to the location "UCI HAR Dataset",
    with the file name of tidy_dataset.txt
    
Note: this script clears all work variables and dataframes. To suppress this feature,
comment-outline 96.   