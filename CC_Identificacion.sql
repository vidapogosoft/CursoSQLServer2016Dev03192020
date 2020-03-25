USE [cuponera]
GO

ALTER TABLE [dbo].[Proveedores] DROP CONSTRAINT [CC_Identificacion]
GO

ALTER TABLE [dbo].[Proveedores]  WITH CHECK ADD  CONSTRAINT [CC_Identificacion] CHECK  ((len([Identificacion])>=(10)))
GO

ALTER TABLE [dbo].[Proveedores] CHECK CONSTRAINT [CC_Identificacion]
GO


