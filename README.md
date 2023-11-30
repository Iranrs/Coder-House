#### INTRODUÇÃO AO BANCO DE DADOS CLÍNICA VETERINÁRIA

Bem-vindo ao banco de dados dedicado à gestão eficiente e abrangente de uma clínica veterinária. Este sistema foi projetado para atender às necessidades específicas do setor veterinário, proporcionando uma plataforma robusta para armazenamento, organização e recuperação de informações cruciais relacionadas aos pacientes, funcionários, procedimentos e registros financeiros.

A gestão eficaz de uma clínica veterinária requer um controle preciso e acessível de dados vitais, desde informações médicas detalhadas sobre os animais até a administração de compromissos e a supervisão das atividades financeiras. Nosso banco de dados foi desenvolvido para proporcionar uma solução abrangente e integrada, permitindo que a equipe veterinária concentre-se no que faz de melhor: fornecer cuidados excepcionais aos animais de estimação.


O grande volume de informações descentralizadas foi se tornando um obstáculo no crescimento do negócio. Uma vez que o tempo utilizado na organização do próprio negócio poderia ser melhor administrado para questões relacionadas a negociação e fechamento das vendas.

<a href="https://github.com/Iranrs/Coder-House/tree/main/INSERT%20INTO"> SCRIPTS DE INSERT</a>

Criação de tabelas
Inserção de dados
Views
Funções
Stored Procedures
Triggers
Usuários


### TABELAS QUE COMPOEM O BANCO DE DADOS



                                                     TABELA CONSULTA 
                                                     
Tabela com todos os dados da consulta da clínica veterinaria.

| NOME DAS COLUNA      | TIPO DOS DADOS        | CHAVE           | INDEXES               | TABELA REFERENCIADA   | DESCRIÇÃO          | 
| -------------        | -------------         | -------------   | -------------         | -------------         | -------------      |
|  ID_CONSULTA         | INT                   | PRIMARY KEY     | índice clusterizado (B-TRE)  | -                     | ID da consulta     |
|  ID_PET              | INT                   |  FOREIGN KEY    | -                     | PET                   | ID do pet          |
|  ID_VETERINARIO      | INT                   |  FOREIGN KEY    | -                     | VETERINARIO           | ID do veterinario  |
|  ID_EXAME            | INT                   |  FOREIGN KEY    | -                     | EXAME                 | ID do exame        |
|  CONSULTA_DATA       | DATE                  | -               | -                     | -                     | DATE DA CONSULTA   |
|  CONSULTA_HORA       | TIME                  | -               | -                     | -                     | HORÁRIO DA CONSULTA|

                                                         TRIGGERS 
TRIGGER BEFORE INSERT:
Trigger criada para não permitir inserir valores negativos na coluna ID_CONSULTA.

TRIGGER AFERT INSERT:
Trigger criada para logs de inserções dos registros na tabela consulta.

                                                    TABELA CONSULTA LOG
Tabela criada derivada de um trigger after.

| NOME DAS COLUNA  | TIPO DOS DADOS | CHAVE |             INDEXES                         | TABELA REFERENCIADA       | DESCRIÇÃO | 
| -------------  | -------------    | -------------   | -------------                     | -------------             | ------------- |
|  CONSULTA_ID   | INT              | PRIMARY KEY     |   índice clusterizado (B-TREE)    | -                         | Consulta do ID
|  DATA_REGISTRO | DATETIME         | -               |              -                    | -                         | DATA do insert na tabela  |
|  USUARIO       | VARCHAR(100)     | -               |              -                    | -                         | USUARIO Que inseriu o registro |


                                                       TABELA DONO PET

Tabela criada para guardar as informações do tutor do pet

