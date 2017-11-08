#Question 6
#Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California 
#(fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?

#If not already completed, download and read in the data - include libraries
file_name <- "~/data.r"
source(file_name)

#Filters the data to the fips 24510 or Baltimore City County
Balt <- NEI[NEI$fips=="24510",]

#Joins the data to the SCC data that includes the Emission types
balt_scc <- left_join(Balt, SCC, by = "SCC")

#filters the data to only mobile - on road vs some misc like mobile - airplane
mobile_balt <- balt_scc[grep("[Mm]obile - On-Road", balt_scc$EI.Sector),]

#creates the sum of emissions by year and sector
total_mobile_balt <- mobile_balt %>%
  group_by(year) %>%
  summarize(sum = sum(Emissions))

#Filters the data to the fips 06037 or Los Angeles County
LA <-NEI[NEI$fips=="06037",]

#Joins the data to the SCC data that includes the Emission types
LA_scc <- left_join(LA, SCC, by = "SCC")

#filters the data to only mobile - on road vs some misc like mobile - airplane
mobile_LA <- LA_scc[grep("[Mm]obile - On-Road", LA_scc$EI.Sector),]

#creates the sum of emissions by year and sector
total_mobile_LA <- mobile_LA %>%
  group_by(year) %>%
  summarize(sum = sum(Emissions))

#Include a column for city/county name
total_mobile_LA$City = "Los Angeles"
total_mobile_balt$City = "Baltimore City"

#Combine the two datasets
combined2 <- rbind(total_mobile_balt, total_mobile_LA)

#write the png
png(filename = "~/plot6.png", width = 480, height = 480)

#Creates the plot with color defined County
d <- ggplot(data = combined2, aes(year,sum))
d + 
  geom_point() + 
  geom_smooth(method = "loess",aes(color = City)) + 
  labs(x = "Year", y = "Sum of Auto Emissions", title = "Comparison of LA and Baltimore City Auto Emissions") +
  theme(legend.position = "bottom")


#renews the graphics device
dev.off()

#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#Notes:
#
#Emissions from Baltimore City seem to be decreasing with an uptick in 2006
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!