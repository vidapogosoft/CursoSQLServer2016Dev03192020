--'{
--    "info":{  
--      "type":1,
--      "address":{  
--        "town":"Bristol",
--        "county":"Avon",
--        "country":"England"
--      },
--      "tags":["Sport", "Water polo"]
--   },
--   "type":"Basic"
--}'


--'<Orders>
--      <Order OrderID="13000" CustomerID="ALFKI" OrderDate="2006-09-20Z" EmployeeID="2">
--         <OrderDetails ProductID="76" Price="123" Qty = "10"/>
--         <OrderDetails ProductID="16" Price="3.23" Qty = "20"/>
--      </Order>
--      <Order OrderID="13001" CustomerID="VINET" OrderDate="2006-09-20Z" EmployeeID="1">
--         <OrderDetails ProductID="12" Price="12.23" Qty = "1"/>
--      </Order>
--    </Orders>'


--Lecturas de XML


declare @x XML

select @x = '<Orders>
      <Order OrderID="13000" CustomerID="ALFKI" OrderDate="2006-09-20Z" EmployeeID="2">
         <OrderDetails ProductID="76" Price="123" Qty = "10"/>
         <OrderDetails ProductID="16" Price="3.23" Qty = "20"/>
      </Order>
      <Order OrderID="13001" CustomerID="VINET" OrderDate="2006-09-20Z" EmployeeID="1">
         <OrderDetails ProductID="12" Price="12.23" Qty = "1"/>
		 <OrderDetails ProductID="16" Price="10" Qty = "2"/>
      </Order>
    </Orders>'

---select @x


----Cabeceras
select
---T.Item.value('@OrderID', 'int') as OrderId
OrderId = T.Item.value('@OrderID', 'int'),
CustomerId = T.Item.value('@CustomerID','varchar(10)'),
EmployeeID = T.Item.value('@EmployeeID','int')
from @x.nodes('Orders/Order') as T (Item)

---Detalles

select
OrderId = T.Item.value('../@OrderID', 'int'),
ProductID = T.Item.value('@ProductID','int')
from @x.nodes('Orders/Order/OrderDetails') as T (Item)


---Convertir a XML

select BusinessEntityID, FirstName, LastName from AdventureWorks2014.Person.Person for XML auto

select BusinessEntityID, FirstName, LastName from AdventureWorks2014.Person.Person as Datos 
for XML auto, root('Personas'), Elements

with xmlnamespaces(default 'http://www.w3.org/2005/Atom')
select BusinessEntityID, FirstName, LastName from AdventureWorks2014.Person.Person as Datos 
for XML auto, root('Personas'), Elements

