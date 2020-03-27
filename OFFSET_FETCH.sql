
---Funciones de paginación
--Limitar el número de filas devueltas
--OFFSET y FETCH

use AdventureWorks2014
go

-----offset especifica tiene que saltarse dentro del resultado que esta buscando
----Fetch especifica cuantos registros desde ese punto en adelante tiene que devolver

declare @number int

select @number = 200

select * from Person.Person
order by BusinessEntityID asc
 offset @number rows
 fetch next 15 rows only

