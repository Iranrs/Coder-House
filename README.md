# Coder-House
Banco de dados

                                                     TABELA CONSULTA 

| NOME DAS COLUNA  | TIPO DOS DADOS | CHAVE | INDEXES | TABELA REFERENCIADA | DESCRIÇÃO | 
| ------------- | ------------- | ------------- | ------------- | ------------- | ------------- |
|  ID_CONSULTA | INT | PRIMARY KEY | índice clusterizado | - | ID da consulta
|  ID_PET | INT  |  FOREIGN KEY | - | PET | ID do pet  |
|  ID_VETERINARIO | INT  |  FOREIGN KEY | - | VETERINARIO | ID do veterinario |
|  ID_EXAME | INT  |  FOREIGN KEY | - | EXAME | ID do exame |
|  CONSULTA_DATA | DATE  |  - | - | - | DATE DA CONSULTA |
|  CONSULTA_HORA | TIME  |  - | -  | - | HORÁRIO DA CONSULTA  |
