
use AdventureWorks2014
go

select * from Person.Person   --- todos los registros

select PersonType, Title, FirstName, LastName, EmailPromotion  from Person.Person  ---Selecciono campos

select PersonType as TipoPersona, 
Title Titulo, 
FirstName Nombres, 
LastName Apellido, EmailPromotion as RecibioEmail  from Person.Person  -- seleccionar con alias


select PersonType as TipoPersona, 
case when  Title is null then 'N/A'
	else Title
end Titulo, 
FirstName Nombres, 
LastName Apellido, 
case when EmailPromotion = 0 then 'No Enviado'  
	when EmailPromotion = 1 then 'Enviado'
	when EmailPromotion = 2 then 'Reenvios'
	else 'No Catalogado'
end as RecibioEmail 
from Person.Person  -- seleccionar con case


select PersonType as TipoPersona, 
case when  Title is null then 'N/A'
	else Title
end Titulo, 
FirstName Nombres, 
LastName Apellido, 
case when EmailPromotion = 0 then 'No Enviado'  
	when EmailPromotion = 1 then 'Enviado'
	when EmailPromotion = 2 then 'Reenvios'
	else 'No Catalogado'
end as RecibioEmail 
from Person.Person  -- seleccionar ordenados
order by LastName desc, Titulo asc


select PersonType as TipoPersona, 
case when  Title is null then 'N/A'
	else Title
end Titulo, 
FirstName Nombres, 
LastName Apellido, 
case when EmailPromotion = 0 then 'No Enviado'  
	when EmailPromotion = 1 then 'Enviado'
	when EmailPromotion = 2 then 'Reenvios'
	else 'No Catalogado'
end as RecibioEmail 
from Person.Person  -- seleccionar con filtrado de datos
where PersonType = 'IN'
order by LastName desc, Titulo asc


select PersonType as TipoPersona, 
case when  Title is null then 'N/A'
	else Title
end Titulo, 
FirstName Nombres, 
LastName Apellido, 
case when EmailPromotion = 0 then 'No Enviado'  
	when EmailPromotion = 1 then 'Enviado'
	when EmailPromotion = 2 then 'Reenvios'
	else 'No Catalogado'
end as RecibioEmail 
from Person.Person  -- seleccionar con filtrado de datos
where PersonType in ('IN', 'GC', 'VC')
order by LastName desc, Titulo asc

select PersonType as TipoPersona, 
case when  Title is null then 'N/A'
	else Title
end Titulo, 
FirstName Nombres, 
LastName Apellido, 
case when EmailPromotion = 0 then 'No Enviado'  
	when EmailPromotion = 1 then 'Enviado'
	when EmailPromotion = 2 then 'Reenvios'
	else 'No Catalogado'
end as RecibioEmail 
from Person.Person  -- seleccionar con filtrado de datos
where PersonType not in ('IN', 'GC', 'VC')
order by LastName desc, Titulo asc


select PersonType as TipoPersona, 
case when  Title is null then 'N/A'
	else Title
end Titulo, 
FirstName Nombres, 
LastName Apellido, 
case when EmailPromotion = 0 then 'No Enviado'  
	when EmailPromotion = 1 then 'Enviado'
	when EmailPromotion = 2 then 'Reenvios'
	else 'No Catalogado'
end as RecibioEmail 
from Person.Person  -- seleccionar con filtrado de datos con coincidencia
where LastName like '%za%'
order by LastName desc, Titulo asc

select PersonType as TipoPersona, 
case when  Title is null then 'N/A'
	else Title
end Titulo, 
FirstName Nombres, 
LastName Apellido, 
case when EmailPromotion = 0 then 'No Enviado'  
	when EmailPromotion = 1 then 'Enviado'
	when EmailPromotion = 2 then 'Reenvios'
	else 'No Catalogado'
end as RecibioEmail 
from Person.Person  -- seleccionar con filtrado de datos con coincidencia
where LastName like 'za%'
order by LastName desc, Titulo asc


select PersonType as TipoPersona, 
case when  Title is null then 'N/A'
	else Title
end Titulo, 
FirstName Nombres, 
LastName Apellido, 
case when EmailPromotion = 0 then 'No Enviado'  
	when EmailPromotion = 1 then 'Enviado'
	when EmailPromotion = 2 then 'Reenvios'
	else 'No Catalogado'
end as RecibioEmail 
from Person.Person  -- seleccionar con filtrado de datos con coincidencia
where LastName like '%za'
order by LastName desc, Titulo asc


select PersonType as TipoPersona, 
case when  Title is null then 'N/A'
	else Title
