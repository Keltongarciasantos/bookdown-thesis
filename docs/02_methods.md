---
output:
  html_document: default
  pdf_document: 
    toc: yes
---
# Séries Temporais

## Introdução

\justify
As previsões são necessárias em várias situações para servir como suporte na tomada de decisões e muitas vezes com vários anos de antecedência. Por exemplo, para uma empresa decidir se vai investir na construção de uma  nova unidade de produção, nos próximos cinco anos, requer previsões da procura dos produtos e do retorno do investimento no futuro. Para se decidir sobre a implementação de determinada política económica-financeira, as autoridades de um determinado país precisam de previsões para análise da viabilidade da implementação dessa política.

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

### Objectivos da análise de séries temporais

Ao analisar uma série temporal, espera-se que exista uma causa relacionada com o tempo, que influenciou os dados no passado e que continuará a influencia-los futuramente [@xavier2016analise]. Segundo [@morettin1981modelos] o objectivo da análise de séries temporais é de construir modelos para as séries, com propósitos determinados.

Podemos destacar os seguinte objectivos da análise de séries temporais segundo [xavier2016analise]:

1. Determinar as propriedades de uma série, como sazonalidades, estacionaridade padrão de tendência, etc.
2. Desenvolver um modelo estatístico que permita explicar o comportamento da série no período observado;
3. Estimar valores futuros de uma série temporal, com base em dados históricos;
4. Tomar medidas de forma a controlar determinado processo.

De acordo com [@morettin1981modelos] existem dois enfoques usados na análise de séries temporais para o alcance dos objectivos acima. No primeiro enfoque, a análise é feita no *domínio temporal* e os modelos propostos são *modelos paramétricos* (com número finito de parâmetros). Pode-se destacar dentro dos modelos paramétricos os modelos ARIMA (Autoregressivo Médias Móveis). No segundo enfoque, a análise é conduzida no *domínio de frequências* e os modelos propostos são *modelos não paramétricos*. No domínio de frequências têm-se a *análise espectral*, que têm aplicações em ciências físicas e engenharia e que consiste em decompor a série inicial em componentes de frequência onde a existência de *espectro* é a característica fundamental. Para esse trabalho não será estudado este tipo de análise, podendo-se consultar [@box1994pages] para mais detalhes.

Quer no domínio temporal ou no domínio de frequências, são construídos *modelos probabilísticos* ou *estocásticos* para atingir os objetivos acima. Os modelos construídos devem ser simples e parcimónicos, ou seja, deve ter o menor número possível de parâmetros, e sempre que possível, a utilização dos modelos não devem apresentar dificuldades às pessoas interessadas em manipulá-los [@morettin1981modelos].

## Processos Estocásticos

Os modelos que se utilizam para descrever séries temporais são processos estocásticos, ou seja, processos controlados por leis probabilísticas. Para [@chatfield2000time], a maioria das séries temporais são estocásticas, ou aleatórias ou seja, o futuro é apenas parcialmente determinado por valores passados, sendo o modelo para estas séries muitas vezes chamado de processo estocástico.


