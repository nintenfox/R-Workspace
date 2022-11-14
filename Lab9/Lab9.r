library(ggplot2)
Step <- read.csv2("Pedometer.csv", sep = ",")
Day.f <- factor(Step$Day)
Step <- with(Step, Step[order(Day),])

StepG <- ggplot(Step, aes(x = Day, y = kcal))
StepG + geom_point(aes(color = DayType, size = Rain, alpha = 0.54))

StepG1 <- ggplot(Step, aes(x = Steps, y = kcal))
StepG1 + geom_point() + geom_smooth(se = F) + coord_cartesian(xlim = c(4000, 8000),
                                                              ylim = c(20, 250))
StepG2 <- ggplot(data=subset(Step), aes(DayType))
StepG2 + geom_bar(aes(fill=Steps, color = DayType), fill = "violet", colour = "blue",
                  linetype = 5)                                                            

StepG3 <- ggplot(Step, aes(x = Steps))
StepG3 + geom_histogram(fill = "violet", colour = "blue", linetype = 5, alpha = 0.54,
                        binwidth = 500)
ggplot(Step, aes(DayType, Steps)) + stat_summary(fun.y = mean, geom = "bar",
                                                 fill = "violet", colour = "blue",
                                                 linetype = 5, alpha = 0.54)

ggplot(Step, aes("", fill = Day)) + geom_bar(position = "stack", colour = "blue",
                                             linetype = 5, alpha = 0.54)
ggplot(Step, aes("", fill = Day)) + geom_bar(position = "fill", colour = "blue",
                                             linetype = 5, alpha = 0.54)
ggplot(Step, aes("", fill = Day)) + geom_bar(position = "dodge", colour = "blue",
                                             linetype = 5, alpha = 0.54)

StepG4 <- ggplot(Step, aes(x = Rain, y = Mile)) + geom_point(aes(color = kcal)) +
  labs(title = "Пройденные мили в разную погоду", y = "Мили") +
  scale_x_discrete(name = "Погода", labels = c("cold", "rain", "shine")) +
  scale_color_continuous(name = "Сожженные калории")
print(StepG4)
help("ggplot2")

G5 <- ggplot(Step, aes(Day, Steps * 0.001, colour = kcal)) + geom_point() +
  labs(title = "Статистика шагомера", y = "Количество пройденных шагов") +
  scale_x_discrete(name="Дни недели", labels=c("Пн", "Bт", "Cр", "Чт", "Пт", "Сб", "Вс")) +
  scale_color_continuous(name ="Сожженные каллории", breaks=c(50,270), 
                         labels = c("Новичок","Спортсмен"), low="blue", high="red") +
  theme(plot.title = element_text(size = 16, color = "blue", face = "bold"), 
        axis.title.y = element_text(size = 14, color = "purple", face = "bold"),
        axis.text.y = element_text(size = 10, color = "blue"), 
        axis.title.x = element_text(size = 14, color = "purple", face = "bold"),
        axis.text.x = element_text(size = 10, color = "blue"))
G5 + facet_grid(DayType ~ Rain) +theme(legend.title = element_text(colour = "red"))

StepG5 <- ggplot(Step, aes("", fill = Rain)) + geom_bar(position = "fill", 
                                                        color = "violet", linetype=5)
StepG5 <- StepG5 + coord_polar(theta = "y")
StepG5 <- StepG5 + coord_polar(theta = "x")

ggsave(filename = "StepG5.png", plot = StepG5, device = "png")
