#Task 1
vector1 <- c(3, 6, 12, 5, 76, 82, 4, 44, 890, 34)
vector1
vector_char <- c("three", "six", "twelve", "five", "seventy six")
vector_char
var1 <- 39
var2 <- 14
var3 <- 3
compare <- var1 + var2 > var3
var5 <- 8537:9642; 7:7134
index = vector1[c(4, 7, 3, 10, 5)]
Sum_vec = sum(vector1[vector1 < 14])

#Task 2
lev_obr <- c("начальное", "среднее", "средне-специальное", "высшее неоконченое", "высшее")
is.vector(lev_obr)
is.character(lev_obr)
str(lev_obr)
table(lev_obr)
lev_obr.f <- factor(lev_obr)
str(lev_obr.f)
lev_obr.o <- ordered(lev_obr, levels = c("начальное", "среднее", "средне-специальное", "высшее неоконченое", "высшее"))
new_vector <- c("малый", "мало-средний", "средний", "крупный")
new_vector.f <- factor(new_vector)
new_vector.o <- ordered(new_vector, levels = c("малый", "мало-средний", "средний", "крупный"))
new_vector.f [2:3]
new_vector.f [2:3, drop = TRUE]

#Task 3
mtx <- c(1:24)
dim(mtx) <- c(6, 4)
str(mtx)
ncol(mtx)
rownames(mtx) <- c("x1", "x2", "x3", "x4", "x5", "x6")
colnames(mtx) <- c("y1", "y2", "y3", "y4")
mtx1 = t(mtx)
mtx2 = mtx[2, 3]
mtx[,c(2, 3)]
mtx3 = mtx[c(1), -c(2, 3)]
mtx1[,c(2)]
mtx1[-2,]
nrow(mtx)
ncol(mtx)
nrow(mtx1)

#Task 4
sps <- list("Анализ данных Царенков", "RTU MIREA", 4:11, 4.1, TRUE, NA, list(FALSE, "N", 26))
sps[3]
sps[[3]]
names(sps) <- c("Title", "HEI", "Numbers", "Double", "Statement", "Logic", "List")
sps["Statement"]

#Hometask
mtx4 <- 1:72
dim(mtx4) <- c(6, 4, 3)
str(mtx4)
