use cuponera
go

create trigger TrgInsProveedor
on Proveedores
for update
as
begin
	
	declare @IdProveedor int ,  @RazonSocial varchar(100)

	Select  @IdProveedor = IdProveedor, @RazonSocial = RazonSocial from inserted
 
	insert into LogProveedores(IdProveedor, RazonSocial, FechaLog)
	values (@IdProveedor, @RazonSocial, GETDATE())

end
