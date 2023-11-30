
DELIMITER //
CREATE PROCEDURE SP_SUBLINGUAGEM_TCL()
BEGIN
IF (SELECT COUNT(*) FROM CONSULTA) > 0 THEN  --  Verificar se a tabela consulta tem registros
	BEGIN
		START TRANSACTION; -- Iniciando previamente uma transação
		DELETE FROM CONSULTA  -- Se tiver registros ela deleta aonde os id_consultas for maior que 502
        WHERE ID_CONSULTA > 502;
		-- ROLLBACK;
        -- COMMIT;
	END;
ELSE -- Senão tem registros, ela insere
	BEGIN
    INSERT INTO CONSULTA 
    VALUES
    (503, 8, 4, 1, '2023-11-06', '20:20'),
    (504, 8, 4, 1, '2023-11-07', '20:30'),
    (505, 8, 4, 1, '2023-11-08', '20:50');
    END;
END IF;
END
//
DELIMITER ;

CALL SP_SUBLINGUAGEM_TCL()

START TRANSACTION; -- Inicia uma transação

CREATE TEMPORARY TABLE CONSULTA2  (ID_CONSULTA, ID_PET, ID_VETERINARIO, ID_EXAME, CONSULTA_DATA, CONSULTA_HORA) 
    ID_CONSULTA INT,
    ID_PET INT,
    ID_VETERINARIO INT,
    ID_EXAME INT,
    CONSULTA_DATA DATE,
    CONSULTA_HORA TIME
);
INSERT INTO CONSULTA2
VALUES
    (503, 101, 201, 301, '2023-11-08', '09:00:00'),
    (504, 102, 202, 302, '2023-11-09', '10:30:00'),
    (505, 103, 203, 303, '2023-11-10', '14:15:00'),
    (506, 104, 204, 304, '2023-11-11', '15:45:00');
    
SAVEPOINT savepoint1; -- Define o primeiro savepoint após a inserção do 4º registro

INSERT INTO CONSULTA2 (ID_CONSULTA, ID_PET, ID_VETERINARIO, ID_EXAME, CONSULTA_DATA, CONSULTA_HORA)
VALUES
    (5, 105, 205, 305, '2023-11-12', '11:30:00'),
    (6, 106, 206, 306, '2023-11-13', '13:20:00'),
    (7, 107, 207, 307, '2023-11-14', '16:00:00'),
    (8, 108, 208, 308, '2023-11-15', '17:30:00');
    
SAVEPOINT savepoint2; -- Define o segundo savepoint após a inserção do 8º registro

SELECT * FROM CONSULTA2; -- antes do rollback
ROLLBACK TO savepoint1;  -- setença de eliminaçÃo do savepoint dos primeiros 4 registros 
SELECT * FROM CONSULTA2; -- depois do rollback

-- Insira oitos registros, iniciando também uma transação 
-- Adicione um savepòint após a inserção do registro #4 e outro savepoint após o registro #8 
-- Adicione em uma linha comentada a setença de eliminaçÃo do savepoint dos primeiros 4 registros 