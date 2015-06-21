# Getting and Cleaning Data, Coursera course getdata-015
# Course Project

## Summary
This project contains a script that prepares data from the [
Human Activity Recognition Using Smartphones Data Set ](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) for easy analysis in R. 

The data gathers the average of each measuresumement mean and stardard deviation for each subject and actvity. You can find more details on the measurements in the raw data's documentation.

The data was original obtain by having human subjects recording daily activties while wearing a Samsung Galaxy S smartphone. The measurements were collected from the phone's accelerometers.

The data is usually used for machine learning. Because of this, it is broken several attributes for each reading are broken into several files. The run_analysis.R script merges these files and processes the data so that it fits the tidy data criteria. You can find the source and more details about tidy data in Jeff Leek's [How to share data with a statistician](https://github.com/jtleek/datasharing) post about the subject.

Once the data was merged into a single data frame, then it was grouped by subject and activity and sumarized by getting the means on each data column.

The column names were processed so that they would be legible and pleasing to the eyes. 

## Project files
run_analysis.R      This file runs the analysis of the data to produce the tidy table
tidy_data           Directory with tidy data
tidy_data/tidy.txt  Output file from run_analysis.R
UCI HAR Dataset     The raw data obtained from the Machine Learning Repository 
CodeBook.md         The codebook for the data
README.md           This document

## Dependencies
The script was written using R version 3.2.0 (2015-04-16). The script requires the [dplyr](http://cran.r-project.org/web/packages/dplyr/index.html) package. 

## How to run the script
1. Download the project
2. From R Studio, set the folder as the workspace
3. In the console run: source('~/Documents/classproject/run_analysis.R')

Alternatively, you can download run_analysis.R and place it in a directory that contains the unzipped raw data. From there running the file as described in step 3 should work.


Author: Hugo Estrada
