
download.file("https://raw.githubusercontent.com/swcarpentry/r-novice-gapminder/gh-pages/_episodes_rmd/data/gapminder-FiveYearData.csv", destfile = "data.csv")
?download.file

data <- read.csv(file = "data.csv", header = TRUE)

gapdata <- data[,c(1,2,6)]
head(gapdata)

by_country <- function(countr) {
  country_name <- subset(gapdata, gapdata$country == countr)
  plot(country_name$year, country_name$gdpPercap, xlab = "Year", ylab = "GDP", main = countr)
}

for (i in x) {
  by_country(i)
}

by_country("Uganda")