USE [master]
GO
/****** Object:  Database [QuanLyKho]    Script Date: 10/21/2023 15:53:45 ******/
CREATE DATABASE [QuanLyKho] ON  PRIMARY 
( NAME = N'QuanLyKho', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\QuanLyKho.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QuanLyKho_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\QuanLyKho_log.LDF' , SIZE = 768KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QuanLyKho] SET COMPATIBILITY_LEVEL = 100
GO
USE [QuanLyKho]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 10/21/2023 15:53:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](1000) NULL,
	[addrs] [nvarchar](1000) NULL,
	[phoneNo] [nvarchar](15) NULL,
	[email] [nvarchar](500) NULL,
	[moreInfo] [nvarchar](1000) NULL,
	[contractDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MeasuringUnit]    Script Date: 10/21/2023 15:53:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MeasuringUnit](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[unit] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Import]    Script Date: 10/21/2023 15:53:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Import](
	[id] [nvarchar](128) NOT NULL,
	[importDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Export]    Script Date: 10/21/2023 15:53:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Export](
	[id] [nvarchar](128) NOT NULL,
	[exportDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 10/21/2023 15:53:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](1000) NULL,
	[addrs] [nvarchar](1000) NULL,
	[phoneNo] [nvarchar](15) NULL,
	[email] [nvarchar](500) NULL,
	[moreInfo] [nvarchar](1000) NULL,
	[contractDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountRole]    Script Date: 10/21/2023 15:53:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountRole](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[roleDescription] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 10/21/2023 15:53:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userName] [nvarchar](1000) NULL,
	[displayName] [nvarchar](500) NULL,
	[password] [nvarchar](max) NULL,
	[roleId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material]    Script Date: 10/21/2023 15:53:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[id] [nvarchar](128) NOT NULL,
	[name] [nvarchar](1000) NULL,
	[unitId] [int] NOT NULL,
	[supplierId] [int] NOT NULL,
	[qrCode] [nvarchar](max) NULL,
	[barcode] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImportInfo]    Script Date: 10/21/2023 15:53:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImportInfo](
	[id] [nvarchar](128) NOT NULL,
	[materialId] [nvarchar](128) NOT NULL,
	[importId] [nvarchar](128) NOT NULL,
	[count] [int] NULL,
	[imPrice] [float] NULL,
	[exPrice] [float] NULL,
	[status] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExportInfo]    Script Date: 10/21/2023 15:53:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExportInfo](
	[id] [nvarchar](128) NOT NULL,
	[materialId] [nvarchar](128) NOT NULL,
	[importInfoId] [nvarchar](128) NOT NULL,
	[customerId] [int] NOT NULL,
	[count] [int] NULL,
	[status] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Default [DF__ImportInf__imPri__1ED998B2]    Script Date: 10/21/2023 15:53:48 ******/
ALTER TABLE [dbo].[ImportInfo] ADD  DEFAULT ((0)) FOR [imPrice]
GO
/****** Object:  Default [DF__ImportInf__exPri__1FCDBCEB]    Script Date: 10/21/2023 15:53:48 ******/
ALTER TABLE [dbo].[ImportInfo] ADD  DEFAULT ((0)) FOR [exPrice]
GO
/****** Object:  ForeignKey [FK__Account__roleId__164452B1]    Script Date: 10/21/2023 15:53:48 ******/
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([roleId])
REFERENCES [dbo].[AccountRole] ([id])
GO
/****** Object:  ForeignKey [FK__Material__barcod__0CBAE877]    Script Date: 10/21/2023 15:53:48 ******/
ALTER TABLE [dbo].[Material]  WITH CHECK ADD FOREIGN KEY([unitId])
REFERENCES [dbo].[MeasuringUnit] ([id])
GO
/****** Object:  ForeignKey [FK__Material__suppli__0DAF0CB0]    Script Date: 10/21/2023 15:53:48 ******/
ALTER TABLE [dbo].[Material]  WITH CHECK ADD FOREIGN KEY([supplierId])
REFERENCES [dbo].[Supplier] ([id])
GO
/****** Object:  ForeignKey [FK__ImportInf__impor__21B6055D]    Script Date: 10/21/2023 15:53:48 ******/
ALTER TABLE [dbo].[ImportInfo]  WITH CHECK ADD FOREIGN KEY([importId])
REFERENCES [dbo].[Import] ([id])
GO
/****** Object:  ForeignKey [FK__ImportInf__statu__20C1E124]    Script Date: 10/21/2023 15:53:48 ******/
ALTER TABLE [dbo].[ImportInfo]  WITH CHECK ADD FOREIGN KEY([materialId])
REFERENCES [dbo].[Material] ([id])
GO
/****** Object:  ForeignKey [FK__ExportInf__custo__2C3393D0]    Script Date: 10/21/2023 15:53:48 ******/
ALTER TABLE [dbo].[ExportInfo]  WITH CHECK ADD FOREIGN KEY([customerId])
REFERENCES [dbo].[Customer] ([id])
GO
/****** Object:  ForeignKey [FK__ExportInf__impor__2B3F6F97]    Script Date: 10/21/2023 15:53:48 ******/
ALTER TABLE [dbo].[ExportInfo]  WITH CHECK ADD FOREIGN KEY([importInfoId])
REFERENCES [dbo].[ImportInfo] ([id])
GO
/****** Object:  ForeignKey [FK__ExportInf__statu__2A4B4B5E]    Script Date: 10/21/2023 15:53:48 ******/
ALTER TABLE [dbo].[ExportInfo]  WITH CHECK ADD FOREIGN KEY([materialId])
REFERENCES [dbo].[Material] ([id])
GO
