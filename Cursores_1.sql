---CURSORES
---USO DE MEMORIA RAM
---DATOS EN BUCLES
---CONTROVERSIA DEL RENDIMIENTO

---Pasos en consideracion para trabajar con cursores
--declacrar el cursor, a tarves del declare
--abrir el cursor
--leer los datos del cursor (bucle -- fetch)
--cerrar el cursor
--liberar el cursor (liberamos recursos tomados)

/*
-- Declaración del cursor 
DECLARE[NOMBRE CURSOR]CURSOR[ LOCAL | GLOBAL ] [ FORWARD_ONLY | SCROLL ] FOR [SENTENCIA DE SQL (SELECT)] 
-- Apertura del cursor 
OPEN[NOMBRE CURSOR]  
-- Lectura de la primera fila del cursor 
FETCH[NOMBRE CURSOR]INTO[LISTA DE VARIABLES DECLARADAS] 
WHILE(@@FETCH_STATUS= 0) BEGIN 
-- Lectura de la siguiente fila de un cursor 
FETCH[NOMBRE CURSOR]INTO[LISTA DE VARIABLES DECLARADAS] ... 
-- Fin del bucle WHILE 
END 
-- Cierra el cursor 
CLOSE[NOMBRE CURSOR] 
-- Libera los recursos del cursor 
DEALLOCATE[NOMBRE CURSOR]
*/


use AdventureWorks2014
go

declare @CustomerID int, @AccountNumber varchar(max)

declare cursor_ejemplo cursor fast_forward for

	--- instruccion de toma de datos
	select top 10 CustomerID, AccountNumber from AdventureWorks2014.Sales.Customer
	
	open cursor_ejemplo

		fetch next from cursor_ejemplo
		into @CustomerID, @AccountNumber

		while (@@FETCH_STATUS = 0)
		begin

			----Procesos a transaccionar
			---simple codigo transact (query)
			---llamar a stored procedures

			Print @CustomerID
			Print @AccountNumber

			select convert(varchar,@CustomerID) + '-' + @AccountNumber

			fetch next from cursor_ejemplo
			into @CustomerID, @AccountNumber

		end
	close cursor_ejemplo
deallocate cursor_ejemplo




-----Tabla de Log de cambios de proveedores

use cuponera
go
create table LogProveedores
(
	IdLog int identity(1,1),
	IdProveedor int,
	RazonSocial varchar(max),
	FechaLog datetime
)
