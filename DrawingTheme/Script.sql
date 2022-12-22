USE [master]
GO
/****** Object:  Database [Automatische]    Script Date: 12/22/2022 9:48:28 PM ******/
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
/****** Object:  Table [dbo].[tblAccessLevel]    Script Date: 12/22/2022 9:48:29 PM ******/
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
/****** Object:  Table [dbo].[tblLog]    Script Date: 12/22/2022 9:48:29 PM ******/
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
/****** Object:  Table [dbo].[tblMenu]    Script Date: 12/22/2022 9:48:29 PM ******/
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
/****** Object:  Table [dbo].[tblRole]    Script Date: 12/22/2022 9:48:29 PM ******/
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
/****** Object:  Table [dbo].[tblUser]    Script Date: 12/22/2022 9:48:29 PM ******/
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

INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (10, NULL, NULL, NULL, 1, 1, 1, CAST(N'2022-12-22T20:53:58.490' AS DateTime), 1, CAST(N'2022-12-22T20:53:58.490' AS DateTime), 1)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (11, NULL, NULL, NULL, 2, 1, 1, CAST(N'2022-12-22T20:53:58.493' AS DateTime), 1, CAST(N'2022-12-22T20:53:58.493' AS DateTime), 1)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (12, NULL, NULL, NULL, 3, 1, 1, CAST(N'2022-12-22T20:53:58.497' AS DateTime), 1, CAST(N'2022-12-22T20:53:58.497' AS DateTime), 1)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (13, NULL, NULL, NULL, 4, 1, 1, CAST(N'2022-12-22T20:53:58.497' AS DateTime), 1, CAST(N'2022-12-22T20:53:58.497' AS DateTime), 1)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (14, NULL, NULL, NULL, 5, 1, 1, CAST(N'2022-12-22T20:53:58.500' AS DateTime), 1, CAST(N'2022-12-22T20:53:58.500' AS DateTime), 1)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (15, NULL, NULL, NULL, 6, 1, 1, CAST(N'2022-12-22T20:53:58.500' AS DateTime), 1, CAST(N'2022-12-22T20:53:58.500' AS DateTime), 1)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (16, NULL, NULL, NULL, 7, 1, 1, CAST(N'2022-12-22T20:53:58.503' AS DateTime), 1, CAST(N'2022-12-22T20:53:58.503' AS DateTime), 1)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (17, NULL, NULL, NULL, 8, 1, 1, CAST(N'2022-12-22T20:53:58.503' AS DateTime), 1, CAST(N'2022-12-22T20:53:58.503' AS DateTime), 0)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (18, NULL, NULL, NULL, 9, 1, 1, CAST(N'2022-12-22T20:53:58.503' AS DateTime), 1, CAST(N'2022-12-22T20:53:58.503' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tblAccessLevel] OFF
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
SET IDENTITY_INSERT [dbo].[tblMenu] OFF
GO
SET IDENTITY_INSERT [dbo].[tblRole] ON 

INSERT [dbo].[tblRole] ([RoleId], [Role], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (1, N'Admin', 1, CAST(N'2022-12-22T00:00:00.000' AS DateTime), 1, CAST(N'2022-12-22T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tblRole] OFF
GO
SET IDENTITY_INSERT [dbo].[tblUser] ON 

INSERT [dbo].[tblUser] ([UserId], [username], [LastName], [FirstName], [Email], [Password], [Address], [Phone], [ImagePath], [RoleId], [LastLogin], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (1, N'Admin', N'Admin', N'Admin', N'admin@gmail.com', N'YWRtaW4=', N'321', N'321', N'\Uploading\WhatsApp Image 2022-12-07 at 7.33.43 PM.jpeg', 1, CAST(N'2022-12-22T21:39:11.720' AS DateTime), 1, NULL, 1, CAST(N'2022-12-22T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [username], [LastName], [FirstName], [Email], [Password], [Address], [Phone], [ImagePath], [RoleId], [LastLogin], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (2, NULL, N'test3', N'test3', N'test@gmail.com', N'MTIz', N'3213', N'03003', N'\Uploading\WhatsApp Image 2022-12-07 at 7.33.43 PM.jpeg', NULL, NULL, 1, CAST(N'2022-12-22T00:00:00.000' AS DateTime), 1, CAST(N'2022-12-22T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [username], [LastName], [FirstName], [Email], [Password], [Address], [Phone], [ImagePath], [RoleId], [LastLogin], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (3, NULL, N'test', N'test', N'add@lender.com', N'MTIz', N'321', N'0300000000', N'\Uploading\WhatsApp Image 2022-12-07 at 7.33.43 PM.jpeg', NULL, NULL, 1, CAST(N'2022-12-22T00:00:00.000' AS DateTime), 1, CAST(N'2022-12-22T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[tblUser] ([UserId], [username], [LastName], [FirstName], [Email], [Password], [Address], [Phone], [ImagePath], [RoleId], [LastLogin], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (4, NULL, N'test', N'test', N'test1@gmail.com', N'MTIz', N'321', N'0300000000', N'\Uploading\WhatsApp Image 2022-12-07 at 7.33.43 PM.jpeg', NULL, NULL, 1, CAST(N'2022-12-22T00:00:00.000' AS DateTime), 1, CAST(N'2022-12-22T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[tblUser] ([UserId], [username], [LastName], [FirstName], [Email], [Password], [Address], [Phone], [ImagePath], [RoleId], [LastLogin], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (6, NULL, N'test', N'test', N'test3@gmail.com', N'MTIz', N'321', N'03210000000', N'\Uploading\WhatsApp Image 2022-12-07 at 7.33.43 PM.jpeg', NULL, NULL, 1, CAST(N'2022-12-22T00:00:00.000' AS DateTime), 1, CAST(N'2022-12-22T00:00:00.000' AS DateTime), 1)
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
ALTER TABLE [dbo].[tblLog]  WITH CHECK ADD  CONSTRAINT [FK_tblLog_tblUser] FOREIGN KEY([UserId])
REFERENCES [dbo].[tblUser] ([UserId])
GO
ALTER TABLE [dbo].[tblLog] CHECK CONSTRAINT [FK_tblLog_tblUser]
GO
ALTER TABLE [dbo].[tblUser]  WITH CHECK ADD  CONSTRAINT [FK_CreatedByUserUser] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[tblUser] ([UserId])
GO
ALTER TABLE [dbo].[tblUser] CHECK CONSTRAINT [FK_CreatedByUserUser]
GO
ALTER TABLE [dbo].[tblUser]  WITH CHECK ADD  CONSTRAINT [FK_EditByUserUser] FOREIGN KEY([EditBy])
REFERENCES [dbo].[tblUser] ([UserId])
GO
ALTER TABLE [dbo].[tblUser] CHECK CONSTRAINT [FK_EditByUserUser]
GO
ALTER TABLE [dbo].[tblUser]  WITH CHECK ADD  CONSTRAINT [FK_tblUser_tblRole] FOREIGN KEY([RoleId])
REFERENCES [dbo].[tblRole] ([RoleId])
GO
ALTER TABLE [dbo].[tblUser] CHECK CONSTRAINT [FK_tblUser_tblRole]
GO
USE [master]
GO
ALTER DATABASE [Automatische] SET  READ_WRITE 
GO
