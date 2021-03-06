USE [master]
GO
/****** Object:  Database [BankContext]    Script Date: 16-Jan-19 19:50:54 ******/
CREATE DATABASE [BankContext]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BankContext', FILENAME = N'/var/opt/mssql/data/BankContext-afea5610-d4cd-47d8-8ae0-6e4372c48298.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BankContext-afea5610-d4cd-47d8-8ae0-6e4372c48298_log', FILENAME = N'/var/opt/mssql/data/BankContext-afea5610-d4cd-47d8-8ae0-6e4372c48298_log.ldf' , SIZE = 1600KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BankContext] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BankContext].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BankContext] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BankContext] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BankContext] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BankContext] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BankContext] SET ARITHABORT OFF 
GO
ALTER DATABASE [BankContext] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BankContext] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BankContext] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BankContext] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BankContext] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BankContext] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BankContext] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BankContext] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BankContext] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BankContext] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BankContext] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BankContext] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BankContext] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BankContext] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BankContext] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BankContext] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [BankContext] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BankContext] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BankContext] SET  MULTI_USER 
GO
ALTER DATABASE [BankContext] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BankContext] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BankContext] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BankContext] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BankContext] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BankContext] SET QUERY_STORE = OFF
GO
USE [BankContext]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [BankContext]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 16-Jan-19 19:50:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 16-Jan-19 19:50:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FromAccount] [bigint] NOT NULL,
	[DestAccount] [bigint] NOT NULL,
	[DestBank] [int] NOT NULL,
	[Date] [datetime2](7) NOT NULL,
	[Constant] [int] NULL,
	[Variable] [int] NULL,
	[Specific] [int] NULL,
	[Message] [nvarchar](max) NULL,
	[Amount] [float] NOT NULL,
	[DestAccountPrefix] [bigint] NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Standing]    Script Date: 16-Jan-19 19:50:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Standing](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Account] [int] NOT NULL,
	[Bank] [int] NOT NULL,
	[Frequency] [int] NOT NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NOT NULL,
	[Constant] [int] NOT NULL,
	[Variable] [int] NOT NULL,
	[Specific] [int] NOT NULL,
	[Message] [nvarchar](max) NULL,
 CONSTRAINT [PK_Standing] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Template]    Script Date: 16-Jan-19 19:50:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Template](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Variable] [int] NULL,
	[Name] [nvarchar](max) NULL,
	[Amount] [float] NOT NULL,
	[Constant] [int] NULL,
	[DestAccount] [bigint] NOT NULL,
	[DestAccountPrefix] [bigint] NULL,
	[DestBank] [int] NOT NULL,
	[Specific] [int] NULL,
 CONSTRAINT [PK_Template] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 16-Jan-19 19:50:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[BirthNumber] [int] NULL,
	[Adress] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Phone] [int] NULL,
	[AccountNumber] [bigint] NULL,
	[CardNumber] [bigint] NULL,
	[Login] [nvarchar](450) NOT NULL,
	[Pin] [nvarchar](max) NOT NULL,
	[Role] [int] NOT NULL,
	[Money] [float] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190102114104_create', N'2.2.0-rtm-35687')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190102124051_create2', N'2.2.0-rtm-35687')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190103200231_user', N'2.2.0-rtm-35687')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190106002606_hash_pin', N'2.2.0-rtm-35687')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190106005430_pin', N'2.2.0-rtm-35687')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190106111634_unique', N'2.2.0-rtm-35687')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190106170548_nullAccount', N'2.2.0-rtm-35687')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190107142755_payment', N'2.2.0-rtm-35687')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190107153553_moneyDouble', N'2.2.0-rtm-35687')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190107192557_fk', N'2.2.0-rtm-35687')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190107215700_template', N'2.2.0-rtm-35687')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190107222704_template2', N'2.2.0-rtm-35687')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190107224120_template3', N'2.2.0-rtm-35687')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190107230648_dalsizkurvenamigrace', N'2.2.0-rtm-35687')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190107230720_dalsizkurvenamigraceNo2', N'2.2.0-rtm-35687')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190107231107_uzmetovaznesere', N'2.2.0-rtm-35687')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190107231249_aaaaaaaaaaaaaaaaaaaaaaaaaaaaa', N'2.2.0-rtm-35687')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190107234601_pomuzeto', N'2.2.0-rtm-35687')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190108023227_zebyuzkonecne', N'2.2.0-rtm-35687')
