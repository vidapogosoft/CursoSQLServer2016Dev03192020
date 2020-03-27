
----WITH COMMON TABLE EXPRESSION  CTE

USE AdventureWorks2014
go

select
SalesPersonID, count(*)
from Sales.SalesOrderHeader
where SalesPersonID is not null
group by SalesPersonID
go


select
	SalesPersonID, sum(TotalDue) as TotalSales, YEAR(OrderDate) as SalesYear
	from Sales.SalesOrderHeader
	where SalesPersonID is not null
	group by SalesPersonID, YEAR(OrderDate)
go

select BusinessEntityID, sum(SalesQuota) as SalesQuota, YEAR(QuotaDate) as SalesQuotaYear
from Sales.SalesPersonQuotaHistory
group by BusinessEntityID, YEAR(QuotaDate)

go
---aplicando CTE

with sales_cte (SalesPersonID, NumberOfOrders)
as
(
	select
	SalesPersonID, count(*)
	from Sales.SalesOrderHeader
	where SalesPersonID is not null
	group by SalesPersonID
)
select AVG(NumberOfOrders) as 'Avergae Sales Per Person'
from sales_cte;

---uno mas un cte

with Sales_CTE (SalesPersonId, TotalSales, SalesYear)
as
(
	select
	SalesPersonID, sum(TotalDue) as TotalSales, YEAR(OrderDate) as SalesYear
	from Sales.SalesOrderHeader
	where SalesPersonID is not null
	group by SalesPersonID, YEAR(OrderDate)
)
,
Sales_Quota_CTE (BusinessEntityID, SalesQuota, SalesQuotaYear)
as
(
	select BusinessEntityID, sum(SalesQuota) as SalesQuota, YEAR(QuotaDate) as SalesQuotaYear
	from Sales.SalesPersonQuotaHistory
	group by BusinessEntityID, YEAR(QuotaDate)
)

select 
SalesPersonId, TotalSales, SalesQuota, (TotalSales - SalesQuota) as Amt_Quota 
from Sales_CTE
join Sales_Quota_CTE on Sales_Quota_CTE.BusinessEntityID =  Sales_CTE.SalesPersonId
			and Sales_Quota_CTE.SalesQuotaYear = Sales_CTE.SalesYear
order by SalesPersonId, SalesYear
