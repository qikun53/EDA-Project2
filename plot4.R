

# Question4
# Across the United States, how have emissions from coal combustion-related sources changed from 1999¨C2008?

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library("data.table")
library("plyr")
library("ggplot2")


## Convert into data.table
NEI= data.table(NEI)
SCC= data.table(SCC)


scc_coal = SCC[grep("Coal", SCC.Level.Three), SCC]
Emissions_coal = NEI[SCC %in% scc_coal, sum(Emissions), by = "year"]
setnames(Emissions_coal, c("Year", "Emissions"))


png(filename='plot4.png', width=480, height=480)
qplot(Emissions_coal$Year,Emissions_coal$Emissions,
      geom = c("point","line"), 
      ylab = "Emissions (tons)", 
      xlab = "Year", 
      main = "emissions from coal combustion-related sources, 1999-2008") 
dev.off()
