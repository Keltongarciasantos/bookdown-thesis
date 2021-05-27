# Séries Temporais

## Introdução
\justify
As Previsões são necessárias em várias situações para servir como suporte na tomada de decisões e muitas vezes com vários anos de antecedência. Por exemplo, para uma empresa decidir se vai investir na construção de uma  nova unidade de produção, nos próximos cinco anos, requer previsões da procura dos produtos e do retorno do investimento no futuro. Para se decidir sobre a implementação de determinada política económica-financeira, as autoridades de um determinado país precisam de previsões para análise da viabilidade da implementação dessa política.

Alguns eventos são mais fáceis de se fazer previsões do que outras. Por exemplo pode-se prever com alto grau de precisão a que horas será o pôr do sol daqui a uma semana, mas prever que equipa irá vencer o próximo campeonato do mundo de futebol não pode ser previsto com 100% de certeza. Segundo [@hyndman2018forecasting], a presibilidade  de um evento depende de vários factores como:

* Nível de conhecimento dos factores que afectam o evento;
* Quantidade de dados disponíveis;
* Efeito que o conhecimento da previsão poderá ter no próprio evento.
  
Por exemplo a previsão do consumo de electricidade pode ser determinado com alto grau de precisão, pois as três condições acima normalmente são satisfeitas. Têm-se ideia dos factores que podem afetar o consumo de electricidade (temperatura, época do ano, e condições económicas da população etc.); normalmente têm-se dados do passado relativamente ao consumo de electricidade; a precisão determinada normalmente não influência o consumo de electricidade no futuro [@hyndman2018forecasting]. No caso de previsões de taxas de câmbio somente a segunda condição é satisfeita, visto que têm-se conhecimento limitado dos factores externos que podem afetar as taxas de câmbio e a previsão e publicação das taxas de câmbio podem afetar a taxa de câmbio no futuro.

Geralmente, os métodos usados nas previsões analisam dados do passado para tentar fazer previsões sobre valores futuros[@xavier2016analise]. O método apropriado a usar nas previsões depende muito dos dados disponíveis. Quando não existem dados disponíveis, ou se os dados não são muito relevantes para a previsão, usam-se **métodos de previsões qualitativas**, que são métodos bem desenvolvidos estruturados para obter previsões sem usar dados históricos[@hyndman2018forecasting].

Os **métodos de previsão quantitativas** são aplicadas quando as seguintes condições são satisfeitas:

1. Dados numéricos sobre o passado estão disponíveis;
2. É razoável assumir que alguns padrões verificadas no passado continuarão no futuro.

Existem vários métodos de previsão quantitativas dos mais simples aos mais complexos, normalmente desenvolvidos para áreas e propósitos específicos. A maioria dos métodos quantitativos usam dados em forma de *séries temporais*(recolhidos em intervalos regulares ao longo do tempo) ou dados de *corte transversal*, também chamados *cross-sectional* (relativos a um dado instante ou período de tempo).

Em Economia há dois procedimentos predominantes no processo de previsão: *modelos econométricos* e *modelos de séries temporais*.  *Métodos Econométricos* são métodos de previsões que determinam futuros movimentos numa variável relacionando-a com um conjunto de outras varíaveis de forma causal. Esses modelos aplicam teorias económicas para construir modelos que podem incluir várias variáveis. Por exemplo um modelo económetrico para determinar a taxa de juros, pode utilizar  dados de variáveis como PIB, preços, dinheiro em circulação etc. através de métodos de regressão como na equação \@ref(eq:linreg), onde $X_{i1}$ e $X_{i2}$ são as variáveis explicativas, $\beta_0$, $\beta_1$, $\beta_2$ são os coeficientes da regressão, $\varepsilon_i$ o erro e $Y_i$ a variável a ser estimada.