\BeginKnitrBlock{definition}\iffalse{-91-70-101-110-243-109-101-110-111-115-32-65-108-101-97-116-243-114-105-111-115-93-}\fi{}<div class="definition"><span class="definition" id="def:unnamed-chunk-1"><strong>(\#def:unnamed-chunk-1)  \iffalse (Fenómenos Aleatórios) \fi{} </strong></span>São Fenómenos naturais em que se supõe a intervenção do acaso no sentido em que não é possível, a partir do passado prever determinísticamente o futuro.</div>\EndKnitrBlock{definition}
Os fenómenos aleatórios que se desenrolam no tempo são objeto do estudo do *processos estocásticos*. Os processos estocásticos são os modelos matemáticos que descrevem os fenómenos aleatórios que evoluem ao longo do tempo.

\BeginKnitrBlock{definition}\iffalse{-91-80-114-111-99-101-115-115-111-32-69-115-116-111-99-225-115-116-105-99-111-93-}\fi{}<div class="definition"><span class="definition" id="def:unnamed-chunk-2"><strong>(\#def:unnamed-chunk-2)  \iffalse (Processo Estocástico) \fi{} </strong></span>Dado um espaço de probabilidade $(\Omega, F, P)$ e um conjunto $T$, *processo estocástico* é uma função $X(t, w)$ definida no produto cartesiano $T\times \Omega$, que para cada $t \in T$ é uma variável aleatória. Simbólicamente escreve-se:</div>\EndKnitrBlock{definition}
\begin{equation}
X = \{X_t, t \in T\}
(\#eq:procestoc)
\end{equation}

Assim, um processo estocástico é uma família de variáveis aleatórias $X = \{X_t, t \in T\}$ definidas num mesmo espaço de probabilidade $(\Omega, F, P)$. Normalmente $T$ é tomado como o conjunto $\mathbb{Z}$ ou o conjunto  dos números reais $\mathbb{R}$.
Para cada $\omega _0 \in \Omega$, $X(w_0,t) = x(t)$ é uma função não aleatória de $t$ com domínio em $T$. Assim podemos identificar um *processo estocástico* como sendo um sistema que, a cada ponto $\omega_0 \in \Omega$ faz corresponder uma função de parâmetro $t$. Cada uma dessas funções chamam-se *realização* ou *trajetória* do processo, ou ainda, uma *série temporal* [@morettin1981modelos]. A totalidade das realizações $X^{(1)}_t,\ X^{(2)}_t, ...$ designa-se por *ensamble*.

### Classificação dos processos estocásticos
O conjunto dos valores $X_t, t \in T$ é chamado *espaço dos estados*, *E*, do processo estocástico e os valores de $X_t$ são chamados *estados*, ou seja *E* é o conjunto dos possíveis valores das variáveis aleatórias $X_t, t\in T$.


* Se $T$ e $E$ forem conjuntos discretos diz-se  que $X$ é um processo estocástico de tempo discreto com espaço de estados discreto.
* Se $T$ for discreto e $E$ contínuo, diz-se que $X$ é um processo estocástico de tempo discreto com espaço de estados contínuo.
* Se $T$ contínuo e $E$ discreto, diz-se que $X$ um processo estocástico de tempo contínuo com espaço de estados discreto
* Se $T$ e $E$ são contínuos diz-se que $X$ um processo estocástico de tempo contínuo com espaço de estados contínuo.

### Lei de probabilidade de um processo estocástico

Sejam $\{t_1, t_2,...,t_n\}$ elementos quaisquer do conjunto $T$ pode-se determinar a lei de probabilidade conjunta do vector aleatório $(X_{t_1}, X_{t_1},...,X_{t_n})$ de dimensão finita $n$, através da função de distribuição conjunta:

\begin{equation}
F_{(X_{t_1}, X_{t_1},...,X_{t_n})}(x_1, x_2,...,x_n) = P(X_{t_1}\leq x_1, X_{t_2}\leq x_2,..., X_{t_n}\leq x_n )
(\#eq:leiprobpe)
\end{equation}

O conjunto de todas as leis de probabilidade, definida por:
\begin{equation*}
F_{(X_{t_1}, X_{t_2},...,X_{t_n})}:(t_1, t_2,...,t_n \in T)
\end{equation*}

é conhecida como *família de distribuições de dimensão finita* do processo estocástico. Geralmente, quando $t$ é discreto, o conhecimento das funções de distribuição de dimensão finita permite a determinação da probabilidade de qualquer acontecimento associado ao respetivo acontecimento [@morettin1981modelos].

\BeginKnitrBlock{definition}\iffalse{-91-73-110-99-114-101-109-101-110-116-111-115-32-73-110-100-101-112-101-110-100-101-110-116-101-115-93-}\fi{}<div class="definition"><span class="definition" id="def:unnamed-chunk-3"><strong>(\#def:unnamed-chunk-3)  \iffalse (Incrementos Independentes) \fi{} </strong></span>O processo estocástico $X = \{X_t, t \in T\}$ diz-se *processo estocástico com incrementos independentes* sse $\forall n, \forall t_1, t_2,...,t_n \in T : t_1<...<t_n$ as variáveis aleatórias $X_{t_1} - X_{t_2},...,X_{t_n} - X_{t_{n-1}}$ são independentes.
</div>\EndKnitrBlock{definition}

A definição acima é importante do ponto de vista da modelação, uma vez que permite descrever fenómenos cujos resultados são independentes em intervalo de tempo disjuntos

\BeginKnitrBlock{definition}\iffalse{-91-73-110-99-114-101-109-101-110-116-111-115-32-69-115-116-97-99-105-111-110-225-114-105-111-115-93-}\fi{}<div class="definition"><span class="definition" id="def:unnamed-chunk-4"><strong>(\#def:unnamed-chunk-4)  \iffalse (Incrementos Estacionários) \fi{} </strong></span>
O processo estocástico $X = \{X_t, t \in T\}$ diz-se *processo estocástico com incrementos estacionários* sse $\forall s,t \in T(s < t)$ as distribuição de incrementos $X_{t} - X_{s}$ depende  apenas da amplitude $t-s$
</div>\EndKnitrBlock{definition}
Ou seja, a distribuição de resultados em qualquer intervalo de tempo depende unicamente da amplitude do intervalo. Quando um processo estocástico tem incrementos independentes e estacionários simultaneamente dez-se *processo com incrementos independentes e estacionários*.

\BeginKnitrBlock{definition}\iffalse{-91-80-114-111-99-101-115-115-111-32-100-101-32-115-101-103-117-110-100-97-32-111-114-100-101-109-93-}\fi{}<div class="definition"><span class="definition" id="def:unnamed-chunk-5"><strong>(\#def:unnamed-chunk-5)  \iffalse (Processo de segunda ordem) \fi{} </strong></span>
O processo estocástico $X = \{X_t, t \in T\}$ diz-se *processo real de segunda ordem* se:
O conjunto de todas as leis de probabilidade, definida por:
\begin{equation*}
\forall t \in T, E(X^{2}_t) < \infty
\end{equation*}
</div>\EndKnitrBlock{definition}

Exemplos clássicos de um processo de segunda ordem são:

1. **Ruído Branco** ou *white noise* $(X_t, t \in T)$ define-se por:
  * $\forall t \in T, E(X_t)=0$
  * $\forall t \in T, V(X_t)=\sigma^2$
  * $\forall s,t \in T : s\neq t,Cov(X_s,X_t)=0$
2. **Processo Gaussiano** $(X_t, t \in T)$  tal que $\forall n \in \mathbb{N}, \forall t_1,...,t_n \in T,$ $(X_{t_1}, X_{t_2},...,X_{t_n})$ é vector aleatório Gaussiano.

### Processos estacionários

Os modelos de séries temporais a serem desenvolvidos nos próximos capítulos são todos baseados na suposição de que as séries são geradas por um processo estocástico. Em outras palavras, assumimos que cada valor $X_{t_1}, X_{t_2},...,X_{t_n}$ é extraído aleatoriamente de uma distribuição de probabilidade. Ao modelar esses processos, tentamos descrever as características da sua aleatoriedade. Isso nos permite inferir, até certo ponto, sobre as probabilidades associados aos valores futuros alternativos da série.

Se pudéssemos numericamente especificar a função distribuição de probabilidade das séries, poderíamos determinar resultados futuros. Infelizmente a determinação de tal função de distribuição é normalmente impossível. Entretanto, normalmente é possível construir um modelo simplificado de séries temporais que explicam a aleatoriedade, de maneira útil para previsões. O modelo simplificado construído não precisa (e normalmente não) produzir obrigatoriamente os valores passados conhecidos, uma vez que a série e o modelo são estocásticos. Esse modelo deve simplesmente capturar as características da aleatoriedade da série analisada [@pindyck2008econometric].

Segundo [@morettin1981modelos], poderemos ter as seguintes classes de processos:

* Processos estacionários ou não estacionários, de acordo com a independência ou não relativamente à origem dos tempos;
* Processos normais (Gaussianos) ou não normais, de acordo com as fdp que caracterizam os processos;
* Processos Markovianos ou não Markovianos, de acordo com a independência dos valores em instantes precedentes

Assim um processo $X$ é estacionário se desenvolver no tempo de modo que a escolha de uma origem dos tempos não importante, ou seja, as características de $X(t + \delta)$, para todo $\delta$, são as mesmas de $X(t)$.

Em termos gerais, os processos estacionários traduzem situações em que o sistema se apresenta num estado de equilíbrio estatístico em torno de um nível médio fixo, isto é, tem propriedades probabilísticas estáveis ou invariantes ao longo do tempo.

\BeginKnitrBlock{definition}\iffalse{-91-69-115-116-97-99-105-111-110-97-114-105-100-97-100-101-32-102-111-114-116-101-93-}\fi{}<div class="definition"><span class="definition" id="def:unnamed-chunk-6"><strong>(\#def:unnamed-chunk-6)  \iffalse (Estacionaridade forte) \fi{} </strong></span>
Um processo estocástico $X = \{X_t, t \in T\}$ diz-se *fortemente estacionário*, se $\forall n \in \mathbb{N}, t_1, t_2,...,t_n \in T : t_1<...<t_n$,

\begin{equation}
(X_{t_1},...,X_{t_n}) = (X_{t_{1 + h}},...,X_{t_{n+h}}), h > 0
\end{equation}

isto é,

\begin{equation}
P(X_{t_1}\leq x_1,...,X_{t_n} \leq x_n) = P(X_{t_{1+h}}\leq x_1,...,X_{t_{n+h}} \leq x_n)
(\#eq:estforte)
\end{equation}
</div>\EndKnitrBlock{definition}

Segundo [@shumway2000time] a estacionaridade em \@ref(eq:estforte) é muito forte para a maioria das aplicações. Em vez de impor condições para todas as possíveis distribuições de uma série temporal, pode-se usar uma versão mais "mansa" que impões condições somente nos primeiros dois momentos das séries (momentos de segunda ordem). Teremos então a seguinte definição:

\BeginKnitrBlock{definition}\iffalse{-91-69-115-116-97-99-105-111-110-97-114-105-100-97-100-101-32-102-114-97-99-97-93-}\fi{}<div class="definition"><span class="definition" id="def:unnamed-chunk-7"><strong>(\#def:unnamed-chunk-7)  \iffalse (Estacionaridade fraca) \fi{} </strong></span>
Um processo estocástico $X = \{X_t, t \in T\}$ diz-se *fracamente estacionária*, se 

* $\forall t \in T, E(X^{2}_t) < \infty$ (processo de segunda ordem)
* $\forall t \in T, E(X_t) = \mu$ (independente de $t$)
* $\forall t, s \in T, \Gamma(s,t) = Cov(X_s, X_t) = \gamma(\left | t-s \right |)$
  </div>\EndKnitrBlock{definition}

Daqui em diante usaremos o termo **estacionário** em vez de **fracamente estacionário**. Se um processo for fortemente estacionário, usaremos o termo **estritamente estacionário** ou **fortemente estacionária**
Os processos estacionários são apropriados para modelar fenómenos aleatórios cujo comportamento parece não mudar muito com o tempo [@shumway2000time].

Existem vários tipos de não estacionaridade, mas nos próximos capítulos veremos que tais processos podem ser transformados em processos estacionários através de diferenças sucessivas.

\BeginKnitrBlock{definition}\iffalse{-91-70-117-110-231-227-111-32-100-101-32-99-111-118-97-114-105-97-110-231-97-93-}\fi{}<div class="definition"><span class="definition" id="def:unnamed-chunk-8"><strong>(\#def:unnamed-chunk-8)  \iffalse (Função de covariança) \fi{} </strong></span>
Uma função real 
\begin{equation*}
\Gamma:T\times T\rightarrow \mathbb{R}\\
(s,t) \rightarrow \Gamma(s,t)
\end{equation*}

é uma função de covariança de um processo estocástico real de segunda ordem sse $\Gamma$ é uma função simétrica e definida positiva.  </div>\EndKnitrBlock{definition}
Por outras palavras, $\Gamma$ é uma função de autocorrelação se satisfazer as seguintes condições:

* $\gamma(0) >0$;
* $\gamma(-h) = \gamma(h)$;
* $\left | \gamma(t) \right | \leq \gamma(0)$
* $\gamma(t)$ é **positiva definida**, no sentido que 

\begin{equation}
\sum_{j=1}^{n}\sum_{k=1}^{n}a_ja_k\gamma(t_j-t_k) \geq 0, \forall n\in \mathbb{N}, \forall a_j \in \mathbb{R}, j=1,...,n
\end{equation}


\BeginKnitrBlock{definition}\iffalse{-91-70-117-110-231-227-111-32-100-101-32-97-117-116-111-99-111-114-114-101-108-97-231-227-111-93-}\fi{}<div class="definition"><span class="definition" id="def:unnamed-chunk-9"><strong>(\#def:unnamed-chunk-9)  \iffalse (Função de autocorrelação) \fi{} </strong></span>
A função de autocorrelação é definida por

\begin{equation}
\rho = Corr(X_t,X_{t+h}) = \frac{Cov(X_t,X_{t+h})}{\sqrt{V(X_t)}\sqrt{V(X_{t+h})}} = \frac{\gamma(h)}{\gamma(0)}
(\#eq:autocorrelacao)
\end{equation}</div>\EndKnitrBlock{definition}
Como usualmente é quase impossível obter uma descrição completa de um processo estocástico ( isto é, especificar a função distribuição de probabilidade correspondente), a função de autocorrelação demonstra-se muito útil porque ela fornece uma descrição parcial do processo para efeito de modelação. A função autocorrelação indica o nível de correlação existente entre pontos vizinhos de uma série e ela é usada normalmente para identificar um modelo adequado para a série temporal $X_t$ [@pindyck2008econometric].

## Tendência e sazonalidade das séries temporais

Dois dos principais motivos por detrás das variações da maioria das séries temporais são a *tendência* e a *sazonalidade*. Pode-se definir **tendência** como um comportamento de longo prazo da série temporal. Normalmente esse tipo de variação está presente quando um série apresenta constante crescimento ou declínio, em sucessivos períodos de tempo [@xavier2016analise].

Se considerarmos que a série temporal não apresenta a componente sazonal, poderemos escrever o modelo

\begin{equation}
X_t = T_t + \epsilon_t
(\#eq:tendencia)
\end{equation}
onde $\epsilon_t$ é um ruído branco (uma variável aleatória com média zero e variância $\sigma^{2}$) e $T_t$ o estimador da tendência. Existem vários métodos de se estimar $T_t$. Segundo [@morettin1981modelos] os mais utilizados são:

1. Ajustar uma função do tempo, como um polinómio, uma exponencial ou outra função suave de $t$;
2. Suavizar (ou filtrar) os valores da série ao redor de um ponto, para estimar a tendência naquele ponto.

Depois de estimada a tendência $\hat{T}_t$, podemos considerar a série ajustada para a tendência ou livre da tendência,

\begin{equation}
Y_t = X_t - \hat{T}_t
(\#eq:tendencias)
\end{equation}

Outro procedimento que é também utilizado para eliminar a tendência de uma série, consiste em tomar sucessivas diferenças da série original até encontrar uma série estacionária. Segundo [@morettin1981modelos], para séries económicas, a primeira diferença já é estacionária
\begin{equation}
\Delta X_t = X_t - X_{t-1}
(\#eq:tendenciass)
\end{equation}

O testes mais utilizados para identificar tendências são:

1. *Teste de Sequências* (Wald-Wolfowitz)
2. *Teste do Sinal* (Cox - Stuart)
3. *Teste baseado do coeficiente de correlação de Spearaman*

A **Sazanolidade** é um tipo de variação onde fenômenos que ocorrem durante o tempo se repete a cada período idêntico de tempo. Por exemplo o aumento de vendas de uma loja todos os anos no período de Natal.
A sazonalidade pode ser devidida em dois tipos, *sazonalidade determinista*, quando o padrão sazonal é regular e estável no tempo, ou *sazonalidade estocástica* quando o padrão sazonal varia como tempo [@xavier2016analise].


Existem vários procedimentos para se estimar a sazonalidade, sendo que as mais utilizadas são os *métodos de regressão* e os *métodos de médias móveis*. Os métodos de regressão são mais apropriados para séries que apresentam sazonalidade determinística, ou seja, pode ser prevista normalmente a partir de comportamento dos dados em períodos anteriores [@morettin1981modelos]. Já o método de médias móveis é mais apropriado para séries temporais cuja componente sazonal varia com o tempo, isto é, séries de sazonalidade estocástica.


Os testes mais utilizados para estimar a sazonalidade são

1. *Teste de Kruskal-Wallis*, para várias amostras independentes;
2. *Teste de Friedman*, para amostras dependentes/emparelhadas
3. *Teste F* para determinar sazonalidade determinística

Uma outra abordagem seria incorporar a variação sazonal e a tendência em um modelo ARIMA (será estudado no próximo capítulo).

## Modelos Matemáticos para previsão de séries temporais

Um método de previsão, normalmente tem associado alguns procedimentos, que de acordo os dados históricos disponíveis, poder-se prever o comportamento dos mesmos no futuro. Os métodos de previsão de séries temporais tem como base a suposição que os dados passados contêm as informações sobre o padrão de comportamento da série.

De acordo com [chatfield2000time], podemos classificar o métodos de previsão em três tipos

* **As previsões Julgamentais** (*Judgemental*), que se baseia no julgamento subjectivo, intuição e na experiência sem qualquer outra informação revelante.
* **Métodos univariados**, em que as previsões dependem apenas dos valores passados de uma única variável, podendo ser auxiliada por uma função de tempo ou por uma tendência linear. Nesse trabalho a ênfase será nesses métodos.
* **Métodos multivariados**, onde as previsões de uma variável dependem dos valores de uma ou mais variáveis adiconais, chamados variáveis explicativas. Normalmente esses métodos são usados na econometria.


Existem vários métodos dos mais simples aos mais complexos, mas nem sempre os mais complexos produzem os melhores resulados, por isso será necessário avaliar as vantagens dos métodos antes de se iniciar a previsão.
Ao escolher os métodos, deve-se ter em atenção as seguintes medidas de erro.

* Análise gráfica;
* Diagrama de dispersão;
* Coeficiente de correlação;
* Erro quadrático acumulado;
* Raíz do errro médio quadrático (RMSE);
* Erro percentual absoluto (MAPE)
* ...

Pode-se classificar os modelos para séries temporais em duas classes, de acordo como o número de parâmetros envolvidos [@morettin1981modelos]:

* Modelos paramétricos, onde o número de parâmetros é finito;
* Modelos não paramétricos, o número de parâmetros é infinito.

Nos modelos parmétricos, a análise é feita no domínio do tempo. Dentre esses modelos, os mais utilizados são os modelos de regressão (ou de erro), os modelos autoregressivos - médias móveis(ARMA) e os modelos autoregressivos-integrados-médias móveis (ARIMA). 
Os modelos não paramétricos mais frequentemente usados são a função de auto-covariânça (ou auto-correlação) e sua transformada de Fourier, o *espectro*.


Pode-se escrever a série temporal observada na forma
\begin{equation}
X_t = f(t) + \epsilon_t, t=1,...,n,
(\#eq:sinal)
\end{equation}
onde $f(t)$ é denominado *sinal* e $\epsilon_t$ o *ruído*

De acordo com as hipóteses estabelicidas para \@ref(eq:sinal), pode-se ter duas classes de modelos, os modelos de regressão  ou os modelos ARIMA.



### Modelos de erros ou de regressão

Esse são os modelos mais clássicos e provavelmente os primeiros a serem utilizados [@morettin1981modelos]. Nesses modelos, os sinal de $f(t)$ em \@ref(eq:sinal), é uma função completamente determinada(parte sistemática determinística) e $\epsilon_t$ é uma sequência aleatória, independente de $f(t)$ [@morettin1981modelos]. Supõe-se que as variáveis aleatórias $\epsilon_t$ não são correlacionadas, têm média zero e variância constante, isto é,

\begin{equation}
E(\epsilon_t) = 0,\\
E(\epsilon^{2}_t) = \sigma^{2}_{\epsilon},\\
E(\epsilon_t, \epsilon_s) = 0,  \text{  para  } s\neq s
(\#eq:sistdeter)
\end{equation}

Nessas condições, a série $\epsilon_t$ é chamada de *ruído branco*.

Desta maneira, qualquer efeito do tempo influência somente a parte determinística $f(t)$ e os modelos onde $X_t$ depende funcionalmente de $X_{t-1}, X_{t-2},...$ não estão incluídos em \@ref(eq:sinal) com estas suposições.
Abaixo temos alguns exemplos desses métodos.

#### Modelo de tendência linear

\begin{equation}
X_t = \alpha + \beta t + \epsilon_t,  \text{  com   } t = 1,...,n
(\#eq:tlinear)
\end{equation}
com $f(t) = \alpha + \beta t$, que é uma função linear dos parâmetros.
 
#### Modelo de regressão:

\begin{equation}
X_t = \alpha + \beta X_t + \epsilon_t,  \text{  com  }  t = 1,...,n
(\#eq:regress)
\end{equation}
com $f(t) = \alpha + \beta X_t$, sendo $x_t$ uma quantidade observável e $f(t)$ um função linear de parâmetros.
Nestes casos os parâmetros podem se estimados usando-se o método de mínimos quadrados.
 
#### Modelos de curva de crescimento

\begin{equation}
X_t = \alpha + e^{\beta t + \epsilon_t}, \text{ ou } X_t=\log \alpha +\beta t+\epsilon_t  
(\#eq:curvcresc)
\end{equation}

Neste caso, $f(t)$ não é uma função linear dos parâmetros, embora $log (X_t)$ o seja. Segundo [@morettin1981modelos] normalmente, ha dois tipos diferentes de funções para $f(t)$


1. polinómio em $t$, em geral de grau baixo, da forma
\begin{equation}
f(t) = \beta_0 + \beta_1t+...+\beta_mt^m  
(\#eq:polin1)
\end{equation}
de modo que a componente sistemática move-se lentamente, suavemente e progressivamente ao longo do tempo. a função $f(t)$ representa uma *tendência polinomial determinística de grau $m$*. Daí resulta que o processo $X_t$ será não estacionário, se $m >0$.

2. polinômio harmônico, ou seja, uma combinação linear de senos e cossenos com coeficientes constantes, da forma
\begin{equation}
f(t) = \sum_{n=1}^{p}(\alpha_ncos\lambda_nt + \beta_nsen\lambda_nt)
(\#eq:polin2)
\end{equation}
com $\lambda_n = \frac{2 \pi n}{p}$, se $f(t)$ tem período $p$.

O modelo de erro é clássico para análise de séries econômicas, onde $f(t)$ é composta da adição ou multiplicação de ambos os tipos  de função: \@ref(eq:polin1)  representará a tendência e \@ref(eq:polin2) representará as variações sazonais. Isto é $f(t) = T_t + S_t$, donde

\begin{equation}
X_t = T_t + S_t + \epsilon_t
(\#eq:sazon1)
\end{equation}
Normalmente, $T_t$ é a componente da tendência, enquanto que $S_t$ é a componente sazonl.

### Modelos ARIMA

Estabelecendo-se a hipótese de que os erros não são correlacionados, introduz limitações quanto a validade e aplicabilidade dos modelos do tipo \@ref(eq:sinal), para descrever comportamento de séries económicas, onde os erros normalmente são auto-correlacionados e influenciam a evolução do processo [@morettin1981modelos].

Nessas situações, os modelos ARIMA são muito úteis para a previsão. Pode-se descrever duas classes de processos pelo método ARIMA

* **Processos lineares estacionários**, que podem ser representados na forma

\begin{equation}
X_t - m = \epsilon_t +\phi_1 \epsilon_{t-1} + \phi_2 \epsilon_{t-2} +... = \sum_{k = 0 }^{\infty}\phi_k\epsilon_{t-k}, \text{ com } \phi_0 = 1
(\#eq:proclineaesta)
\end{equation}

Na expressão acima, como mencionado anteriormente, $\epsilon_t$ é ruído branco e $m = E(X_t)$; e $\phi_1, \phi_2,....$ a sequência de parâmetros tal que

\begin{equation}
\sum_{k = 0 }^{\infty}\phi^{2}_k < \infty
\end{equation}

A partir de \@ref(eq:proclineaesta) pode-se identificar três casos particulares que usaremos frequentemete nos próximos capítulos.

  1. Processo Auto - regressivo de ordem $p$; $AR(p)$
  2. Processo de médias móveis de ordem $q$: $MA(q)$
  3. Processo auto - regressivo - médias móveis de ordem $p$ e $q$: $ARMA(p,q)$

Nesse momento não vamos desenvolver muito esse tema, visto que é um assunto que será abordado com mais cuidado no próximo capítulo.

* **Processos lineares não estacionários homogênios**, constituem uma generalização dos processos lineares estacionários, que pressupõem que o mecanismo gerador da série prosuz erros auto-correlacionados e que as séries são não estacionárias. Entretanto estas séries podem se tornar estacionárias através de um número finito de diferenças.

Esses processos são descritos de maneira adequada pelos métodos auto-regressivos-integrados-médias móveis de ordem $p$, $d$, e $q$: $ARIMA(p, d, q)$ que podem ser generalizados pela inclusão de um operador sazonal. O próximo capítulo será dedicado principalmente aos modelos $ARIMA$

Segundo [@morettin1981modelos], algumas vezes, o sinal de $f(t)$ no modelo \@ref(eq:sinal), não pode ser aproximado por uma função simples do tempo, como em \@ref(eq:polin1). Nefsse caso para a estimação da tendência tem de se utilizar procedimentos não paramétricos de suazização. **Suavização ou alisamento** é um processo que transforma a série $X_t$, no instante $t$ numa outra série dada por

\begin{equation}
X^*_t = \sum_{k = -n}^{n}b_kX_{t+k}, \text{ onde, } t = n+1,...,N-n
(\#eq:filtro)
\end{equation}

Usamos $2n+1$ observações ao redor do instante $t$ para estimar a tendência naquele instante. Nesse caso perdemos $n$ observações no início da série e outras $n$ no final da série. \@ref(eq:filtro) chama-se um *filtro linear* e normalmente tem-se que $\sum_{k = -n}^{n}b_k = 1$.
