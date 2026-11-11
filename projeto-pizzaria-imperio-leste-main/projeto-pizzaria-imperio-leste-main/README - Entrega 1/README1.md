# Entrega 1 — Modelo Conceitual (DER)

Matheus Cerasi Rodrigues - Eduardo Correa - Ryan Mangeth de Lima - Leonardo Oliveira Rodrigues
### Modelagem de um sistema de gestão de informações para uma organização de pequeno porte

> Este arquivo é o esqueleto do **README.md** do repositório GitHub do seu grupo. Preencha cada seção abaixo. Não apague os títulos — apenas substitua as instruções em *itálico* pelo conteúdo do seu projeto. O **DER** é anexado separadamente ao repositório (em imagem), mas sua justificativa entra neste README.  
>   
> **A organização escolhida pode ser de qualquer natureza:** empresa com fins lucrativos (livraria, lanchonete, pet shop), ONG, associação comunitária, cooperativa, instituições religiosas/comunitárias como igrejas, terreiros de religiões de matriz africana (candomblé, umbanda) ou outras. O que muda de um tipo para outro são os processos e as regras específicas — a estrutura do trabalho (levantamento de requisitos, modelagem conceitual, DER) é a mesma para todas. Termos como "empresa" e "negócio" usados abaixo devem ser lidos de forma ampla, no sentido técnico de modelagem de dados (ex.: "regras de negócio" \= regras de funcionamento da organização, seja ela comercial, religiosa ou social).  
>   
> **Importante:** a organização precisa **existir de fato** — não é permitido inventar uma organização fictícia. O levantamento de requisitos e regras de negócio deve ser feito por meio de **pesquisa de campo na própria organização** (visitas, entrevistas com responsáveis, observação dos processos reais), então o grupo só deve escolher uma organização à qual **realmente tenha acesso**. Ao escolher, tomem cuidado com o porte: **nem tão pequena** que não gere dados suficientes para o trabalho (poucos processos, poucas entidades), **nem tão grande/complexa** que fique inviável de modelar nesta primeira etapa do curso.

---

## 1\. Caracterização da Organização

*(vale 7,5% — Dimensão Conceitual)*

- **Nome e natureza da organização:** Império Leste Pizzaria  
- **Contexto e porte:** Empresa com fins lucrativos; pequeno porte; 4 funcionários (pizzaiolo, auxiliar, atendente e gerente); em média 20 a 25 pedidos por dia.  
- **Problemas e necessidades identificados:** A crise operacional é referente a falta de um sistema de precificação.  
- **Justificativa da escolha:** A empresa foi selecionada pois existe uma necessidade real em relação a falta de sistema, pois no momento de selecionar os preços, não possuem precisão de quanto estão lucrando em cima do produto X.  
- **Evidências da organização:** 

