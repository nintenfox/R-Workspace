install.packages("ggplot2")
library(ggplot2)

salary <- read.csv2("Salaries.csv", sep = ",")

qplot(x = yrs.service, y = salary, data = salary, color = rank, 
      geom = c("point", "smooth"), shape = discipline, size = yrs.since.phd,
      alpha = 0.6)

qplot(x = salary, data = salary, geom = "histogram", binwidth = 10000, 
      xlim = c(70000, 200000), fill = discipline)

qplot(x = salary, data = salary, geom = "density", color = rank, alpha = rank)

qplot(x = yrs.service, data = salary, geom = "freqpoly", color = discipline)

qplot(x = discipline, data = salary, geom = "bar", fill = rank)
      
qplot(x = salary, data = salary, y = rank, geom = c("jitter", "boxplot"), 
      outlier.color = NA)

qplot(x = salary, data = salary, geom = "freqpoly", facets = rank~., fill = rank)

qplot(x = salary, y = yrs.service, data = salary, geom = "smooth", facets = rank~discipline)

qplot(x = salary, y = yrs.service, data = salary)

qplot(x = salary, y = discipline, data = salary)

qplot(x = salary, y = rank, data = salary)
