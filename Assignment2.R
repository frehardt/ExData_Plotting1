## TODO: Check with dir() for availability of file

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

unique(NEI$year)

boxplot(NEI$Emissions ~ NEI$year)

NEI <- tapply(NEI$Emission, NEI$year, FUN=sum)

# Question 1
hist(NEI$year, main="Total PM2.5 Emission", xlab="Year", ylab="Frequency", col="Red")) 
barplot(NEI, main="Total PM2.5 Emission", xlab="Year", ylab="PM2.5 Emission [tons]", col="Red", ylim = c(0, 7000000))

# Question 2
NEI_Baltimore <- subset(NEI, NEI$fips == "24510")
#hist(NEI_Baltimore$year, main="Total PM2.5 Emission Baltimore", xlab="Year", ylab="Frequency", col="Red")
barplot(tapply(NEI_Baltimore$Emission, NEI_Baltimore$year, FUN=sum), main="Total PM2.5 Emission Baltimore City", xlab="Year", ylab="PM2.5 Emission [tons]", col="Red", ylim = c(0, 3500))

# Question 3
library(ggplot2)
qplot(type, data = NEI_Baltimore, fill = type, facets = .~year, weight=Emissions, geom="histogram", main="PM 2.5 Emission Baltimore City", xlab="Year", ylab="PM 2.5") 


# Question 4
contains_coal <- SCC$EI.Sector %in% grep("*Coal*", SCC$EI.Sector, value = TRUE)
coal <- subset(SCC, grepl("[Cc]omb", Short.Name) & grepl("[Cc]oal", Short.Name))


# Question 5