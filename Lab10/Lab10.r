library(readxl)
library(moments)
library(Hmisc)
library(psych)
DetskiyMir<-c(8,5,10,8,9,6,9,10,9,10,8,9,9,10,9,9,9)
DochkiSyinochki<-c(6,7,10,10,9,7,10,8,9,8,10,10,8,8,6,9,10)
BabyKid<-c(6,8,9,10,7,10,9,9,6,10,8,9,7,10,8,9,9)
Olant<-c(9,8,10,7,9,8,9,10,8,10,8,9,10,8,6,9,6)
Korablik<- c(7,5,7,5,10,7,6,8,9,7,10,7,9,9,6,9,8)

mean(DetskiyMir); mean(DochkiSyinochki); mean(BabyKid); mean(Olant); 
mean(Korablik)
table(DetskiyMir); table(DochkiSyinochki); table(BabyKid); table(Olant); 
table(Korablik)
median(DetskiyMir); median(DochkiSyinochki); median(BabyKid); median(Olant); 
median(Korablik)
summary(DetskiyMir); summary(DochkiSyinochki); summary(BabyKid); summary(Olant);
summary(Korablik)

plot(DetskiyMir)
title(main="Детский Мир")
plot(DochkiSyinochki)
title(main="Дочки Сыночки")
plot(BabyKid)
title(main="Baby Kid")
plot(Olant)
title(main="Олант")
plot(Korablik)
title(main="Кораблик")

hist(DetskiyMir); hist(DochkiSyinochki); hist(BabyKid); hist(Olant); 
hist(Korablik)

Tab <- data.frame(DetskiyMir, DochkiSyinochki, BabyKid, Olant, Korablik)
Tab
summary(Tab)
var(Tab)
range(Tab)
sd(Tab$DochkiSyinochki)

quantile(Tab$DetskiyMir); quantile(Tab$DochkiSyinochki); quantile(Tab$BabyKid);
quantile(Tab$Olant); quantile(Tab$Korablik)

min(Tab$BabyKid); max(Tab$BabyKid)
which.min(Tab$DochkiSyinochki); which.max(Tab$DochkiSyinochki)

Avto <- read_xlsx("Avto.xlsx", col_names = T)
tapply(X = Avto$cost, INDEX = Avto$class, FUN = mean)
tapply(X = Avto$cost, INDEX = list(Avto$class, Avto$fuel), FUN = mean)

skewness(Avto$cost, na.rm = T)
kurtosis(Avto$cost, na.rm = T)

aggregate(x = Avto$door, by = list(Avto$class), FUN = mean)

mean.h.g <- aggregate(Avto$door, by = list(Avto$class), FUN = mean)
colnames(mean.h.g) <- c("door", "class")
mean.h.g

aggregate(x = Avto$cost, by = list(Avto$class, Avto$fuel), FUN = mean)
aggregate(cost~class+fuel,Avto,mean)
describe(Avto)
describeBy(x = Avto[,-c(1,7)], group = Avto$class,mat = F)
describeBy(x = Avto[,-c(1,7)], group = Avto$class,mat = T)