SET IDENTITY_INSERT [dbo].[Payment] ON 

INSERT [dbo].[Payment] ([Id], [FromAccount], [DestAccount], [DestBank], [Date], [Constant], [Variable], [Specific], [Message], [Amount], [DestAccountPrefix], [UserId]) VALUES (6, 123, 24333, 666, CAST(N'2019-01-07T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 54345, 3453, 19)
INSERT [dbo].[Payment] ([Id], [FromAccount], [DestAccount], [DestBank], [Date], [Constant], [Variable], [Specific], [Message], [Amount], [DestAccountPrefix], [UserId]) VALUES (7, 555, 555, 555, CAST(N'2019-01-07T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 1000, 555, 29)
INSERT [dbo].[Payment] ([Id], [FromAccount], [DestAccount], [DestBank], [Date], [Constant], [Variable], [Specific], [Message], [Amount], [DestAccountPrefix], [UserId]) VALUES (8, 123, 425452, 100, CAST(N'2019-01-07T00:00:00.0000000' AS DateTime2), 4566, 45656666, 6555555, N'Ahoj svete!', 5555, NULL, 19)
INSERT [dbo].[Payment] ([Id], [FromAccount], [DestAccount], [DestBank], [Date], [Constant], [Variable], [Specific], [Message], [Amount], [DestAccountPrefix], [UserId]) VALUES (9, 123, 4554455445, 300, CAST(N'2019-01-07T00:00:00.0000000' AS DateTime2), 4545, 454554, 4545, N'ghghghgf', 123575, NULL, 19)
INSERT [dbo].[Payment] ([Id], [FromAccount], [DestAccount], [DestBank], [Date], [Constant], [Variable], [Specific], [Message], [Amount], [DestAccountPrefix], [UserId]) VALUES (10, 123, 45545, 45, CAST(N'2019-01-07T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 45656645, NULL, 19)
INSERT [dbo].[Payment] ([Id], [FromAccount], [DestAccount], [DestBank], [Date], [Constant], [Variable], [Specific], [Message], [Amount], [DestAccountPrefix], [UserId]) VALUES (11, 123, 56456456, 566, CAST(N'2019-01-07T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 44444, NULL, 19)
INSERT [dbo].[Payment] ([Id], [FromAccount], [DestAccount], [DestBank], [Date], [Constant], [Variable], [Specific], [Message], [Amount], [DestAccountPrefix], [UserId]) VALUES (14, 0, 2555555, 555, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 555555, NULL, 19)
INSERT [dbo].[Payment] ([Id], [FromAccount], [DestAccount], [DestBank], [Date], [Constant], [Variable], [Specific], [Message], [Amount], [DestAccountPrefix], [UserId]) VALUES (15, 123, 4545454545, 454545, CAST(N'2019-01-08T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, N'45564572y5gtrhfkfjkhdggggggggggggggggggggggggggggggggg', 4545454545, NULL, 19)
INSERT [dbo].[Payment] ([Id], [FromAccount], [DestAccount], [DestBank], [Date], [Constant], [Variable], [Specific], [Message], [Amount], [DestAccountPrefix], [UserId]) VALUES (16, 123, 55545, 5455, CAST(N'2019-01-08T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, N'???????????????????????????????????????????????????????????', 555555, NULL, 19)
INSERT [dbo].[Payment] ([Id], [FromAccount], [DestAccount], [DestBank], [Date], [Constant], [Variable], [Specific], [Message], [Amount], [DestAccountPrefix], [UserId]) VALUES (17, 123, 545455, 55, CAST(N'2019-01-08T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 55555, NULL, 19)
INSERT [dbo].[Payment] ([Id], [FromAccount], [DestAccount], [DestBank], [Date], [Constant], [Variable], [Specific], [Message], [Amount], [DestAccountPrefix], [UserId]) VALUES (18, 123, 444444444444, 444, CAST(N'2019-01-08T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 44444, NULL, 19)
INSERT [dbo].[Payment] ([Id], [FromAccount], [DestAccount], [DestBank], [Date], [Constant], [Variable], [Specific], [Message], [Amount], [DestAccountPrefix], [UserId]) VALUES (19, 123, 45463453, 1232, CAST(N'2019-01-08T00:00:00.0000000' AS DateTime2), 111, 5455, 4747, NULL, 12312312, NULL, 19)
INSERT [dbo].[Payment] ([Id], [FromAccount], [DestAccount], [DestBank], [Date], [Constant], [Variable], [Specific], [Message], [Amount], [DestAccountPrefix], [UserId]) VALUES (20, 123, 444444444444, 444, CAST(N'2019-01-08T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, N'TADY JSEM', 44444, NULL, 19)
INSERT [dbo].[Payment] ([Id], [FromAccount], [DestAccount], [DestBank], [Date], [Constant], [Variable], [Specific], [Message], [Amount], [DestAccountPrefix], [UserId]) VALUES (21, 5102038072744956, 0, 0, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 0, NULL, 1032)
INSERT [dbo].[Payment] ([Id], [FromAccount], [DestAccount], [DestBank], [Date], [Constant], [Variable], [Specific], [Message], [Amount], [DestAccountPrefix], [UserId]) VALUES (22, 5102038072744956, 2115626794924683, 0, CAST(N'2019-01-08T00:00:00.0000000' AS DateTime2), 1234, 88888888, 88888888, N'Test payment', 1000, NULL, 1032)
INSERT [dbo].[Payment] ([Id], [FromAccount], [DestAccount], [DestBank], [Date], [Constant], [Variable], [Specific], [Message], [Amount], [DestAccountPrefix], [UserId]) VALUES (23, 5102038072744956, 7777777777, 0, CAST(N'2019-01-08T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 1000, NULL, 1032)
INSERT [dbo].[Payment] ([Id], [FromAccount], [DestAccount], [DestBank], [Date], [Constant], [Variable], [Specific], [Message], [Amount], [DestAccountPrefix], [UserId]) VALUES (24, 5102038072744956, 7777777777, 0, CAST(N'2019-01-08T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 500, NULL, 1032)
INSERT [dbo].[Payment] ([Id], [FromAccount], [DestAccount], [DestBank], [Date], [Constant], [Variable], [Specific], [Message], [Amount], [DestAccountPrefix], [UserId]) VALUES (25, 5102038072744956, 2115626794924683, 666, CAST(N'2019-01-08T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 500, NULL, 1032)
INSERT [dbo].[Payment] ([Id], [FromAccount], [DestAccount], [DestBank], [Date], [Constant], [Variable], [Specific], [Message], [Amount], [DestAccountPrefix], [UserId]) VALUES (26, 5102038072744956, 2115626794924683, 666, CAST(N'2019-01-08T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 500, NULL, 1032)
INSERT [dbo].[Payment] ([Id], [FromAccount], [DestAccount], [DestBank], [Date], [Constant], [Variable], [Specific], [Message], [Amount], [DestAccountPrefix], [UserId]) VALUES (30, 5555555, 1519151, 666, CAST(N'2019-08-26T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 1000, NULL, 19)
INSERT [dbo].[Payment] ([Id], [FromAccount], [DestAccount], [DestBank], [Date], [Constant], [Variable], [Specific], [Message], [Amount], [DestAccountPrefix], [UserId]) VALUES (31, 5555555, 1519151, 666, CAST(N'2019-08-26T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 1000, NULL, 19)
INSERT [dbo].[Payment] ([Id], [FromAccount], [DestAccount], [DestBank], [Date], [Constant], [Variable], [Specific], [Message], [Amount], [DestAccountPrefix], [UserId]) VALUES (32, 5555555, 1519151, 666, CAST(N'2019-08-26T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 1000, NULL, 19)
INSERT [dbo].[Payment] ([Id], [FromAccount], [DestAccount], [DestBank], [Date], [Constant], [Variable], [Specific], [Message], [Amount], [DestAccountPrefix], [UserId]) VALUES (33, 5555555, 1519151, 666, CAST(N'2019-08-26T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 1000, NULL, 19)
INSERT [dbo].[Payment] ([Id], [FromAccount], [DestAccount], [DestBank], [Date], [Constant], [Variable], [Specific], [Message], [Amount], [DestAccountPrefix], [UserId]) VALUES (34, 5555555, 1519151, 666, CAST(N'2019-08-26T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 1000, NULL, 19)
INSERT [dbo].[Payment] ([Id], [FromAccount], [DestAccount], [DestBank], [Date], [Constant], [Variable], [Specific], [Message], [Amount], [DestAccountPrefix], [UserId]) VALUES (35, 5555555, 1519151, 666, CAST(N'2019-08-26T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 1000, NULL, 19)
INSERT [dbo].[Payment] ([Id], [FromAccount], [DestAccount], [DestBank], [Date], [Constant], [Variable], [Specific], [Message], [Amount], [DestAccountPrefix], [UserId]) VALUES (36, 5555555, 1519151, 666, CAST(N'2019-08-26T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 1000, NULL, 19)
INSERT [dbo].[Payment] ([Id], [FromAccount], [DestAccount], [DestBank], [Date], [Constant], [Variable], [Specific], [Message], [Amount], [DestAccountPrefix], [UserId]) VALUES (37, 5555555, 1519151, 666, CAST(N'2019-08-26T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 1000, NULL, 19)
INSERT [dbo].[Payment] ([Id], [FromAccount], [DestAccount], [DestBank], [Date], [Constant], [Variable], [Specific], [Message], [Amount], [DestAccountPrefix], [UserId]) VALUES (38, 5555555, 1519151, 666, CAST(N'2019-08-26T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 1000, NULL, 19)
INSERT [dbo].[Payment] ([Id], [FromAccount], [DestAccount], [DestBank], [Date], [Constant], [Variable], [Specific], [Message], [Amount], [DestAccountPrefix], [UserId]) VALUES (39, 5555555, 1519151, 666, CAST(N'2019-08-26T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, N'ENDE', 1000, NULL, 19)
INSERT [dbo].[Payment] ([Id], [FromAccount], [DestAccount], [DestBank], [Date], [Constant], [Variable], [Specific], [Message], [Amount], [DestAccountPrefix], [UserId]) VALUES (40, 5555555, 1519151, 666, CAST(N'2019-08-26T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 1000, NULL, 19)
INSERT [dbo].[Payment] ([Id], [FromAccount], [DestAccount], [DestBank], [Date], [Constant], [Variable], [Specific], [Message], [Amount], [DestAccountPrefix], [UserId]) VALUES (41, 5555555, 1519151, 666, CAST(N'2019-08-26T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 1000, NULL, 19)
INSERT [dbo].[Payment] ([Id], [FromAccount], [DestAccount], [DestBank], [Date], [Constant], [Variable], [Specific], [Message], [Amount], [DestAccountPrefix], [UserId]) VALUES (42, 5555555, 1519151, 666, CAST(N'2019-08-26T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 1000, NULL, 19)
INSERT [dbo].[Payment] ([Id], [FromAccount], [DestAccount], [DestBank], [Date], [Constant], [Variable], [Specific], [Message], [Amount], [DestAccountPrefix], [UserId]) VALUES (43, 5555555, 1519151, 666, CAST(N'2019-08-26T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 1000, NULL, 19)
INSERT [dbo].[Payment] ([Id], [FromAccount], [DestAccount], [DestBank], [Date], [Constant], [Variable], [Specific], [Message], [Amount], [DestAccountPrefix], [UserId]) VALUES (44, 5555555, 1519151, 666, CAST(N'2019-08-26T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 1000, NULL, 19)
INSERT [dbo].[Payment] ([Id], [FromAccount], [DestAccount], [DestBank], [Date], [Constant], [Variable], [Specific], [Message], [Amount], [DestAccountPrefix], [UserId]) VALUES (45, 5555555, 1519151, 666, CAST(N'2019-08-26T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 1000, NULL, 19)
INSERT [dbo].[Payment] ([Id], [FromAccount], [DestAccount], [DestBank], [Date], [Constant], [Variable], [Specific], [Message], [Amount], [DestAccountPrefix], [UserId]) VALUES (46, 5555555, 1519151, 666, CAST(N'2019-08-26T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 1000, NULL, 19)
INSERT [dbo].[Payment] ([Id], [FromAccount], [DestAccount], [DestBank], [Date], [Constant], [Variable], [Specific], [Message], [Amount], [DestAccountPrefix], [UserId]) VALUES (47, 5555555, 1519151, 666, CAST(N'2019-08-26T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 1000, NULL, 19)
INSERT [dbo].[Payment] ([Id], [FromAccount], [DestAccount], [DestBank], [Date], [Constant], [Variable], [Specific], [Message], [Amount], [DestAccountPrefix], [UserId]) VALUES (48, 5555555, 1519151, 666, CAST(N'2019-08-26T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 1000, NULL, 19)
INSERT [dbo].[Payment] ([Id], [FromAccount], [DestAccount], [DestBank], [Date], [Constant], [Variable], [Specific], [Message], [Amount], [DestAccountPrefix], [UserId]) VALUES (49, 5555555, 1519151, 666, CAST(N'2019-08-26T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 1000, NULL, 19)
INSERT [dbo].[Payment] ([Id], [FromAccount], [DestAccount], [DestBank], [Date], [Constant], [Variable], [Specific], [Message], [Amount], [DestAccountPrefix], [UserId]) VALUES (50, 5555555, 1519151, 666, CAST(N'2019-08-26T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 1000, NULL, 19)
INSERT [dbo].[Payment] ([Id], [FromAccount], [DestAccount], [DestBank], [Date], [Constant], [Variable], [Specific], [Message], [Amount], [DestAccountPrefix], [UserId]) VALUES (51, 5555555, 1519151, 666, CAST(N'2019-08-26T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 1000, NULL, 19)
INSERT [dbo].[Payment] ([Id], [FromAccount], [DestAccount], [DestBank], [Date], [Constant], [Variable], [Specific], [Message], [Amount], [DestAccountPrefix], [UserId]) VALUES (52, 5555555, 1519151, 666, CAST(N'2019-08-26T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 1000, NULL, 19)
INSERT [dbo].[Payment] ([Id], [FromAccount], [DestAccount], [DestBank], [Date], [Constant], [Variable], [Specific], [Message], [Amount], [DestAccountPrefix], [UserId]) VALUES (53, 5555555, 1519151, 666, CAST(N'2019-08-26T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 1000, NULL, 19)
INSERT [dbo].[Payment] ([Id], [FromAccount], [DestAccount], [DestBank], [Date], [Constant], [Variable], [Specific], [Message], [Amount], [DestAccountPrefix], [UserId]) VALUES (54, 5555555, 1519151, 666, CAST(N'2019-08-26T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 1000, NULL, 19)
INSERT [dbo].[Payment] ([Id], [FromAccount], [DestAccount], [DestBank], [Date], [Constant], [Variable], [Specific], [Message], [Amount], [DestAccountPrefix], [UserId]) VALUES (55, 5555555, 1519151, 666, CAST(N'2019-08-26T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 1000, NULL, 19)
INSERT [dbo].[Payment] ([Id], [FromAccount], [DestAccount], [DestBank], [Date], [Constant], [Variable], [Specific], [Message], [Amount], [DestAccountPrefix], [UserId]) VALUES (56, 5555555, 1519151, 666, CAST(N'2019-08-26T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 1000, NULL, 19)
INSERT [dbo].[Payment] ([Id], [FromAccount], [DestAccount], [DestBank], [Date], [Constant], [Variable], [Specific], [Message], [Amount], [DestAccountPrefix], [UserId]) VALUES (57, 5555555, 1519151, 666, CAST(N'2019-08-26T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 1000, NULL, 19)
INSERT [dbo].[Payment] ([Id], [FromAccount], [DestAccount], [DestBank], [Date], [Constant], [Variable], [Specific], [Message], [Amount], [DestAccountPrefix], [UserId]) VALUES (58, 5555555, 1519151, 666, CAST(N'2019-08-26T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, NULL, 1000, NULL, 19)
INSERT [dbo].[Payment] ([Id], [FromAccount], [DestAccount], [DestBank], [Date], [Constant], [Variable], [Specific], [Message], [Amount], [DestAccountPrefix], [UserId]) VALUES (59, 5555555, 1519151, 666, CAST(N'2019-08-26T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, N'ENDE', 1000, NULL, 19)
INSERT [dbo].[Payment] ([Id], [FromAccount], [DestAccount], [DestBank], [Date], [Constant], [Variable], [Specific], [Message], [Amount], [DestAccountPrefix], [UserId]) VALUES (60, 5555555, 1519151, 666, CAST(N'2019-08-26T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, N'ENDE', 1000, NULL, 19)
SET IDENTITY_INSERT [dbo].[Payment] OFF
SET IDENTITY_INSERT [dbo].[Template] ON 

INSERT [dbo].[Template] ([Id], [UserId], [Variable], [Name], [Amount], [Constant], [DestAccount], [DestAccountPrefix], [DestBank], [Specific]) VALUES (8, 19, 5455, N'asfsdfgf', 12312312, 111, 45463453, NULL, 1232, 4747)
INSERT [dbo].[Template] ([Id], [UserId], [Variable], [Name], [Amount], [Constant], [DestAccount], [DestAccountPrefix], [DestBank], [Specific]) VALUES (10, 19, NULL, N'qqqq', 44444, NULL, 444444444444, NULL, 444, NULL)
SET IDENTITY_INSERT [dbo].[Template] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [Name], [BirthNumber], [Adress], [Email], [Phone], [AccountNumber], [CardNumber], [Login], [Pin], [Role], [Money]) VALUES (17, N'Admin', 0, N'no', N'admin@admin.com', 0, 0, 0, N'147', N'97-A3-24-F5-13-20-3D-D6-F9-23-5F-7F-81-57-2F-72-7A-0D-58-39-D3-91-CA-94-2B-D5-33-92-A8-5A-4D-D0', 1, 0)
INSERT [dbo].[User] ([Id], [Name], [BirthNumber], [Adress], [Email], [Phone], [AccountNumber], [CardNumber], [Login], [Pin], [Role], [Money]) VALUES (19, N'123', 123, N'no', N'e@e.e', 12322, 123, 789, N'123', N'A5-DC-F5-B8-41-8D-FA-FE-C1-60-79-14-8E-C9-0C-F8-1D-FC-62-76-C1-CC-E2-20-01-7C-78-2E-CB-7D-7A-EA', 0, 95395708481)
INSERT [dbo].[User] ([Id], [Name], [BirthNumber], [Adress], [Email], [Phone], [AccountNumber], [CardNumber], [Login], [Pin], [Role], [Money]) VALUES (29, N'jklhkljlh', 5645345, NULL, N'e@e.e', NULL, 4545656, 45456456456, N'71355853', N'B5-A7-24-72-6E-56-7F-72-32-F9-75-49-54-AE-51-6F-BC-27-D4-78-64-51-70-5F-35-B7-E1-35-40-C6-07-E8', 0, NULL)
INSERT [dbo].[User] ([Id], [Name], [BirthNumber], [Adress], [Email], [Phone], [AccountNumber], [CardNumber], [Login], [Pin], [Role], [Money]) VALUES (32, N'jklhkljlh', 45353453, NULL, N'e@e.e', NULL, 2115626794924683, 7613278445248443, N'39849973', N'D2-E9-EE-C0-3A-B1-76-C3-54-D3-22-33-E5-1D-A4-2E-70-79-FE-D4-21-A7-AA-6B-8E-04-E3-1A-2C-81-88-81', 0, 1000)
INSERT [dbo].[User] ([Id], [Name], [BirthNumber], [Adress], [Email], [Phone], [AccountNumber], [CardNumber], [Login], [Pin], [Role], [Money]) VALUES (33, N'jklhkljlh', 572, NULL, N'e@e.e', NULL, 8013361398106767, 7931486974322128, N'19040344', N'E5-59-8A-E9-1E-82-B7-2E-93-43-CB-D5-40-9F-0B-82-E4-0C-82-A1-69-F0-DF-86-D3-0D-F1-34-9A-46-1E-34', 0, 0)
INSERT [dbo].[User] ([Id], [Name], [BirthNumber], [Adress], [Email], [Phone], [AccountNumber], [CardNumber], [Login], [Pin], [Role], [Money]) VALUES (1029, N'Admin001', 0, NULL, N'admin@admin.com', NULL, NULL, NULL, N'Admin001', N'F1-04-A7-85-7C-79-51-99-2B-A8-FB-4D-E1-6B-D6-B9-56-95-FD-85-32-15-70-B1-77-FD-D1-BD-F7-07-0A-E9', 1, NULL)
INSERT [dbo].[User] ([Id], [Name], [BirthNumber], [Adress], [Email], [Phone], [AccountNumber], [CardNumber], [Login], [Pin], [Role], [Money]) VALUES (1030, N'User0001', 0, NULL, N'e@e.e', NULL, 2199978855608006, 7851066013212095, N'User0001', N'67-AB-DD-72-10-24-F0-FF-4E-0B-3F-4C-2F-C1-3B-C5-BA-D4-2D-0B-78-51-D4-56-D8-8D-20-3D-15-AA-A4-50', 0, 0)
INSERT [dbo].[User] ([Id], [Name], [BirthNumber], [Adress], [Email], [Phone], [AccountNumber], [CardNumber], [Login], [Pin], [Role], [Money]) VALUES (1031, N'User0002', 0, NULL, N'e@e.e', NULL, 6680223485878089, 6708619055304708, N'User0002', N'26-B2-5D-45-75-97-A7-B0-46-3F-96-20-F6-66-DD-10-AA-2C-43-73-A5-05-96-7C-7C-8D-70-92-2A-2D-6E-CE', 0, 0)
INSERT [dbo].[User] ([Id], [Name], [BirthNumber], [Adress], [Email], [Phone], [AccountNumber], [CardNumber], [Login], [Pin], [Role], [Money]) VALUES (1032, N'Me', 7553, NULL, N'pivovar.david@gmail.com', NULL, 5102038072744956, 5395305873823515, N'27141478', N'5B-4D-16-60-38-E3-AE-FA-38-CB-B8-58-9E-12-81-31-F8-4A-90-27-53-43-F7-1C-28-A1-89-2D-B0-B4-91-A2', 0, 96500)
SET IDENTITY_INSERT [dbo].[User] OFF
/****** Object:  Index [IX_Payment_UserId]    Script Date: 16-Jan-19 19:50:54 ******/
CREATE NONCLUSTERED INDEX [IX_Payment_UserId] ON [dbo].[Payment]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Template_UserId]    Script Date: 16-Jan-19 19:50:54 ******/
CREATE NONCLUSTERED INDEX [IX_Template_UserId] ON [dbo].[Template]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_User_Login]    Script Date: 16-Jan-19 19:50:54 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_User_Login] ON [dbo].[User]
(
	[Login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Payment] ADD  DEFAULT ((0.000000000000000e+000)) FOR [Amount]
GO
ALTER TABLE [dbo].[Payment] ADD  DEFAULT ((0)) FOR [UserId]
GO
ALTER TABLE [dbo].[Template] ADD  DEFAULT ((0.000000000000000e+000)) FOR [Amount]
GO
ALTER TABLE [dbo].[Template] ADD  DEFAULT (CONVERT([bigint],(0))) FOR [DestAccount]
GO
ALTER TABLE [dbo].[Template] ADD  DEFAULT ((0)) FOR [DestBank]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_User_UserId]
GO
ALTER TABLE [dbo].[Template]  WITH CHECK ADD  CONSTRAINT [FK_Template_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Template] CHECK CONSTRAINT [FK_Template_User_UserId]
GO
USE [master]
GO
ALTER DATABASE [BankContext] SET  READ_WRITE 
GO
