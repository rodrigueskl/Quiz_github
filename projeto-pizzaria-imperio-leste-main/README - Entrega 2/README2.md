# Entrega 2 — Modelo Lógico, Implementação SQL e Apresentação Final

### Modelagem de um sistema de gestão de informações para uma organização de pequeno porte

**Projeto:** Sistema de Gestão de Informações da Pizzaria Império Leste  
**Curso:** Ciência da Computação  
**Instituição:** Universidade Cidade de São Paulo (UNICID)  
**Repositório:** https://github.com/matheuscerasi/projeto-pizzaria-imperio-leste



> Este arquivo é o esqueleto dos artefatos finais do grupo, a serem organizados no repositório GitHub. **Será corrigido exclusivamente o conteúdo da branch `main` do repositório** — arquivos que estiverem em qualquer outra branch não serão considerados, mesmo que o link enviado aponte para ela. Preencha cada seção com o conteúdo do seu projeto. Alguns itens são documentos Markdown, outros são arquivos separados (diagramas, dicionário de dados, script `.sql`, massa de dados, slides) — está indicado em cada seção. Nesta etapa vocês atuam como uma **software house** implementando o banco de dados completo do sistema modelado na Entrega 1 e revisado na seção 1.1 — seja para uma empresa, uma ONG ou outra organização escolhida pelo grupo.

> **Lembrete:** termos como "empresa" e "negócio" usados abaixo são o vocabulário técnico padrão de modelagem de dados e se aplicam a qualquer tipo de organização, com ou sem fins lucrativos.

> **Importante:** esta etapa exige uma **organização real**, com evidências de existência e contato com um responsável.

> - **Se a organização da Entrega 1 era real**, continue com ela — não é permitido trocá-la por outra. &#x20;
> - **Se a organização da Entrega 1 era fictícia** (ou não teve a existência comprovada na correção), o grupo deve **procurar agora uma organização real** e refazer, para ela, toda a base da Entrega 1, inclusive o DER (ver seção 1.1, Caso B).

> Em qualquer caso, o grupo deve manter o acesso à organização, pois pode ser necessário voltar a campo para validar regras, tirar dúvidas sobre o processo de normalização ou conferir se a massa de dados reflete a realidade observada.

---

## 1. Relatório Técnico Final

*(arquivo Markdown — reúne a maior parte da Dimensão Conceitual, 30%)*

**O Relatório Técnico Final deve ser o próprio `README.md` da raiz da branch `main`**, seguindo a estrutura deste esqueleto. Relatório entregue em outro arquivo (PDF, Word, outro `.md`, Google Docs, wiki do GitHub etc.) **não será corrigido**. Os demais artefatos (DER, modelo lógico, dicionário de dados, levantamento, script SQL, massa de dados, slides) ficam em arquivos separados no repositório, com link a partir do README.

### Integrantes

