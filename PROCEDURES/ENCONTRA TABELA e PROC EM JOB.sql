SELECT 
    [sJOB].[job_id] AS [JobID]
    ,[sJOB].[name] AS [JobName]
    ,step.step_name
    ,step.command
FROM
    [msdb].[dbo].[sysjobs] AS [sJOB]
    LEFT JOIN [msdb].dbo.sysjobsteps step ON sJOB.job_id = step.job_id
WHERE 
  step.command LIKE '%dt_transacao_dia%' -- VER PROC
ORDER BY 
  [JobName]                                                               



select * from  dbo.sysjobs jobs
INNER JOIN dbo.sysjobsteps jobSteps ON jobs.job_id = jobSteps.job_id
WHERE  jobSteps.command LIKE '%dt_transacao_dia%'; -- VER TABELA