# Coder-House
Banco de dados

                                                     TABELA CONSULTA 
                                                     
Tabela com todos os dados da consulta da clínica veterinaria.

| NOME DAS COLUNA  | TIPO DOS DADOS | CHAVE | INDEXES | TABELA REFERENCIADA | DESCRIÇÃO | 
| ------------- | ------------- | ------------- | ------------- | ------------- | ------------- |
|  ID_CONSULTA | INT | PRIMARY KEY | índice clusterizado | - | ID da consulta
|  ID_PET | INT  |  FOREIGN KEY | - | PET | ID do pet  |
|  ID_VETERINARIO | INT  |  FOREIGN KEY | - | VETERINARIO | ID do veterinario |
|  ID_EXAME | INT  |  FOREIGN KEY | - | EXAME | ID do exame |
|  CONSULTA_DATA | DATE  |  - | - | - | DATE DA CONSULTA |
|  CONSULTA_HORA | TIME  |  - | -  | - | HORÁRIO DA CONSULTA  |

                                                     TRIGGERS 
TRIGGER BEFORE INSERT:
Trigger criada para permitir inserir valores negativos na coluna ID_CONSULTA.

TRIGGER AFERT INSERT:
Trigger criada para logs de inserções dos registros na tabela consulta.

                                                  TABELA CONSULTA LOG
Tabela criada derivada de um trigger after.

| NOME DAS COLUNA  | TIPO DOS DADOS | CHAVE |             INDEXES                         | TABELA REFERENCIADA       | DESCRIÇÃO | 
| -------------  | -------------    | -------------   | -------------                     | -------------             | ------------- |
|  CONSULTA_ID   | INT              | PRIMARY KEY     |   índice clusterizado (B-TREE)    | -                         | Consulta do ID
|  DATA_REGISTRO | DATETIME         | -               |              -                    | -                         | DATA do insert na tabela  |
|  USUARIO       | VARCHAR(100)     | -               |              -                    | -                         | USUARIO Que inseriu o registro |

