# Load data.
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

# Find the indices in SCC where EI Sector ends in "Vehicles". Those correspond
# to vehicle related sources of emissions.
vehicleindices <- grep("Vehicles$", SCC$EI.Sector)
# Extract the SCC values for the above indices.
SCCbyvehicle <- SCC$SCC[vehicleindices]
# Subset the NEI data by the rows with the above SCC values.
NEIbyvehicle <- with(NEI, NEI[SCC %in% SCCbyvehicle,])
# Split the subset data by the year and take the sum for each year where the
# fips value matches 06037 for the county of Los Angeles.
emissbyyearLA <- aggregate(NEIbyvehicle$Emissions[NEIbyvehicle$fips == "06037"],
                           list(NEIbyvehicle$year[NEIbyvehicle$fips == 
                           "06037"]), FUN = sum)
png("plot6.png", width = 480, height = 480)  # Open PNG graphic device.
# Plot the total emissions for each year.
plot(emissbyyearLA, type = "b", xlab = "Year", ylab = "Total Emissions",
     main = "Los Angeles Vehicle Related Emissions by Year")
dev.off()

# Plot 6 shows that vehicle emissions increased slightly overall from 1999 to
# 2008. There was a significant increase from 1999 to 2005 before it dropped
# back down in 2008.