| Nome completo do aluno | RGM | Usuário do GitHub |
| ---------------------- | --- | ----------------- |
| Matheus Cerasi Rodrigues | 47495821 | [matheuscerasi](https://github.com/matheuscerasi) |
| Ryan Mangeth de Lima | 48348881 | [ryanmangeth](https://github.com/ryanmangeth) |
| Leonardo Oliveira Rodrigues | 47569590 | [rodrigueskl](https://github.com/rodrigueskl) |
| Eduardo Correa | 47674245 | [educorrea08](https://github.com/educorrea08) |

### 1.1 Revisão do Modelo Conceitual

#### Informações do Projeto Império Leste

### Caracterização da organização

**Nome:** Império Leste  
**Natureza:** Pizzaria real, com fins lucrativos.  
**Endereço:** Rua Professor Antônio de Castro Lopes, 42, Ermelino Matarazzo, São Paulo – SP, CEP 03805-080.  
**Google Maps:** https://maps.app.goo.gl/FkhGU2vBcxwV7a8v9?g_st=ic

A Pizzaria Império Leste é uma organização real localizada no bairro de Ermelino Matarazzo, na cidade de São Paulo. A operação conta com três funcionários. A proprietária, Michely, também atua no atendimento de balcão, sendo responsável pelo atendimento dos clientes e pelo registro dos dados dos pedidos de delivery na plataforma atualmente utilizada pela empresa.

A pizzaria trabalha com dois canais de atendimento: pedidos realizados presencialmente no balcão e pedidos realizados por delivery.

### Problemas identificados

Durante o levantamento realizado com a proprietária, foram identificadas as seguintes necessidades:

- **P1 — Controle de estoque:** dificuldade em registrar e acompanhar as entradas e saídas dos produtos, prejudicando o controle dos insumos disponíveis.
- **P2 — Organização dos gastos:** dificuldade para organizar e acompanhar os gastos da pizzaria, incluindo custos relacionados à operação.
- **P3 — Acompanhamento dos lucros:** dificuldade para reunir informações de vendas e gastos para compreender melhor os resultados financeiros da organização.

### Justificativa da escolha

A organização foi escolhida por ser uma empresa real, acessível aos integrantes do grupo, possibilitando a realização de entrevista presencial e o levantamento de necessidades relacionadas à gestão de informações.

O projeto busca contribuir para a organização dos dados da pizzaria, facilitando consultas sobre produtos, ingredientes, receitas, custos, margens de lucro, clientes e vendas.

### Responsável pela organização

**Nome:** Michely  
**Função:** Proprietária e atendente de balcão.  
**Telefone de contato:** (11) 95637-2778.

### Relato da entrevista

A entrevista foi realizada presencialmente nas dependências da Pizzaria Império Leste no dia **08 de novembro de 2026**.

Participaram todos os integrantes do grupo:

- Matheus Cerasi Rodrigues;
- Ryan Mangeth de Lima;
- Leonardo Oliveira Rodrigues;
- Eduardo Correa.

A responsável entrevistada foi Michely, proprietária da pizzaria.

Durante a entrevista, foram realizadas perguntas relacionadas ao funcionamento da empresa, ao atendimento de clientes e às principais dificuldades de gestão. Foram identificados problemas ligados ao controle das entradas e saídas de produtos, à organização dos gastos e ao acompanhamento dos lucros.

Também foi confirmado que a pizzaria realiza atendimento presencial no balcão e por delivery.

Como evidência da entrevista, o grupo produziu um vídeo e informou possuir fotografias do estabelecimento.

### Processos de negócio identificados

Os principais processos relacionados ao sistema desenvolvido são:

1. Cadastro e manutenção de produtos comercializados.
2. Cadastro e manutenção de ingredientes utilizados na produção.
3. Registro da composição das receitas dos produtos.
4. Organização dos custos fixos da pizzaria.
5. Definição e acompanhamento das margens de lucro.
6. Cadastro e consulta de clientes.
7. Registro de vendas.
8. Registro dos itens vendidos, quantidades e preços unitários.
9. Registro de informações sobre concorrentes.
10. Comparação dos preços praticados por concorrentes.
11. Gerenciamento de usuários autorizados.
12. Consulta e organização das informações gerenciais armazenadas.

O sistema acadêmico desenvolvido tem como objetivo apoiar a organização das informações da pizzaria. Ele não substitui a plataforma de pedidos atualmente utilizada pela empresa.

### Requisitos funcionais

Os requisitos funcionais descrevem as funcionalidades que o sistema deve disponibilizar.

| Código | Requisito funcional |
|---|---|
| RF01 | O sistema deve permitir cadastrar, consultar, atualizar e organizar produtos comercializados pela pizzaria, incluindo nome, descrição, categoria, preço de venda, margem de lucro associada e status. |
| RF02 | O sistema deve permitir cadastrar e consultar ingredientes, incluindo nome, unidade de medida, custo unitário, fornecedor, data de atualização e status. |
| RF03 | O sistema deve permitir registrar a composição das receitas dos produtos, relacionando produtos e ingredientes por meio de quantidades. |
| RF04 | O sistema deve permitir cadastrar e consultar custos fixos, incluindo descrição, valor mensal, data de início, data de término e status. |
| RF05 | O sistema deve permitir cadastrar e consultar margens de lucro, incluindo descrição, percentual, período de vigência e status. |
| RF06 | O sistema deve permitir cadastrar e consultar clientes, armazenando informações como nome, CPF, CEP, telefone, WhatsApp, e-mail, endereço, data de cadastro e status. |
| RF07 | O sistema deve permitir registrar vendas, associando-as opcionalmente a clientes cadastrados e armazenando data e observações. |
| RF08 | O sistema deve permitir registrar os itens de cada venda, incluindo produto, quantidade e preço unitário. |
| RF09 | O sistema deve permitir cadastrar e consultar concorrentes, incluindo nome, contato, endereço e observações. |
| RF10 | O sistema deve permitir registrar informações sobre pizzas comercializadas por concorrentes, incluindo nome, descrição, preço praticado, data da coleta e fonte da informação. |
| RF11 | O sistema deve permitir cadastrar usuários autorizados, incluindo nome, login, autorização para precificação e status. |
| RF12 | O sistema deve disponibilizar consultas e visualizações para apoiar a análise das informações cadastradas. |

### Requisitos não funcionais

| Código | Requisito não funcional |
|---|---|
| RNF01 | O sistema deve possuir interface web de fácil utilização, permitindo a navegação entre seus módulos. |
| RNF02 | O sistema deve utilizar banco de dados relacional para armazenar e organizar as informações. |
| RNF03 | O sistema deve manter a integridade dos dados por meio de chaves primárias, chaves estrangeiras e restrições de integridade. |
| RNF04 | O sistema deve ser desenvolvido utilizando tecnologias compatíveis com o ambiente de desenvolvimento do grupo, incluindo Python, Flask e SQLite. |
| RNF05 | O código-fonte deve ser organizado e disponibilizado em repositório GitHub para facilitar manutenção e colaboração. |

### Regras de negócio

As regras abaixo foram definidas com base na estrutura de dados do projeto e devem ser validadas pelo grupo em relação ao levantamento da organização.

| Código | Regra de negócio |
|---|---|
| RN01 | Cada produto deve possuir um identificador único. |
| RN02 | Cada ingrediente deve possuir um identificador único. |
| RN03 | Um produto pode possuir vários ingredientes em sua receita. |
| RN04 | Um ingrediente pode participar da composição de diferentes produtos. |
| RN05 | A quantidade de um ingrediente utilizada na receita deve ser registrada na associação entre produto e ingrediente. |
| RN06 | Cada venda deve possuir um identificador único. |
| RN07 | Uma venda pode estar associada a um cliente cadastrado, mas o relacionamento com cliente é opcional. |
| RN08 | Cada item de venda deve estar relacionado a uma venda e a um produto existente. |
| RN09 | A quantidade e o preço unitário de cada item vendido devem ser registrados. |
| RN10 | Cada produto pode estar relacionado a uma margem de lucro cadastrada. |
| RN11 | Os custos fixos devem possuir descrição, valor mensal e período de vigência. |
| RN12 | Os registros de concorrentes devem ser mantidos separadamente dos produtos próprios da pizzaria. |
| RN13 | Os usuários cadastrados devem possuir login único. |
| RN14 | Os status dos registros devem indicar sua condição de atividade, utilizando os valores definidos no banco de dados. |

### Revisão do DER

O grupo informou que os apontamentos realizados pelo professor na correção da Entrega 1 foram corrigidos.

O DER revisado apresenta as entidades e seus relacionamentos para representar os processos de gestão da pizzaria. O diagrama contempla produtos, ingredientes, receitas, custos fixos, margens de lucro, concorrentes, clientes, vendas, itens de venda e usuários autorizados.

**Arquivo do DER:** `DER_Imperio_Leste.drawio.webp`

O diagrama deve ser disponibilizado na raiz ou em uma pasta de documentação do repositório.

---


*(obrigatória, sem peso próprio — mas todo o restante da entrega é construído e avaliado sobre este modelo: um erro que permanecer no DER revisado se propaga para a conversão, a normalização, o modelo lógico e o script SQL)*

**Caracterização da organização (todos os grupos)**

*Repita aqui a caracterização da organização — atualizada, mesmo que a organização seja a da Entrega 1. Na Entrega 1, os erros mais comuns foram: porte sem números, problema declarado que depois não aparecia no DER, evidências fora do repositório e modelo cobrindo só parte da organização. Evite-os:*

- **Nome e natureza da organização:** qual organização real o grupo escolheu (com acesso garantido para pesquisa de campo) — pode ser uma empresa (livraria, lanchonete, pet shop), uma ONG, uma associação comunitária ou outra instituição. &#x20;
- **Contexto e porte:** com ou sem fins lucrativos; tamanho da operação; número de pessoas envolvidas (funcionários, voluntários, membros, fiéis); volume de atividades (vendas, atendimentos, doações, rituais, eventos). **Informe números**, não só adjetivos (ex.: "cerca de 300 pedidos por semana", e não "grande movimento") — são eles que justificam o tamanho da massa de dados (seção 4). &#x20;
- **Problemas e necessidades identificados:** qual é a "crise operacional" — o que está desorganizado hoje (planilhas soltas, papel, falta de controle de estoque/doações/cadastros etc.)? Numere cada problema (`P1`, `P2`…). **Todo problema declarado aqui precisa ser resolvido pelo modelo:** deve aparecer no DER e ter ao menos uma consulta gerencial no script SQL (ver a tabela de rastreabilidade da seção 1.6). O problema deve ser de **gestão de informações** — refazer o site ou melhorar a divulgação da organização, por exemplo, não é um problema que um banco de dados resolva. &#x20;
- **Escopo do sistema:** o banco de dados deve reunir **todos os dados da organização**, não só os de um setor ou processo. Mesmo que os problemas declarados se concentrem em uma área, o modelo não pode servir somente a um recorte (ex.: só o estoque de uma clínica, deixando de fora pacientes e atendimentos). &#x20;
- **Justificativa da escolha:** por que essa organização foi escolhida e por que ela é um bom caso para o projeto? Se algum integrante trabalha na organização ou tem vínculo familiar com os responsáveis, declare isso — o vínculo não gera desconto, mas **não dispensa a comprovação da entrevista com o responsável, realizada no ambiente da organização**. &#x20;
- **Evidências da organização:** comprove que a organização existe e que o grupo teve acesso a ela — fotos do local/da visita, link da organização no Google, endereço completo e forma de contato. **Prefira o perfil da organização no Google Meu Negócio (Google Business Profile)**, que é a comprovação mais direta; site e redes sociais complementam. As fotos só são aceitas como **arquivos JPG ou PNG dentro do repositório** — fotos hospedadas fora dele (Google Drive, Imgur, anexos colados no editor do GitHub etc.) não são consideradas. &#x20;
- **Responsável pela organização:** **nome e telefone** de quem atendeu o grupo — o professor pode entrar em contato para confirmar as informações.

**Relato da entrevista (todos os grupos)**

*Relate a entrevista com o responsável pela organização. A entrevista da Entrega 1 pode ser reaproveitada se atender a todos os itens abaixo — inclusive ter sido feita no ambiente da organização, com foto — e se tiver levantado o necessário para os processos, requisitos e regras desta etapa. Se algo precisou ser confirmado depois (ex.: processos típicos levantados por pesquisa), relate também a nova visita.*

- **Quem:** nome e função do entrevistado e quais integrantes do grupo participaram. &#x20;
- **Quando e onde:** data e local — a entrevista deve ser realizada **no ambiente da organização**. A **observação presencial** da rotina é parte importante do levantamento de requisitos: o que o grupo vê acontecer no local (como um pedido é anotado, onde o estoque é controlado, que papéis e planilhas circulam) muitas vezes difere do que é dito na entrevista. **Destaque os achados obtidos pela observação**, separados dos obtidos pelas respostas do entrevistado. &#x20;
- **Comprovação:** ao menos uma foto da entrevista no local, como arquivo JPG ou PNG no repositório. &#x20;
- **O que foi levantado:** o que foi perguntado, o que foi confirmado e, se houve nova visita, o que mudou em relação à Entrega 1 (processos, regras, volumes, problemas). O levantamento completo fica em **um arquivo Markdown (`.md`) à parte no repositório**, com link no README — **recomenda-se fortemente** colocá-lo numa pasta chamada **`levantamento`** (ex.: `levantamento/levantamento.md`). Esse arquivo é um **texto organizado, escrito pelo grupo**, sobre o que foi levantado — **não** é um vídeo ou áudio da entrevista, nem a transcrição crua de formulários ou de perguntas e respostas. **No README, apresente um resumo do levantamento.**

**Nível de detalhe — processos, requisitos e regras de negócio (todos os grupos)**

*Frases genéricas como "o sistema deve permitir cadastrar cliente" são **superficiais** e não bastam. Em processos, requisitos e regras, indique **quais dados** estão envolvidos — todos os campos que aparecem no trabalho (DER, dicionário de dados, modelo lógico):*

| Superficial                                  | Detalhado                                                                                                                                 |
| -------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- |
| *O sistema deve permitir cadastrar cliente.* | *RF03 — O sistema deve permitir cadastrar cliente com nome completo, CPF, telefone, e-mail e endereço (logradouro, número, bairro, CEP).* |
| *O cliente faz o pedido.*                    | *O garçom anota no pedido a mesa, o número da pulseira do cliente e, para cada item, o produto, a quantidade e as observações.*           |
| *O cliente precisa estar cadastrado.*        | *RN05 — Todo cliente deve ter CPF válido e único; telefone e nome completo são obrigatórios.*                                             |

**Processos de negócio (todos os grupos)**

*Apresente os **principais processos mapeados** na organização — ex.: cadastro de clientes/beneficiários/fiéis, controle de estoque ou doações, vendas ou arrecadação, emissão de pedidos ou solicitações, entregas ou distribuição, organização de eventos/rituais/mutirões.*

- **Levante os processos típicos do tipo de organização.** É recomendável usar pesquisas e ferramentas de IA para descobrir quais processos são comuns em organizações do mesmo tipo (ex.: o que toda pizzaria, ONG de doação de alimentos ou oficina mecânica costuma fazer) e conferir se eles existem na organização escolhida. Isso pode exigir **uma nova visita à organização** para confirmar como cada processo funciona lá. Registre esse uso de IA na seção 6. &#x20;
- **Inclua os processos que existem na organização**, mesmo os que não estão ligados aos problemas declarados — o banco de dados reúne todos os dados da organização (ver *Escopo do sistema* acima). &#x20;
- **Justifique os processos prováveis não incluídos:** se um processo comum nesse tipo de organização ficou de fora (ex.: compras de fornecedores, cancelamentos, escala da equipe), explique por quê — por exemplo, a organização não o realiza, ou ele é feito por terceiros.

**Requisitos (todos os grupos)**

*Apresente os requisitos do sistema, atualizados com base na correção da Entrega 1 (ou elaborados agora, para quem trocou de organização):*

- **Requisitos Funcionais:** o que o sistema precisa **fazer**, com os dados envolvidos (ex.: "o sistema deve permitir registrar uma venda com data, cliente, vendedor, forma de pagamento e, para cada item, produto, quantidade e preço unitário"). Cada um com um código (`RF01`, `RF02`…). &#x20;
- **Requisitos Não Funcionais:** características de qualidade (ex.: desempenho, segurança, usabilidade, disponibilidade). Cada um com um código (`RNF01`, `RNF02`…). &#x20;
- **Levante os requisitos típicos do tipo de organização.** Assim como nos processos, é recomendável usar pesquisas e ferramentas de IA para descobrir quais requisitos funcionais e não funcionais são comuns em sistemas de organizações semelhantes e conferir se eles se aplicam à organização escolhida — o que pode exigir confirmação com o responsável. Registre esse uso de IA na seção 6. &#x20;
- **Justifique os requisitos prováveis não incluídos:** se um requisito comum nesse tipo de organização ficou de fora, explique por quê (ex.: a organização não realiza o processo correspondente, ou a necessidade não existe no porte dela).

*Na Entrega 1, os erros mais comuns foram: requisitos de um sistema diferente do que foi mapeado (ex.: cardápio por QR Code ou motor de recomendação, quando o processo real é o garçom anotar o pedido), problemas declarados sem nenhum requisito que os resolva e requisitos técnicos (autenticação por JWT, hospedagem em nuvem) listados como funcionais. Os requisitos devem corresponder aos processos de negócio descritos acima e cobrir todos os problemas declarados (`P1`, `P2`…).*

**Regras de negócio (todos os grupos)**

*Liste as regras de negócio vigentes, cada uma com um código (`RN01`, `RN02`…) — mantenha os códigos da Entrega 1 quando já existirem. Esses códigos são citados nas justificativas das restrições (seção 1.5) e nas consultas de auditoria do script SQL (seção 3).*

- **Levante as regras típicas do tipo de organização.** Assim como nos processos e nos requisitos, é recomendável usar pesquisas e ferramentas de IA para descobrir quais regras são comuns em organizações semelhantes e conferir se elas valem na organização escolhida — o que pode exigir confirmação com o responsável. Considere tanto as **regras operacionais** (ex.: pedido só é entregue se estiver registrado; cancelamento fica no histórico, não é apagado) quanto as **restrições legais e organizacionais** (ex.: LGPD, emissão de nota fiscal, normas sanitárias, idade mínima, acesso por cargo). Registre esse uso de IA na seção 6. &#x20;
- **Justifique as regras prováveis não incluídas:** se uma regra comum nesse tipo de organização ficou de fora, explique por quê (ex.: a organização não realiza o processo correspondente, ou a regra não se aplica ao porte ou à natureza dela).

**Notação do DER conceitual (todos os grupos — Caso A e Caso B)**

*O DER deve seguir a notação do **brModelo**, como no exemplo abaixo:*

| Elemento                                                 | Como aparece                                                                                                                                       | No exemplo                                  |
| -------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------- |
| **Entidade**                                             | retângulo                                                                                                                                          | `Entity 1` a `Entity 5`                     |
| **Relacionamento**                                       | losango                                                                                                                                            | `Rel 33`, `Rel 34`                          |
| **Cardinalidade mínima e máxima**                        | par `(mín, máx)` dos dois lados de cada relacionamento                                                                                             | `(0, 1)`, `(1, n)`, `(0, n)`                |
| **Autorrelacionamento**                                  | losango ligado duas vezes à mesma entidade, cada lado com sua cardinalidade                                                                        | `Rel 33`, em `Entity 3`                     |
| **Atributo identificador (chave)**                       | círculo **preenchido**                                                                                                                             | `Chave 1`, `Chave 2`, `Chave 3`, `Chave 4`  |
| **Identificador composto**                               | mais de um círculo preenchido na mesma entidade (obrigatório) — ou mais de um atributo sublinhado, se os atributos estiverem listados no retângulo | `Chave 50` + `Chave 51`, em `Entity 5`      |
| **Atributo comum**                                       | círculo **vazio**                                                                                                                                  | `Attribute 10`, `Attribute 30`              |
| **Atributo multivalorado**                               | círculo vazio com a cardinalidade do atributo                                                                                                      | `Attribute 11 (1, n)`                       |
| **Atributo composto** *(representação gráfica opcional)* | atributo com seus próprios subatributos ligados a ele                                                                                              | `Attribute 21`, com `attr 211` e `attr 212` |
| **Generalização/especialização**                         | triângulo ligando a entidade genérica às especializadas. **A indicação de totalidade e disjunção não é obrigatória**                               | `Entity 1` → `Entity 2` e `Entity 3`        |
| **Entidade associativa**                                 | retângulo envolvendo o losango do relacionamento, que passa a poder se relacionar com outras entidades e ter atributos próprios                    | `Rel 53`, com `Attribute 530`               |

- **Representação gráfica opcional:** atributos compostos podem ser desenhados como no exemplo (subatributos ligados ao atributo), mas não é obrigatório; o mesmo vale para a indicação de totalidade/disjunção da generalização/especialização. &#x20;
- **Atributos de entidades:** podem ser representados como no brModelo (círculos ligados à entidade, como no exemplo) **ou** listados dentro do retângulo da entidade — nesse caso, o **identificador deve estar sublinhado**. &#x20;
- **Atributos de relacionamentos e de entidades associativas:** **somente** como no brModelo, ligados ao losango ou à entidade associativa (como `Attribute 530`) — não podem ser listados dentro de um retângulo. &#x20;
- **Sem chaves estrangeiras** — elas só aparecem no modelo lógico (seção 2).

*Informe no README **em qual software ou aplicativo o DER foi criado**.*

**Caso A — mesma organização da Entrega 1**

*Apresente o **DER conceitual revisado**, na notação descrita acima. A revisão parte da correção da Entrega 1 recebida pelo grupo — o DER e os demais itens acima. Para cada apontamento da correção, registre o que foi feito:*

| Apontamento da correção da E1                    | O que mudou no trabalho                                                      | Por quê                                                           |
| ------------------------------------------------ | ---------------------------------------------------------------------------- | ----------------------------------------------------------------- |
| *ex.: N:N entre PEDIDO e PRODUTO sem quantidade* | *criada a entidade associativa ITEM_PEDIDO com quantidade e preço praticado* | *sem ela não é possível saber quanto de cada produto foi vendido* |
| *ex.: chaves estrangeiras desenhadas no DER*     | *removidas — passam a aparecer só no modelo lógico (seção 2)*                | *FK é decisão do modelo lógico, não do conceitual*                |

*Se o grupo discordar de algum apontamento e mantiver o modelo como estava, registre isso na tabela com a justificativa. Apontamento não citado na tabela é tratado como não corrigido.*

**Caso B — nova organização (a da Entrega 1 era fictícia ou não teve a existência comprovada)**

*Além de todos os itens acima, apresente o **DER conceitual** da nova organização, na notação descrita acima.*

*Use a correção da Entrega 1 do grupo como guia dos erros a não repetir, mesmo sendo outra organização.*

### 1.2 Conversão do Modelo Conceitual para o Modelo Lógico

#### Informações do Projeto Império Leste

do Modelo Conceitual para o Modelo Lógico

A conversão do modelo conceitual para o modelo lógico resultou em onze tabelas na implementação do banco de dados.

As entidades do DER foram transformadas em tabelas relacionais. Os atributos passaram a ser representados por colunas, e os identificadores foram definidos como chaves primárias.

Os relacionamentos de um para muitos foram implementados por meio de chaves estrangeiras no lado correspondente à multiplicidade.

Os relacionamentos de muitos para muitos foram resolvidos utilizando tabelas associativas:

- `item_receita`: relaciona produtos e ingredientes, armazenando a quantidade utilizada na receita.
- `pizza_concorrente`: relaciona produtos próprios e concorrentes, armazenando informações sobre preços praticados.
- `item_venda`: relaciona vendas e produtos, registrando quantidade e preço unitário.

A implementação está organizada nos seguintes grupos:

| Grupo | Tabelas |
|---|---|
| Produtos e precificação | `produto`, `margem_lucro` |
| Ingredientes e receitas | `ingrediente`, `item_receita` |
| Custos | `custo_fixo` |
| Concorrência | `concorrente`, `pizza_concorrente` |
| Vendas e clientes | `cliente`, `venda`, `item_venda` |
| Autorização | `usuario_autorizado` |

---


*(vale 7,5%)*

- **Entidades → Tabelas:** *como cada entidade virou tabela.* &#x20;
- **Atributos → Colunas:** *conversão correta dos atributos.* &#x20;
- **Relacionamentos → Chaves:** *como os relacionamentos foram traduzidos.* &#x20;
- **Cardinalidades:** *como cada cardinalidade (1:1, 1:N, N:N) foi tratada (inclusive tabelas associativas, se houver).* &#x20;
- **Generalização/especialização:** *se o DER tiver, qual estratégia de conversão foi usada (tabela única, uma tabela por entidade ou só as especializadas) e por quê.*

### 1.3 Definição de Chaves Primárias e Estrangeiras

#### Informações do Projeto Império Leste

de Chaves Primárias e Estrangeiras

| Tabela | Chave primária (PK) | Chaves estrangeiras (FK) |
|---|---|---|
| `margem_lucro` | `id_margem` | — |
| `produto` | `id_produto` | `id_margem` → `margem_lucro(id_margem)` |
| `ingrediente` | `id_ingrediente` | — |
| `item_receita` | `id_item_receita` | `id_produto` → `produto(id_produto)`; `id_ingrediente` → `ingrediente(id_ingrediente)` |
| `custo_fixo` | `id_custo_fixo` | — |
| `concorrente` | `id_concorrente` | — |
| `pizza_concorrente` | `id_pizza_concorrente` | `id_produto` → `produto(id_produto)`; `id_concorrente` → `concorrente(id_concorrente)` |
| `cliente` | `id_cliente` | — |
| `venda` | `id_venda` | `id_cliente` → `cliente(id_cliente)` |
| `item_venda` | `id_item_venda` | `id_venda` → `venda(id_venda)`; `id_produto` → `produto(id_produto)` |
| `usuario_autorizado` | `id_usuario` | — |

---


*Liste as PKs e FKs de cada tabela (serve de base para a justificativa técnica abaixo).*

### 1.4 Processo de Normalização (1FN, 2FN e 3FN)

#### Informações do Projeto Império Leste

de Normalização

### Primeira Forma Normal (1FN)

A primeira forma normal foi considerada por meio da organização dos atributos em valores individuais, evitando listas de produtos ou ingredientes dentro de uma única coluna.

Os itens de uma venda são armazenados separadamente na tabela `item_venda`. Os ingredientes utilizados nas receitas são registrados na tabela `item_receita`.

Essa organização permite que cada registro represente uma ocorrência específica de uma relação.

### Segunda Forma Normal (2FN)

A segunda forma normal foi considerada na separação das informações que dependem das associações entre entidades.

A tabela `item_receita` registra a quantidade de ingrediente utilizada em determinado produto. A tabela `item_venda` registra a quantidade e o preço unitário de um produto dentro de uma venda.

As tabelas associativas evitam a repetição de dados relacionados às entidades principais.

### Terceira Forma Normal (3FN)

A terceira forma normal foi considerada mantendo informações de entidades independentes em tabelas próprias.

Exemplos:

- Os dados dos clientes ficam na tabela `cliente`.
- As informações de margem de lucro ficam na tabela `margem_lucro`.
- Os dados dos concorrentes ficam na tabela `concorrente`.
- Os ingredientes ficam separados dos produtos.
- Os custos fixos ficam na tabela `custo_fixo`.

Dessa forma, busca-se evitar dependências transitivas e repetição desnecessária de informações.

A validação formal definitiva deve ser conferida em conjunto com o modelo lógico diagramado e o dicionário de dados.

---


*(vale 7,5%)*

- **1FN:** *eliminação de grupos repetitivos/atributos multivalorados.* &#x20;
- **2FN:** *eliminação de dependências parciais.* &#x20;
- **3FN:** *eliminação de dependências transitivas.* &#x20;
- **Justificativa do processo:** *por que cada forma normal foi necessária no seu caso.*

### 1.5 Justificativas Técnicas das Decisões

#### Informações do Projeto Império Leste

Técnicas das Decisões

### Chaves primárias

Foram utilizados identificadores numéricos como chaves primárias das tabelas. Essa escolha permite identificar cada registro de maneira única e estável.

### Chaves estrangeiras

As chaves estrangeiras asseguram que os relacionamentos entre as tabelas sejam mantidos de forma consistente.

Elas são utilizadas para relacionar:

- Produtos e margens de lucro.
- Produtos e ingredientes.
- Produtos e concorrentes.
- Vendas e clientes.
- Vendas e produtos vendidos.

### Tabelas associativas

As tabelas `item_receita`, `pizza_concorrente` e `item_venda` foram utilizadas para representar relacionamentos que necessitam de informações adicionais.

### Integridade dos dados

O banco de dados utiliza restrições de integridade para evitar registros inconsistentes, incluindo identificadores, relacionamentos e valores obrigatórios.

### Limitações identificadas

O modelo atual não possui uma tabela específica de movimentação de estoque para registrar entradas e saídas de produtos ou ingredientes.

Consequentemente, o sistema ainda não realiza o cálculo automático de saldo de estoque nem o rastreamento detalhado das movimentações.

Também não foram identificados no esquema atual campos específicos para:

- Forma de pagamento.
- Canal de venda (balcão ou delivery).
- Cancelamento de venda.
- Funcionário responsável por cada venda.

Esses pontos representam oportunidades de evolução do sistema.

### Segurança

A tabela `usuario_autorizado` possui informações de usuários e autorização para precificação.

Entretanto, a existência dessa tabela não significa que todas as funcionalidades de autenticação e controle de acesso estejam implementadas no sistema web.

---


*(vale 7,5%)*

- Justificar as **chaves primárias** escolhidas. &#x20;
- Justificar as **chaves estrangeiras** e os relacionamentos que elas implementam. &#x20;
- Justificar as **restrições** aplicadas (unicidade, obrigatoriedade, valores permitidos etc.), citando o código da regra de negócio (`RNxx`) que cada restrição implementa, quando houver. &#x20;
- Justificar **decisões arquiteturais** gerais do modelo.

### 1.6 Proposta de Arquitetura Analítica para BI e IA

#### Informações do Projeto Império Leste

de Arquitetura Analítica para BI e IA

A estrutura do banco de dados do Império Leste permite organizar informações relevantes para futuras análises gerenciais.

### Informações estratégicas

As informações que podem apoiar a gestão da pizzaria incluem:

- Produtos mais comercializados.
- Quantidade de produtos vendidos.
- Faturamento por período.
- Valor médio das vendas.
- Custos estimados de ingredientes.
- Custos fixos mensais.
- Margens de lucro cadastradas.
- Comparação de preços com concorrentes.
- Evolução das vendas ao longo do tempo.

### KPIs propostos

Os indicadores abaixo são propostas de análise. As consultas específicas para calculá-los ainda precisam ser adicionadas ao script SQL.

| KPI proposto | Fórmula | Tabelas envolvidas |
|---|---|---|
| Faturamento total | Soma de quantidade × preço unitário dos itens vendidos | `venda`, `item_venda` |
| Ticket médio | Faturamento total ÷ quantidade de vendas | `venda`, `item_venda` |
| Produto mais vendido | Produto com maior quantidade total comercializada | `produto`, `item_venda` |
| Custo estimado de ingredientes por produto | Soma da quantidade utilizada × custo unitário dos ingredientes | `produto`, `item_receita`, `ingrediente` |
| Total de custos fixos mensais | Soma dos valores mensais dos custos fixos ativos | `custo_fixo` |
| Comparação de preços de concorrentes | Diferença entre preço de venda próprio e preço praticado pelo concorrente | `produto`, `pizza_concorrente`, `concorrente` |

### Rastreabilidade dos problemas

| Problema ou KPI | Tabelas envolvidas | Situação |
|---|---|---|
| P1 — Controle de entradas e saídas de estoque | `ingrediente`, `item_receita`, `produto` | Parcialmente representado. Não existe tabela de movimentação de estoque. |
| P2 — Organização dos gastos | `ingrediente`, `item_receita`, `custo_fixo` | Os dados necessários para estimativas estão parcialmente armazenados. Consulta gerencial específica pendente. |
| P3 — Acompanhamento dos lucros | `venda`, `item_venda`, `produto`, `ingrediente`, `item_receita`, `custo_fixo`, `margem_lucro` | Possível estimativa com os dados disponíveis, mas a consulta de lucro ainda precisa ser desenvolvida. |
| Faturamento total | `venda`, `item_venda` | Consulta gerencial pendente. |
| Ticket médio | `venda`, `item_venda` | Consulta gerencial pendente. |
| Produto mais vendido | `produto`, `item_venda` | Consulta gerencial pendente. |
| Custos fixos mensais | `custo_fixo` | Consulta gerencial pendente. |
| Comparação de preços | `produto`, `pizza_concorrente`, `concorrente` | Consulta gerencial pendente. |

### Potencial para BI

A base de dados pode futuramente ser integrada a ferramentas de Business Intelligence para produzir dashboards e relatórios gerenciais.

Esses recursos poderiam permitir que a proprietária acompanhasse os resultados da pizzaria com maior facilidade, identificando tendências de vendas, produtos com maior demanda e despesas relevantes.

### Potencial para IA

A estrutura de dados também apresenta potencial para aplicações futuras de inteligência artificial, como:

- Previsão de demanda por produto.
- Identificação de tendências de vendas.
- Sugestões de precificação.
- Análise de custos e margens.
- Recomendações para planejamento de compras.

Essas aplicações dependem da existência de dados históricos em quantidade suficiente e da ampliação do sistema.

---


*(vale 7,5%)*

- **Informações estratégicas** que podem ser extraídas dos dados para a gestão da organização. &#x20;
- **Indicadores e métricas gerenciais** propostos (KPIs). &#x20;
- **Potencial dos dados para BI:** como a estrutura apoia dashboards/relatórios. &#x20;
- **Aplicações analíticas e de IA:** como o modelo pode alimentar análises preditivas, recomendações etc.

**Rastreabilidade:** inclua uma tabela que ligue cada problema declarado na caracterização da organização e cada KPI proposto às tabelas que o sustentam e à consulta do script SQL que o responde (pelo código da consulta — ver seção 3):

| Problema ou KPI                           | Tabelas envolvidas              | Consulta no script |
| ----------------------------------------- | ------------------------------- | ------------------ |
| *ex.: P1 — ruptura de estoque de bebidas* | *PRODUTO, MOVIMENTACAO_ESTOQUE* | *G03*              |
| *ex.: ticket médio por ambiente*          | *PEDIDO, ITEM_PEDIDO, AMBIENTE* | *G05*              |

*KPI sem consulta no script que o calcule não é considerado KPI. Cada problema declarado deve ter pelo menos uma consulta que o responda.*

> **O que é KPI:** *Key Performance Indicator* (indicador-chave de desempenho) é um número que mostra, de forma objetiva, se a organização está indo bem em algo que importa para a gestão dela. Um KPI tem **fórmula** (como é calculado), **período** (por dia, semana, mês) e, de preferência, uma **meta** para comparação. Exemplos: ticket médio por venda, taxa de cancelamento de pedidos, produtos abaixo do estoque mínimo, tempo médio de atendimento, número de beneficiários atendidos por mês, percentual de doações recorrentes. "Melhorar o atendimento" não é KPI; "tempo médio entre o pedido e a entrega, por semana" é.

> **Como levantar:** é recomendável usar pesquisas e ferramentas de IA para descobrir quais indicadores são usados por organizações do mesmo tipo (ex.: "principais KPIs de uma pizzaria", "indicadores de gestão de uma ONG de doação de alimentos") e quais análises de BI e de IA costumam ser aplicadas a elas. Depois, **filtre pelo que o seu banco consegue calcular**: um KPI só vale se as tabelas do modelo tiverem os dados necessários e se houver uma consulta no script que o calcule (ver *Rastreabilidade*, abaixo). Se possível, confirme com o responsável pela organização quais indicadores seriam úteis para ele. Registre esse uso de IA na seção 6.

---

## 2. Modelo Lógico Relacional

#### Informações do Projeto Império Leste

LÓGICO RELACIONAL

A implementação do projeto possui onze tabelas relacionais:

1. `margem_lucro`
2. `produto`
3. `ingrediente`
4. `item_receita`
5. `custo_fixo`
6. `concorrente`
7. `pizza_concorrente`
8. `cliente`
9. `venda`
10. `item_venda`
11. `usuario_autorizado`

O modelo lógico representa a organização dos dados, seus atributos, chaves primárias e chaves estrangeiras.

O DER conceitual foi disponibilizado pelo grupo. O modelo lógico diagramado deverá ser incluído no repositório em arquivo próprio, utilizando a notação solicitada pelo professor.

**Arquivo do DER:** `DER_Imperio_Leste.drawio.webp`

**Arquivo do modelo lógico:** inserir o nome do arquivo diagramado após sua conclusão.

---


*(diagrama separado — vale 10% na Dimensão Procedimental)*

O modelo lógico deve seguir a **notação visual do brModelo** para o modelo lógico, como no exemplo abaixo. Informe no README **em qual software ou aplicativo ele foi criado**.

| Elemento                                      | Como aparece                                                                                       | No exemplo                                                                                 |
| --------------------------------------------- | -------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------ |
| **Tabela**                                    | retângulo com o nome da tabela no topo e uma linha por coluna                                      | `Entity 1`, `Entity 5`                                                                     |
| **Coluna**                                    | nome da coluna, à esquerda, com o tipo de dado à direita                                           | `Attribute 30` — `INT`                                                                     |
| **Chave primária**                            | marca `PK` ao lado do tipo                                                                         | `Chave 1`, em `Entity 1`; `Chave 50` + `Chave 51`, em `Entity 5` (chave primária composta) |
| **Chave estrangeira**                         | marca `FK` ao lado do tipo                                                                         | `Chave 3`, em `Entity 4`                                                                   |
| **Coluna que é chave primária e estrangeira** | marcas `PK, FK`                                                                                    | `Chave 1`, em `Entity 2`                                                                   |
| **Ligação entre tabelas**                     | linha entre a tabela da FK e a tabela referenciada, com a cardinalidade `(mín, máx)` em cada ponta | `Entity 3` — `Entity 4`: `(1, 1)` e `(0, n)`                                               |

Deve apresentar claramente:

- Tabelas &#x20;
- Atributos (colunas), com seus tipos de dados &#x20;
- Chaves primárias &#x20;
- Chaves estrangeiras &#x20;
- Cardinalidades já convertidas

As **demais restrições de integridade** — obrigatoriedade (`NOT NULL`), unicidade (`UNIQUE`), valores permitidos (`CHECK`), valores padrão (`DEFAULT`) — não aparecem no diagrama do brModelo e devem ser documentadas no **dicionário de dados** (seção 5) e implementadas no **script SQL** (seção 3).

---

## 3. Script SQL Completo

#### Informações do Projeto Império Leste

SQL COMPLETO

O projeto possui um script SQL corrigido, denominado `script_corrigido.sql`.

O arquivo contém:

- Criação do banco de dados.
- Criação das onze tabelas.
- Definição de chaves primárias.
- Definição de chaves estrangeiras.
- Restrições de integridade.
- Inserção dos dados de teste.
- Consultas de conferência da quantidade de registros por tabela.

O script foi atualizado para completar a carga de dados que estava interrompida no comando de inserção da tabela `venda`.

**Arquivo:** `script_corrigido.sql`

**Repositório:** https://github.com/matheuscerasi/projeto-pizzaria-imperio-leste

### Consultas gerenciais e de auditoria

O script corrigido contém consultas de conferência dos registros, porém ainda não contém um conjunto completo de consultas gerenciais e de auditoria identificadas pelos códigos G01, G02, A01, A02 etc.

Essa etapa deverá ser complementada para atender integralmente aos requisitos da Entrega 2.

As consultas deverão contemplar:

- Faturamento por período.
- Ticket médio.
- Produtos mais vendidos.
- Custos fixos.
- Estimativas de custos de ingredientes.
- Comparação de preços de concorrentes.
- Verificação de integridade das vendas e seus itens.
- Verificação de relacionamentos e registros inconsistentes.

O script ainda deverá ser executado em ambiente MySQL para validação completa de sua execução.

---


*(arquivo `.sql` — vale 12% na Dimensão Procedimental)*

O script completo é **um arquivo no formato `.sql` disponível no repositório**, de preferência numa pasta chamada **`docs`** (ex.: `docs/script.sql`), com link no README. Script colado só no README, em PDF, em imagem ou em outro formato não é aceito.

**SGBD:** MySQL — o disponível no laboratório ou outra instalação equivalente a que o grupo tenha acesso. O script deve executar no MySQL.

O script deve conter, nesta ordem lógica:

1. `CREATE DATABASE` &#x20;
2. `CREATE TABLE` (todas as tabelas, com tipos de dados adequados) &#x20;
3. **Constraints** (PK, FK, `NOT NULL`, `UNIQUE`, `CHECK` etc.) &#x20;
4. `INSERT INTO` (carga da massa de dados — ver seção 4) &#x20;
5. `SELECT` com `JOIN` (consultas que cruzam múltiplas tabelas) &#x20;
6. `UPDATE` &#x20;
7. `DELETE` &#x20;
8. **Consultas gerenciais** (que respondem perguntas de gestão, ex.: faturamento/arrecadação por período, número de atendimentos/beneficiários) &#x20;
9. **Consultas de auditoria** (que verificam consistência/integridade dos dados)

Cada **consulta gerencial** e cada **consulta de auditoria** deve ter um cabeçalho em comentário com um código (`G01`, `G02`… para gerenciais; `A01`, `A02`… para auditoria), a pergunta que ela responde em português e o que ela atende:

```
-- G03 — Quais bebidas estão abaixo do estoque mínimo hoje?
-- Atende: P1 (ruptura de estoque de bebidas)
SELECT ...

-- A02 — Existe pedido registrado sem nenhum item?
-- Verifica: RN04 (todo pedido tem ao menos um item)
SELECT ...
```

- **Consultas gerenciais** respondem aos problemas declarados e aos KPIs da seção 1.6 — pelo menos uma por problema declarado e por KPI. &#x20;
- **Consultas de auditoria** verificam regras de negócio, citando o código da regra (`RNxx`) que cada uma confere. &#x20;
- Essas mesmas consultas são as usadas na demonstração da apresentação final (seção 7).

*Teste o script do zero (banco vazio) antes de entregar, para garantir que ele executa sem erros.*

---

## 4. Massa de Dados

#### Informações do Projeto Império Leste

DE DADOS

A base SQLite utilizada pelo sistema web possui dados de teste distribuídos pelas onze tabelas.

A quantidade de registros identificada no banco é:

| Tabela | Quantidade de registros |
|---|---:|
| `margem_lucro` | 2 |
| `produto` | 5 |
| `ingrediente` | 7 |
| `item_receita` | 12 |
| `custo_fixo` | 4 |
| `concorrente` | 2 |
| `pizza_concorrente` | 4 |
| `cliente` | 3 |
| `venda` | 6 |
| `item_venda` | 12 |
| `usuario_autorizado` | 4 |
| **Total** | **61** |

A massa de dados foi utilizada para testar a estrutura do banco e as funcionalidades do sistema web.

Os registros são utilizados para demonstrar os relacionamentos entre produtos, ingredientes, receitas, clientes, vendas, custos e concorrentes.

A quantidade de registros foi mantida conforme a base SQLite fornecida pelo grupo. O volume operacional real da pizzaria ainda precisa ser confirmado para justificar quantitativamente a massa de dados em relação ao funcionamento cotidiano da organização.

---


*(incluída no script ou em arquivo separado — parte da nota de Implementação SQL, 12%)*

Se a massa de dados ficar em arquivo separado, ele deve seguir a mesma regra do script: **um arquivo no formato `.sql` no repositório**, de preferência na pasta **`docs`** (ex.: `docs/massa_de_dados.sql`), com link no README.

- **Dados reais da organização (nomes de clientes, fiéis, beneficiários, doadores, valores reais etc.) não devem ser utilizados, em respeito à privacidade dessas informações.** A massa de dados deve ser **fictícia**, mas **coerente com as operações modeladas** (mesmos tipos de processo, volumes e regras observados na organização real). &#x20;
- Volume de registros **coerente com a realidade da organização** (nada de 3 linhas de exemplo — mas também nada artificialmente inflado sem sentido). &#x20;
- **Explique como o volume real da organização** — os números informados em *Contexto e porte* (seção 1.1), como clientes ativos, pedidos por mês, atendimentos por semana, itens no estoque — **justifica a quantidade de registros de cada tabela** da massa de dados. &#x20;
- Dados consistentes o suficiente para validar os processos organizacionais modelados (ex.: pedidos que referenciam clientes e produtos existentes, ou doações que referenciam doadores e campanhas existentes). &#x20;
- **Variedade e quantidade coerentes com a organização, para que os testes sejam possíveis:** os dados devem cobrir as situações reais — não só o caso comum, mas também pedidos cancelados, clientes sem compras, produtos abaixo do estoque mínimo, pagamentos em formas diferentes, registros em períodos diferentes. Sem essa variedade, as consultas gerenciais e de auditoria (seção 3) não têm o que mostrar: uma consulta de produtos abaixo do estoque mínimo que retorna vazio não demonstra nada. &#x20;
- **Documente o uso de LLMs** para gerar essa massa de dados na seção 6 (**Uso de Inteligência Artificial**), incluindo ferramentas, prompts e ajustes feitos manualmente.

---

## 5. Repositório GitHub

#### Informações do Projeto Império Leste

GITHUB

O projeto está disponível no seguinte repositório:

**https://github.com/matheuscerasi/projeto-pizzaria-imperio-leste**

O repositório deverá conter:

- Relatório Técnico Final (`README.md`).
- DER revisado.
- Modelo lógico relacional.
- Dicionário de dados.
- Script SQL completo.
- Massa de dados.
- Arquivo de levantamento da organização.
- Evidências da entrevista.
- Fotografias da pizzaria.
- Histórico de commits dos integrantes.

### Evidências da organização

A pizzaria é uma organização real e foi visitada presencialmente pelo grupo.

O grupo informou possuir fotografias do estabelecimento e produziu um vídeo da entrevista realizada em 08/11/2026.

As imagens e o vídeo deverão ser disponibilizados de forma organizada no repositório, respeitando a privacidade da proprietária e das demais pessoas envolvidas.

### Colaboração

O histórico de commits do GitHub deverá demonstrar a participação dos integrantes no desenvolvimento do projeto.

Cada integrante deverá realizar contribuições identificáveis por sua própria conta do GitHub.

---


*(vale 13% — Documentação e Repositório)*

O repositório deve conter:

- Relatório Técnico (no `README.md`) &#x20;
- **Dicionário de Dados** atualizado, no modelo do arquivo `02-03g_Exemplo_Dicionario_Dados.pdf` e com as restrições de integridade de cada coluna (obrigatoriedade, unicidade, valores permitidos, valor padrão), em **um único arquivo HTML** no repositório. **Exceção — turma de GTI:** o dicionário é apresentado em **um único arquivo Markdown (`.md`) separado do README**, seguindo o mesmo modelo do `02-03g_Exemplo_Dicionario_Dados.pdf`. &#x20;
- Diagramas (DER revisado e modelo lógico) &#x20;
- Levantamento (pasta `levantamento`, recomendada) e evidências da organização e da entrevista (fotos JPG ou PNG) &#x20;
- Script SQL completo em arquivo `.sql` (de preferência na pasta `docs`) &#x20;
- **Histórico de commits** que evidencie o desenvolvimento ao longo do tempo (evite um único commit final) &#x20;
- **Evidências de colaboração entre os membros do grupo:** é a listagem de commits do repositório, que deve estar **equilibrada entre os integrantes** — a quantidade de commits deve se distribuir de forma proporcional entre todos os membros do grupo, cada um fazendo commits com a própria conta do GitHub. O integrante precisa ser **identificável na conta do GitHub**: o nome configurado na conta deve ser compatível com o nome do aluno na tabela de Integrantes, onde também deve constar o usuário do GitHub de cada um

---

## 6. Uso de Inteligência Artificial

#### Informações do Projeto Império Leste

DE INTELIGÊNCIA ARTIFICIAL

O ChatGPT, desenvolvido pela OpenAI, foi utilizado como ferramenta de apoio durante o desenvolvimento e a documentação do projeto Império Leste.

### Ferramenta utilizada

**ChatGPT — OpenAI**

### Etapas em que a ferramenta foi utilizada

- Organização das informações do projeto.
- Estruturação e revisão do relatório técnico.
- Apoio à compreensão de conceitos de banco de dados.
- Apoio à resolução de problemas no sistema web desenvolvido em Python e Flask.
- Apoio à revisão e correção de scripts SQL.
- Identificação de informações que precisavam ser confirmadas pelo grupo.

### Motivação

A utilização da ferramenta teve como objetivo auxiliar o grupo na organização do projeto, na compreensão de dificuldades técnicas e na elaboração de uma documentação mais clara e estruturada.

### Prompts utilizados

Os prompts devem ser registrados de acordo com as solicitações efetivamente realizadas pelo grupo.

Exemplo representativo de solicitação:

> “Preciso que você pegue todo o texto desse arquivo e mude, substituindo os pontos solicitados por informações sobre meu projeto. Caso precise que eu te informe sobre o projeto, me solicite.”

Outro exemplo representativo:

> “Consegue atualizar e corrigir o script.sql?”

Esses exemplos devem ser ajustados caso o grupo utilize outros prompts relevantes.

### Respostas recebidas

A ferramenta auxiliou na estruturação do relatório, identificação de informações pendentes, organização dos requisitos e análise de aspectos técnicos do banco de dados.

Também foi utilizada como apoio na revisão do script SQL e na documentação das limitações identificadas.

### Fontes consultadas e verificadas

As informações referentes à organização foram fornecidas pelo grupo a partir da entrevista presencial com Michely, proprietária da Pizzaria Império Leste, realizada em 08/11/2026.

Os dados técnicos foram conferidos a partir dos arquivos do projeto, incluindo o DER, banco SQLite, código Python e script SQL.

### Trechos rejeitados ou corrigidos

Foram ajustadas informações que poderiam apresentar funcionalidades não implementadas como se estivessem concluídas.

Entre os pontos identificados estão:

- Controle de movimentação de estoque ainda não implementado.
- Consultas gerenciais e de auditoria ainda pendentes.
- Necessidade de validação completa do script SQL no MySQL.
- Necessidade de completar o modelo lógico diagramado e o dicionário de dados.

### Justificativa da escolha final

Foram mantidas as informações compatíveis com a organização e com os arquivos técnicos disponibilizados pelo grupo.

As informações ainda não confirmadas foram registradas como pendências, evitando a inclusão de dados fictícios sobre a rotina real da pizzaria.

### Reflexão crítica

A utilização de inteligência artificial contribuiu para a organização e compreensão do projeto. Entretanto, suas respostas podem conter sugestões genéricas que não correspondem exatamente à realidade da organização ou às funcionalidades implementadas.

Por esse motivo, as informações foram confrontadas com os dados fornecidos pelo grupo, o DER, o banco de dados e o código-fonte.

A ferramenta foi utilizada como apoio, e não como substituta da validação técnica e do conhecimento dos integrantes.

---


*(documentação obrigatória — não é opcional se o grupo usou IA em qualquer etapa: pesquisa, levantamento de processos, requisitos e regras típicos, escrita, organização de ideias, revisão de texto, geração de massa de dados ou apoio a scripts SQL)*

Para cada uso relevante de ferramenta de IA (ChatGPT, Claude, Gemini, Perplexity etc.), registre:

| Item                                 | O que registrar                                                                                                                                                                                            |
| ------------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Ferramenta e etapa**               | Qual IA foi usada e em qual parte do trabalho (ex.: normalização, geração da massa de dados, escrita de queries SQL, redação do relatório, preparação dos slides).                                         |
| **Motivação**                        | Por que o grupo recorreu à IA nesse ponto específico.                                                                                                                                                      |
| **Prompt(s) utilizados**             | Texto exato (ou muito próximo) do que foi perguntado/pedido à IA.                                                                                                                                          |
| **Resposta recebida**                | Resumo ou trecho relevante da resposta da IA.                                                                                                                                                              |
| **Fontes consultadas e verificadas** | Se a IA citou fontes/dados, quais foram checadas pelo grupo e como.                                                                                                                                        |
| **Trechos rejeitados ou corrigidos** | O que da resposta da IA foi descartado, editado ou corrigido manualmente (ex.: query SQL ajustada, dado fictício alterado), e por quê.                                                                     |
| **Justificativa da escolha final**   | Por que o grupo manteve, adaptou ou rejeitou o que a IA sugeriu.                                                                                                                                           |
| **Reflexão crítica**                 | Limites, vieses ou erros identificados no uso da IA nessa etapa (ex.: normalização incorreta sugerida pela IA, script SQL com erro de sintaxe, dado fictício incoerente com o volume real da organização). |

*Se o grupo não usou nenhuma ferramenta de IA em alguma dessas etapas, declare isso explicitamente.*

**Uso de IA observado e não declarado será penalizado.**

---

## 7. Apresentação Corporativa Final

#### Informações do Projeto Império Leste

CORPORATIVA FINAL

A apresentação corporativa final do Projeto Império Leste deverá demonstrar a solução desenvolvida e sua relação com as necessidades identificadas durante a entrevista.

O pitch terá duração de oito minutos e deverá seguir a ordem estabelecida pelo professor.

### 1. Contextualização do problema

Apresentar a Pizzaria Império Leste, sua localização, porte e os problemas identificados:

- Dificuldade de controle de entradas e saídas de produtos.
- Dificuldade de organização dos gastos.
- Dificuldade de acompanhamento dos lucros.

### 2. Apresentação da solução

Demonstrar o sistema web desenvolvido utilizando Python, Flask e SQLite, explicando como ele organiza as informações da pizzaria.

### 3. Apresentação do modelo lógico

Apresentar as tabelas, atributos, chaves primárias, chaves estrangeiras e relacionamentos.

### 4. Demonstração da implementação

Demonstrar a estrutura do banco de dados e a execução do script SQL.

### 5. Demonstração de consultas

Apresentar consultas gerenciais e de auditoria efetivamente implementadas e testadas.

### 6. Potencial para BI e IA

Explicar como as informações armazenadas podem apoiar análises de vendas, custos, produtos e concorrência.

### 7. Benefícios diretos

Demonstrar como a organização das informações pode contribuir para a tomada de decisão da proprietária da pizzaria.

Todos os integrantes deverão participar da apresentação e estar presentes para a defesa do modelo lógico, conforme as orientações do professor.

---


*(pitch cronometrado de **8 minutos** — vale 15%, maior peso individual da Dimensão Procedimental)*

Formato: slides com estética limpa e minimalista — **proibida a leitura de blocos longos de texto**.

O pitch deve conter, nesta ordem:

1. **Contextualização do problema institucional/organizacional** solucionado &#x20;
2. **Apresentação da solução** proposta &#x20;
3. **Apresentação do modelo lógico** &#x20;
4. **Demonstração da implementação** (SQL rodando) &#x20;
5. **Demonstração de consultas** (gerenciais/auditoria) &#x20;
6. **Potencial para BI e IA** &#x20;
7. **Benefícios diretos** para a tomada de decisão da organização

**Defesa do modelo lógico:** logo após o pitch, fora do tempo cronometrado, o grupo responde às perguntas do professor e da turma. **Cada pergunta deve ser respondida exclusivamente pelo aluno a quem foi dirigida** — os colegas não podem responder por ele.

**Regras da apresentação:**

- **Participação:** não é necessário e nem recomendável que todos os integrantes falem durante o pitch, mas é **obrigatório que todos participem** da apresentação e estejam presentes para a defesa. &#x20;
- **Ausência:** o integrante ausente na apresentação terá **nota reduzida**, exceto em casos com justificativa legal (ex.: doença que impeça o comparecimento, com atestado). &#x20;
- **Apresentação pessoal:** será avaliada. Postura e vestimenta adequadas a uma apresentação corporativa. Não são adequados bonés, bermudas, chinelos, camisas de time, roupas esportivas ou semelhantes.

---

## Critérios Atitudinais (20%)

**Estes critérios NÃO constam explicitamente como item de entrega nos artefatos do grupo.** Eles são avaliados por meio de **Avaliação 360º entre os integrantes do grupo** (cada membro avalia os colegas de equipe) e, no caso da colaboração, também pela **colaboração equilibrada no histórico de commits** do repositório GitHub (Seção 5) e pela conduta do grupo na **Apresentação Corporativa Final** (seção 7) — não pela leitura do relatório:

- **Participação e colaboração (5%):** participação técnica ativa + colaboração com o grupo, incluindo colaboração equilibrada no histórico de commits do repositório GitHub. &#x20;
- **Responsabilidade (5%):** cumprimento de prazos + entrega dos itens sob sua responsabilidade. &#x20;
- **Postura profissional (5%):** comunicação profissional + conduta ética. &#x20;
- **Autonomia e resolução de problemas (5%):** buscar soluções independentes + propor melhorias.

---

## Resumo dos Pesos

| Dimensão      | Peso total | Itens principais                                                                                              |
| ------------- | ---------- | ------------------------------------------------------------------------------------------------------------- |
| Conceitual    | 30%        | Conversão conceitual→lógico (7,5%), Normalização (7,5%), Justificativas técnicas (7,5%), Análise BI/IA (7,5%) |
| Procedimental | 50%        | Modelo lógico (10%), Implementação SQL (12%), Documentação/repositório (13%), Apresentação final (15%)        |
| Atitudinal    | 20%        | Participação/colaboração, responsabilidade, postura profissional, autonomia                                   |

**Entrega final:** Relatório Técnico + Dicionário de Dados + Modelo Conceitual + Modelo Lógico + Script SQL + Massa de Dados + Repositório GitHub, seguidos da Apresentação Corporativa Final perante o professor e a turma.

---

# 8. CONSIDERAÇÕES FINAIS

O Projeto Império Leste foi desenvolvido com o objetivo de organizar informações relacionadas à gestão de uma pizzaria real.

A partir da entrevista realizada com a proprietária Michely, foram identificadas dificuldades relacionadas ao controle de estoque, à organização dos gastos e ao acompanhamento dos lucros.

O projeto resultou na elaboração de um modelo conceitual, na conversão para um modelo relacional com onze tabelas, na implementação de uma base SQLite e no desenvolvimento de um sistema web utilizando Python e Flask.

O banco de dados possui 61 registros de teste distribuídos entre suas tabelas, permitindo demonstrar relacionamentos e funcionalidades básicas de gestão.

A correção do script SQL contribuiu para completar a carga de dados e organizar a estrutura de criação e conferência do banco.

Apesar dos resultados alcançados, ainda existem oportunidades de melhoria, especialmente na implementação de consultas gerenciais e de auditoria, no controle de movimentações de estoque e na finalização dos artefatos de documentação.

O projeto representa uma etapa importante para a aplicação prática dos conhecimentos de modelagem de dados, desenvolvimento web, SQL e documentação técnica.

---

# 9. PENDÊNCIAS PARA A ENTREGA FINAL

Antes da entrega definitiva, o grupo deverá verificar os seguintes pontos:

- [ ] Confirmar a quantidade média real de pedidos por dia, semana ou mês.
- [ ] Inserir as fotografias da pizzaria e da entrevista no repositório.
- [ ] Disponibilizar o vídeo da entrevista como evidência complementar.
- [ ] Criar e inserir o modelo lógico diagramado.
- [ ] Criar e atualizar o dicionário de dados.
- [ ] Completar as consultas gerenciais no script SQL.
- [ ] Completar as consultas de auditoria no script SQL.
- [ ] Executar o script SQL em ambiente MySQL e verificar se funciona do início ao fim.
- [ ] Revisar os requisitos funcionais, não funcionais e regras de negócio.
- [ ] Conferir os apontamentos específicos realizados pelo professor na correção do DER.
- [ ] Organizar os arquivos na branch `main` do GitHub.
- [ ] Verificar a participação dos integrantes no histórico de commits.
- [ ] Preparar a apresentação corporativa final de oito minutos.

---

## RESUMO DOS PESOS DA AVALIAÇÃO

| Dimensão | Peso | Itens principais |
|---|---:|---|
| Conceitual | 30% | Conversão conceitual para lógico, normalização, justificativas técnicas e BI/IA |
| Procedimental | 50% | Modelo lógico, implementação SQL, documentação/repositório e apresentação final |
| Atitudinal | 20% | Participação, colaboração, responsabilidade, postura profissional e autonomia |

**Entrega final:** Relatório Técnico Final, Dicionário de Dados, Modelo Conceitual, Modelo Lógico, Script SQL, Massa de Dados, Repositório GitHub e Apresentação Corporativa Final.
