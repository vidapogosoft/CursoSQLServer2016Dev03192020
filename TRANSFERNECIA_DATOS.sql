

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
