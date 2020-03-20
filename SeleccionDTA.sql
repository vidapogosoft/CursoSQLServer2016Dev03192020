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