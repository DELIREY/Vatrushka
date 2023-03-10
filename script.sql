USE [master]
GO
/****** Object:  Database [VatrushkaDB]    Script Date: 25.12.2022 17:27:29 ******/
CREATE DATABASE [VatrushkaDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VatrushkaDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\VatrushkaDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'VatrushkaDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\VatrushkaDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [VatrushkaDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VatrushkaDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VatrushkaDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VatrushkaDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VatrushkaDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VatrushkaDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VatrushkaDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [VatrushkaDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VatrushkaDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VatrushkaDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VatrushkaDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VatrushkaDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VatrushkaDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VatrushkaDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VatrushkaDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VatrushkaDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VatrushkaDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [VatrushkaDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VatrushkaDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VatrushkaDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VatrushkaDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VatrushkaDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VatrushkaDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VatrushkaDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VatrushkaDB] SET RECOVERY FULL 
GO
ALTER DATABASE [VatrushkaDB] SET  MULTI_USER 
GO
ALTER DATABASE [VatrushkaDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VatrushkaDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VatrushkaDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VatrushkaDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [VatrushkaDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [VatrushkaDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'VatrushkaDB', N'ON'
GO
ALTER DATABASE [VatrushkaDB] SET QUERY_STORE = OFF
GO
USE [VatrushkaDB]
GO
/****** Object:  Table [dbo].[Contracts]    Script Date: 25.12.2022 17:27:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contracts](
	[ContractsID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL,
	[SuppliersID] [int] NOT NULL,
 CONSTRAINT [PK_Contracts] PRIMARY KEY CLUSTERED 
(
	[ContractsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 25.12.2022 17:27:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeesID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](32) NOT NULL,
	[Post] [varchar](32) NOT NULL,
	[Adress] [varchar](max) NOT NULL,
	[Telephone] [varchar](32) NOT NULL,
	[Birth] [date] NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material]    Script Date: 25.12.2022 17:27:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[MaterialID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](32) NOT NULL,
	[Weight] [varchar](32) NOT NULL,
	[Price] [money] NOT NULL,
	[ContractID] [int] NOT NULL,
	[EmployeesID] [int] NOT NULL,
 CONSTRAINT [PK_Material] PRIMARY KEY CLUSTERED 
(
	[MaterialID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 25.12.2022 17:27:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrdersID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Data] [varchar](50) NOT NULL,
	[Kolvo] [varchar](50) NOT NULL,
	[EmployeesID] [int] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrdersID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 25.12.2022 17:27:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](32) NOT NULL,
	[Weight] [varchar](32) NOT NULL,
	[Price] [money] NOT NULL,
	[Date] [date] NOT NULL,
	[OrdersID] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 25.12.2022 17:27:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(2,1) NOT NULL,
	[Name] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 25.12.2022 17:27:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SuppliersID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](32) NOT NULL,
	[Adress] [varchar](max) NOT NULL,
	[Telephone] [varchar](32) NOT NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[SuppliersID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 25.12.2022 17:27:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UsersID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Telephone] [varchar](50) NOT NULL,
	[Email] [varchar](max) NOT NULL,
	[RoleID] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UsersID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([EmployeesID], [Name], [Post], [Adress], [Telephone], [Birth]) VALUES (1, N'Иванов И.В', N'Заказчик', N'Кирова 7б', N'89056473633', CAST(N'1991-03-29' AS Date))
INSERT [dbo].[Employees] ([EmployeesID], [Name], [Post], [Adress], [Telephone], [Birth]) VALUES (2, N'Гранин В.Ю', N'Уборщик', N'Ленина 15', N'89046574631', CAST(N'1987-10-21' AS Date))
INSERT [dbo].[Employees] ([EmployeesID], [Name], [Post], [Adress], [Telephone], [Birth]) VALUES (3, N'Юдин Ю.Ю', N'Директор', N'Толстого 32', N'89056472921', CAST(N'1999-01-15' AS Date))
INSERT [dbo].[Employees] ([EmployeesID], [Name], [Post], [Adress], [Telephone], [Birth]) VALUES (4, N'Грачева А.Н', N'Зам.директора', N'Красная 11', N'86373563543', CAST(N'1994-10-05' AS Date))
INSERT [dbo].[Employees] ([EmployeesID], [Name], [Post], [Adress], [Telephone], [Birth]) VALUES (5, N'Николаев А.Е', N'Охранник ', N'Лесная 9', N'95646349399', CAST(N'1979-09-23' AS Date))
INSERT [dbo].[Employees] ([EmployeesID], [Name], [Post], [Adress], [Telephone], [Birth]) VALUES (6, N'Юрьев А.К', N'Пекарь', N'Красноармейская 5', N'96479279384', CAST(N'1982-06-19' AS Date))
INSERT [dbo].[Employees] ([EmployeesID], [Name], [Post], [Adress], [Telephone], [Birth]) VALUES (7, N'Соловьёв И.Н', N'Сортировщик', N'Кирова 23', N'97463816463', CAST(N'1987-12-14' AS Date))
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrdersID], [Name], [Data], [Kolvo], [EmployeesID]) VALUES (9, N'Мука пшеничная', N'25.12.2022', N'10', 1)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [Name]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([RoleID], [Name]) VALUES (2, N'Users')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UsersID], [Name], [Telephone], [Email], [RoleID]) VALUES (1, N'Админов А.А', N'89054647474', N'petr.8@mail.ru', 1)
INSERT [dbo].[Users] ([UsersID], [Name], [Telephone], [Email], [RoleID]) VALUES (2, N'Куликов Н.М', N'89056473535', N'Kylic.98@mail.ru', 2)
INSERT [dbo].[Users] ([UsersID], [Name], [Telephone], [Email], [RoleID]) VALUES (3, N'Попугаев И.В', N'89056767676', N'Popug@mail.ru', 2)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Contracts]  WITH CHECK ADD  CONSTRAINT [FK_Contracts_Suppliers] FOREIGN KEY([SuppliersID])
REFERENCES [dbo].[Suppliers] ([SuppliersID])
GO
ALTER TABLE [dbo].[Contracts] CHECK CONSTRAINT [FK_Contracts_Suppliers]
GO
ALTER TABLE [dbo].[Material]  WITH CHECK ADD  CONSTRAINT [FK_Material_Contracts] FOREIGN KEY([ContractID])
REFERENCES [dbo].[Contracts] ([ContractsID])
GO
ALTER TABLE [dbo].[Material] CHECK CONSTRAINT [FK_Material_Contracts]
GO
ALTER TABLE [dbo].[Material]  WITH CHECK ADD  CONSTRAINT [FK_Material_Employees] FOREIGN KEY([EmployeesID])
REFERENCES [dbo].[Employees] ([EmployeesID])
GO
ALTER TABLE [dbo].[Material] CHECK CONSTRAINT [FK_Material_Employees]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Employees] FOREIGN KEY([EmployeesID])
REFERENCES [dbo].[Employees] ([EmployeesID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Employees]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Orders] FOREIGN KEY([OrdersID])
REFERENCES [dbo].[Orders] ([OrdersID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Orders]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Role]
GO
USE [master]
GO
ALTER DATABASE [VatrushkaDB] SET  READ_WRITE 
GO
