

Select f.IdFactura, f.NumeroFactura, fd.IdFactura from Bd_Gtisys..Factura f
left join Bd_Gtisys..FacturaDetalle fd on fd.IdFactura = f.IdFactura

select * from Bd_Gtisys..Factura where IdFactura = 2312
select * from Bd_Gtisys..FacturaDetalle where IdFactura = 2312

---Cross Join

--X	Y

--1	A
--2   B
--3   C

--1	A
--1	B
--1	C

--2	A
--2	B
--2	C

--3	A
--3	B
--3	C

select top 10
ProductID, SalesPersonID
from AdventureWorks2014.Production.Product
cross join AdventureWorks2014.Sales.Store 

select * from AdventureWorks2014.Sales.Store 


----While

declare @site_value int 

select @site_value = 0

Print getdate()

while @site_value <=  10
begin

	Print 'DENTRO DEL WHILE'

	SELECT @site_value = @site_value + 1

	IF (@site_value = 9)
	BEGIN
		--waitfor delay '00:00:03'
		waitfor time '20:42'
		Print getdate()
	END

end

Print 'FIN DEL WHILE'

