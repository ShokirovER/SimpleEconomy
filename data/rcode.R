data <- read.csv("experiment_data", skip = 6)

plot(data$ticks, data$max..wealth..of.turtles, 
     type = "l", 
     col = "red", 
     lwd = 3,
     xlab = "Тики (шаги модели)", 
     ylab = "Богатство (доллары)",
     main = "Рост максимального богатства во времени",
     cex.main = 1.2,
     cex.lab = 1,
     ylim = c(80, 300))
grid(col = "lightgray")

gap <- data$max..wealth..of.turtles - data$mean..wealth..of.turtles

plot(data$ticks, gap, 
     type = "l", 
     col = "darkred", 
     lwd = 3,
     xlab = "Тики (шаги модели)", 
     ylab = "Разница в долларах",
     main = "Разрыв между максимальным и средним богатством")
grid(col = "lightgray")

data2 <- read.csv("experiment_data2", skip = 6)
final2 <- data2[data2$ticks == 1000, ]
sums <- aggregate(sum..wealth..of.turtles ~ num.agents, data = final2, FUN = mean)

bp <- barplot(sums$sum..wealth..of.turtles / 1000,
              names.arg = c("100", "500", "1000"),
              col = c("#3498DB", "#2ECC71", "#E74C3C"),
              xlab = "Количество агентов",
              ylab = "Общая сумма (тыс. долларов)",
              main = "Общая сумма богатства в системах разного размера",
              ylim = c(0, 120),
              border = "white",
              las = 1)

text(bp, sums$sum..wealth..of.turtles / 1000 + 3, 
     labels = paste0(sums$sum..wealth..of.turtles / 1000, "k"), 
     cex = 1.2, font = 2)
