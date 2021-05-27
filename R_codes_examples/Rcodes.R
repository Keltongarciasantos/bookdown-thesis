# purely random process with mean 0 and standard deviation 1.5
library("ggplot2")
eps <- rnorm(100, mean = 0, sd = 1)
mu <- 2 
X_t <- mu + eps
#ts.plot(X_t, main = "Exemplo of série temporal estacionária", xlab = "Tempo", ylab = expression(X[t]), col = "blue")
ggplot(X_t, aes('Exemplo de série temporal estacionária','Tempo', colour = class)) + 
  geom_point( )