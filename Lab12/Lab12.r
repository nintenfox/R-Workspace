install.packages("ellipse")
library(ellipse)
library(ggplot2)
street <- c(80, 98, 75, 91, 78)
garage <- c(100, 82, 105, 89, 102)
cor.test(street, garage)
plot(street, garage, main = "Диаграмма рассеивания", 
     xlab = "Число машин, припаркованных на улице", 
     ylab = "Число машин, припаркованных в гараже")

tab1 <- read.csv2("parkovki.csv")
correl <- cor.test(x = tab1$Multi.level.parking, y = tab1$Open.parking)
correl

sal_numeric <- tab1[, c(2,3,4)]
cor(sal_numeric)
plotcorr(cor(sal_numeric))

tab2 <- read.csv2("institute.csv")
round(cor(tab2, method="spearman"), 2)
cor(tab2$Entrance, tab2$Final, method="kendall")


iqp <- c(126,119,111,105,106,96,95,90,81,76)
iqc <- c(110,106,95,126,120,106,74,95,90,81)
IQ <- data.frame(iqp, iqc)
lm(iqp ~ iqc, IQ)
qplot(x = iqp, y = iqc, data = IQ)
cor.test(iqp, iqc)
