USE CODER_HOUSE

/* ########################################################################### 
Primeira procedure
########################################################################### */

DELIMITER //
CREATE PROCEDURE SP_CLIENTES_3MESES()
/* Essa procedure lista os clientes que não fazem consulta do pet por mais de 3 meses e retorna uma mensagem para o MySQL para realizar uma nova consulta do seu pet */
BEGIN
SELECT 
CONSULTA_DATA AS DATA_CONSULTA, 
PET_NOME AS PET,
DONO_NOME AS TUTOR, 
DONO_ENDERECO AS ENDERECO, 
DONO_EMAIL AS EMAIL, 
DONO_TELEFONE AS TELEFONE
FROM CONSULTA C 
INNER JOIN DONO_PET D
ON C.ID_CONSULTA = D.ID_DONO
INNER JOIN PET P
ON P.ID_PET = D.ID_DONO
WHERE CONSULTA_DATA < (SELECT DATE_SUB(CURRENT_DATE(), INTERVAL 90 DAY))
ORDER BY DATA_CONSULTA ;

SELECT 'AS CONSULTAS RETORNAS ACIMA FAZEM MAIS DE 3 MESES DESDE A SUA ÚLTIMA VEZ, ENVIAR EMAIL OU LIGAR PARA OS TUTORES REMARCA A CONSULTA, SEGUE LISTA:' AS CONSULTA_3MESES;

SELECT 
DONO_EMAIL AS EMAIL, 
DONO_TELEFONE AS TELEFONE
FROM CONSULTA C 
INNER JOIN DONO_PET D
ON C.ID_CONSULTA = D.ID_DONO
WHERE CONSULTA_DATA < (SELECT DATE_SUB(CURRENT_DATE(), INTERVAL 90 DAY));

END;
//
DELIMITER ;

CALL SP_CLIENTES_3MESES;


/* ########################################################################### 
Segunda procedure
########################################################################### */


DELIMITER //
CREATE PROCEDURE SP_CONSULTAS_1DAY()
BEGIN
/* Uma procedure que notifique o usuário que existem cleintes consultas marcadas amanhã e avisa o usuário para notificar os clientes.? */

SELECT 
*
FROM CONSULTA C 
WHERE CONSULTA_DATA = (SELECT DATE_ADD(CURRENT_DATE(), INTERVAL 1 DAY));
SELECT CONCAT(USER(), ' Por favor, notifique o cliente sobre a agenda de consulta amanhã') as CONSULTAS_MARCADAS;

END;
//
DELIMITER ;

CALL SP_CONSULTAS_1DAY()
