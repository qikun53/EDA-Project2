
# Question3
# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999¨C2008 for Baltimore City? Which have seen increases in emissions from 1999¨C2008? Use the ggplot2 plotting system to make a plot answer this question.

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library("data.table")
library("plyr")
library("ggplot2")

NEI_baltimore <- subset(NEI, fips == '24510')
Emissions_Baltimore <- ddply(NEI_baltimore, .(type, year), summarize, Emissions = sum(Emissions))

png(filename='plot3.png', width=480, height=480)
#

qplot(Emissions_Baltimore$year, Emissions_Baltimore$Emissions, 
      group = Emissions_Baltimore$type, 
      color = Emissions_Baltimore$type, 
      geom = c("point", "line"), 
      ylab = "Emissions (tons)", 
      xlab = "Year", 
      main = "Total Emissions in Baltimore") + scale_colour_discrete(name  ="Type of pollutant")
dev.off()