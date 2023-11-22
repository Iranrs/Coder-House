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




                                                  TABELA CONSULTA LOG
Tabela criada derivada de um trigger after.

| NOME DAS COLUNA  | TIPO DOS DADOS | CHAVE |             INDEXES                         | TABELA REFERENCIADA       | DESCRIÇÃO | 
| -------------  | -------------    | -------------   | -------------                     | -------------             | ------------- |
|  CONSULTA_ID   | INT              | PRIMARY KEY     |   índice clusterizado (B-TREE)    | -                         | ID da consulta
|  DATA_REGISTRO | DATETIME         | -               |              -                    | -                         | ID do pet  |
|  USUARIO       | VARCHAR(100)     | -               |              -                    | -                         | ID do veterinario |

