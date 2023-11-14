# Analise de dados da covid
Este projeto tem como objetivo realizar uma análise das estimativas de vacinação e mortalidade por COVID-19 em diversos países, utilizando as ferramentas gráficas disponíveis nos pacotes R.
 
# Base de Dados:
A base de dados compreende informações cruciais relacionadas à pandemia de COVID-19 em nível global, com ênfase nas estimativas de vacinação e na mortalidade associada. Os campos selecionados para este projeto são o número de óbitos registrados e o número de pessoas que receberam a primeira dose da vacina em cada país.
É importante destacar que os dados foram organizados e analisados considerando uma "fotografia" do cenário, representando um ponto específico em um contínuo processo temporal. Essa abordagem reconhece as limitações temporais dos dados, proporcionando uma interpretação mais precisa das informações disponíveis.
Segmentação por Continente:
Para uma análise mais aprofundada e segmentada, os resultados foram agrupados por continente. Essa abordagem permite explorar padrões e tendências específicas em diferentes regiões do mundo, considerando as características únicas de cada continente.
Campos Selecionados:
1.	Número de Óbitos: Representa o impacto da pandemia, medindo a quantidade de vidas perdidas em cada país.
2.	Número de Pessoas Vacinadas (Primeira Dose): Indica a cobertura inicial de vacinação, fornecendo insights sobre o progresso das campanhas de vacinação em cada país.
A escolha desses campos visa proporcionar uma análise abrangente, considerando tanto a dimensão da perda de vidas quanto o progresso nas estratégias de imunização.
Objetivo do Projeto:
O principal objetivo deste projeto é representar visualmente as relações entre a vacinação e a mortalidade por COVID-19 em formato de redes de associação. O uso de grafos permite uma compreensão intuitiva das interações entre os países, evidenciando padrões que podem orientar políticas de saúde pública e estratégias de combate à pandemia.

# Metodologia de Representação Gráfica:
Neste projeto, a representação gráfica será construída utilizando um grafo de associação, onde cada país será representado como um nó ou vértice. A interpretação visual será enriquecida pela inclusão de duas características cruciais: o tamanho do nó, refletindo a quantidade de óbitos no país, e a cor do nó, indicando o número de pessoas que receberam a primeira dose da vacina contra a COVID-19.
•	Nós (Vértices): Cada país será representado por um nó no grafo, permitindo uma visualização eficaz das relações entre os países.
•	Tamanho do Nó: O tamanho do nó será proporcional à quantidade de óbitos registrados no país. Países com maior número de óbitos terão nós maiores, proporcionando uma representação visual intuitiva do impacto da pandemia.
•	Cor do Nó: A cor do nó será atribuída com base no número de pessoas que receberam a primeira dose da vacina. A escala de cores será definida de forma que países com menor cobertura de vacinação serão representados em vermelho, enquanto aqueles com maior cobertura serão em verde.
# Código
O script em R disponível no repositório GitHub propõe uma abordagem eficaz para a análise e visualização da rede de associação entre países em relação à vacinação e mortalidade por COVID-19. Abaixo, destacarei alguns tópicos essenciais presentes no código:
1.	Carregamento e Pré-processamento dos Dados:
•	O script inicia com a importação das tabelas de dados relevantes, obtidas dos links fornecidos. São realizadas operações de limpeza e preparação para garantir a consistência e qualidade dos dados.
2.	Criação da Rede de Associação:
•	Utilizando a biblioteca RedeR, o script constrói a rede de associação, onde os países são representados como nodos e as associações são indicadas por arestas. As características dos nodos, como tamanho e cor, são atribuídas com base nos dados de óbitos e vacinação.
3.	Escalonamento de Cores e Tamanhos:
•	O script realiza o escalonamento adequado das cores e tamanhos dos nodos para garantir uma representação visual clara. A escolha de escalas ajuda a destacar discrepâncias significativas nos dados.
4.	Apresentação Gráfica da Rede:
•	A parte central do script se concentra na criação visual da rede de associação. A utilização de técnicas visuais, como a cor para indicar o número de pessoas vacinadas e o tamanho do nodo para representar a quantidade de óbitos, contribui para uma interpretação mais intuitiva dos resultados.
5.	Interpretação e Exportação:
•	Ao final do script, são incluídas seções que facilitam a interpretação dos resultados obtidos a partir da análise da rede de associação. Além disso, o script pode incluir funções para exportar visualizações para formatos de imagem para futuras referências ou compartilhamento.
Ao revisar o código presente no repositório, recomenda-se focar nessas áreas para entender a metodologia adotada e os parâmetros utilizados na construção da rede de associação. Qualquer ajuste ou personalização desejada pode ser explorado a partir desses pontos.

# Resultados:
América
 ![América](https://github.com/brksaian/redeR_treeandleef_covid/blob/main/America.png)

# África
![África](https://github.com/brksaian/redeR_treeandleef_covid/blob/main/Africa.png)

#	Europa
 ![Europa](https://github.com/brksaian/redeR_treeandleef_covid/blob/main/Europa.png)
 
#	Oceania
 ![Oceania](https://github.com/brksaian/redeR_treeandleef_covid/blob/main/Oceania.png)
 
# Referências:
As análises realizadas neste projeto foram fundamentadas em dados obtidos a partir das tabelas disponíveis nos seguintes links, datados no dia de hoje:
•	[Tabela Global de Dados COVID-19](https://covid19.who.int/WHO-COVID-19-global-table-data.csv) 
•	[Tabela de Dados de Vacinação COVID-19](https://covid19.who.int/who-data/vaccination-data.csv)
Estas fontes fornecem informações abrangentes sobre a pandemia de COVID-19 em escala global, incluindo dados específicos sobre casos, óbitos e vacinação em cada país.
Para a construção e visualização da rede de associação, utilizou-se a biblioteca RedeR no R. A documentação detalhada dessa biblioteca pode ser encontrada no seguinte link: http://bioconductor.org/packages/release/bioc/vignettes/RedeR/inst/doc/RedeR.html 
A RedeR proporciona ferramentas poderosas para análise e visualização de redes complexas, sendo essencial para a representação gráfica das relações entre os países, seus óbitos e o progresso da vacinação.
O script em R desenvolvido para este projeto está disponível para consulta e replicação, garantindo a transparência e reprodutibilidade da análise conduzida.

