-- Função que mostra a última consulta realizada pelo pet
delimiter $$
CREATE FUNCTION `fn_Ultima_Consulta_Pet`(Nome_Pet varchar(50), Nome_Dono varchar(100)) RETURNS date
    NO SQL
BEGIN
	declare data_consulta date;
	set data_consulta = 
	(
	SELECT MAX(consulta_data) as Data_Última_Consulta
	FROM consulta CON
	JOIN pet PT ON PT.ID_PET = CON.ID_PET
	JOIN dono_pet DP ON DP.ID_DONO = PT.ID_DONO
	WHERE PT.PET_NOME = Nome_Pet AND DP.DONO_NOME = Nome_Dono
	ORDER BY MAX(consulta_data)
	);
RETURN data_consulta ;
END
$$


-- Função que mostra os Pets que o dono tem cadastrado
DELIMITER //
CREATE FUNCTION `fn_Pets_Do_Dono` (nome_dono VARCHAR(45), cpf_dono VARCHAR(12))
RETURNS VARCHAR(200)
DETERMINISTIC
BEGIN
    DECLARE resultado VARCHAR(200);
    
    SELECT GROUP_CONCAT(PET_NOME) INTO resultado
    FROM DONO_PET dp
	INNER JOIN PET p ON dp.ID_DONO = p.ID_DONO
    WHERE dp.DONO_NOME = nome_dono AND dp.DONO_CPF = cpf_dono;
    
    IF resultado IS NULL THEN
        SET resultado = 'Nenhum pet encontrado para este dono.';
    END IF;
    
    RETURN resultado;
END //
DELIMITER ;


/* Selects para testes da função
SELECT fn_Ultima_Consulta_Pet ('Buddy', 'João');
SELECT fn_Pets_Do_Dono ('João', '12345678901');
*/
