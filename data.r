if(!(file.exists("~/EPA.zip"))){
  link <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
  file <- "EPA.zip"
  
  download.file(link, file)
  
  library(utils)
  unzip(file)
  

  
}

if (!(exists("NEI"))){
  NEI <- readRDS("~/summarySCC_PM25.rds")
}

if (!(exists("SCC"))){
  SCC <- readRDS("~/Source_Classification_Code.rds")
}

if(!("dplyr" %in% (.packages()))){
  library(dplyr)
}

if(!("ggplot2" %in% (.packages()))){
  library(ggplot2)
}

