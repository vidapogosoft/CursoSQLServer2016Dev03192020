USE [cuponera]
GO

/****** Object:  Index [UN_Identificaion]    Script Date: 24/03/2020 21:19:25 ******/
ALTER TABLE [dbo].[Proveedores] DROP CONSTRAINT [UN_Identificaion]
GO

SET ANSI_PADDING ON
GO

/****** Object:  Index [UN_Identificaion]    Script Date: 24/03/2020 21:19:25 ******/
ALTER TABLE [dbo].[Proveedores] ADD  CONSTRAINT [UN_Identificaion] UNIQUE NONCLUSTERED 
(
	[Identificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


