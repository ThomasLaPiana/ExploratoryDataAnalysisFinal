## Set the working directory and load the required packages
setwd("/home/thomas/JHU DataScience Courses/R Directory/ExploratoryDataAnalysisFinal")
library(data.table)
library(dplyr)
library(ggplot2)

## Read in the Data 
NEI <- data.table(readRDS("summarySCC_PM25.rds"))
SCC <- data.table(readRDS("Source_Classification_Code.rds"))

## Extract the needed identifiers from SCC
raw_identifiers = SCC %>% filter(grepl("Coal", Short.Name))
id_list = as.character(raw_identifiers$SCC)

## Format the Data 
cleaned = NEI %>% 
    filter(Pollutant == 'PM25-PRI', SCC %in% id_list) %>% 
    select(year,type,Emissions) %>% 
    group_by(year) %>% 
    summarise(EmissionSummary = sum(Emissions))

## Plot it
png('plot4.png')
plot(cleaned$year,cleaned$EmissionSummary)
dev.off()