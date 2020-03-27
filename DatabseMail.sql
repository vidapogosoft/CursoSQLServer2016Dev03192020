
--Database Mail

--activare database mail
use master
go

sp_configure 'show advanced options', 1
reconfigure
go

sp_configure 'Database Mail XPs', 1
reconfigure
go

---Creamos un perfil de Email

execute  msdb.dbo.sysmail_add_profile_sp
@profile_name = 'Notifications',
@description = 'Profile Email using GMAIL'
go

----Agregar rol de DBMAil al profile

execute msdb.dbo.sysmail_add_principalprofile_sp
@profile_name= 'Notifications',
@principal_name = 'public',
@is_default = 1
go

---
---Create a Database mail Account

execute msdb.dbo.sysmail_add_account_sp
@account_name = 'Gmail',
@description = 'Mail taller SQL Server Sipecom',
@email_address = 'afilarest@gmail.com',
@display_name = 'Taller SQL Server SIPECOM',
@mailserver_name = 'smtp.gmail.com',
@port = 587,
@enable_ssl = 1,
@username = 'afilarest@gmail.com',
@password = 'Afilarest12019'


------Agregar la cuenta al profile

execute msdb.dbo.sysmail_add_profileaccount_sp
@profile_name = 'Notifications',
@account_name = 'Gmail',
@sequence_number = 1


-----------------------

exec msdb.dbo.sp_send_dbmail
@profile_name = 'Notifications',
@recipients = 'vidapogosoft@gmail.com',
@body = 'Ejemplo de database email con transact sql',
@subject = 'Automatic Email - SIPECOM'



--------------------

SELECT * FROM
AdventureWorks2014.Production.WorkOrder

set dateformat mdy
SELECT COUNT(*) FROM
AdventureWorks2014.Production.WorkOrder
                   WHERE DueDate > '2000-04-30'
                   AND  DATEDIFF(dd, '2000-04-30', DueDate) < 2


EXEC msdb.dbo.sp_send_dbmail
     @profile_name = 'Notifications',
     @recipients = 'vidapogosoft@gmail.com',
     @query = 'SELECT COUNT(*) FROM
AdventureWorks2014.Production.WorkOrder' ,
     @subject = 'Work Order Count',
     @attach_query_result_as_file = 1 ;

EXEC msdb.dbo.sp_send_dbmail
     @profile_name = 'Notifications',
     @recipients = 'vidapogosoft@gmail.com',
     @query = 'SELECT top 1000 * FROM
AdventureWorks2014.Production.WorkOrder' ,
     @subject = 'Work Order Count',
     @attach_query_result_as_file = 1 ;
