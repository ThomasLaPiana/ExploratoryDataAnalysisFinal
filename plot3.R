## Set the working directory and load the required packages
setwd("/home/thomas/JHU DataScience Courses/R Directory/ExploratoryDataAnalysisFinal")
library(data.table)
library(dplyr)
library(ggplot2)

## Read in the Data 
NEI <- data.table(readRDS("summarySCC_PM25.rds"))
SCC <- data.table(readRDS("Source_Classification_Code.rds"))

## Format the Data 
cleaned = NEI %>% 
    filter(Pollutant == 'PM25-PRI', fips == '24510') %>% 
    select(year,type,Emissions) %>% 
    group_by(year,type) %>% 
    summarise(EmissionSummary = sum(Emissions))
## Plot it
png('plot3.png')
ggplot(data=cleaned,aes(x = year,y = EmissionSummary, fill = type)) + 
    geom_bar(stat="identity", position=position_dodge(), colour="black")
dev.off()