**Endereço:** R. Prof. Antônio de Castro Lopes, 42 \- Ermelino Matarazzo, São Paulo \- SP, 03805-080  
**Telefone:** (11) 95637-2778  
**Link do site:** [https://www.imperiolestepizzaria.com.br/](https://www.imperiolestepizzaria.com.br/)  
**Instagram:** [https://www.instagram.com/pizzariaimperioleste/](https://www.instagram.com/pizzariaimperioleste/)

**Imagens do Local:** (Anexado em imagem no Github)

## 

## 2\. Processos de Negócio

*(vale 10% — Dimensão Procedimental)*

- **Principais processos mapeados:**   
* Custos fixos e variáveis: Considera gastos como aluguel, salários, matéria-prima e impostos.  
* Margem de lucro: Define o ganho financeiro desejado para garantir a saúde do negócio.  
* Análise da concorrência: Monitora os preços praticados por outros concorrentes no mercado.  
* Percepção de valor: Avalia o quanto o cliente está disposto a pagar com base na qualidade e no benefício entregue.

- **Fluxograma:** (Anexado em imagem no Github)

---

## 

## 3\. Requisitos do Sistema

*(esta seção e a Seção 4 "Regras de Negócio" DIVIDEM 7,5% na dimensão conceitual — juntas valem 7,5%, não 7,5% cada — \+ 4% exclusivos desta seção na organização/documentação)*

### 3.1 Requisitos Funcionais

**Cadastro de produtos:** O sistema deve permitir cadastrar, editar, excluir e consultar as pizzas, contendo informações como nome, categoria, ingredientes e preço de venda.

**Cadastro de ingredientes:** O sistema deve permitir cadastrar os ingredientes utilizados nas pizzas, seus custos e unidades de medida.

**Cadastro de custos:** O sistema deve permitir registrar os custos fixos, como aluguel e salários, e os custos variáveis, como matéria-prima e impostos.

**Cálculo dos custos:** O sistema deve calcular o custo de cada pizza com base nos ingredientes utilizados e nos demais custos envolvidos.

**Definição da margem de lucro:** O sistema deve permitir cadastrar e alterar a margem de lucro desejada para os produtos.

**Cálculo do preço de venda:** O sistema deve calcular um preço de venda sugerido considerando os custos e a margem de lucro definida.

**Análise da concorrência:** O sistema deve permitir cadastrar os concorrentes e registrar os preços praticados por eles para realizar comparações.

**Análise da percepção de valor:** O sistema deve permitir registrar informações que auxiliem na avaliação do quanto o cliente está disposto a pagar, considerando a qualidade e os benefícios oferecidos.

**Ajuste e aprovação do preço:** O sistema deve permitir analisar o preço sugerido e realizar ajustes quando ele não for considerado adequado aos custos, à concorrência ou à percepção de valor.

**Atualização das informações:** O sistema deve permitir atualizar custos, preços, margens de lucro e informações dos concorrentes sempre que necessário.

**Geração de relatórios:** O sistema deve gerar relatórios com informações sobre custos, preços, margens de lucro, concorrência e rentabilidade, auxiliando na tomada de decisões da pizzaria. 

### 3.2 Requisitos Não Funcionais

**Desempenho:** O sistema deve realizar os cálculos de custos, margem de lucro e preço sugerido rapidamente.

**Usabilidade:** A interface deve ser simples e intuitiva, permitindo que funcionários e gestores possam utilizar o sistema sem necessidade de conhecimento avançado.

**Segurança:** O sistema deve proteger os dados financeiros da pizzaria e permitir acesso somente a funcionários autorizados.

**Controle de acesso:** O sistema deve possuir diferentes níveis de acesso, por exemplo, administrador/gestor e funcionário.

**Confiabilidade:** Os cálculos de custos, margens e preços devem ser precisos, evitando erros.

**Manutenção:** O sistema deve permitir alterações e atualizações de custos, impostos, margem de lucro e informações de concorrentes sem necessidade de reconstruir o sistema.

**Backup e recuperação: Os dados** devem possuir cópias de segurança e podem ser recuperados caso tenha alguma falhas ou perda de informações.

**Atualização dos dados:** As informações de custos, preços dos concorrentes e demais parâmetros devem poder ser atualizadas de forma fácil .

**Privacidade:** Informações comerciais e financeiras da pizzaria não serão expostas a usuários que não possuem autorização.  
---

## 4\. Regras de Negócio

*(esta seção DIVIDE com a Seção 3 "Requisitos do Sistema" os mesmos 7,5% da dimensão conceitual — juntas valem 7,5%, não 7,5% cada — \+ 4% exclusivos desta seção na documentação. "Regras de negócio" é o termo técnico usado em modelagem de dados para as regras de funcionamento de qualquer organização, com ou sem fins lucrativos)*

- **Regras operacionais:** As regras operacionais informam que o preço da pizza deve ser superior ao custo total e considerar a margem de lucro definida. O sistema também deve levar em conta os preços da concorrência e a percepção de valor dos clientes.   
- **Restrições organizacionais:** Incluem o cumprimento das leis fiscais e tributárias, o controle dos custos dentro do orçamento da pizzaria, o acesso aos dados apenas por funcionários autorizados para alteração de preços e custos, que devem ser revisados quando houver mudanças no mercado. Essas restrições são importantes para dar garantia de que o sistema funcione de acordo com as normas legais e com as necessidades da empresa, evitando prejuízos e problemas administrativos.

---

## 5\. Dicionário de Dados Conceitual (Preliminar)

*(vale 10% — Dimensão Procedimental)*

| 1\. Entidade: Produto (Pizza) |  |  |
| :---- | :---- | :---- |
| **Atributo** | **Descrição** | **Regra de negócio associada** |
| id\_custo\_fixo (PK) | Identificador único do custo. | Obrigatório e único. |
| descricao | Descrição do custo, como aluguel ou salário. | Obrigatório. |
| valor\_mensal | Valor mensal do custo fixo. | Obrigatório é maior ou igual a zero. |
| data\_inicio | Data em que o custo começou a ser considerado. | Obrigatório. |
| status | Indica se o custo está ativo ou inativo. | Apenas custos ativos entram nos cálculos. |
| **2\. Entidade: Custo Fixo** |  |  |
| **Atributo** | **Descrição** | **Regra de negócio associada** |
| id\_custo\_fixo (PK) | Identificador único do custo. | Obrigatório e único. |
| descricao | Descrição do custo, como aluguel ou salário. | Obrigatório. |
| valor\_mensal | Valor mensal do custo fixo. | Obrigatório é maior ou igual a zero. |
| data\_inicio | Data em que o custo começou a ser considerado. | Obrigatório. |
| status | Indica se o custo está ativo ou inativo. | Apenas custos ativos entram nos cálculos. |
| **3\. Entidade: Custo Variável (Ingrediente)** |  |  |
| **Atributo** | **Descrição** | **Regra de negócio associada** |
| id\_ingrediente (PK) | Identificador único do ingrediente. | Obrigatório e único. |
| nome | Nome do ingrediente. | Obrigatório. |
| unidade\_medida | Unidade utilizada, como kg, g ou unidade. | Obrigatório. |
| custo\_unitario | Custo de cada unidade do ingrediente. | Obrigatório é maior que zero. |
| fornecedor | Fornecedor do ingrediente. | Opcional. |
| data\_atualizacao | Data da última atualização do custo. | Obrigatório. |
| **4\. Entidade: Concorrente** |  |  |
| **Atributo** | **Descrição** | **Regra de negócio associada** |
| id\_concorrente (PK) | Identificador único do concorrente. | Obrigatório e único. |
| nome | Nome da pizzaria concorrente. | Obrigatório. |
| pizza\_referencia | Pizza utilizada para comparação. | Obrigatório. |
| preco\_praticado | Preço cobrado pelo concorrente. | Obrigatório é maior que zero. |
| data\_coleta | Data em que o preço foi coletado. | Obrigatório. |
| fonte | Origem da informação, como site ou cardápio. | Obrigatório. |
**5\. Entidade: Pizza do Concorrente** |  |  |
| **Atributo** | **Descrição** | **Identificação** |
| id_pizza_concorrente | Identificador único da pizza comercializada pelo concorrente. | PK |
| id_concorrente | Identifica o concorrente ao qual a pizza pertence. | FK |
| nome | Nome da pizza do concorrente. | — |
| descricao | Descrição dos ingredientes ou características da pizza. | — |
| **6\. Entidade: Margem de Lucro** |  |  |
| **Atributo** | **Descrição** | **Regra de negócio associada** |
| id\_margem (PK) | Identificador da configuração de margem. | Obrigatório e único. |
| percentual\_margem | Percentual de lucro desejado. | Obrigatório é maior que zero. |
| data\_inicio | Data de início da aplicação da margem. | Obrigatório. |
| data\_fim | Data de término da aplicação da margem. | Opcional. |
| status | Indica se a margem está ativa ou inativa. | Apenas margens ativas são utilizadas. |
**7\. Entidade: Histórico de Preço** |  |  |
| **Atributo** | **Descrição** | **Regra de negócio associada** |
| id_historico | Identificador único do registro de histórico de preço. | PK |
| id_pizza_concorrente | Identifica a pizza do concorrente cujo preço foi registrado. | FK |
| preco_praticado | Valor do preço praticado pelo concorrente no momento da coleta. | — |
| data_coleta | Data em que o preço da pizza foi coletado ou registrado. | — |
| fonte | Origem da informação utilizada para obter o preço. | — |


---

## 6\. Modelagem Conceitual (Entidades, Atributos, Relacionamentos)

*(vale 7,5% na dimensão conceitual)*

- **Entidades:** Produto (Pizza), Ingrediente, Custo Fixo, Concorrente e Margem de Lucro. Elas representam os principais dados necessários para calcular e definir os preços das pizzas.  
- **Atributos:** Cada entidade possui informações específicas, como nome, custo, preço, categoria, percentual de lucro, fornecedor e valores praticados pelos concorrentes.  
- **Relacionamentos:** Um produto pode possuir vários ingredientes, e um ingrediente pode estar presente em vários produtos. Os produtos também são relacionados aos concorrentes para comparação de preços e às margens de lucro para definição do preço de venda. Os custos fixos são considerados no cálculo da precificação.  
- **Restrições:** O preço deve ser maior que o custo total, os dados financeiros devem ser protegidos e apenas usuários autorizados podem alterar custos, preços e margens. Os valores devem ser atualizados quando houver mudanças relevantes no mercado.

---

## 7\. Diagrama Entidade-Relacionamento (DER)

*(vale 20% — é o item de maior peso da entrega)*

-**DER:** (Anexado em imagem no Github)

---

## 8\. Justificativa Técnica

*(vale 7,5% — sozinho, é o subcritério de maior peso dentro da Dimensão Conceitual)*

Consideramos que as entidades “Produto”, “Ingrediente”, “Custo Fixo”, “Concorrente” e “Margem de Lucro” são as principais informações para o sistema realizar a precificação das pizzas, e por isso nós escolhemos essas entidades. Outras informações, como vendas ou clientes, não foram incluídas neste momento porque não são tão importantes para o objetivo principal do sistema, com a possibilidade de adicionarmos futuramente. 

Os atributos foram escolhidos de acordo com a função de cada entidade, e os `ID` garantem a identificação de cada um dos registros. O relacionamento Produto–Ingrediente é N:N, pois uma pizza pode ter vários ingredientes e um ingrediente pode estar em várias pizzas. Produto–Concorrente permite fazer a comparação de preços com diferentes pizzarias. A Margem de Lucro e os Custos Fixos foram separados para evitar duplicações e serem fáceis de serem feitas alterações.

---

## 9\. Uso de Inteligência Artificial

*(documentação obrigatória — não é opcional se o grupo usou IA em qualquer etapa: pesquisa, escrita, organização de ideias ou revisão de texto)*

Se o grupo usou alguma ferramenta de IA (ChatGPT, Claude, Gemini, Perplexity etc.) em qualquer parte do trabalho, registre **para cada uso relevante**:

| Item | O que registrar |
| :---- | :---- |
| **Ferramenta e etapa** | Usamos o ChatGPT para auxílio nos tópicos 2, 5 e 7, para gerar imagens ilustrativas, auxílio na criação de tabela mais complexa por não dominar tanto o assunto. |
| **Motivação** | Para gerar imagens ilustrativas, auxílio na criação de tabela mais complexa por não dominar tanto o assunto. |
| **Prompt(s) utilizados** | ‘’Crie uma imagem ilustrativa para o fluxograma com os requisitos da empresa’’; ‘’Me auxilie na criação da tabela de Dicionário de Dados Conceitual’’; ‘’Crie uma imagem ilustrativa para o Diagrama Entidade-Relacionamento (DER) com os requisitos da empresa’’ |
| **Resposta recebida** | (Imagem), (Tabela para embasamento), (Imagem). |
| **Fontes consultadas e verificadas** | A IA não citou nenhuma fonte |
| **Trechos rejeitados ou corrigidos** | Alteramos a formatação da tabela e algumas informações que estavam divergindo.. |
| **Justificativa da escolha final** | Mantivemos algumas coisas e retiramos outras para ficar apenas o que é necessário para visualização. |
| **Reflexão crítica** | Algumas informações eram alucinações, não condizentes com o que foi solicitado. |

*Se o grupo não usou nenhuma ferramenta de IA, declare isso explicitamente nesta seção.*

---

## Critérios Atitudinais (20%)

**Estes critérios NÃO constam explicitamente como item de entrega no README.** Eles são avaliados por meio de **Avaliação 360º entre os integrantes do grupo** (cada membro avalia os colegas de equipe) e, no caso da Colaboração, também pela **colaboração equilibrada no histórico de commits** do repositório GitHub — não pela leitura do restante do repositório nem pela apresentação:

- **Participação (5%):** envolvimento nas discussões técnicas e nas decisões do grupo.  
- **Comprometimento (5%):** cumprimento de prazos e responsabilidades assumidas.  
- **Colaboração (5%):** respeito às contribuições dos colegas, cooperação na construção do projeto e colaboração equilibrada no histórico de commits do repositório GitHub.  
- **Autonomia (5%):** busca independente de soluções e proposta de melhorias.

---

## Resumo dos Pesos

| Dimensão | Peso total |
| :---- | :---- |
| Conceitual (contexto, requisitos/regras, modelagem, justificativa técnica) | 30% |
| Procedimental (requisitos, fluxogramas, dicionário de dados, DER) | 50% |
| Atitudinal (participação, comprometimento, colaboração, autonomia) | 20% |

**Entrega final:** README.md completo \+ DER anexado no repositório GitHub do grupo.  
