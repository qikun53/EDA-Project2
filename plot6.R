

# Question6
# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library("data.table")
library("plyr")
library("ggplot2")


## Convert into data.table
NEI= data.table(NEI)
SCC= data.table(SCC)


scc_mv = SCC[grep("[mM]obile|[vV]ehicles", EI.Sector), SCC]
Emissions_mv = NEI[SCC %in% scc_mv, sum(Emissions), by=c("year","fips")][fips == "24510"|fips == "06037"]
setnames(Emissions_mv, c("Year","FIPS","Emissions"))


png(filename='plot6.png', width=480, height=480)
qplot(Emissions_mv$Year,Emissions_mv$Emissions,
      group = Emissions_mv$FIPS, 
      color = Emissions_mv$FIPS,
      geom = c("point","line"), 
      ylab = "Emissions (tons)", 
      xlab = "Year", 
      main = "emissions from motor vehicle, 1999-2008") + scale_colour_discrete(name  ="County", breaks = c("06037", "24510"),labels = c("Los Angeles", "Baltimore"))
dev.off()
