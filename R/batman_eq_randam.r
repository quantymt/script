install.packages("ggplot2")
require(ggplot2)
x <- runif(500000, -10, 10)
y <- runif(500000, -4, 4)
f1 <- ((x/7)^2)*sqrt((abs(abs(x) - 3))/(abs(x) - 3)) + ((y/3)^2)*sqrt((abs(y + (3*sqrt(33))/7))/(y + (3*sqrt(33))/7)) - 1
f2 <- abs(x/2) - ((3*sqrt(33) - 7)/112)*x^2 - 3 + sqrt(1 - (abs(abs(x) - 2) - 1)^2) - y
f3 <- 9*sqrt(abs((abs(x) - 1)*(abs(x) - 3/4))/(1 - abs(x))/(abs(x) - 3/4)) - 8*abs(x) - y
f4 <- 3*abs(x) + (3/4)*sqrt(abs((abs(x) - 3/4)*(abs(x) - 1/2))/(3/4 - abs(x))/(abs(x) - 1/2)) - y
f5 <- (9/4)*sqrt(abs((x - 1/2)*(x + 1/2))/(1/2 - x)/(1/2 + x)) - y
f6 <- (6*sqrt(10))/7 + (3/2 - abs(x)/2)*sqrt((abs(abs(x) - 1))/(abs(x) - 1)) - ((6*sqrt(10))/14) *sqrt(4 - (abs(x) - 1)^2 ) - y
d1 <- data.frame(x=x,y=y,f=f1,col="red")
dd1 <- subset(d1, d1$f<0.025 & d1$f>-0.025 )
d2 <- data.frame(x=x,y=y,f=f2,col="yellow")
dd2 <- subset(d2, d2$f<0.025 & d2$f>-0.025 )
d3 <- data.frame(x=x,y=y,f=f3,col="green")
dd3 <- subset(d3, d3$f<0.05 & d3$f>-0.05 )
d4 <- data.frame(x=x,y=y,f=f4,col="steelblue")
dd4 <- subset(d4, d4$f<0.025 & d4$f>-0.025 )
d5 <- data.frame(x=x,y=y,f=f5,col="black")
dd5 <- subset(d5, d5$f<0.025 & d5$f>-0.025 )
d6 <- data.frame(x=x,y=y,f=f6,col="blue")
dd6 <- subset(d6, d6$f<0.05 & d6$f>-0.05 )

r1 = rbind ( dd1, dd2)
r1 = rbind ( r1, dd3)
r1 = rbind ( r1, dd4)
r1 = rbind ( r1, dd5)
r1 = rbind ( r1, dd6)
p1 <- ggplot(r1,aes(x,y,col)) + geom_point(col=r1$col)
print(p1)
