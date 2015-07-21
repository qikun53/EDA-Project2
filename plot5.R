

# Question5
# How have emissions from motor vehicle sources changed from 1999¨C2008 in Baltimore City?

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library("data.table")
library("plyr")
library("ggplot2")


## Convert into data.table
NEI= data.table(NEI)
SCC= data.table(SCC)


scc_mv = SCC[grep("[mM]obile|[vV]ehicles", EI.Sector), SCC]
Emissions_mv = NEI[SCC %in% scc_mv, sum(Emissions), by=c("year","fips")][fips == "24510"]
setnames(Emissions_mv, c("Year","FIPS","Emissions"))


png(filename='plot5.png', width=480, height=480)
qplot(Emissions_mv$Year,Emissions_mv$Emissions,
      geom = c("point","line"), 
      ylab = "Emissions (tons)", 
      xlab = "Year", 
      main = "emissions from motor vehicle in  Baltimore, 1999-2008") 
dev.off()
