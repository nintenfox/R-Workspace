library(help = "datasets")
str(attenu)
help(attenu)
dats <- attenu
View(head(dats))
head(dats, 26)
View(tail(dats))
tail(dats, 26)
View(dats)
str(dats)
head(dats)
names(dats)
summary(dats)
Name <- c(names(dats))
my_vector <- as.vector(dats[,4])
mean(my_vector)
summary(my_vector)
dats$accelx26 <- dats$accel*26
dats$zero <- 0
dats$rows <- 1:nrow(dats)
datsvector <- c(rep(1,182))
dats1 <- data.frame(dats,datsvector)
dats1$datsvector <- NULL
dim(dats1)
ncol(dats1)
nrow(dats1)
dats1[, c(1,2,3)]
dats1[, c("dist", "accel")]
dats1[c(44,55,66),]
dats1[c(100,111), c(6,7,8)]
dats1[55, -c(1,3)]
univer <- UCBAdmissions
univer <- as.data.frame(univer)
FA1 <- Freq(univer$Dept)
FA <- as.double(nrow(FA1))
univer.small <- univer[c(3,9,14,24),]
univer2 <- subset(univer, Gender == "Male" & Dept == "B" & Freq >= 138)
univer3 <- subset(univer, Gender == "Male" & Dept == "C" & Freq >= 138)
univer4 <- subset(univer, Gender == "Male" & Dept == "E" & Freq > 138)
univer1 <- full_join(x = univer2, y = univer3)
