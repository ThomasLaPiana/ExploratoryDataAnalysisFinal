## Set the working directory and load the required packages
setwd("/home/thomas/JHU DataScience Courses/R Directory/ExploratoryDataAnalysisFinal")
library(ggplot2)
library(data.table)
library(dplyr)

## Read in the Data 
NEI <- data.table(readRDS("summarySCC_PM25.rds"))
SCC <- data.table(readRDS("Source_Classification_Code.rds"))