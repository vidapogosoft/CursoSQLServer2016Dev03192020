use AdventureWorks2014
go

Select
DaysToManufacture, AVG(StandardCost) as AverageCost
from Production.Product
group by DaysToManufacture

Select
	avg(StandardCost)
	from Production.Product

/*
Cost_ByProduction		0			1
AverageCost				5.0885		223.08

etc
*/

Select 'AverageCost' as Cost_By_Production_Days,
[0], [1], [2], [3], [4], [5]
from
(
	Select
	DaysToManufacture, StandardCost
	from Production.Product
) as SourceTable
pivot
(
	avg(StandardCost)
	for DaysToManufacture in ([0], [1], [2], [3], [4], [5])
) as PivotTable


----- COUNT

Select PurchaseOrderID, EmployeeID, VendorID from Purchasing.PurchaseOrderHeader

select VendorID, [250] as EMP1, [251] as EMP2, [256] as EMP3, [257] as EMP4, [260] as EMP5
from
(Select PurchaseOrderID, EmployeeID, VendorID from Purchasing.PurchaseOrderHeader
) p
pivot
(
	count (PurchaseOrderID)
	for EmployeeID in ([250], [251], [256], [257], [260])
) as infoPVT
order by infoPVT.VendorID desc



