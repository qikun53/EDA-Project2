# Question2
# Have total emissions from PM2.5 decreased in Baltimore from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from Baltimore for each of the years 1999, 2002, 2005, and 2008.

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library("data.table")
library("plyr")

NEI_baltimore <- subset(NEI, fips == '24510')
Emissions_Baltimore<-aggregate(NEI_baltimore[, 'Emissions'],by = list(NEI_baltimore$year), FUN = sum)
png(filename = "plot2.png", width = 480, height = 480)
plot(Emissions_Baltimore, 
     type = "o", 
     pch = 10, 
     xlab = "Year",
     ylab = "Emissions (tons)",
     main = "total emissions of PM2.5 in Baltimore from 1999 to 2008")
dev.off()