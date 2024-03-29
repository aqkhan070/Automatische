USE [master]
GO
/****** Object:  Database [Automatische]    Script Date: 12/26/2022 8:08:16 PM ******/
CREATE DATABASE [Automatische]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Automatische', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Automatische.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Automatische_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Automatische_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Automatische] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Automatische].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Automatische] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Automatische] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Automatische] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Automatische] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Automatische] SET ARITHABORT OFF 
GO
ALTER DATABASE [Automatische] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Automatische] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Automatische] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Automatische] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Automatische] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Automatische] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Automatische] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Automatische] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Automatische] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Automatische] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Automatische] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Automatische] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Automatische] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Automatische] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Automatische] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Automatische] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Automatische] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Automatische] SET RECOVERY FULL 
GO
ALTER DATABASE [Automatische] SET  MULTI_USER 
GO
ALTER DATABASE [Automatische] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Automatische] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Automatische] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Automatische] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Automatische] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Automatische] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Automatische', N'ON'
GO
ALTER DATABASE [Automatische] SET QUERY_STORE = OFF
GO
USE [Automatische]
GO
/****** Object:  Table [dbo].[tblAccessLevel]    Script Date: 12/26/2022 8:08:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAccessLevel](
	[AccessId] [int] IDENTITY(1,1) NOT NULL,
	[EditAccess] [bit] NULL,
	[DeleteAccess] [bit] NULL,
	[CreateAccess] [bit] NULL,
	[MenuId] [int] NULL,
	[RoleId] [int] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[EditBy] [int] NULL,
	[EditDate] [datetime] NULL,
	[isActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[AccessId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblComponent]    Script Date: 12/26/2022 8:08:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblComponent](
	[ComponentId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Code] [nvarchar](max) NULL,
	[Price] [float] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[EditBy] [int] NULL,
	[EditDate] [datetime] NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK_tblComponent] PRIMARY KEY CLUSTERED 
(
	[ComponentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLog]    Script Date: 12/26/2022 8:08:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLog](
	[LogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[Action] [nvarchar](500) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_tblLog] PRIMARY KEY CLUSTERED 
(
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMenu]    Script Date: 12/26/2022 8:08:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMenu](
	[MenuId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[ControllerName] [nvarchar](50) NULL,
	[ActionName] [nvarchar](50) NULL,
	[isParent] [bit] NULL,
	[ParentId] [int] NULL,
	[FontAwesome] [nvarchar](50) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[EditBy] [int] NULL,
	[EditDate] [datetime] NULL,
	[isActive] [bit] NULL,
	[ElementId] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[MenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 12/26/2022 8:08:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrder](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[OrderNumber] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[TotalPrice] [float] NULL,
	[Status] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[EditDate] [datetime] NULL,
	[EditBy] [int] NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK_tblOrder] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderDetail]    Script Date: 12/26/2022 8:08:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[OrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NULL,
	[ComponentId] [int] NULL,
	[ComponentName] [nvarchar](max) NULL,
	[ComponentCode] [nvarchar](max) NULL,
	[ComponentPrice] [float] NULL,
 CONSTRAINT [PK_tblOrderDetail] PRIMARY KEY CLUSTERED 
(
	[OrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRole]    Script Date: 12/26/2022 8:08:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRole](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[Role] [nvarchar](max) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[EditBy] [int] NULL,
	[EditDate] [datetime] NULL,
	[isActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSetting]    Script Date: 12/26/2022 8:08:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSetting](
	[SettingId] [int] IDENTITY(1,1) NOT NULL,
	[SecretKey] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[ClientID] [nvarchar](max) NULL,
	[Port] [int] NULL,
	[SMTP] [nvarchar](max) NULL,
	[Mode] [nvarchar](max) NULL,
	[Editby] [int] NULL,
	[EditDate] [datetime] NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK_tblSetting] PRIMARY KEY CLUSTERED 
(
	[SettingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTransaction]    Script Date: 12/26/2022 8:08:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTransaction](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PaymentDateTime] [datetime] NULL,
	[PaypalPaymentId] [nvarchar](50) NULL,
	[PayerEmail] [nvarchar](50) NULL,
	[PayerFirstName] [nvarchar](50) NULL,
	[PayerLastName] [nvarchar](50) NULL,
	[PayerId] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Amount] [nvarchar](50) NULL,
	[Currency] [nvarchar](50) NULL,
	[PaymentDescription] [nvarchar](max) NULL,
	[UserId] [int] NULL,
	[OrderId] [int] NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblTransaction] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 12/26/2022 8:08:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[FirstName] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[ImagePath] [nvarchar](max) NULL,
	[RoleId] [int] NULL,
	[LastLogin] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[EditBy] [int] NULL,
	[EditDate] [datetime] NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK__tblUser__1788CC4CF61B627F] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblAccessLevel] ON 

INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (69, NULL, NULL, NULL, 1, 1, 1, CAST(N'2022-12-26T19:30:44.167' AS DateTime), 1, CAST(N'2022-12-26T19:30:44.167' AS DateTime), 1)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (70, NULL, NULL, NULL, 2, 1, 1, CAST(N'2022-12-26T19:30:44.177' AS DateTime), 1, CAST(N'2022-12-26T19:30:44.177' AS DateTime), 1)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (71, NULL, NULL, NULL, 3, 1, 1, CAST(N'2022-12-26T19:30:44.180' AS DateTime), 1, CAST(N'2022-12-26T19:30:44.180' AS DateTime), 1)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (72, NULL, NULL, NULL, 4, 1, 1, CAST(N'2022-12-26T19:30:44.187' AS DateTime), 1, CAST(N'2022-12-26T19:30:44.187' AS DateTime), 1)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (73, NULL, NULL, NULL, 5, 1, 1, CAST(N'2022-12-26T19:30:44.190' AS DateTime), 1, CAST(N'2022-12-26T19:30:44.190' AS DateTime), 1)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (74, NULL, NULL, NULL, 6, 1, 1, CAST(N'2022-12-26T19:30:44.193' AS DateTime), 1, CAST(N'2022-12-26T19:30:44.193' AS DateTime), 0)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (75, NULL, NULL, NULL, 7, 1, 1, CAST(N'2022-12-26T19:30:44.197' AS DateTime), 1, CAST(N'2022-12-26T19:30:44.197' AS DateTime), 1)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (76, NULL, NULL, NULL, 8, 1, 1, CAST(N'2022-12-26T19:30:44.203' AS DateTime), 1, CAST(N'2022-12-26T19:30:44.203' AS DateTime), 1)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (77, NULL, NULL, NULL, 9, 1, 1, CAST(N'2022-12-26T19:30:44.203' AS DateTime), 1, CAST(N'2022-12-26T19:30:44.203' AS DateTime), 1)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (78, NULL, NULL, NULL, 10, 1, 1, CAST(N'2022-12-26T19:30:44.210' AS DateTime), 1, CAST(N'2022-12-26T19:30:44.210' AS DateTime), 1)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (79, NULL, NULL, NULL, 11, 1, 1, CAST(N'2022-12-26T19:30:44.213' AS DateTime), 1, CAST(N'2022-12-26T19:30:44.213' AS DateTime), 1)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (80, NULL, NULL, NULL, 12, 1, 1, CAST(N'2022-12-26T19:30:44.217' AS DateTime), 1, CAST(N'2022-12-26T19:30:44.217' AS DateTime), 1)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (81, NULL, NULL, NULL, 1, 2, 1, CAST(N'2022-12-26T19:30:50.680' AS DateTime), 1, CAST(N'2022-12-26T19:30:50.680' AS DateTime), 1)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (82, NULL, NULL, NULL, 2, 2, 1, CAST(N'2022-12-26T19:30:50.687' AS DateTime), 1, CAST(N'2022-12-26T19:30:50.687' AS DateTime), 0)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (83, NULL, NULL, NULL, 3, 2, 1, CAST(N'2022-12-26T19:30:50.693' AS DateTime), 1, CAST(N'2022-12-26T19:30:50.693' AS DateTime), 0)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (84, NULL, NULL, NULL, 4, 2, 1, CAST(N'2022-12-26T19:30:50.700' AS DateTime), 1, CAST(N'2022-12-26T19:30:50.700' AS DateTime), 0)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (85, NULL, NULL, NULL, 5, 2, 1, CAST(N'2022-12-26T19:30:50.703' AS DateTime), 1, CAST(N'2022-12-26T19:30:50.703' AS DateTime), 0)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (86, NULL, NULL, NULL, 6, 2, 1, CAST(N'2022-12-26T19:30:50.707' AS DateTime), 1, CAST(N'2022-12-26T19:30:50.707' AS DateTime), 0)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (87, NULL, NULL, NULL, 7, 2, 1, CAST(N'2022-12-26T19:30:50.713' AS DateTime), 1, CAST(N'2022-12-26T19:30:50.713' AS DateTime), 0)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (88, NULL, NULL, NULL, 8, 2, 1, CAST(N'2022-12-26T19:30:50.720' AS DateTime), 1, CAST(N'2022-12-26T19:30:50.720' AS DateTime), 0)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (89, NULL, NULL, NULL, 9, 2, 1, CAST(N'2022-12-26T19:30:50.723' AS DateTime), 1, CAST(N'2022-12-26T19:30:50.723' AS DateTime), 1)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (90, NULL, NULL, NULL, 10, 2, 1, CAST(N'2022-12-26T19:30:50.727' AS DateTime), 1, CAST(N'2022-12-26T19:30:50.727' AS DateTime), 0)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (91, NULL, NULL, NULL, 11, 2, 1, CAST(N'2022-12-26T19:30:50.733' AS DateTime), 1, CAST(N'2022-12-26T19:30:50.733' AS DateTime), 1)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (92, NULL, NULL, NULL, 12, 2, 1, CAST(N'2022-12-26T19:30:50.740' AS DateTime), 1, CAST(N'2022-12-26T19:30:50.740' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tblAccessLevel] OFF
GO
SET IDENTITY_INSERT [dbo].[tblComponent] ON 

INSERT [dbo].[tblComponent] ([ComponentId], [Name], [Code], [Price], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (4, N'Lawn', N'100', 10, 1, CAST(N'2022-12-26T00:00:00.000' AS DateTime), 1, CAST(N'2022-12-26T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[tblComponent] ([ComponentId], [Name], [Code], [Price], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (5, N'Dry Area', N'101', 20, 1, CAST(N'2022-12-26T00:00:00.000' AS DateTime), 1, CAST(N'2022-12-26T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tblComponent] OFF
GO
SET IDENTITY_INSERT [dbo].[tblLog] ON 

INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (1, 1, N'Add User', CAST(N'2022-12-22T18:32:27.650' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (2, 1, N'Add User', CAST(N'2022-12-22T18:35:16.643' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (3, 1, N'Add User', CAST(N'2022-12-22T18:36:40.647' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (4, 1, N'Add User', CAST(N'2022-12-22T18:37:16.297' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (5, 1, N'Add User', CAST(N'2022-12-22T18:38:19.400' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (6, 1, N'Update User', CAST(N'2022-12-22T19:23:27.250' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (7, 1, N'Update User', CAST(N'2022-12-22T19:24:05.723' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (8, 1, N'Update User', CAST(N'2022-12-22T19:25:14.510' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (9, 1, N'Delete User', CAST(N'2022-12-22T19:49:39.227' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (10, 1, N'Update User', CAST(N'2022-12-22T19:51:06.027' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (11, 1, N'Create Role', CAST(N'2022-12-22T20:48:25.667' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (12, 1, N'Update Role', CAST(N'2022-12-22T20:53:58.507' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (13, 1, N'Update User', CAST(N'2022-12-22T21:06:38.297' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (14, 1, N'Update User', CAST(N'2022-12-22T21:38:23.540' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (15, 1, N'Update User', CAST(N'2022-12-22T21:38:43.850' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (16, 1, N'Login', CAST(N'2022-12-22T21:39:14.893' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (17, 1, N'Login', CAST(N'2022-12-23T12:45:32.043' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (18, 1, N'Login', CAST(N'2022-12-23T14:58:03.363' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (19, 1, N'Login', CAST(N'2022-12-23T15:49:06.133' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (20, 1, N'Login', CAST(N'2022-12-23T15:50:36.643' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (21, 1, N'Update User', CAST(N'2022-12-23T15:53:26.773' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (22, 1, N'Login', CAST(N'2022-12-23T15:56:15.870' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (23, 1, N'Add User', CAST(N'2022-12-23T15:56:55.823' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (24, 1, N'Login', CAST(N'2022-12-23T16:18:23.630' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (25, 1, N'Create Role', CAST(N'2022-12-23T16:18:39.793' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (26, 8, N'Login', CAST(N'2022-12-23T16:52:53.967' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (27, 8, N'Login', CAST(N'2022-12-23T17:23:43.020' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (28, 1, N'Login', CAST(N'2022-12-23T17:23:47.633' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (29, 1, N'Login', CAST(N'2022-12-23T17:36:30.170' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (30, 1, N'Login', CAST(N'2022-12-23T18:17:37.303' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (31, 1, N'Login', CAST(N'2022-12-23T18:20:07.153' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (32, 1, N'Login', CAST(N'2022-12-23T18:45:26.293' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (33, 1, N'Login', CAST(N'2022-12-23T18:47:02.767' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (34, 1, N'Delete User', CAST(N'2022-12-23T18:48:26.383' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (35, 1, N'Delete User', CAST(N'2022-12-23T18:49:52.670' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (36, 1, N'Login', CAST(N'2022-12-23T19:28:51.197' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (37, 1, N'Login', CAST(N'2022-12-23T19:42:01.257' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (38, 1, N'Login', CAST(N'2022-12-23T19:55:30.650' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (39, 1, N'Update User', CAST(N'2022-12-23T19:56:17.380' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (40, 1, N'Update User', CAST(N'2022-12-23T19:57:06.850' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (41, 1, N'Update User', CAST(N'2022-12-23T19:59:36.593' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (42, 1, N'Update User', CAST(N'2022-12-23T20:00:14.907' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (43, 1, N'Update User', CAST(N'2022-12-23T20:00:55.063' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (44, 1, N'Update User', CAST(N'2022-12-23T20:01:49.577' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (45, 1, N'Login', CAST(N'2022-12-23T20:25:17.303' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (46, 1, N'Login', CAST(N'2022-12-23T20:33:41.413' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (47, 1, N'Login', CAST(N'2022-12-23T20:37:55.183' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (48, 1, N'Login', CAST(N'2022-12-23T20:40:01.477' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (49, 1, N'Login', CAST(N'2022-12-23T20:44:23.740' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (50, 1, N'Login', CAST(N'2022-12-23T20:46:10.583' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (51, 1, N'Login', CAST(N'2022-12-23T20:47:42.127' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (52, 1, N'Change Password', CAST(N'2022-12-23T20:49:34.763' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (53, 1, N'Login', CAST(N'2022-12-23T21:02:24.823' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (54, 1, N'Change Password', CAST(N'2022-12-23T21:05:42.360' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (55, 1, N'Login', CAST(N'2022-12-23T21:05:59.050' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (56, 1, N'Update Role', CAST(N'2022-12-23T21:06:08.677' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (57, 1, N'Login', CAST(N'2022-12-23T21:06:11.663' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (58, 10, N'Login', CAST(N'2022-12-23T21:06:19.113' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (59, 10, N'Change Password', CAST(N'2022-12-23T21:06:37.300' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (60, 10, N'Update User', CAST(N'2022-12-23T21:07:06.057' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (61, 1, N'Login', CAST(N'2022-12-23T21:08:02.770' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (62, 1, N'Add User', CAST(N'2022-12-23T21:08:50.413' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (63, 1, N'Add User', CAST(N'2022-12-23T21:09:30.780' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (64, 1, N'Login', CAST(N'2022-12-23T21:48:57.577' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (65, 1, N'Login', CAST(N'2022-12-23T21:49:00.623' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (66, 1, N'Update Role', CAST(N'2022-12-23T21:49:21.173' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (67, 1, N'Login', CAST(N'2022-12-23T21:49:26.450' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (68, 1, N'Login', CAST(N'2022-12-23T21:49:42.393' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (69, 1, N'Login', CAST(N'2022-12-23T22:07:07.020' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (70, 1, N'Login', CAST(N'2022-12-24T12:23:32.433' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (71, 1, N'Login', CAST(N'2022-12-24T12:53:56.763' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (72, 1, N'Add Component', CAST(N'2022-12-24T12:54:20.277' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (73, 1, N'Update Component', CAST(N'2022-12-24T12:54:37.200' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (74, 1, N'Delete Component', CAST(N'2022-12-24T12:55:49.133' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (75, 1, N'Add Component', CAST(N'2022-12-24T12:56:18.287' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (76, 1, N'Update Component', CAST(N'2022-12-24T12:56:28.113' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (77, 1, N'Delete Component', CAST(N'2022-12-24T12:56:31.637' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (78, 1, N'Login', CAST(N'2022-12-24T14:56:14.017' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (79, 1, N'Login', CAST(N'2022-12-24T15:04:06.640' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (80, 1, N'Login', CAST(N'2022-12-24T15:04:18.270' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (81, 1, N'Update User', CAST(N'2022-12-24T15:04:41.530' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (82, 1, N'Login', CAST(N'2022-12-24T15:06:59.373' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (83, 1, N'Login', CAST(N'2022-12-24T15:09:13.187' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (84, 1, N'Login', CAST(N'2022-12-24T16:16:41.430' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (85, 1, N'Login', CAST(N'2022-12-24T16:22:50.760' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (86, 7, N'Login', CAST(N'2022-12-24T16:27:41.910' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (87, 1, N'Login', CAST(N'2022-12-24T17:07:12.643' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (88, 7, N'Login', CAST(N'2022-12-24T17:07:44.733' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (89, 7, N'Change Password', CAST(N'2022-12-24T17:08:04.520' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (90, 7, N'Login', CAST(N'2022-12-24T17:09:05.160' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (91, 7, N'Change Password', CAST(N'2022-12-24T17:09:16.463' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (92, 7, N'Change Password', CAST(N'2022-12-24T17:09:20.313' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (93, 7, N'Login', CAST(N'2022-12-24T17:12:54.850' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (94, 7, N'Change Password', CAST(N'2022-12-24T17:13:13.640' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (95, 1, N'Login', CAST(N'2022-12-24T17:13:57.320' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (96, 1, N'Update User', CAST(N'2022-12-24T17:14:56.657' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (97, 1, N'Update User', CAST(N'2022-12-24T17:15:20.007' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (98, 1, N'Login', CAST(N'2022-12-24T17:16:05.753' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (99, 1, N'Change Password', CAST(N'2022-12-24T17:16:16.107' AS DateTime))
GO
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (100, 8, N'Login', CAST(N'2022-12-24T17:17:21.993' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (101, 8, N'Change Password', CAST(N'2022-12-24T17:17:49.660' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (102, 8, N'Login', CAST(N'2022-12-24T17:19:17.193' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (103, 8, N'Login', CAST(N'2022-12-24T17:19:25.607' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (104, 1, N'Login', CAST(N'2022-12-24T17:19:30.500' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (105, 1, N'Login', CAST(N'2022-12-24T17:42:25.770' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (106, 1, N'Login', CAST(N'2022-12-24T18:51:38.033' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (107, 1, N'Update Role', CAST(N'2022-12-24T18:51:46.363' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (108, 1, N'Login', CAST(N'2022-12-24T18:51:50.473' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (109, 1, N'Login', CAST(N'2022-12-24T19:05:06.727' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (110, 1, N'Login', CAST(N'2022-12-26T10:58:32.233' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (111, 1, N'Login', CAST(N'2022-12-26T11:24:45.370' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (112, 1, N'Add Order', CAST(N'2022-12-26T11:30:03.420' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (113, 1, N'Update Order', CAST(N'2022-12-26T11:30:19.920' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (114, 1, N'Update Order', CAST(N'2022-12-26T11:32:44.947' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (115, 1, N'Update Order', CAST(N'2022-12-26T11:33:13.300' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (116, 1, N'Login', CAST(N'2022-12-26T11:34:24.293' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (117, 1, N'Update Order', CAST(N'2022-12-26T11:34:33.540' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (118, 1, N'Update Order', CAST(N'2022-12-26T11:38:12.120' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (119, 1, N'Login', CAST(N'2022-12-26T12:01:59.100' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (120, 1, N'Update Order', CAST(N'2022-12-26T12:03:13.420' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (121, 1, N'Login', CAST(N'2022-12-26T12:04:30.643' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (122, 1, N'Add Order', CAST(N'2022-12-26T12:07:41.013' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (123, 1, N'Delete Order', CAST(N'2022-12-26T12:14:28.380' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (124, 1, N'Add Order', CAST(N'2022-12-26T12:14:48.783' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (125, 1, N'Update Order', CAST(N'2022-12-26T12:14:55.347' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (126, 1, N'Update Order', CAST(N'2022-12-26T12:15:04.913' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (127, 1, N'Update Order', CAST(N'2022-12-26T12:15:10.433' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (128, 1, N'Login', CAST(N'2022-12-26T12:47:42.923' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (129, 1, N'Add Order', CAST(N'2022-12-26T12:49:50.137' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (130, 1, N'Delete Order', CAST(N'2022-12-26T12:50:35.293' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (131, 1, N'Delete Order', CAST(N'2022-12-26T12:50:38.103' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (132, 1, N'Add Order', CAST(N'2022-12-26T12:50:43.347' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (133, 1, N'Add Order', CAST(N'2022-12-26T12:50:51.497' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (134, 1, N'Add Component', CAST(N'2022-12-26T12:52:47.147' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (135, 1, N'Add Component', CAST(N'2022-12-26T12:53:17.647' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (136, 1, N'Delete Component', CAST(N'2022-12-26T12:53:34.917' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (137, 1, N'Login', CAST(N'2022-12-26T13:08:12.310' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (138, 1, N'Login', CAST(N'2022-12-26T14:18:24.420' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (139, 1, N'Login', CAST(N'2022-12-26T14:34:03.967' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (140, 1, N'Add Order', CAST(N'2022-12-26T14:34:17.327' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (141, 1, N'Login', CAST(N'2022-12-26T14:35:06.860' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (142, 1, N'Add Order', CAST(N'2022-12-26T14:35:15.470' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (143, 1, N'Add Order', CAST(N'2022-12-26T14:35:38.897' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (144, 1, N'Add Order', CAST(N'2022-12-26T14:36:29.983' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (145, 1, N'Add Order', CAST(N'2022-12-26T14:37:18.957' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (146, 1, N'Add Order Details', CAST(N'2022-12-26T14:37:24.127' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (147, 1, N'Add Order Details', CAST(N'2022-12-26T14:37:26.870' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (148, 1, N'Login', CAST(N'2022-12-26T15:12:26.010' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (149, 1, N'Add Order', CAST(N'2022-12-26T15:13:27.970' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (150, 1, N'Add Order Details', CAST(N'2022-12-26T15:13:34.017' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (151, 1, N'Add Order Details', CAST(N'2022-12-26T15:14:19.097' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (152, 1, N'Login', CAST(N'2022-12-26T15:44:46.233' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (153, 1, N'Login', CAST(N'2022-12-26T15:57:25.613' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (154, 1, N'Update Order', CAST(N'2022-12-26T15:57:52.537' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (155, 1, N'Login', CAST(N'2022-12-26T16:15:17.227' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (156, 1, N'Login', CAST(N'2022-12-26T16:17:43.483' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (157, 1, N'Update Role', CAST(N'2022-12-26T16:18:05.533' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (158, 8, N'Login', CAST(N'2022-12-26T16:18:29.337' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (159, 8, N'Login', CAST(N'2022-12-26T16:23:03.207' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (160, 8, N'Add Order', CAST(N'2022-12-26T16:23:51.463' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (161, 8, N'Add Order', CAST(N'2022-12-26T16:24:31.487' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (162, 8, N'Login', CAST(N'2022-12-26T16:29:09.247' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (163, 8, N'Update Order', CAST(N'2022-12-26T16:29:39.257' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (164, 8, N'Login', CAST(N'2022-12-26T16:37:57.357' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (165, 1, N'Login', CAST(N'2022-12-26T16:39:21.767' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (166, 1, N'Login', CAST(N'2022-12-26T17:34:53.127' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (167, 1, N'Delete User', CAST(N'2022-12-26T17:35:03.487' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (168, 1, N'Update User', CAST(N'2022-12-26T17:35:51.000' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (169, 1, N'Delete User', CAST(N'2022-12-26T17:37:06.610' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (170, 1, N'Login', CAST(N'2022-12-26T18:52:26.737' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (171, 1, N'Add Order', CAST(N'2022-12-26T18:52:44.177' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (172, 1, N'Add Order Details', CAST(N'2022-12-26T18:52:45.897' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (173, 1, N'Add Order Details', CAST(N'2022-12-26T18:52:48.557' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (174, 1, N'Add Order Details', CAST(N'2022-12-26T18:53:31.043' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (175, 1, N'Add Order Details', CAST(N'2022-12-26T18:53:33.217' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (176, 1, N'Add Order Details', CAST(N'2022-12-26T18:54:52.837' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (177, 1, N'Add Order Details', CAST(N'2022-12-26T18:54:53.770' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (178, 1, N'Add Order Details', CAST(N'2022-12-26T18:54:57.187' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (179, 1, N'Login', CAST(N'2022-12-26T19:29:35.590' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (180, 1, N'Update Role', CAST(N'2022-12-26T19:30:44.223' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (181, 1, N'Update Role', CAST(N'2022-12-26T19:30:50.747' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (182, 1, N'Login', CAST(N'2022-12-26T19:30:55.607' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (183, 1, N'Add Order Details', CAST(N'2022-12-26T19:39:24.277' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (184, 1, N'Add Order Details', CAST(N'2022-12-26T19:39:26.150' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (185, 1, N'Add Order', CAST(N'2022-12-26T19:42:28.147' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (186, 1, N'Add Order Details', CAST(N'2022-12-26T19:42:30.637' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (187, 1, N'Add Order Details', CAST(N'2022-12-26T19:42:31.047' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (188, 1, N'Add Order Details', CAST(N'2022-12-26T19:42:33.443' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (189, 1, N'Login', CAST(N'2022-12-26T19:43:34.130' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (190, 1, N'Add Order', CAST(N'2022-12-26T19:43:42.830' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (191, 1, N'Add Order Details', CAST(N'2022-12-26T19:43:45.927' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (192, 1, N'Add Order Details', CAST(N'2022-12-26T19:43:47.707' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (193, 1, N'Add Order', CAST(N'2022-12-26T19:45:53.397' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (194, 1, N'Add Order Details', CAST(N'2022-12-26T19:50:03.407' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (195, 1, N'Add Order Details', CAST(N'2022-12-26T19:50:04.743' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (196, 1, N'Add Order', CAST(N'2022-12-26T19:51:27.217' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (197, 1, N'Add Order Details', CAST(N'2022-12-26T19:51:50.240' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (198, 1, N'Add Order Details', CAST(N'2022-12-26T19:51:50.583' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblLog] OFF
GO
SET IDENTITY_INSERT [dbo].[tblMenu] ON 

INSERT [dbo].[tblMenu] ([MenuId], [Name], [ControllerName], [ActionName], [isParent], [ParentId], [FontAwesome], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive], [ElementId]) VALUES (1, N'Dashboard', N'Home', N'Index', 0, 0, N'fa fa-dashboard', NULL, NULL, NULL, NULL, 1, N'Dashboard')
INSERT [dbo].[tblMenu] ([MenuId], [Name], [ControllerName], [ActionName], [isParent], [ParentId], [FontAwesome], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive], [ElementId]) VALUES (2, N'Draw Shape', N'Admin', N'DrawShape', 0, 0, N'fa fa-paint-brush', NULL, NULL, NULL, NULL, 1, N'DrawShape')
INSERT [dbo].[tblMenu] ([MenuId], [Name], [ControllerName], [ActionName], [isParent], [ParentId], [FontAwesome], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive], [ElementId]) VALUES (3, N'User Management', N'User', N'UserList', 0, 0, N'fa fa-user', NULL, NULL, NULL, NULL, 1, N'User')
INSERT [dbo].[tblMenu] ([MenuId], [Name], [ControllerName], [ActionName], [isParent], [ParentId], [FontAwesome], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive], [ElementId]) VALUES (4, N'Roles Management', N'User', N'Roles', 0, 0, N'fa fa-cog', NULL, NULL, NULL, NULL, 1, N'Roles')
INSERT [dbo].[tblMenu] ([MenuId], [Name], [ControllerName], [ActionName], [isParent], [ParentId], [FontAwesome], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive], [ElementId]) VALUES (5, N'Customer', N'Customer', N'CustomerList', 0, 0, N'fa fa-user-circle', NULL, NULL, NULL, NULL, 1, N'customer')
INSERT [dbo].[tblMenu] ([MenuId], [Name], [ControllerName], [ActionName], [isParent], [ParentId], [FontAwesome], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive], [ElementId]) VALUES (6, N'Transactions', N'Admin', N'Transaction', 0, 0, N'fa fa-cc-paypal', NULL, NULL, NULL, NULL, 1, N'Transaction')
INSERT [dbo].[tblMenu] ([MenuId], [Name], [ControllerName], [ActionName], [isParent], [ParentId], [FontAwesome], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive], [ElementId]) VALUES (7, N'Settings', N'Admin', N'Setting', 0, 0, N'fa fa-cog', NULL, NULL, NULL, NULL, 1, N'Setting')
INSERT [dbo].[tblMenu] ([MenuId], [Name], [ControllerName], [ActionName], [isParent], [ParentId], [FontAwesome], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive], [ElementId]) VALUES (8, N'Packages', N'Admin', N'Packages', 0, 0, N'fa fa-calendar-o', NULL, NULL, NULL, NULL, 1, N'Packages')
INSERT [dbo].[tblMenu] ([MenuId], [Name], [ControllerName], [ActionName], [isParent], [ParentId], [FontAwesome], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive], [ElementId]) VALUES (9, N'Profile Settings', N'User', N'Profile', 0, 0, N'fa fa-user-o', NULL, NULL, NULL, NULL, 1, N'Profile')
INSERT [dbo].[tblMenu] ([MenuId], [Name], [ControllerName], [ActionName], [isParent], [ParentId], [FontAwesome], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive], [ElementId]) VALUES (10, N'Components', N'Component', N'Components', 0, 0, N'fa fa-cog', NULL, NULL, NULL, NULL, 1, N'Component')
INSERT [dbo].[tblMenu] ([MenuId], [Name], [ControllerName], [ActionName], [isParent], [ParentId], [FontAwesome], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive], [ElementId]) VALUES (11, N'Orders', N'Customer', N'Orders', 0, 0, N'fa fa-cog', NULL, NULL, NULL, NULL, 1, N'Order')
INSERT [dbo].[tblMenu] ([MenuId], [Name], [ControllerName], [ActionName], [isParent], [ParentId], [FontAwesome], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive], [ElementId]) VALUES (12, N'Transactions', N'Customer', N'Transactions', 0, 0, N'fa fa-cc-paypal', NULL, NULL, NULL, NULL, 1, N'Transaction')
SET IDENTITY_INSERT [dbo].[tblMenu] OFF
GO
SET IDENTITY_INSERT [dbo].[tblOrder] ON 

INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (1, N'O-001', N'Area', 200, 1, NULL, 1, CAST(N'2022-12-26T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (2, NULL, N'Test', 55, 2, CAST(N'2022-12-26T00:00:00.000' AS DateTime), 1, CAST(N'2022-12-26T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (6, N'O-003', N'AAAAa', NULL, NULL, CAST(N'2022-12-26T00:00:00.000' AS DateTime), 1, CAST(N'2022-12-26T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (7, N'O-007', N'BBBB', NULL, NULL, CAST(N'2022-12-26T00:00:00.000' AS DateTime), 1, CAST(N'2022-12-26T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (8, N'O-008', N'Test', NULL, NULL, CAST(N'2022-12-26T00:00:00.000' AS DateTime), 1, CAST(N'2022-12-26T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (9, N'O-009', N'Test', NULL, NULL, CAST(N'2022-12-26T00:00:00.000' AS DateTime), 1, CAST(N'2022-12-26T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (10, N'O-0010', N'Test111', NULL, NULL, CAST(N'2022-12-26T00:00:00.000' AS DateTime), 1, CAST(N'2022-12-26T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (11, N'O-0011', N'Te', NULL, NULL, CAST(N'2022-12-26T00:00:00.000' AS DateTime), 1, CAST(N'2022-12-26T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (12, N'O-0012', N'Test Customer', 120, 1, CAST(N'2022-12-26T00:00:00.000' AS DateTime), 8, CAST(N'2022-12-26T00:00:00.000' AS DateTime), 8, 1)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (13, N'O-0013', N'Test Customer2', 250, 2, CAST(N'2022-12-26T00:00:00.000' AS DateTime), 8, CAST(N'2022-12-26T00:00:00.000' AS DateTime), 8, 1)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (14, N'O-0014', N'Test', NULL, NULL, CAST(N'2022-12-26T00:00:00.000' AS DateTime), 1, CAST(N'2022-12-26T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (15, N'O-0015', N'test111', NULL, NULL, CAST(N'2022-12-26T00:00:00.000' AS DateTime), 1, CAST(N'2022-12-26T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (16, N'O-0016', N'test10', NULL, NULL, CAST(N'2022-12-26T00:00:00.000' AS DateTime), 1, CAST(N'2022-12-26T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (17, N'O-0017', N'test30', NULL, NULL, CAST(N'2022-12-26T00:00:00.000' AS DateTime), 1, CAST(N'2022-12-26T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (18, N'O-0018', N'test50', NULL, NULL, CAST(N'2022-12-26T00:00:00.000' AS DateTime), 1, CAST(N'2022-12-26T00:00:00.000' AS DateTime), 1, NULL)
SET IDENTITY_INSERT [dbo].[tblOrder] OFF
GO
SET IDENTITY_INSERT [dbo].[tblOrderDetail] ON 

INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [ComponentId], [ComponentName], [ComponentCode], [ComponentPrice]) VALUES (1, 9, 4, N'Lawn', N'100', 10)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [ComponentId], [ComponentName], [ComponentCode], [ComponentPrice]) VALUES (2, 9, 5, N'Dry Area', N'101', 20)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [ComponentId], [ComponentName], [ComponentCode], [ComponentPrice]) VALUES (3, 10, 4, N'Lawn', N'100', 10)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [ComponentId], [ComponentName], [ComponentCode], [ComponentPrice]) VALUES (4, 10, 5, N'Dry Area', N'101', 20)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [ComponentId], [ComponentName], [ComponentCode], [ComponentPrice]) VALUES (5, 11, 4, N'Lawn', N'100', 10)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [ComponentId], [ComponentName], [ComponentCode], [ComponentPrice]) VALUES (6, 11, 5, N'Dry Area', N'101', 20)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [ComponentId], [ComponentName], [ComponentCode], [ComponentPrice]) VALUES (7, 14, 4, N'Lawn', N'100', 10)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [ComponentId], [ComponentName], [ComponentCode], [ComponentPrice]) VALUES (8, 14, 5, N'Dry Area', N'101', 20)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [ComponentId], [ComponentName], [ComponentCode], [ComponentPrice]) VALUES (9, 14, 4, N'Lawn', N'100', 10)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [ComponentId], [ComponentName], [ComponentCode], [ComponentPrice]) VALUES (10, 14, 5, N'Dry Area', N'101', 20)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [ComponentId], [ComponentName], [ComponentCode], [ComponentPrice]) VALUES (11, 14, 4, N'Lawn', N'100', 10)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [ComponentId], [ComponentName], [ComponentCode], [ComponentPrice]) VALUES (12, 14, 5, N'Dry Area', N'101', 20)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [ComponentId], [ComponentName], [ComponentCode], [ComponentPrice]) VALUES (13, 14, 5, N'Dry Area', N'101', 20)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [ComponentId], [ComponentName], [ComponentCode], [ComponentPrice]) VALUES (14, 14, 4, N'Lawn', N'100', 10)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [ComponentId], [ComponentName], [ComponentCode], [ComponentPrice]) VALUES (15, 14, 5, N'Dry Area', N'101', 20)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [ComponentId], [ComponentName], [ComponentCode], [ComponentPrice]) VALUES (16, 15, 4, N'Lawn', N'100', 10)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [ComponentId], [ComponentName], [ComponentCode], [ComponentPrice]) VALUES (17, 15, 5, N'Dry Area', N'101', 20)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [ComponentId], [ComponentName], [ComponentCode], [ComponentPrice]) VALUES (18, 15, 5, N'Dry Area', N'101', 20)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [ComponentId], [ComponentName], [ComponentCode], [ComponentPrice]) VALUES (19, 16, 4, N'Lawn', N'100', 10)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [ComponentId], [ComponentName], [ComponentCode], [ComponentPrice]) VALUES (20, 16, 5, N'Dry Area', N'101', 20)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [ComponentId], [ComponentName], [ComponentCode], [ComponentPrice]) VALUES (21, 17, 4, N'Lawn', N'100', 10)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [ComponentId], [ComponentName], [ComponentCode], [ComponentPrice]) VALUES (22, 17, 5, N'Dry Area', N'101', 20)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [ComponentId], [ComponentName], [ComponentCode], [ComponentPrice]) VALUES (23, 18, 4, N'Lawn', N'100', 10)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [ComponentId], [ComponentName], [ComponentCode], [ComponentPrice]) VALUES (24, 18, 5, N'Dry Area', N'101', 20)
SET IDENTITY_INSERT [dbo].[tblOrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[tblRole] ON 

INSERT [dbo].[tblRole] ([RoleId], [Role], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (1, N'Admin', 1, CAST(N'2022-12-22T00:00:00.000' AS DateTime), 1, CAST(N'2022-12-26T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[tblRole] ([RoleId], [Role], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (2, N'Customer', 1, CAST(N'2022-12-23T00:00:00.000' AS DateTime), 1, CAST(N'2022-12-26T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tblRole] OFF
GO
SET IDENTITY_INSERT [dbo].[tblSetting] ON 

INSERT [dbo].[tblSetting] ([SettingId], [SecretKey], [Email], [Password], [ClientID], [Port], [SMTP], [Mode], [Editby], [EditDate], [isActive]) VALUES (1, N'AYctY-wZ1hLf2OG33fuEW2CCsPGqa4hcHxK-aI1Gyv4Rcdi0OdGdbJ_5Hmry', N'demo@technosolx.com', N'=^T1-KFmLA4v', N'EFbTStisJ8DmFy5xYrAeEDcCROw8WLOj0LtiSZ5S1NU2-myO4fZrCLC', 587, N'technosolx.com', N'Sandbox', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblSetting] OFF
GO
SET IDENTITY_INSERT [dbo].[tblTransaction] ON 

INSERT [dbo].[tblTransaction] ([Id], [PaymentDateTime], [PaypalPaymentId], [PayerEmail], [PayerFirstName], [PayerLastName], [PayerId], [State], [Amount], [Currency], [PaymentDescription], [UserId], [OrderId], [Status]) VALUES (1, CAST(N'2022-12-26T19:45:13.877' AS DateTime), N'PAYID-MOU3GXQ8KM70907FF551730K', N'sb-aen2018068512@business.example.com', N'John', N'Doe', N'QN94F2JTXLSGU', NULL, N'30.00', NULL, NULL, 1, 1, N'Successfull')
INSERT [dbo].[tblTransaction] ([Id], [PaymentDateTime], [PaypalPaymentId], [PayerEmail], [PayerFirstName], [PayerLastName], [PayerId], [State], [Amount], [Currency], [PaymentDescription], [UserId], [OrderId], [Status]) VALUES (2, CAST(N'2022-12-26T19:51:17.820' AS DateTime), N'PAYID-MOU3JVY09K03267262688504', N'sb-aen2018068512@business.example.com', N'John', N'Doe', N'QN94F2JTXLSGU', NULL, N'30.00', NULL, NULL, 1, 1, N'Successfull')
INSERT [dbo].[tblTransaction] ([Id], [PaymentDateTime], [PaypalPaymentId], [PayerEmail], [PayerFirstName], [PayerLastName], [PayerId], [State], [Amount], [Currency], [PaymentDescription], [UserId], [OrderId], [Status]) VALUES (3, CAST(N'2022-12-26T19:52:22.860' AS DateTime), N'PAYID-MOU3KEY16V09504BH585400W', N'sb-aen2018068512@business.example.com', N'John', N'Doe', N'QN94F2JTXLSGU', NULL, N'30.00', NULL, NULL, 1, 18, N'Successfull')
SET IDENTITY_INSERT [dbo].[tblTransaction] OFF
GO
SET IDENTITY_INSERT [dbo].[tblUser] ON 

INSERT [dbo].[tblUser] ([UserId], [username], [LastName], [FirstName], [Email], [Password], [Address], [Phone], [ImagePath], [RoleId], [LastLogin], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (1, N'Admin', N'Admin', N'Admin', N'admin@gmail.com', N'YWRtaW4=', N'321', N'321', N'\Uploading\WhatsApp Image 2022-12-07 at 7.33.43 PM.jpeg', 1, CAST(N'2022-12-26T19:43:34.100' AS DateTime), 1, NULL, 1, CAST(N'2022-12-22T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [username], [LastName], [FirstName], [Email], [Password], [Address], [Phone], [ImagePath], [RoleId], [LastLogin], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (2, NULL, N'test3', N'test34', N'test@gmail.com', N'YmlsYWw=', N'3213', N'03003', N'\Uploading\WhatsApp Image 2022-12-07 at 7.33.43 PM.jpeg', NULL, NULL, 1, CAST(N'2022-12-22T00:00:00.000' AS DateTime), 1, CAST(N'2022-12-23T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [username], [LastName], [FirstName], [Email], [Password], [Address], [Phone], [ImagePath], [RoleId], [LastLogin], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (3, NULL, N'test', N'test', N'add@lender.com', N'MTIz', N'321', N'0300000000', N'\Uploading\WhatsApp Image 2022-12-07 at 7.33.43 PM.jpeg', NULL, NULL, 1, CAST(N'2022-12-22T00:00:00.000' AS DateTime), 1, CAST(N'2022-12-22T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[tblUser] ([UserId], [username], [LastName], [FirstName], [Email], [Password], [Address], [Phone], [ImagePath], [RoleId], [LastLogin], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (4, NULL, N'test', N'test', N'test1@gmail.com', N'MTIz', N'321', N'0300000000', N'\Uploading\WhatsApp Image 2022-12-07 at 7.33.43 PM.jpeg', NULL, NULL, 1, CAST(N'2022-12-22T00:00:00.000' AS DateTime), 1, CAST(N'2022-12-22T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[tblUser] ([UserId], [username], [LastName], [FirstName], [Email], [Password], [Address], [Phone], [ImagePath], [RoleId], [LastLogin], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (7, NULL, N'Asad', N'Asad', N'bilal@gmail.com', N'YWRtaW4=', N'aaaa', N'03003', N'\Uploading\WhatsApp Image 2022-12-07 at 7.33.43 PM.jpeg', 1, CAST(N'2022-12-24T17:12:54.840' AS DateTime), 1, CAST(N'2022-12-23T00:00:00.000' AS DateTime), 1, CAST(N'2022-12-24T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [username], [LastName], [FirstName], [Email], [Password], [Address], [Phone], [ImagePath], [RoleId], [LastLogin], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (8, N'Customer', N'Customer', N'Customer', N'olaptop05@gmail.com', N'Y3VzdG9tZXI=', N'Model', N'03003', N'\Uploading\user.png', 2, CAST(N'2022-12-26T16:37:57.347' AS DateTime), NULL, CAST(N'2022-12-23T00:00:00.000' AS DateTime), 8, CAST(N'2022-12-24T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [username], [LastName], [FirstName], [Email], [Password], [Address], [Phone], [ImagePath], [RoleId], [LastLogin], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (10, N'Customer1', NULL, N'Customer1', N'customer1@gmail.com', N'Y3VzMQ==', NULL, NULL, N'\Uploading\user.png', 2, CAST(N'2022-12-23T21:06:19.110' AS DateTime), NULL, CAST(N'2022-12-23T00:00:00.000' AS DateTime), 10, CAST(N'2022-12-23T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tblUser] OFF
GO
ALTER TABLE [dbo].[tblAccessLevel]  WITH CHECK ADD  CONSTRAINT [FK_AccessManu] FOREIGN KEY([MenuId])
REFERENCES [dbo].[tblMenu] ([MenuId])
GO
ALTER TABLE [dbo].[tblAccessLevel] CHECK CONSTRAINT [FK_AccessManu]
GO
ALTER TABLE [dbo].[tblAccessLevel]  WITH CHECK ADD  CONSTRAINT [FK_AccessRole] FOREIGN KEY([RoleId])
REFERENCES [dbo].[tblRole] ([RoleId])
GO
ALTER TABLE [dbo].[tblAccessLevel] CHECK CONSTRAINT [FK_AccessRole]
GO
ALTER TABLE [dbo].[tblComponent]  WITH CHECK ADD  CONSTRAINT [FK_tblComponent_tblUser] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[tblUser] ([UserId])
GO
ALTER TABLE [dbo].[tblComponent] CHECK CONSTRAINT [FK_tblComponent_tblUser]
GO
ALTER TABLE [dbo].[tblComponent]  WITH CHECK ADD  CONSTRAINT [FK_tblComponent_tblUser1] FOREIGN KEY([EditBy])
REFERENCES [dbo].[tblUser] ([UserId])
GO
ALTER TABLE [dbo].[tblComponent] CHECK CONSTRAINT [FK_tblComponent_tblUser1]
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD  CONSTRAINT [FK_tblOrder_tblUser] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[tblUser] ([UserId])
GO
ALTER TABLE [dbo].[tblOrder] CHECK CONSTRAINT [FK_tblOrder_tblUser]
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD  CONSTRAINT [FK_tblOrder_tblUser1] FOREIGN KEY([EditBy])
REFERENCES [dbo].[tblUser] ([UserId])
GO
ALTER TABLE [dbo].[tblOrder] CHECK CONSTRAINT [FK_tblOrder_tblUser1]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblComponent] FOREIGN KEY([ComponentId])
REFERENCES [dbo].[tblComponent] ([ComponentId])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblComponent]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblOrder] FOREIGN KEY([OrderId])
REFERENCES [dbo].[tblOrder] ([OrderId])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblOrder]
GO
ALTER TABLE [dbo].[tblSetting]  WITH CHECK ADD  CONSTRAINT [FK_tblSetting_tblUser] FOREIGN KEY([Editby])
REFERENCES [dbo].[tblUser] ([UserId])
GO
ALTER TABLE [dbo].[tblSetting] CHECK CONSTRAINT [FK_tblSetting_tblUser]
GO
ALTER TABLE [dbo].[tblTransaction]  WITH CHECK ADD  CONSTRAINT [FK_tblTransaction_tblOrder] FOREIGN KEY([OrderId])
REFERENCES [dbo].[tblOrder] ([OrderId])
GO
ALTER TABLE [dbo].[tblTransaction] CHECK CONSTRAINT [FK_tblTransaction_tblOrder]
GO
ALTER TABLE [dbo].[tblTransaction]  WITH CHECK ADD  CONSTRAINT [FK_tblTransaction_tblUser] FOREIGN KEY([UserId])
REFERENCES [dbo].[tblUser] ([UserId])
GO
ALTER TABLE [dbo].[tblTransaction] CHECK CONSTRAINT [FK_tblTransaction_tblUser]
GO
ALTER TABLE [dbo].[tblUser]  WITH CHECK ADD  CONSTRAINT [FK_tblUser_tblRole] FOREIGN KEY([RoleId])
REFERENCES [dbo].[tblRole] ([RoleId])
GO
ALTER TABLE [dbo].[tblUser] CHECK CONSTRAINT [FK_tblUser_tblRole]
GO
/****** Object:  StoredProcedure [dbo].[SpOrderNumber]    Script Date: 12/26/2022 8:08:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[SpOrderNumber]
AS
BEGIN

declare @ID as int
declare @res as nvarchar(12)
set @ID=0
SELECT @ID=OrderId FROM tblOrder where OrderId=(SELECT max(OrderId) FROM tblOrder);
IF  @ID IS NOT NULL
		begin
			set @ID=@ID+1
			set @res=('O-00'+CAST(@ID as nvarchar(12)))
		end
		ELSE
		begin
			set @ID=1
			set @res=('O-00'+CAST(@ID as nvarchar(12)))
		end
	    select @res as Invoicenumber
END;
GO
USE [master]
GO
ALTER DATABASE [Automatische] SET  READ_WRITE 
GO
