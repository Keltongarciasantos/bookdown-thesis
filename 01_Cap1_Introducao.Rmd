# Introdução

## Enquadramento

\justify 
No setor financeiro, o acesso aos dados para suporte na tomada de decisões é fundamental para o sucesso de qualquer empresa ou organização. Os dados devem ser fidedignos e devem prover informações úteis aos decisores. Atualmente as organizações têm dado mais importância aos dados do que davam no passado, devido aos diversos métodos desenvolvidos para análise de dados, suportados por softwares capazes de processar grande volume de informações em poucos minutos, fornecendo assim informações de grande utilidade às empresas.

Um dos problemas que as organização enfrentam é o acesso aos dados no momento certo para a tomada de decisão. Se os dados não estiverem disponíveis no momento exato ela poderá deixar de ser relevante. Frequentemente usam-se dados do passado para analisar o desempenho de determinada organização e tirar ilações sobre como melhorar no futuro. Entretanto, muitas vezes há necessidade de dados referente a eventos que ainda não ocorerram. Nesse caso deve-se recorrer a previsões para se tomar decisões com determinado grau de confiança.
Uma maneira de obter previsões sobre o futuro é usar os dados do passado para analisar o  comportamento dos mesmos no futuro. Existem vários tipos de dados com características diferentes e por isso a metodologia utilizada na previsão varia de acordo com o tipo de dados.

Nesse trabalho serão analisados dados em forma de *séries temporais*, que é muito frequente no setor financeiro. *Séries temporais* são sequências de observações sobre uma determinada variável, ordenada no tempo, e registado em períodos regulares [@box1994pages]. Como exemplo têm-se: temperaturas diárias num determinado local ao longo do ano, vendas mensais de uma empresa, cotação diária de uma determinada ação na bolsa de valores, produto interno bruto (PIB) anual ou trimestral de um determinado país etc.

Para a análise e previsão de séries temporais existem vários métodos ou modelos, mas nesse trabalho o foco será na metodologia ARIMA (Modelos Autoregressivos - Integrados - Médias Móveis). A metodologia ARIMA consiste em ajustar modelos autorregressivos integrados de médias móveis a um conjunto de dados com o objetivo essencial de transformar uma série com certas características não estacionárias numa estacionária [@Lopes2008]

Os dados a serem utilizados na parte prática do trabalho serão alguns indicadores macroeconómicos e microecononómicos da economia Caboverdiana como: PIB, taxa de inflação (índice de preço do consumidor), taxa de juro dos títulos do tesouro, cotações de algumas ações na Bolsa de Valores de Cabo Verde e  taxa de desemprego. O *software R* será utilizado para a análise dos dados, por ser muito potente e de fácil utilização.

## Objetivos

A necessidade de ter dados atualizados na tomada de decisões é imperativo para o sucesso  das empresas e organizações que operam no setor financeiro. Em Cabo Verde as previsões económicas são feitas normalmente pelo Banco de Cabo Verde (BCV), Ministério das Finanças e o Instituto Nacional de Estatísticas (INE), que são todas entidades do Estado ou relacionadas ao Estado. Essas previsões normalmente são de um número muito limitado de indicadores económicos (normalmente o PIB, a taxa de desemprego, taxa de inflação etc.), daí a necessidade de ter pesquisas independentes que ajudem na diversificação de previsões e que forneçam outros dados que poderão servirpara confrontação ou comparação aos publicados pelas entidades acima, com vista a melhorar na previsão e fornecer ao público outras fontes adicionais. Pretende-se com esse trabalho alcançar os seguites objetivos:

  * Apresentar alguns métodos usados para análise e previsão de séries temporais;
  * Identificar indicadores económico-financeiros que podem ser modelados por meio de séries temporais;
  * Usar o software R na análise e previsão de séries temporais, recorrendo  a dados da economia Caboverdiana.


## Hipóteses de Estudo

Para a realização desse estudo parte-se do pressuposto que:

  * Vários indicadores económico-financeiros da economia Caboverdiana podem ser representados por meio de séries temporais;
  * A metodologia ARIMA fornecerá previsões com alto nível de confiança dos indicadores económico-financeiros da economia Caboverdiana que podem ser  representadas por séries temporais;
  
## Motivação para o Estudo

Os dados do setor financeiro muitas vezes podem ser representados em forma de séries temporais devido a sua característica referente ao tempo de observação ou ocorrência (anuais, trimestrais, mensais, díarias etc.). Devido aos vários métodos de análise e previsão desenvolvidos ao longo do tempo e do avanço da ciência computacional, é possível obter previsões com alto grau de precisão dos dados com essas características.

Cabo Verde é um país com alguma deficiência na disponibilidade a tempo útil das informações económico-finaceiros, o que poderá fazer com que se percam muitas oportunidades de investimento nacional e internacional por falta de informações ao investidores, empresas e público em geral. Uma das razões é a fraca participação da comunidade acadêmica com estudos e pesquisas na matéria e outra é o pouco número de entidades independentes que fazem estudos de previsão dos indicadores económico-financeiro da economia de Cabo Verde.

A motivação maior para a realização desse trabalho, é o de poder contribuir com exemplos concretos de aplicações das séries temporais na análise e previsão dos indicadores económico-financeiros de Cabo Verde e despertar assim na comunidade acadêmica e entidades independentes o interesse de realizar pesquisas adicionais e produzir informações periódicas sobre a economia Caboverdiana,  que possam ser úteis ao mercado financeiro nacional e internacional.

