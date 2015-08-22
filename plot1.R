# Load data.
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

# Split the emissions data by the year and take the sum for each year.
emissbyyear <- aggregate(NEI$Emissions, by = list(NEI$year), FUN = sum)
png("plot1.png", width = 480, height = 480)  # Open PNG graphic device.
# Plot the total emissions for each year.
plot(emissbyyear, type = "b", xlab = "Year", ylab = "Total Emissions",
     main = "Emissions From PM2.5 by Year")
dev.off()

# Plot 1 shows that the total emissions have decreased from 1999 to 2008.