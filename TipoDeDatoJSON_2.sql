DECLARE @json NVARCHAR(MAX);
SET @json = N'[  
  {"id": 2, "info": {"name": "John", "surname": "Smith"}, "age": 25},
  {"id": 5, "info": {"name": "Jane", "surname": "Smith", "skills": ["SQL", "C#", "Azure"]}, "dob": "2005-11-04T12:00:00"}  
]';

---Funcion para validar JSON
if ISJSON(@json) = 1
begin
	print 'Formato Correcto'
end

---lectura de informacion JSON
select * from
openjson(@json)
with
(
	id int '$.id',
	nombres varchar(50) '$.info.name',
	apellido varchar(50) '$.info.surname'
)
where id = 2


----Crear JSON
select top 8 Personas.BusinessEntityID, FirstName, LastName, Emails.EmailAddress 
from AdventureWorks2014.Person.Person as Personas
join AdventureWorks2014.Person.EmailAddress as Emails
on Emails.BusinessEntityID = Personas.BusinessEntityID
for JSON auto, ROOT ('PersonasInfo')




