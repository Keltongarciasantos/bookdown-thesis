library(ggplot2)
library(scales)
library(lubridate)
library(readxl)
entrada<- read_excel("R_codes_examples/entrada_turistas.xlsx", sheet = "mensal", col_types = c("date", "numeric"))
ggplot(entrada, aes(x = entrada$`mes_ano`, y = entrada$`movimento_de_passageiros`)) +
  geom_line( colour = "#0c4c8a") + 
  scale_x_date(date_breaks = "6 months",labels = date_format("%b-%Y"),limits = c(as.Date("2006-08-01"), NA)) +
  scale_y_continuous(labels=function(n){format(n, scientific = FALSE)}) +
  labs(y= "Movimento de Passageiros mensais 2006 a 2017 ", x = "Mês/Ano") +
  xlab("") +
  theme(axis.text.x=element_text(angle=60, hjust=1))

