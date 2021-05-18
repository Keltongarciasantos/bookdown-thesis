# Séries Temporais

## Introdução

As Previsões são necessárias em várias situações para servir como suporte na tomada de decisões, muitas vezes com vários anos de antecedência. Por exemplo, para uma empresa decidir se vai investir na construção de uma  nova unidade de produção, nos próximos três anos, requer previsões da procura dos produtos e do retorno no futuro. Para se decidir sobre a implementação de determinada política económica-financeira, as autoridades de um determinado país precisam de previsões para análise da viabilidade da implementação dessa política.

Alguns eventos são mais fáceis de se fazer previsões do que outras. Por exemplo pode-se prever com alto grau de precisão a que horas será o por do sol daqui a uma semana, mas por exemplo prever que equipa irá vencer o próximo campeonato do mundo de futebol não pode ser previsto com 100% de certeza. Segundo [@hyndman2018forecasting], a presibilidade  de um evento depende de vários factores como:

* Nível de conhecimento dos factores que afectam o evento;
* Quantidade de dados disponíveis;
* Efeito que a previsão poderá ter no próprio
  
Por exemplo previsão do consumo de electricidade pode ser determinado com alto grau de precisão, pois as três condições acima normalmente são satisfeitas. (1)Têm-se ideia dos factores que podem afetar o consumo de electricidade (temperatura, época do ano, e condições económicas da população etc.); (2) normalmente têm-se dados do passado relativamente ao consumo de electricidade; (3) a precisão determinada normalmente não influência o consumo de electricidade no futuro [@hyndman2018forecasting]. No caso de previsões de taxas de câmbio somente a condição (2) é satisfeita, visto que têm-se conhecimento limitado dos factores externos que podem afetar as taxas de câmbio e a determinação e publicação das taxas de câmbio podem afetar a taxa de câmbio no futuro.
  
  \begin{equation}
y_i = \beta_0 + \beta_1x_i + \varepsilon_i,\  \varepsilon_i \overset{iid}{\sim} N(0, \sigma^2)
(\#eq:linreg)
\end{equation}


## Additional method

- text 6
- text 7