| NOME DAS COLUNA  | TIPO DOS DADOS | CHAVE |             INDEXES                         | TABELA REFERENCIADA       | DESCRIÇÃO | 
| -------------  | -------------    | -------------   | -------------                     | -------------             | ------------- |
|  ID_DONO       | INT              | PRIMARY KEY     |   índice clusterizado (B-TREE)    | -                         | ID DO TUTOR   |
|  DONO_NOME     | VARCHAR(45)      | -               |              -                    | -                         | NOME DO TUTOR |
| DONO_SOBRENOME | VARCHAR(100)     | -               |              -                    | -                         | SOBRENOME DO TUTOR |
|  DONO_CPF      | VARCHAR(12)      | -               |              -                    | -                         | CPF DO TUTOR |
|  DONO_ENDERECO | VARCHAR(100)     | -               |              -                    | -                         | ENDERECO DO TUTOR |
|  DONO_EMAIL    | VARCHAR(45)      | -               |              -                    | -                         | EMAIL DO TUTOR |
|  DONO_TELEFONE | VARCHAR(15)      | -               |              -                    | -                         | TELEFONE DO TUTOR |


                                                          TABELA EXAME

Onde é inserido os exames que os pets precisam fazer ou fez.

| NOME DAS COLUNA  | TIPO DOS DADOS | CHAVE |             INDEXES                         | TABELA REFERENCIADA       | DESCRIÇÃO | 
| -------------  | -------------    | -------------   | -------------                     | -------------             | ------------- |
|  ID_EXAME      | INT              | PRIMARY KEY     |   índice clusterizado (B-TREE)    | -                         | ID DO EXAME   |
|  EXAME_NOME    | VARCHAR(100)     | -               |              -                    | -                         | NOME DO EXAME |

                                                             TABELA PET

Tabela criada para guardar as informações dos exames dos pets

| NOME DAS COLUNA  | TIPO DOS DADOS | CHAVE |             INDEXES                         | TABELA REFERENCIADA       | DESCRIÇÃO | 
| -------------  | -------------    | -------------   | -------------                     | -------------             | ------------- 
|  ID_DONO       | INT              | PRIMARY KEY     |   índice clusterizado (B-TREE)    | -                         |  ID DO TUTOR |
|  ID_PET        | INT              | FOREIGN KEY     |              -                    | -                         | ID DO PET |
|  PET_GENERO    | VARCHAR(1)       | -               |              -                    | -                         | GENERO DO PET |
|  PET_NOME      | VARCHAR(45)      | -               |              -                    | -                         | NOME DO PET |
|  PET_PESO      | DECIMAL (5,2)    | -               |              -                    | -                         | PESO DO PET |
|  PET_RACA      | VARCHAR(45)      | -               |              -                    | -                         | RAÇA DO PET|
|  PET_TIPO      | VARCHAR(45)      | -               |              -                    | -                         | |TIPO DO PET |

                                                          TABELA PRECOS 


Tabela criada para guardar as informações dos serviços e produtos vendidos na clínica

| NOME DAS COLUNA    | TIPO DOS DADOS | CHAVE |             INDEXES                         | TABELA REFERENCIADA       | DESCRIÇÃO | 
| -------------      | -------------    | -------------   | -------------                     | -------------             | ------------- 
|  ID                | INT              | PRIMARY KEY     |   índice clusterizado (B-TREE)    | -                         | ID DO PRECO/PRODUTO |
|  SERVICO_PRODUTO   | VARCHAR(200)     | -               |              -                    | -                         | REGISTROS DOS SERVIÇOS E PRODUTOS |
|  PRECO             | DECIMAL (10,2)   | -               |              -                    | -                         | PREÇOS DOS SERVIÇOS E PRODUTOS    |


                                                         TABELA VETERINARIO 
Onde encontramos os dados do medico de plantão e suas devidas consultas e exames.

| NOME DAS COLUNA                | TIPO DOS DADOS | CHAVE |             INDEXES                         | TABELA REFERENCIADA       | DESCRIÇÃO | 
| -------------                  | -------------    | -------------   | -------------                     | -------------             | ------------- 
|  ID_VETERINARIO                | INT              | PRIMARY KEY     |   índice clusterizado (B-TREE)    | -                         | ID DO VETERINARIO            |
|  VETERINARIO_NOME              | VARCHAR(45)      | -               |              -                    | -                         | NOME DO VETERINARIO          |
|  VETERINARIO_ESPECIALIDADE     | VARCHAR(100)     | -               |              -                    | -                         | ESPECIALIDADE DO VETERINARIO |





                                                        
