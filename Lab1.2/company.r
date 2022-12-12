rm(list=ls())
library(readxl)
library(openxlsx)
options(stringsAsFactors = FALSE)
company <- read.xlsx("company.xlsx", colNames = TRUE, rowNames = FALSE)
company1 <- read.table("company1.txt", header = TRUE, sep = "\t")
company2 <- read.csv("company2.csv", header = TRUE, sep = ";")
?read.table
company512 <- read.table("company2.csv",  skip = 4, sep = ";", nrows = 8)
colnames(company512) <- c("Name", "Sex", "Age", "Marital", "Position", "yer.service", "yer.service.OOO")
company
company1
company2
class(company)
company <- as.data.frame(read_xlsx("company.xlsx"))
all.equal(company, company1)
all.equal(company, company2)
tab <- read.csv("tab.csv", header = TRUE, sep = ",")
ncol(tab)
nrow(tab)
download.file("https://storage.yandexcloud.net/datalens/SuperHeroes.csv", destfile = "Superheroes.csv")
tab1 <- read.table(file = file.choose(), header = TRUE, sep = ",")
save(company, company1, company2, company512, tab, tab1, file = "company.Rda")
write.csv(company1, file = "company1.csv", quote = FALSE, row.names = FALSE)
write.table(company2, file = "company2.txt", sep = "\t", quote = FALSE, row.names = FALSE)
company_book <- createWorkbook()
addWorksheet(company_book, sheetName = "Первый")
writeData(company_book, company, sheet = "Первый")
addWorksheet(company_book, sheetName = "Второй")
writeData(company_book, company1, sheet = "Второй")
addWorksheet(company_book, sheetName = "Третий")
writeData(company_book, company2, sheet = "Третий")
addWorksheet(company_book, sheetName = "Четвертый")
writeData(company_book, tab, sheet = "Четвертый")
saveWorkbook(company_book, "Company_book.xlsx")