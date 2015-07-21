# Question1
# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library("data.table")
library("plyr")


Emissions <- aggregate(NEI[, 'Emissions'], by = list(NEI$year), FUN = sum)
#total_emissions <- with(NEI, aggregate(Emissions, by = list(year), sum))
png(filename = "plot1.png", width = 480, height = 480)
plot(Emissions, 
     type = "o", 
     pch = 10, 
     xlab = "Year",
     ylab = "Emissions (tons)",
     main = "total emissions of PM2.5 in US from 1999 to 2008")
dev.off()
