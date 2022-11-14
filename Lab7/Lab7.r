install.packages("plotrix")
install.packages("vcd")
library(plotrix)
library(vcd)

plot(tan, -pi, pi, main = "График функции tan(x)", sub = "Интервал изменения аргумента = (-pi, pi)", 
     xlab = "x", ylab = "tan(x)", col = "orange", lty = 5, cex = 7, pch = 127, 
     lwd = 3, xlim = c(-4, 4), ylim = c(-5, 30), axes = T, ann = T, bty = "L" )

f <- function(x) {
  return(4 * tan(x) - 5)
}

plot(f, main = "График произвольной функции", col = "purple", xlab = "x",
     ylab = "function(x)", xlim = c(-1, 3), ylim = c(-100, 400), lty = 3, 
     type = "b", cex = 6, pch = 10, lwd = 2, axes = T, ann = T, 
     col.lab = "NavyBlue", col.main = 10, bty = "L")

?Devices

par(mfrow = c(2, 1))

mtcars

barplot(mtcars$carb, xlab = "Число карбюраторов")

cylcarb <- table(mtcars$cyl, mtcars$carb)
barplot(cylcarb, main = "Автомобили", 
        names.arg = c("1 carb", "2 carb", "3 carb", "4 carb", "6 carb", "8 carb"),
        ylab = "Количество автомобилей", las = 2, legend.text = T)

vs <- table(mtcars$vs)
barplot(vs, main = "Типы двигателей в автомобилях", 
        xlab = "Тип двигателя", ylab = "Количество автомобилей", legend.text = T)

carb <- table(mtcars$carb)
barplot(carb, main = "Кол-во карбюраторов в автомобилях", horiz = T,
        ylab = "Количество карбюраторов", xlab = "Количество автомобилей")

par(mfrow = c(1, 1))

plot(mtcars$mpg, mtcars$wt, main = "Зависимость расхода топлива от веса") 
text(mtcars$mpg, mtcars$wt, row.names(mtcars), pos = 3)

carbvs <- table(mtcars$vs, mtcars$carb)
barplot(carbvs, beside = T, ylab = "Количество автомобилей", xlab = "Типы карбюраторов", 
        main = "Кол-во авто с различным типом карбюраторов для разных типов двигателя")
legend("right", title = "Тип двигателя", c("0", "1"), horiz = T)

spin <- table(mtcars$qsec, mtcars$gear)
spine(spin, main = "Спинограмма")

a <- length(which(mtcars$vs == 0 & mtcars$cyl == 4))
b <- length(which(mtcars$vs == 0 & mtcars$cyl == 6))
c <- length(which(mtcars$vs == 0 & mtcars$cyl == 8))
d <- length(which(mtcars$vs == 1 & mtcars$cyl == 4))
e <- length(which(mtcars$vs == 1 & mtcars$cyl == 6))
vscyl <- c(a,b,c,d,e)
pie3D(vscyl, explode = 0.1, main = "Трехмерная круговая диаграмма")


boxplot(mpg ~ cyl, data = mtcars, xlab = "Число цилиндров", ylab = "Мили на шаллон", col = "blue")

hist(mtcars$disp, xlab = "Объем двигателя", main = "Гистограмма объема двигателя", col = "orange", breaks = 28)

png("density.png")
plot(density(mtcars$disp), main = "Плотность распределения")
