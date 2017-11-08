#Question 1
#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total 
#PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

#If not already completed, download and read in the data - include libraries
file_name <- "~/data.r"
source(file_name)

#Finds the sum of the emissions from PM2.5 grouped up by year
total <- NEI %>%
  group_by(year) %>%
  summarize(sum = sum(Emissions))

#write the png
png(filename = "~/plot1.png", width = 480, height = 480)

options(scipen = 7)

#create a plot that shows the sum of emissions by year
plot(total$year, total$sum, type = "b", xlab = "Year", ylab = "Sum of Emissions", main = "National Emissions", ylim = c(0,8000000))


#renew graphics device
dev.off()

#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#Notes:
#
#Emissions seem to be decreasing
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!