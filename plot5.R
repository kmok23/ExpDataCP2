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
# fips value matches 24510 for the county of Baltimore.
emissbyyearbalt <- aggregate(NEIbyvehicle$Emissions[NEIbyvehicle$fips == 
                             "24510"], list(NEIbyvehicle$year[NEIbyvehicle$fips
                             == "24510"]), FUN = sum)
png("plot5.png", width = 480, height = 480)  # Open PNG graphic device.
# Plot the total emissions for each year.
plot(emissbyyearbalt, type = "b", xlab = "Year", ylab = "Total Emissions",
     main = "Baltimore Vehicle Related Emissions by Year")
dev.off()

# Plot 5 shows that vehicle emissions have dropped off significantly after 1999 
# through to 2008.