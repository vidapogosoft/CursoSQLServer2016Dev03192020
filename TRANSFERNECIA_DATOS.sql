

----Importciones de datos mismo servidor

INSERT INTO cuponera.[dbo].[Proveedores]
           ([Identificacion]
           ,[RazonSocial]
           ,[FechaIngreso]
           ,[HoraIngreso]
           ,[FechaModificacion]
           ,[UsuarioIngreso]
           ,[UsuarioModificacion])
select  
RUC, NOMBRE, CONVERT(DATE,FECHA_ING), CONVERT(time,FECHA_ING), NULL, USUARIO_ING, USUARIO_ING
from Bd_Gtisys..INV_PROVEEDOR 
WHERE ESTADO = 1
and not exists (select 1 from cuponera.[dbo].[Proveedores]
				where Identificacion = RUC   collate  Modern_Spanish_BIN )


select *
FROM [(LOCAL)].[Bd_Gtisys].[dbo].[Persona]

select * from cuponera..proveedores

select Identificacion, count(*) Repetidas from cuponera..proveedores
group by Identificacion
having count(*) > 1


select * from cuponera..proveedores where Identificacion = '1790010937001'

select max(IdProveedor) from cuponera..proveedores where Identificacion = '1790010937001'


select IdProveedor, proveedores.Identificacion, RazonSocial 
from cuponera..proveedores
join 
(
	select Identificacion, count(*) Repetidas from cuponera..proveedores
	group by Identificacion
	having count(*) > 1	
) sq on sq.Identificacion = proveedores.Identificacion


select a.IdProveedor, a.Identificacion, a.RazonSocial 
from cuponera..proveedores a
join 
(
	select Identificacion, count(*) Repetidas from cuponera..proveedores
	group by Identificacion
	having count(*) > 1	
) sq on sq.Identificacion = a.Identificacion

where a.IdProveedor = (
						select max(IdProveedor) from cuponera..proveedores b
						where b.Identificacion = a.Identificacion
						)



select LEN(Identificacion), Identificacion, RazonSocial from cuponera..proveedores
where LEN(Identificacion) < 10



