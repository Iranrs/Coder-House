CREATE OR ALTER PROCEDURE SP_ETL_VENDAS_WALLET_DASH 
AS
/*
   QUEM         QUANDO       O QUE FOI FEITO
   =========    =========    ==================
   IRS          22-NOV-23    Adicionado o inserir na tabela wallet.xc_vendas_wallet_bi para alimentação do dashboard

   EXEMPLOS DE EXECUÇÃO:
   -----------------------
   EXEC SP_ETL_VENDAS_WALLET_DASH

   TABELAS:
   -----------------------
   SELECT * FROM wallet.xc_vendas_wallet_bi

   VARIAVEIS:
   -----------------------------
   @DATA_DELETE = ROTINA DE EXPURGO PARA MANTER OS ÚLTIMOS 60 DIAS
*/

DECLARE @DATA_DELETE DATETIME = GETDATE() - 60
SET @DATA_DELETE = FORMAT(@DATA_DELETE, 'yyyy-MM-dd 00:00:00')

DECLARE @GETDATE DATETIME = GETDATE()
SET @GETDATE = FORMAT(DATEADD(HOUR, -3, @GETDATE), 'yyyy-MM-dd hh:mm:ss tt')


SET NOCOUNT ON

BEGIN
   INSERT INTO wallet.xc_vendas_wallet_bi (DATA_HORA, Paymentid, carteira_digital, valor, status, IntegrationTypePix, paymentmethods, cnpj, marca, automacao, datahora_refresh)
   SELECT DATA_HORA, Paymentid, carteira_digital, valor, status, IntegrationTypePix, paymentmethods, cnpj, marca, automacao, @GETDATE
   FROM wallet.xc_vendas_wallet WITH (NOLOCK)
   WHERE report = 'D'

   DELETE FROM wallet.xc_vendas_wallet_bi WHERE DATA_HORA < @DATA_DELETE

   RETURN
END

RETURN

-------------------------------------------------------------------------------------- FIM DA PROCEDURE --------------------------------------------------------------------------------------