#Question 5
#How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

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
  group_by(year, EI.Sector) %>%
  summarize(sum = sum(Emissions))

#write the png
png(filename = "~/plot5.png", width = 480, height = 480)

#Creates the plot with color defined Auto Sector
c <- ggplot(data = total_mobile_balt, aes(year,sum))
c + 
  geom_point() + 
  geom_smooth(method = "loess", aes(color = EI.Sector)) + 
  labs(x = "Year", y = "Sum of Auto Emissions", title = "Baltimore City Auto Emissions") +
  theme(legend.position = "bottom", legend.direction = "vertical")


#renews the graphics device
dev.off()

#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#Notes:
#
#Emissions from Baltimore City seem to be decreasing with an uptick in 2006
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!