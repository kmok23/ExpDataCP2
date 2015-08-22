# Load data.
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

# Split the emissions data by the year and take the sum for each year where the
# fips value matches 24510 for the county of Baltimore.
emissbyyearbalt <- aggregate(NEI$Emissions[NEI$fips == "24510"], 
                             by = list(NEI$year[NEI$fips == "24510"]), 
                             FUN = sum)
png("plot2.png", width = 480, height = 480)  # Open PNG graphic device.
# Plot the total emissions for each year.
plot(emissbyyearbalt, type = "b", xlab = "Year", ylab = "Total Emissions",
     main = "Emissions by Year for Baltimore")
dev.off()

# Plot 2 shows that the total emissions have decreased in Baltimore City from
# 1999 to 2008. There is a slight increase in 2005, but the overall trend is
# downward.