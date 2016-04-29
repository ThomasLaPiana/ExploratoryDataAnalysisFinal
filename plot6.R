## Set the working directory and load the required packages
setwd("/home/thomas/JHU DataScience Courses/R Directory/ExploratoryDataAnalysisFinal")
library(data.table)
library(dplyr)
library(ggplot2)

## Read in the Data 
NEI <- data.table(readRDS("summarySCC_PM25.rds"))
SCC <- data.table(readRDS("Source_Classification_Code.rds"))

## Extract the needed identifiers from SCC
raw_identifiers = SCC %>% filter(grepl("Vehicle", Short.Name)); stuff
id_list = as.character(raw_identifiers$SCC)

## Format the Data 
cleaned = NEI %>% 
    filter(Pollutant == 'PM25-PRI', SCC %in% id_list, fips == '24510' | fips == '06037') %>% 
    select(year,fips,Emissions) %>% 
    group_by(year,fips) %>% 
    summarise(EmissionSummary = sum(Emissions))

## Plot it
png('plot6.png')
ggplot(data=cleaned,aes(x = year,y = EmissionSummary, fill = as.factor(fips))) + 
    geom_bar(stat="identity", position=position_dodge(), colour="black")
dev.off()