end Titulo, 
FirstName Nombres, 
LastName Apellido, 
case when EmailPromotion = 0 then 'No Enviado'  
	when EmailPromotion = 1 then 'Enviado'
	when EmailPromotion = 2 then 'Reenvios'
	else 'No Catalogado'
end as RecibioEmail 
from Person.Person  -- seleccionar con filtrado de datos con coincidencia
where LastName not like '%a'
order by LastName desc, Titulo asc


------------------------------

select PersonType as TipoPersona, 
case when  Title is null then 'N/A'
	else Title
end Titulo, 

--FirstName Nombres, 
--LastName Apellido, 

isnull(FirstName,'') + ' ' + isnull(MiddleName,'') + ' '  + isnull(LastName,'') Nombres,

case when EmailPromotion = 0 then 'No Enviado'  
	when EmailPromotion = 1 then 'Enviado'
	when EmailPromotion = 2 then 'Reenvios'
	else 'No Catalogado'
end as RecibioEmail 
from Person.Person  -- seleccionar concatenados (artesanal)
order by LastName desc, Titulo asc


select PersonType as TipoPersona, 
case when  Title is null then 'N/A'
	else Title
end Titulo, 

--FirstName Nombres, 
--LastName Apellido, 

--isnull(FirstName,'') + ' ' + isnull(MiddleName,'') + ' '  + isnull(LastName,'') Nombres,

CONCAT(FirstName, space(1) , MiddleName, space(1) , LastName) Nombres,

case when EmailPromotion = 0 then 'No Enviado'  
	when EmailPromotion = 1 then 'Enviado'
	when EmailPromotion = 2 then 'Reenvios'
	else 'No Catalogado'
end as RecibioEmail 
from Person.Person  -- seleccionar concatenados (sentencia)
order by LastName desc, Titulo asc


select PersonType as TipoPersona, 
case when  Title is null then 'N/A'
	else Title
end Titulo, 

--FirstName Nombres, 
--LastName Apellido, 

--isnull(FirstName,'') + ' ' + isnull(MiddleName,'') + ' '  + isnull(LastName,'') Nombres,

CONCAT(FirstName, space(1) , MiddleName, space(1) , LastName) Nombres,

case when EmailPromotion = 0 then 'No Enviado'  
	when EmailPromotion = 1 then 'Enviado'
	when EmailPromotion = 2 then 'Reenvios'
	else 'No Catalogado'
end as RecibioEmail 
from Person.Person  -- seleccionar con operadores
where (PersonType = 'IN' and Title = 'Mr.') or EmailPromotion = 0
order by LastName desc, Titulo asc

-------------------------
select top 5 * from Person.EmailAddress
select top 5 * from Person.Person

-----------------------------

select PersonType as TipoPersona, 
case when  Title is null then 'N/A'
	else Title
end Titulo, 

CONCAT(FirstName, space(1) , MiddleName, space(1) , LastName) Nombres,

case when EmailPromotion = 0 then 'No Enviado'  
	when EmailPromotion = 1 then 'Enviado'
	when EmailPromotion = 2 then 'Reenvios'
	else 'No Catalogado'
end as RecibioEmail, 
b.EmailAddress Email, b.ModifiedDate FechaRegistroEmail
from Person.Person a join Person.EmailAddress b on b.BusinessEntityID = a.BusinessEntityID
order by LastName desc, Titulo asc

---------------------------------

select 
PersonType as TipoPersona, 
case when  Title is null then 'N/A'
	else Title
end Titulo, 

CONCAT(FirstName, space(1) , MiddleName, space(1) , LastName) Nombres,

case when EmailPromotion = 0 then 'No Enviado'  
	when EmailPromotion = 1 then 'Enviado'
	when EmailPromotion = 2 then 'Reenvios'
	else 'No Catalogado'
end as RecibioEmail, 
b.EmailAddress Email, 
YEAR(b.ModifiedDate) AnioRegistroEmail,
Month(b.ModifiedDate) MesRegistroEmail
from Person.Person a join Person.EmailAddress b on b.BusinessEntityID = a.BusinessEntityID
order by LastName desc, Titulo asc

-----------------------------

select 
CONCAT(FirstName, space(1) , MiddleName, space(1) , LastName) Nombres,
count(*) Contador 
from Person.Person  -- seleccionar concatenados (sentencia)
group by FirstName, MiddleName, LastName
having count(*) > 1
order by LastName desc

---------------------------------

select 
CONCAT(FirstName, space(1) , MiddleName, space(1) , LastName) Nombres
from Person.Person  -- seleccionar concatenados (sentencia)
group by FirstName, MiddleName, LastName
order by LastName desc

---------------------------------

select 
distinct
CONCAT(FirstName, space(1) , MiddleName, space(1) , LastName) Nombres
from Person.Person  -- seleccionar concatenados (sentencia)

