
---Merge
---PIVOT
---CTE common table expressions

----IF EXISTS (SELECT 1) FALSE INSERT TRUE UPDATE

/*
WITH <TABLE_EXPRESION_ORIGEN1>
MERGE <TABLE_EXPRESION_ORIGEN2>
	WHEN MATCH   TEHN UPDATE
	INSERT
	DELETE

*/

use cuponera
go

--CREATE TABLE Productos
--(
--	ProductId int primary key,
--	ProductName varchar(100),
--	Price MONEY
--)
--GO


--CREATE TABLE ProductosExternos
--(
--	ProductId int primary key,
--	ProductName varchar(100),
--	Price MONEY
--)

--INSERT into Productos(ProductId, ProductName, Price)
--values (1, 'TV', 1500),
--(2, 'TV', 1500),
--(3, 'TV 4k', 2500),
--(4, 'PLAY STATION 5', 500)


--INSERT into ProductosExternos(ProductId, ProductName, Price)
--values (1, 'TV', 1500),
--(2, 'TV', 1500),
--(3, 'TV 4k', 2500),
--(5, 'LAPTOP DELL I7', 900)

SELECT * FROM Productos
SELECT * FROM ProductosExternos


----APLICANDO MERGE

MERGE Productos AS target
using ProductosExternos AS source
ON (target.ProductId = source.ProductId)
when matched and target.ProductName <> source.ProductName or target.Price <> source.Price
then update set target.ProductName = source.ProductName, target.Price = source.Price
when not matched by target
then insert (ProductId, ProductName, Price) values (source.ProductId, source.ProductName, source.Price)
when not matched by source
then DELETE
OUTPUT $ACTION,
deleted.ProductID as TargetProductId,
deleted.Productname as TargetProductName,
deleted.Price as TargetPrice,
inserted.ProductID as SourceProductId,
inserted.Productname as SourceProductName,
inserted.Price as SourcePrice;



SELECT * FROM Productos
SELECT * FROM ProductosExternos

