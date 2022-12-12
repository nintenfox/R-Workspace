install.packages("pvclust")
install.packages("rattle")
install.packages("factoextra")
library(factoextra)
library(rattle)
library(pvclust)
library(cluster)
library(readxl)

#Задача 1
?daisy()
?hclust()

test <- read_xlsx("cars.xlsx")
testcars <- test[seq(1, nrow(test), 5),]
test.dist <- daisy(testcars[, 3:12])
test.h <- hclust(test.dist, method = "ward.D")
plot(test.h)
rect.hclust(test.h, k=3, border = "blue")

testt <- t(testcars[, 3:12])
testt
test.pv <- pvclust(testt, method.dist="manhattan", method.hclust="ward.D",
                    nboot=100)
plot(test.pv)

#Задача 2
beer <- read.csv("pivo.csv", sep = ";")
View(beer)
beer$X..алкоголя <- as.numeric(as.factor(beer$X..алкоголя))
beer$Страна.производитель <- as.numeric(as.factor(beer$Страна.производитель))
beer$Расходы <- as.numeric(as.factor(beer$Расходы))
beer$Калории <- as.numeric(as.factor(beer$Калории))
beer.stand <- scale(beer[3:5])
head(beer.stand)

beers <- beer[seq(1, nrow(beer), 5), ]
beert <- t(beers[,1:5])
beer.pv <- pvclust(beert, method.dist="manhattan", method.hclust="ward.D",
                    nboot=100)
plot(beer.pv, main = "Дендрограмма со значениями поддержки кластеров")

fviz_nbclust(beer.stand, kmeans, method = "wss")

kc <- kmeans(beer.stand, 5)

aggregate(beer.stand, by = list(kc$cluster), FUN = mean)
beer.stand <- data.frame(beer.stand, kc$cluster)

clusplot(beer.stand, kc$cluster, color = T, shade = T, labels = 2, lines = 0)