\begin{equation}
Y_i = \beta_0 + \beta_1X_{i1} +\beta_2X_{i2} + \varepsilon_i
(\#eq:linreg)
\end{equation}

Em determinadas situações o uso de modelos económetricos pode ser difícil ou impossível. Por exemplo se não houver dados disponíveis para as variáveis explicativas $X_{i1}$ e $X_{i2}$ que permitam a determinação dos coeficientes $\beta_0$, $\beta_1$, $\beta_2$, ou se os dados disponíveis resultarem em erros $\varepsilon_i$ muito grandes.

Dado a essas e outras razões muitas vezes recorre-se a outros tipos de modelos para previsão. contrariamente aos modelos econométricos que usam informações de outras varíaveis para a previsão de determinada variável, os métodos de *séries temporais* usam somente dados históricos da variável a ser estimada. Modelos de previsão de séries temporais são muitas vezes caracterizados como *método sofisticado de extrapolação* [@pindyck2008econometric]. O foco desse trabalho é justamente previsões com método de séries temporais. Para previsão usando métodos econométricos favor consultar [@pindyck2008econometric].


## Séries temporais

Uma série temporal é qualquer conjunto de observações ordenadas no tempo. Como exemplo de séries temporais temos:

i. Estimativas trimestrais do PIB de um país;
ii. Valores diários de temperatura em Cabo Verde;
iii. Cotações diárias das ações  da Banco Comercial do Atlântico na Bolsa de Valores de Cabo Verde;
iv. Valores mensais de vendas numa determinada empresa;
v. Registo de marés na ilha de Santiago - Cabo Verde.

As séries dos exemplos i. - iv. são séries temporais *discretas*, enquanto que a série do exemplo v. é *contínua* [@morettin1981modelos]. As séries temporais contínuas podem ser transformadas em discretas se for considerado uma amostragem em intervalos de tempos iguais $\Delta$. Dessa forma, para analisar a série v. será preciso usar uma amostra, por exemplo, em intervalos de um hora, convertendo a série contínua numa discreta com $N$ pontos.

## Objectivos da análise de séries temporais

Ao analisar uma série temporal, espera-se que exista uma causa relacionada com o tempo, que influenciou os dados no passado e que continuará a influencia-los futuramente [@xavier2016analise]. Segundo [@morettin1981modelos] o objectivo da análise de séries temporais é de construir modelos para as séries, com propósitos determinados.

Podemos destacar os seguinte objectivos da análise de séries temporais segundo [xavier2016analise]:

1. Determinar as propriedades de uma série, como sazonalidades, estacionaridade padrão de tendência, etc.
2. Desenvolver um modelo estatístico que permita explicar o comportamento da série no período observado;
3. Estimar valores futuros de uma série temporal, com base em dados históricos;
4. Tomar medidas de forma a controlar determinado processo.

De acordo com [@morettin1981modelos] existem dois enfoques usados na análise de séries temporais para o alcance dos objectivos acima. No primeiro enfoque, a análise é feita no *domínio temporal* e os modelos propostos são *modelos paramétricos* (com número finito de parâmetros). Pode-se destacar dentro dos modelos paramétricos os modelos ARIMA (Autoregressivo Médias Móveis). No segundo enfoque, a análise é conduzida no *domínio de frequências* e os modelos propostos são *modelos não paramétricos*. No domínio de frequências têm-se a *análise espectral*, que têm aplicações em ciências físicas e engenharia e que consiste em decompor a série inicial em componentes de frequência onde a existência de *espectro* é a característica fundamental. Para esse trabalho não será estudado este tipo de análise, podendo-se consultar [@box1994pages] para mais detalhes.

Quer no domínio temporal ou no domínio de frequências, são construídos *modelos probabilísticos* ou *estocásticos* para atingir os objetivos acima. Os modelos construídos devem ser simples e parcimónicos, ou seja, deve ter o menor número possível de parâmetros, e sempre que possível, a utilização dos modelos não devem apresentar dificuldades às pessoas interessadas em manipulá-los [@morettin1981modelos].

## Processos Estocásticos

Os modelos que se utilizam para descrever séries temporais são processos estocásticos, ou seja, processos controlados por leis probabilísticas.


\BeginKnitrBlock{definition}\iffalse{-91-70-101-110-243-109-101-110-111-115-32-65-108-101-97-116-243-114-105-111-115-93-}\fi{}<div class="definition"><span class="definition" id="def:unnamed-chunk-1"><strong>(\#def:unnamed-chunk-1)  \iffalse (Fenómenos Aleatórios) \fi{} </strong></span>São Fenómenos naturais em que se supõe a intervenção do acaso no sentido em que não é possível, a partir do passado prever determinísticamente o futuro.</div>\EndKnitrBlock{definition}
Os fenómenos aleatórios que se desenrolam no tempo são objeto do estudo do *processos estocásticos*. Os processos estocásticos são os modelos matemáticos que descrevem os fenómenos aleatórios que evoluem ao longo do tempo.

\BeginKnitrBlock{definition}\iffalse{-91-80-114-111-99-101-115-115-111-32-69-115-116-111-99-225-115-116-105-99-111-93-}\fi{}<div class="definition"><span class="definition" id="def:unnamed-chunk-2"><strong>(\#def:unnamed-chunk-2)  \iffalse (Processo Estocástico) \fi{} </strong></span>Dado um espaço de probabilidade $(\Omega, F, P)$ e um conjunto $T$, *processo estocástico* é uma função $X(t, w)$ definida no produto cartesiano $T\times \Omega$, que para cada $t \in T$ é uma variável aleatória. Simbólicamente escreve-se:</div>\EndKnitrBlock{definition}
\begin{equation}
X = \{X_t, t \in T\}
(\#eq:procestoc)
\end{equation}

Assim saberemos que todas as pessoas têm de ser

