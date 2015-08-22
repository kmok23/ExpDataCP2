# Load data.
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

# Find the indices in SCC where EI Sector ends in "Coal". Those correspond to
# the coal combustion related sources of emissions.
coalindices <- grep("Coal$", SCC$EI.Sector)
# Extract the SCC values for the above indices.
SCCbycoal <- SCC$SCC[coalindices]
# Subset the NEI data by the rows with the above SCC values.
NEIbycoal <- with(NEI, NEI[SCC %in% SCCbycoal,])
# Split the subset data by the year and take the sum for each year.
emissbycoal <- aggregate(NEIbycoal$Emissions, list(NEIbycoal$year), FUN = sum)
png("plot4.png", width = 480, height = 480)  # Open PNG graphic device.
# Plot the total emissions for each year.
plot(emissbycoal, type = "b", xlab = "Year", ylab = "Total Emissions",
     main = "Coal Combustion-Related Emissions by Year")
dev.off()

# Plot 4 shows that coal combustion-related emissions have dropped off 
# significantly from 2005 to 2008. It was relatively steady and high through 
# 1999 to 2005.