## Justificativa

Dado a demora que frequentemente as empresas enfrentam em ter acesso aos dados em tempo útil, torna-se necessário recorrer às previsões para a tomada de decisões de investimento, financiamento e outras decisões económicas, visto que na maioria das vezes, muitas dessas decisões devem ser tomadas antes da disponibilidade dos dados efetivos. Existem vários métodos muito potentes para a análise e previsão de séries temporais (que é a característica de grande parte dos dados financeiros), produzindo resultados com alta  precisão face aos dados reais.


Com a efetivação dessa pesquisa estará disponível um conjunto de métodos utilizados na análise e previsão de séries temporais, onde estarão destacados os que melhor se adequam às características dos dados da economia de Cabo Verde. A materialização dessa pesquisa permitirá ter disponível um trabalho que poderá ser catalisador de muitas outras pesquisas semelhantes na área financeira ou em outras áreas, dado a relevância do tema e a necessidade que Cabo Verde tem de trabalhos científicos na área matemática-financeira. Além disso, essa pesquisa produzirá um leque diverso de indicadores financeiros que podem ser modelados por meio de séries temporais, fornecendo assim informações que servirão de comparação com os dados fornecidos pelas entidades públicas responsáveis pela publicação dos dados financeiros.

## Revisão Bibliográfica

Os métodos de previsão geralmente usam valores do passado para fazer previsões de valores futuros. No início do século XIX, as previsões eram feitas recorendo a extrapolação simples de um valor global, ajustado em função do tempo [@xavier2016analise]. Devido a simplicidade desse método, foi necessário desenvolver métodos mais eficientes capazes de produzir melhores previsões.

As séries temporais estão incluídas no domínio de probabilidades e estatística, mais concretamente, no campo dos processos estocásticos. Segundo [@Estatcamp], o início dos anos 70, foi considerado como a época de ouro no desenvolvimento das séries temporais devido aos vários trabalhos feitos e as metodologis de análise e previsão desenvolvidas. O trabalho de Box e Jenkins [@box1994pages] é considerado como uma obra de referência na história do desenvolvimento das séries temporais, pois ela integra os conhecimentos existentes sobre séries temporais até a data. Os autores apresentaram modelos estocásticos no domínio de séries temporais discretas com número mínimo de parâmetros, satisfazendo o princípio de parcimónia.


Em relação a pesquisas sobre a aplicação das séries temporais na economia e finanças, numa pesquisa realizado nos Estados Unidos da América por [@andrei2011econometric], utilizou-se as séries temporais para se fazer a previsão do PIB dos EUA. Como a série encontrada não era estacionária, a autora usou vários métodos estatísticos para a transformar numa série estacionária. Depois de aplicar os testes a série foi transformada numa estacionária e integrada de ordem 1. A autora aplicou a metodologia de *Box-Jenkins* para a determinação do ARMA(Auto-regressivos - Médias Móveis). Usando o método dos mínimos quadrados na determinação dos parâmetros, foi optado pelo modelo $ARIMA(1, 1, 1)$ por causa da melhor performance.


Um outro estudo de se destacar, foi sobre a previsão do crescimento económico na região de Shenzhen na China usando séries temporais [@wang2016forecast].  O autor usou o modelo $ARIMA(3, 3, 5)$, pois segundo ele é o que melhor a refletir a lei do desenvolvimento económico, e pode ser usado para previsão a médio prazo e a longo prazo. Chegou-se a conclusão que num espaço de 5 anos, a região em estudo experimentaria uma tendência de crescimento lento.


Através de uma pesquisa empírica realizado por [@li2020forecasting], conluiu-se que o modelo ARIMA tradicional tem uma variância muito grande na previsão de séries temporais financeiras com alta frequência. Com a melhoria da capacidade da computação o autor chegou a conclusão que juntantando o método ARIMA tradicional com a tecnologia *deep learning* pode-se melhorar nas previsões de tais séries. No seu estudo o autor usou como série temporal o índice CSI300 da Bolsa de Valores de Shanghai.


Um aspeto a ter em conta na modelação  estacionária de séries temporais segundo [@Lopes2008], tem a ver com a sazonalidade dos dados. Por exemplo, segundo a autora, para certas séries mensais os dados relativos a um mesmo mês em diferentes anos têm tendência a situar-se de maneira semelhante em relação à média anual. Uma maneira de solucionar esse problema segundo a autora é aplicar a metodologia $SARIMA$ (a letra S vem do temo *sazonal*), desenvolvida por Box e Jenkins, capaz de ter em conta a sazonalidade dos dados. O princípio subjacente a esse modelo, é a aplicação do modelo $ARIMA$ ao modelo inicial, após a eliminação neste da sazonalidade.

## Metodologia

Para alcançar os objetivos estabelecidos para essa pesquisa, será utilizada uma abordagem analítica e descritiva na recolha e análise dos dados, onde na parte de apresentação dos métodos para análise e previsão de séries temporais, se dará maior enfoque na consulta bibliográfica. Na parte da aplicação prática com dados da economia de Cabo Verde o foco será na análise dos dados publicados pelo Banco de Cabo Verde, Instituto Nacional de Estatística, Ministério das Finanças e outras entidade com publicações relevantes. Os dados serão analisados utilizando o *software R* com suporte do *Rstudio* (Editor do R).
Também serão feitas pesquisas na internet focalizadas nas revistas e publicações científicas, bem como páginas de universidades que poderão fornecer auxílio adicional.
