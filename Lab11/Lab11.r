install.packages("gmodels")
library(gmodels)
install.packages("ggplot2")
library(ggplot2)
install.packages("readxl")
library(readxl)
install.packages("reshape2")
library(reshape2)
install.packages("tidyverse")
library(tidyverse)
install.packages("gmodels")
library(gmodels)

sal <- read.csv("Salaries.csv")
str(sal)

sal$yrs.since.phd <- as.factor(sal$yrs.since.phd)
tab <- table(sal$yrs.since.phd)
tab
dim(tab)

tab1 <- table(sal$sex, sal$discipline)
tab1 <- table(Пол = sal$sex, Дисциплина = sal$discipline)
tab1
dim(tab1)

tab2 <- table(Пол = sal$sex, Дисциплина = sal$discipline, Ранг = sal$rank)
tab2
dim(tab2)

dimnames(tab)
dimnames(tab1)
dimnames(tab2)

margin.table(tab2, 3)
prop.table(tab)
prop.table(tab1)

prop.table(tab2, 3)
addmargins(tab2, 2)

addmargins(prop.table(tab1, 1), 2)

addmargins(tab1, 1)
addmargins(tab1, 2)
addmargins(prop.table(tab1))
prop.table(tab1, 1)
prop.table(tab1, 2)

CrossTable(sal$sex, sal$discipline)

tab3 <- xtabs(~ sal$sex + sal$discipline + sal$rank)
View(tab3)
tab2 == tab3

barplot(tab, main = "Столбчатая диаграмма tab",
        xlab = "Пол",
        ylab = "Кол-во",
        col = c("pink", "blue"))
barplot(tab1, main = "Стобчатая диаграмма tab1",
        xlab = "Вид дисциплины",
        ylab = "Кол-во",
        col = c("pink", "blue"),
        names.arg = c("Дисциплина А", "Дисциплина B")) 
legend("center",  c("pink","red"), c("Дисциплина А", "Дисциплина В"))

chisq.test(tab1)
fisher.test(tab1)

t.test(salary ~ sex, sal)
sal1 <- subset(sal, rank!= "Prof")
t.test(salary ~ rank, sal1)
t.test(yrs.service ~ rank, sal1)

hist(sal$salary)

ggplot(sal1, aes(x = salary, fill = rank)) + geom_histogram(fill = "pink", col = "blue")
ggplot(sal1, aes(x = salary, fill = rank)) + geom_density(alpha = 0.4)
ggplot(sal1, aes(rank, salary)) + geom_boxplot()

shapiro.test(sal1$salary)
shapiro.test(sal1$salary[sal$rank == "Prof"])
shapiro.test(sal1$salary[sal$rank == "AsstProf"])
shapiro.test(sal1$salary[sal$rank == "AssocProf"])

bartlett.test(salary ~ rank, sal1)

t.test(salary ~ rank, sal1)
wilcox.test(salary ~ rank, sal1)

wilcox.test(sal$yrs.since.phd, sal$yrs.service, paired = F)

women <- business <- read_xlsx("Female.xlsx")
men <- business <- read_xlsx("Male.xlsx")
new1 <- left_join(women, men, by = c("Частота покупок" = "Частота покупок"))

mw <- xtabs (formula = ~`Частота покупок`+`Семейное положение.x`+Частота.x, data = new1, na.action = na.pass)

CrossTable(new1$`Частота покупок`, new1$`Семейное положение.x`, new1$Частота.x)

chisq.test(new1$Частота.x)
chisq.test(new1$Частота.y)

