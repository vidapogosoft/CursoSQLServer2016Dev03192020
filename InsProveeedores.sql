use cuponera
go

---Ins = Inserciones
---Upd = actualizaciones
---Tran = transacciones/procesos

--SP_ (No usa estas siglas al inicio de los programas)

--create procedure InsProveeedores
alter procedure InsProveeedores
----Parametros de Entrada
@IdEmpresa int,
@Identificacion varchar(15),
@RazonSocial varchar(100),
@Usuario varchar(25)
as
begin

	declare @IdProveedor int = 0, @ErrorMensaje varchar(max), @ErrorEstado int, @ErrorSeverity int

	begin try
			
	if not exists ( select 1 from Proveedores where Identificacion = @Identificacion)
	begin

		insert into Proveedores(Identificacion, RazonSocial, FechaIngreso, HoraIngreso, UsuarioIngreso)
		values (@Identificacion, @RazonSocial, GETDATE(), GETDATE(), @Usuario)
		
		select @IdProveedor = @@identity 
		
		if (@IdProveedor > 0)
		begin
			
			insert into EmpresaProveedor(IdEmpresa, IdProveedor, FechaIngreso, HoraIngreso, UsuarioIngreso)
			values (@IdEmpresa, @IdProveedor, GETDATE(), GETDATE(), @Usuario)

		end

	end
	else
	begin
		
		----actualizacion de datos

		update a
		set a.RazonSocial = @RazonSocial,
		a.FechaModificacion = GETDATE(),
		a.UsuarioModificacion = @Usuario
		from Proveedores a
		where a.Identificacion = @Identificacion
		

	end

	end try
	begin catch

		select @ErrorMensaje = ERROR_MESSAGE(), @ErrorEstado = ERROR_STATE(), @ErrorSeverity = ERROR_SEVERITY()

		RAISERROR(@ErrorMensaje, @ErrorSeverity, @ErrorEstado) --- texto del mensaje, severidad, estado

	end catch

end