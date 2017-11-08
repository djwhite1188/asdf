#Question 3
#Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases 
#in emissions from 1999-2008 for Baltimore City? Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make a 
#plot answer this question.

#If not already completed, download and read in the data - include libraries
file_name <- "~/data.r"
source(file_name)

#Filters the data to the fips 24510 or Baltimore City County
Balt <- NEI[NEI$fips=="24510",]

#Sum the Emissions from Baltimore City by year and type
total_balt_type <- Balt %>%
  group_by(year,type) %>%
  summarize(sum = sum(Emissions))

#write the png
png(filename = "~/plot3.png", width = 480, height = 480)

#generates the base plot object
g <- ggplot(data = total_balt_type, aes(year, sum))

#adds in the layer of colored lines for each "type"
g + 
  geom_point() + 
  geom_smooth(method = "loess", aes(color = type)) +
  labs(x = "Year", y = "Sum of Emissions", title = "Emissions by Source Type") +
  theme(legend.position = "bottom")

#renews the graphics device
dev.off()

#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#Notes:
#
#Emissions from Baltimore City seem to be decreasing with an uptick in 2006
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!