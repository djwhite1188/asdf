#Question 2
#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to 
#make a plot answering this question.

#If not already completed, download and read in the data - include libraries
file_name <- "~/data.r"
source(file_name)

#Filters the data to the fips 24510 or Baltimore City County
Balt <- NEI[NEI$fips=="24510",]

#Sum the Emissions from Baltimore City by year
total_balt <- Balt %>%
  group_by(year) %>%
  summarize(sum = sum(Emissions))

#write the png
png(filename = "~/plot2.png", width = 480, height = 480)

#Create the graph
plot(total_balt$year, total_balt$sum, type = "b", ylim = c(0,5000), xlab = "Year", ylab = "Sum of Emissions", main = "Sum of Balitmore City Emissions")

#renews the graphics device
dev.off()

#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#Notes:
#
#Emissions from Baltimore City seem to be decreasing with an uptick in 2006
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!