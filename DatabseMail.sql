
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
@profile_name = 'NotificationsVPR',
@description = 'Profile Email using GMAIL VPR'
go

----Agregar rol de DBMAil al profile

execute msdb.dbo.sysmail_add_principalprofile_sp
@profile_name= 'NotificationsVPR',
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
@profile_name = 'NotificationsVPR',
@account_name = 'Gmail',
@sequence_number = 1


-----------------------

exec msdb.dbo.sp_send_dbmail
@profile_name = 'NotificationsVPR',
@recipients = 'vidapogosoft@gmail.com',
@body = 'Ejemplo de database email con transact sql',
@subject = 'Automatic Email - SIPECOM AGOSTO 2020'



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

SELECT top 1000 * FROM AdventureWorks2014.Production.WorkOrder

EXEC msdb.dbo.sp_send_dbmail
     @profile_name = 'Notifications',
     @recipients = 'vidapogosoft@gmail.com',
     @query = 'SELECT top 1000 * FROM
AdventureWorks2014.Production.WorkOrder' ,
     @subject = 'Work Order Count',
     @attach_query_result_as_file = 1 ;

-------------------------------------------------------------------------

select top 10 *
FROM AdventureWorks2014.Production.WorkOrder as wo
               JOIN AdventureWorks2014.Production.Product AS p
               ON wo.ProductID = p.ProductID
               ORDER BY DueDate ASC,
                        (p.ListPrice - p.StandardCost) * wo.OrderQty DESC
FOR XML PATH('tr'), TYPE

DECLARE @tableHTML  NVARCHAR(MAX) ;

SET @tableHTML =
     N'<H1>Work Order Report</H1>' +
     N'<table border="1">' +
     N'<tr><th>Work Order ID</th><th>Product ID</th>' +
     N'<th>Name</th><th>Order Qty</th><th>Due Date</th>' +
     N'<th>Expected Revenue</th></tr>' +
     CAST ( ( SELECT top 5000 td = wo.WorkOrderID,       '',
                     td = p.ProductID, '',
                     td = p.Name, '',
                     td = wo.OrderQty, '',
                     td = wo.DueDate, '',
                     td = (p.ListPrice - p.StandardCost) * wo.OrderQty
               FROM AdventureWorks2014.Production.WorkOrder as wo
               JOIN AdventureWorks2014.Production.Product AS p
               ON wo.ProductID = p.ProductID
               ORDER BY DueDate ASC,
                        (p.ListPrice - p.StandardCost) * wo.OrderQty DESC
               FOR XML PATH('tr'), TYPE
     ) AS NVARCHAR(MAX) ) +
     N'</table>' ;


EXEC msdb.dbo.sp_send_dbmail
     @profile_name = 'Notifications',
     @recipients = 'vidapogosoft@gmail.com',
     @subject = 'Work Order Count 5000',
	 @body = @tableHTML,
	 @body_format = 'HTML'

------------------adjunto un csv

exec msdb.dbo.sp_send_dbmail
@profile_name = 'Notifications',
@Recipients= 'vidapogosoft@gmail.com',
@Subject= 'ejemplo csv',
@Body= 'ejemplo csv',
@query = 'SELECT top 1000 * FROM AdventureWorks2014.Production.WorkOrder',
@attach_query_result_as_file = 1,
@query_attachment_filename = 'sample.csv',
@query_result_separator = ',',
@query_result_header = 1,
@query_result_no_padding = 1,
@exclude_query_output = 1