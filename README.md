# Coder-House
Banco de dados

                                                     TABELA CONSULTA 
                                                     
Tabela com todos os dados da consulta da clínica veterinaria.

| NOME DAS COLUNA      | TIPO DOS DADOS        | CHAVE           | INDEXES               | TABELA REFERENCIADA   | DESCRIÇÃO          | 
| -------------        | -------------         | -------------   | -------------         | -------------         | -------------      |
|  ID_CONSULTA         | INT                   | PRIMARY KEY     | índice clusterizado   | -                     | ID da consulta     |
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

Tabela criada para guardar as informações dos exames dos pets

| NOME DAS COLUNA  | TIPO DOS DADOS | CHAVE |             INDEXES                         | TABELA REFERENCIADA       | DESCRIÇÃO | 
| -------------  | -------------    | -------------   | -------------                     | -------------             | ------------- |
|  ID_EXAME      | INT              | PRIMARY KEY     |   índice clusterizado (B-TREE)    | -                         | ID DO EXAME   |
|  EXAME_NOME    | VARCHAR(100)     | -               |              -                    | -                         | NOME DO EXAME |

                                                             TABELA PET

Tabela criada para guardar as informações dos exames dos pets

| NOME DAS COLUNA  | TIPO DOS DADOS | CHAVE |             INDEXES                         | TABELA REFERENCIADA       | DESCRIÇÃO | 
| -------------  | -------------    | -------------   | -------------                     | -------------             | ------------- 
|  ID_DONO       | INT              | PRIMARY KEY     |   índice clusterizado (B-TREE)    | -                         |  ID DO TUTOR |
|  ID_PET        | INT              | -               |              -                    | -                         | ID DO PET |
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
Tabela criada para guardar as informações dos veterinarios

| NOME DAS COLUNA                | TIPO DOS DADOS | CHAVE |             INDEXES                         | TABELA REFERENCIADA       | DESCRIÇÃO | 
| -------------                  | -------------    | -------------   | -------------                     | -------------             | ------------- 
|  ID_VETERINARIO                | INT              | PRIMARY KEY     |   índice clusterizado (B-TREE)    | -                         | ID DO VETERINARIO            |
|  VETERINARIO_NOME              | VARCHAR(45)      | -               |              -                    | -                         | NOME DO VETERINARIO          |
|  VETERINARIO_ESPECIALIDADE     | VARCHAR(100)     | -               |              -                    | -                         | ESPECIALIDADE DO VETERINARIO |



                                                        






