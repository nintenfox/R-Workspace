install.packages("car")
library(ggplot2)
library(car)

shops <- read.csv("shops.csv")
qplot(x = shops$price, y = shops$food, data = shops)

mod_ind <- lm(price ~ food, data = shops)
mod_ind
anova(mod_ind)
fit <- aov(mod_ind)
Anova(mod_ind)

TukeyHSD(fit)

plot(TukeyHSD(fit), las = 1)

aov(price ~ origin, data = shops)
aov(price ~ origin + food, shops)
summary(aov(price ~ origin + food, shops))
aov(price ~ store + origin, shops)
aov(price ~ store + origin + store * origin, shops)
summary(aov(price ~ store + origin, shops))
summary(aov(price ~ store + origin + store * origin, shops))

therapy <- read.csv("therapy_data.csv")
therapy$subject <- as.factor(therapy$subject)
therapy$sex <- as.factor(therapy$sex)
therapy$therapy <- as.factor(therapy$therapy)
therapy$price <- as.factor(therapy$price)

aov(well_being ~ therapy, therapy)
aov(well_being ~ therapy + price, therapy)
aov(well_being ~ therapy + price + sex, therapy)

boxplot(well_being ~ price, therapy)
