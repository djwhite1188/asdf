#Question 4
#Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

#If not already completed, download and read in the data - include libraries
file_name <- "~/data.r"
source(file_name)

#Combines smaller coal types into one grouping
SCC$Coal_Type <-unlist(as.data.frame(gsub("Industrial|Waste Coal|Commercial/Institutional", "Comm/Inst/Waste", SCC$SCC.Level.Three)))

#joins the data with the new SCC dataset
cc <- left_join(NEI,SCC, by = "SCC")

#filters to only items that include coal
cc2 <- cc[grep("[Cc]oal",cc$EI.Sector),]

#summarizes the coal data by year and type of coal
total_coal <- cc2 %>%
  group_by(year, Coal_Type) %>%
  summarize(sum = sum(Emissions))

#write the png
png(filename = "~/plot4.png", width = 480, height = 480)

options(scipen = 7)

#Creates the plot with color defined types of coal
b <- ggplot(data = total_coal, aes(year,sum))
b + 
  geom_point() + 
  geom_smooth(aes(color=Coal_Type)) + 
  labs(x = "Year", y = "Sum of Coal Emissions", title = "Coal Emissions") +
  theme(legend.position = "bottom")

#renews the graphics device
dev.off()

#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#Notes:
#
#Emissions from Baltimore City seem to be decreasing with an uptick in 2006
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!