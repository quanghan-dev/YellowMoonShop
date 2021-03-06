USE [master]
GO
/****** Object:  Database [YellowMoonShop]    Script Date: 12/3/2020 9:21:24 PM ******/
CREATE DATABASE [YellowMoonShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'YellowMoonShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\YellowMoonShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'YellowMoonShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\YellowMoonShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [YellowMoonShop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [YellowMoonShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [YellowMoonShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [YellowMoonShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [YellowMoonShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [YellowMoonShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [YellowMoonShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [YellowMoonShop] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [YellowMoonShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [YellowMoonShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [YellowMoonShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [YellowMoonShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [YellowMoonShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [YellowMoonShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [YellowMoonShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [YellowMoonShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [YellowMoonShop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [YellowMoonShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [YellowMoonShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [YellowMoonShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [YellowMoonShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [YellowMoonShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [YellowMoonShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [YellowMoonShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [YellowMoonShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [YellowMoonShop] SET  MULTI_USER 
GO
ALTER DATABASE [YellowMoonShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [YellowMoonShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [YellowMoonShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [YellowMoonShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [YellowMoonShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [YellowMoonShop] SET QUERY_STORE = OFF
GO
USE [YellowMoonShop]
GO
/****** Object:  Table [dbo].[tblCake]    Script Date: 12/3/2020 9:21:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCake](
	[cakeID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[picture] [varchar](500) NULL,
	[description] [varchar](max) NOT NULL,
	[price] [float] NOT NULL,
	[quantity] [int] NOT NULL,
	[createDate] [datetime] NOT NULL,
	[expirationDate] [datetime] NOT NULL,
	[categoryID] [int] NOT NULL,
	[lastUpdatedDate] [datetime] NOT NULL,
	[userEmail] [varchar](200) NOT NULL,
	[status] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cakeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 12/3/2020 9:21:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[categoryID] [int] IDENTITY(1,1) NOT NULL,
	[categoryName] [nvarchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderDetail]    Script Date: 12/3/2020 9:21:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[detailID] [int] IDENTITY(1,1) NOT NULL,
	[orderID] [int] NOT NULL,
	[cakeID] [int] NOT NULL,
	[price] [float] NOT NULL,
	[quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[detailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrdering]    Script Date: 12/3/2020 9:21:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrdering](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[userEmail] [varchar](200) NULL,
	[orderDate] [datetime] NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[phoneNum] [varchar](20) NOT NULL,
	[shippingAddress] [nvarchar](max) NOT NULL,
	[total] [float] NOT NULL,
	[orderStatus] [varchar](10) NOT NULL,
	[paymentMethod] [varchar](100) NOT NULL,
	[paymentStatus] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 12/3/2020 9:21:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[userEmail] [varchar](200) NOT NULL,
	[password] [varchar](100) NOT NULL,
	[role] [varchar](100) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[phoneNum] [varchar](20) NOT NULL,
	[status] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[userEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblCake] ON 

INSERT [dbo].[tblCake] ([cakeID], [name], [picture], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [lastUpdatedDate], [userEmail], [status]) VALUES (1, N'Traditional Mooncake', N'traditional.jpg', N'no description', 149000, 10, CAST(N'2020-10-10T21:07:08.407' AS DateTime), CAST(N'2020-10-14T00:00:00.000' AS DateTime), 1, CAST(N'2020-10-10T21:07:08.407' AS DateTime), N'admin@admin.admin', N'Active')
INSERT [dbo].[tblCake] ([cakeID], [name], [picture], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [lastUpdatedDate], [userEmail], [status]) VALUES (3, N'St. Regis Yan Ting', N'StRegis.jpg', N'no description', 2490000, 10, CAST(N'2020-10-11T00:00:00.000' AS DateTime), CAST(N'2020-10-14T00:00:00.000' AS DateTime), 2, CAST(N'2020-10-11T00:00:00.000' AS DateTime), N'admin@admin.admin', N'Active')
INSERT [dbo].[tblCake] ([cakeID], [name], [picture], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [lastUpdatedDate], [userEmail], [status]) VALUES (4, N'Good Wood Park', N'GoodwoodPark.jpg', N'no description', 2090000, 10, CAST(N'2020-10-11T00:00:00.000' AS DateTime), CAST(N'2020-10-15T00:00:00.000' AS DateTime), 2, CAST(N'2020-10-11T00:00:00.000' AS DateTime), N'admin@admin.admin', N'Active')
INSERT [dbo].[tblCake] ([cakeID], [name], [picture], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [lastUpdatedDate], [userEmail], [status]) VALUES (5, N'Bunny Mooncake Biscuit', N'BunnyMooncakeBiscuit.jpg', N'no description', 199000, 10, CAST(N'2020-10-11T00:00:00.000' AS DateTime), CAST(N'2020-10-17T00:00:00.000' AS DateTime), 1, CAST(N'2020-10-11T00:00:00.000' AS DateTime), N'admin@admin.admin', N'Active')
INSERT [dbo].[tblCake] ([cakeID], [name], [picture], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [lastUpdatedDate], [userEmail], [status]) VALUES (7, N'Chocolate Peanut Butter', N'ChocolatePeanutButterMooncake.jpg', N'no description', 149000, 10, CAST(N'2020-10-11T00:00:00.000' AS DateTime), CAST(N'2020-10-17T00:00:00.000' AS DateTime), 1, CAST(N'2020-10-11T00:00:00.000' AS DateTime), N'admin@admin.admin', N'Active')
INSERT [dbo].[tblCake] ([cakeID], [name], [picture], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [lastUpdatedDate], [userEmail], [status]) VALUES (8, N'Crowne Plaza', N'CrownePlaza.jpg', N'no description', 5190000, 10, CAST(N'2020-10-11T00:00:00.000' AS DateTime), CAST(N'2020-10-20T00:00:00.000' AS DateTime), 2, CAST(N'2020-10-11T00:00:00.000' AS DateTime), N'admin@admin.admin', N'Active')
INSERT [dbo].[tblCake] ([cakeID], [name], [picture], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [lastUpdatedDate], [userEmail], [status]) VALUES (10, N'Oreo Brownie Chocolate', N'OreoBrownieSocola.jpg', N'no description', 209000, 10, CAST(N'2020-10-11T00:00:00.000' AS DateTime), CAST(N'2020-10-20T00:00:00.000' AS DateTime), 3, CAST(N'2020-10-11T00:00:00.000' AS DateTime), N'admin@admin.admin', N'Active')
INSERT [dbo].[tblCake] ([cakeID], [name], [picture], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [lastUpdatedDate], [userEmail], [status]) VALUES (11, N'Crystal Jade', N'CrystalJade.jpg', N'no description', 2190000, 10, CAST(N'2020-10-11T00:00:00.000' AS DateTime), CAST(N'2020-10-20T00:00:00.000' AS DateTime), 2, CAST(N'2020-10-11T00:00:00.000' AS DateTime), N'admin@admin.admin', N'Active')
INSERT [dbo].[tblCake] ([cakeID], [name], [picture], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [lastUpdatedDate], [userEmail], [status]) VALUES (13, N'Dried Shrimp', N'DriedShrimpMooncakeBiscuit.jpg', N'no description', 99000, 10, CAST(N'2020-10-11T00:00:00.000' AS DateTime), CAST(N'2020-10-20T00:00:00.000' AS DateTime), 1, CAST(N'2020-10-11T00:00:00.000' AS DateTime), N'admin@admin.admin', N'Active')
INSERT [dbo].[tblCake] ([cakeID], [name], [picture], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [lastUpdatedDate], [userEmail], [status]) VALUES (14, N'Fairmont Singapore', N'FairmontSingapore.jpg', N'no description', 4090000, 10, CAST(N'2020-10-11T10:08:28.020' AS DateTime), CAST(N'2020-10-20T00:00:00.000' AS DateTime), 2, CAST(N'2020-10-11T10:08:28.020' AS DateTime), N'admin@admin.admin', N'Active')
INSERT [dbo].[tblCake] ([cakeID], [name], [picture], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [lastUpdatedDate], [userEmail], [status]) VALUES (15, N'Flaky Pandan', N'FlakyPandanMooncakeBiscuit.jpg', N'no description', 129000, 10, CAST(N'2020-10-11T10:09:00.750' AS DateTime), CAST(N'2020-10-15T00:00:00.000' AS DateTime), 1, CAST(N'2020-10-11T10:09:00.750' AS DateTime), N'admin@admin.admin', N'Active')
INSERT [dbo].[tblCake] ([cakeID], [name], [picture], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [lastUpdatedDate], [userEmail], [status]) VALUES (16, N'Ginger Mooncake', N'GingerMooncakeBiscuit.jpg', N'no description', 89000, 10, CAST(N'2020-10-11T10:10:14.660' AS DateTime), CAST(N'2020-10-16T00:00:00.000' AS DateTime), 1, CAST(N'2020-10-11T10:10:14.660' AS DateTime), N'admin@admin.admin', N'Active')
INSERT [dbo].[tblCake] ([cakeID], [name], [picture], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [lastUpdatedDate], [userEmail], [status]) VALUES (17, N'Oreo Cappucino', N'OreoCappucino.jpg', N'no description', 209000, 10, CAST(N'2020-10-11T10:11:10.557' AS DateTime), CAST(N'2020-10-20T00:00:00.000' AS DateTime), 3, CAST(N'2020-10-11T10:11:10.557' AS DateTime), N'admin@admin.admin', N'Active')
INSERT [dbo].[tblCake] ([cakeID], [name], [picture], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [lastUpdatedDate], [userEmail], [status]) VALUES (18, N'Oreo Strawberry Jam', N'OreoMutDauTay.jpg', N'no description', 209000, 10, CAST(N'2020-10-11T10:12:38.987' AS DateTime), CAST(N'2020-10-20T00:00:00.000' AS DateTime), 3, CAST(N'2020-10-11T10:12:38.987' AS DateTime), N'admin@admin.admin', N'Active')
INSERT [dbo].[tblCake] ([cakeID], [name], [picture], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [lastUpdatedDate], [userEmail], [status]) VALUES (19, N'GreenTea Mooncake', N'GreenTeaMooncakeBiscuit.jpg', N'no description', 169000, 10, CAST(N'2020-10-11T10:13:25.353' AS DateTime), CAST(N'2020-10-20T00:00:00.000' AS DateTime), 1, CAST(N'2020-10-11T10:13:25.353' AS DateTime), N'admin@admin.admin', N'Active')
INSERT [dbo].[tblCake] ([cakeID], [name], [picture], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [lastUpdatedDate], [userEmail], [status]) VALUES (20, N'Mandarin Oriental', N'MandarinOriental.jpg', N'no description', 4490000, 10, CAST(N'2020-10-11T10:14:01.547' AS DateTime), CAST(N'2020-10-15T00:00:00.000' AS DateTime), 2, CAST(N'2020-10-11T10:14:01.547' AS DateTime), N'admin@admin.admin', N'Active')
INSERT [dbo].[tblCake] ([cakeID], [name], [picture], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [lastUpdatedDate], [userEmail], [status]) VALUES (21, N'Oreo Chocolate Milk', N'OreoSocolaMilk.jpg', N'no description', 209000, 10, CAST(N'2020-10-11T10:14:56.007' AS DateTime), CAST(N'2020-10-20T00:00:00.000' AS DateTime), 3, CAST(N'2020-10-11T10:14:56.007' AS DateTime), N'admin@admin.admin', N'Active')
INSERT [dbo].[tblCake] ([cakeID], [name], [picture], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [lastUpdatedDate], [userEmail], [status]) VALUES (22, N'PanPacific Hotel', N'PanPacificHotel.jpg', N'no description', 3090000, 10, CAST(N'2020-10-11T10:15:44.323' AS DateTime), CAST(N'2020-10-21T00:00:00.000' AS DateTime), 2, CAST(N'2020-10-11T10:15:44.323' AS DateTime), N'admin@admin.admin', N'Active')
INSERT [dbo].[tblCake] ([cakeID], [name], [picture], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [lastUpdatedDate], [userEmail], [status]) VALUES (25, N'Piggy Mooncake', N'PiggyMooncakeBiscuit.jpg', N'no description', 69000, 10, CAST(N'2020-10-11T00:00:00.000' AS DateTime), CAST(N'2020-10-20T00:00:00.000' AS DateTime), 1, CAST(N'2020-10-11T00:00:00.000' AS DateTime), N'admin@admin.admin', N'Active')
INSERT [dbo].[tblCake] ([cakeID], [name], [picture], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [lastUpdatedDate], [userEmail], [status]) VALUES (26, N'Prosperity Mooncake', N'ProsperityMooncakeBiscuit.jpg', N'no description', 89000, 10, CAST(N'2020-10-11T00:00:00.000' AS DateTime), CAST(N'2020-10-20T00:00:00.000' AS DateTime), 1, CAST(N'2020-10-11T00:00:00.000' AS DateTime), N'admin@admin.admin', N'Active')
INSERT [dbo].[tblCake] ([cakeID], [name], [picture], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [lastUpdatedDate], [userEmail], [status]) VALUES (27, N'ShangriLa', N'ShangriLa.jpg', N'no description', 7990000, 9, CAST(N'2020-10-12T00:00:00.000' AS DateTime), CAST(N'2020-10-20T00:00:00.000' AS DateTime), 2, CAST(N'2020-10-12T00:00:00.000' AS DateTime), N'admin@admin.admin', N'Active')
INSERT [dbo].[tblCake] ([cakeID], [name], [picture], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [lastUpdatedDate], [userEmail], [status]) VALUES (28, N'Traditional Box', N'traditionalBox.jpg', N'no description', 399000, 10, CAST(N'2020-10-12T00:00:00.000' AS DateTime), CAST(N'2020-10-20T00:00:00.000' AS DateTime), 2, CAST(N'2020-10-12T00:00:00.000' AS DateTime), N'admin@admin.admin', N'Active')
INSERT [dbo].[tblCake] ([cakeID], [name], [picture], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [lastUpdatedDate], [userEmail], [status]) VALUES (29, N'Test Cake', N'BunnyMooncakeBiscuit.jpg', N'no description', 100000, 8, CAST(N'2020-10-26T00:00:00.000' AS DateTime), CAST(N'2020-10-28T00:00:00.000' AS DateTime), 1, CAST(N'2020-10-26T00:00:00.000' AS DateTime), N'admin@admin.admin', N'Active')
SET IDENTITY_INSERT [dbo].[tblCake] OFF
GO
SET IDENTITY_INSERT [dbo].[tblCategory] ON 

INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (1, N'Single')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (2, N'Box')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (3, N'Oreo')
SET IDENTITY_INSERT [dbo].[tblCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[tblOrderDetail] ON 

INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [cakeID], [price], [quantity]) VALUES (4, 3, 29, 100000, 2)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [cakeID], [price], [quantity]) VALUES (5, 4, 27, 7990000, 1)
SET IDENTITY_INSERT [dbo].[tblOrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[tblOrdering] ON 

INSERT [dbo].[tblOrdering] ([orderID], [userEmail], [orderDate], [name], [phoneNum], [shippingAddress], [total], [orderStatus], [paymentMethod], [paymentStatus]) VALUES (3, NULL, CAST(N'2020-10-27T11:05:28.000' AS DateTime), N'Abc', N'1111111111', N'Here', 200000, N'Pending', N'Cash', N'Unpaid')
INSERT [dbo].[tblOrdering] ([orderID], [userEmail], [orderDate], [name], [phoneNum], [shippingAddress], [total], [orderStatus], [paymentMethod], [paymentStatus]) VALUES (4, NULL, CAST(N'2020-10-27T11:05:54.107' AS DateTime), N'Han Quang', N'1234567890', N'Here', 7990000, N'Pending', N'Cash', N'Unpaid')
SET IDENTITY_INSERT [dbo].[tblOrdering] OFF
GO
INSERT [dbo].[tblUser] ([userEmail], [password], [role], [name], [phoneNum], [status]) VALUES (N'abc@abc.abc', N'123456', N'user', N'A B C', N'0909090909', N'Active')
INSERT [dbo].[tblUser] ([userEmail], [password], [role], [name], [phoneNum], [status]) VALUES (N'admin@admin.admin', N'123456', N'admin', N'admin', N'123456789', N'Active')
GO
ALTER TABLE [dbo].[tblCake]  WITH CHECK ADD FOREIGN KEY([categoryID])
REFERENCES [dbo].[tblCategory] ([categoryID])
GO
ALTER TABLE [dbo].[tblCake]  WITH CHECK ADD FOREIGN KEY([userEmail])
REFERENCES [dbo].[tblUser] ([userEmail])
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD FOREIGN KEY([cakeID])
REFERENCES [dbo].[tblCake] ([cakeID])
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrdering] ([orderID])
GO
ALTER TABLE [dbo].[tblOrdering]  WITH CHECK ADD FOREIGN KEY([userEmail])
REFERENCES [dbo].[tblUser] ([userEmail])
GO
ALTER TABLE [dbo].[tblCake]  WITH CHECK ADD CHECK  (([price]>(0)))
GO
ALTER TABLE [dbo].[tblCake]  WITH CHECK ADD CHECK  (([quantity]>=(0)))
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD CHECK  (([price]>(0)))
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD CHECK  (([quantity]>(0)))
GO
ALTER TABLE [dbo].[tblOrdering]  WITH CHECK ADD CHECK  (([total]>(0)))
GO
USE [master]
GO
ALTER DATABASE [YellowMoonShop] SET  READ_WRITE 
GO
