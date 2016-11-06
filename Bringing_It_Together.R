
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

print(list_of_countries)

countries_with_list <- function(list_of_countries) {
  for (country_name in list_of_countries) {
    by_country(country_name)
  }
}
list_of_countries <- list("Uganda", "Rwanda", "Iran")

countries_with_list(list_of_countries)

countries_with_list(list("Kenya", "Canada", "Zimbabwe"))
