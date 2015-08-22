# Load data.
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

# Create plot of emissions against year, separated by the source of emissions.
png("plot3.png", width = 480, height = 480)  # Open PNG graphic device.
# Plot the total emissions of Baltimore for each year by type. 
p <- qplot(year, Emissions, data = NEI, facets = ~type, stat = "summary",
      fun.y = "sum", ylab = "Emissions", xlab = "Year", main = "Emissions
      by Type in Baltimore")
# Arrange plots in a single column and allow the axes to scale freely.
p <- p + facet_wrap(facets = ~type, ncol = 1, scales = "free")
print(p)
dev.off()

# Plot 3 shows that all four type of emissions have decreased in Baltimore City
# from 1999 to 2008. Emissions from non-road sources had a slight increase in 
# 2002, and point sources had a slight increase in 2005.