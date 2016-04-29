## Set the working directory and load the required packages
setwd("/home/thomas/JHU DataScience Courses/R Directory/ExploratoryDataAnalysisFinal")
library(data.table)
library(dplyr)

## Read in the Data 
NEI <- data.table(readRDS("summarySCC_PM25.rds"))
SCC <- data.table(readRDS("Source_Classification_Code.rds"))

## Format the Data 
cleaned = NEI %>% 
    filter(Pollutant == 'PM25-PRI', fips == '24510') %>% 
    select(year,Emissions) %>% 
    group_by(year) %>% 
    summarise(EmissionSummary = sum(Emissions))

png('plot2.png')
plot(cleaned$year,cleaned$EmissionSummary)
dev.off()