dats2 <- read.csv("evals.csv", header = TRUE, sep = ",")
dats2$Number <- 1:nrow(dats2)
dats2 <- dats2[order(-dats2$Number), ]
#Delete Number 
dats2$Number <- NULL            
dim(dats2)
subset(dats2, score > 4)
subset(dats2, gender == "female", select = c(score))
subset(dats2, gender == "female", select = c(score, language, age))
dat_f <- subset(dats2, gender == "female")
dat_m <- subset(dats2, gender == "male")
?rbind
?cbind
dat_fm <- rbind(dat_m, dat_f)
dats3 <- dats2 [, c(2:7)]
dats4 <- dats2 [, c(8:11)]
dats5 <- cbind(dats3, dats4)
rm(dats5)
rm(dats3,dats4)
names(dats2)[1] <- "Score"
names(dats2)
dats6 <- dats2 [, c(1, 4:7, 10)]
dats6$numbers <- dats6$cls_perc_eval *1.5
tail(dats6)
dats6 <- dats6 [, -c(2, 3, 6)]
pairs(dats6)
rownames(dats6) [5] <- "row 5"
rm(list = ls())

cik <- read.csv("evals.csv", header = T, sep = ",")
cik$cik_new <- ifelse (cik$score > 4, '1', '0')
score_mov <- c()
average <- 0;
for (i in 1:nrow(cik)){
  for(j in 0:6){
      average <- average + cik$score[i+j]
  }
  average <- average / 7
  score_mov <- c(score_mov, average)
}
score_mov
