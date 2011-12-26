require(ggplot2)

x <- runif(500000, -10, 10)
y <- runif(500000, -4, 4)

f1 <- ((x/7)^2)*sqrt((abs(abs(x) - 3))/(abs(x) - 3)) + ((y/3)^2)*sqrt((abs(y + (3*sqrt(33))/7))/(y + (3*sqrt(33))/7)) - 1

f2 <- abs(x/2) - ((3*sqrt(33) - 7)/112)*x^2 - 3 + sqrt(1 - (abs(abs(x) - 2) - 1)^2) - y

f3 <- 9*sqrt(abs((abs(x) - 1)*(abs(x) - 3/4))/(1 - abs(x))/(abs(x) - 3/4)) - 8*abs(x) - y

f4 <- 3*abs(x) + (3/4)*sqrt(abs((abs(x) - 3/4)*(abs(x) - 1/2))/(3/4 - abs(x))/(abs(x) - 1/2)) - y

f5 <- (9/4)*sqrt(abs((x - 1/2)*(x + 1/2))/(1/2 - x)/(1/2 + x)) - y

f6 <- (6*sqrt(10))/7 + (3/2 - abs(x)/2)*sqrt((abs(abs(x) - 1))/(abs(x) - 1)) - ((6*sqrt(10))/14) *sqrt(4 - (abs(x) - 1)^2 ) - y

d1 <- data.frame(x=x,y=y,f=f1)
dd1 <- subset(d1, d1$f<0.025 & d1$f>-0.025 )
p1 <- ggplot(dd1,aes(x,y)) + geom_point(color="red")

d2 <- data.frame(x=x,y=y,f=f2)
dd2 <- subset(d2, d2$f<0.025 & d2$f>-0.025 )
p2 <- p1+geom_point(aes(x=dd2$x,y=dd2$y), color="yellow")

d3 <- data.frame(x=x,y=y,f=f3)
dd3 <- subset(d3, d3$f<0.05 & d3$f>-0.05 )
p3 <- p2+geom_point(aes(x=dd3$x,y=dd3$y), color="green")

d4 <- data.frame(x=x,y=y,f=f4)
dd4 <- subset(d4, d4$f<0.025 & d4$f>-0.025 )
p4 <- p3+geom_point(aes(x=dd4$x,y=dd4$y), color="steelblue")

d5 <- data.frame(x=x,y=y,f=f5)
dd5 <- subset(d5, d5$f<0.025 & d5$f>-0.025 )
p5 <- p4+geom_point(aes(x=dd5$x,y=dd5$y))

d6 <- data.frame(x=x,y=y,f=f6)
dd6 <- subset(d6, d6$f<0.05 & d6$f>-0.05 )
p6 <- p5+geom_point(aes(x=dd6$x,y=dd6$y), color="blue")

print(p6)

#p4 <- p3+geom_point(aes(x=x4,y=y4), color="steelblue")
#p5 <- p4+geom_point(aes(x=x5,y=y5))
#p6 <- p5+geom_point(aes(x=x6,y=y6), colour="blue")
