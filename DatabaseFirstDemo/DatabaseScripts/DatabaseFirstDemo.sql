USE [master]
GO
/****** Object:  Database [DatabaseFirstDemo2]    Script Date: 10.7.2020. 13:59:44 ******/
CREATE DATABASE [DatabaseFirstDemo2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DatabaseFirstDemo2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\DatabaseFirstDemo2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DatabaseFirstDemo2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\DatabaseFirstDemo2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DatabaseFirstDemo2] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DatabaseFirstDemo2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DatabaseFirstDemo2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DatabaseFirstDemo2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DatabaseFirstDemo2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DatabaseFirstDemo2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DatabaseFirstDemo2] SET ARITHABORT OFF 
GO
ALTER DATABASE [DatabaseFirstDemo2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DatabaseFirstDemo2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DatabaseFirstDemo2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DatabaseFirstDemo2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DatabaseFirstDemo2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DatabaseFirstDemo2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DatabaseFirstDemo2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DatabaseFirstDemo2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DatabaseFirstDemo2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DatabaseFirstDemo2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DatabaseFirstDemo2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DatabaseFirstDemo2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DatabaseFirstDemo2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DatabaseFirstDemo2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DatabaseFirstDemo2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DatabaseFirstDemo2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DatabaseFirstDemo2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DatabaseFirstDemo2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DatabaseFirstDemo2] SET  MULTI_USER 
GO
ALTER DATABASE [DatabaseFirstDemo2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DatabaseFirstDemo2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DatabaseFirstDemo2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DatabaseFirstDemo2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DatabaseFirstDemo2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DatabaseFirstDemo2] SET QUERY_STORE = OFF
GO
USE [DatabaseFirstDemo2]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 10.7.2020. 13:59:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[PostID] [int] IDENTITY(1,1) NOT NULL,
	[DatePublished] [smalldatetime] NULL,
	[Title] [varchar](500) NULL,
	[Body] [varchar](8000) NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Posts] ON 

INSERT [dbo].[Posts] ([PostID], [DatePublished], [Title], [Body]) VALUES (1, CAST(N'2020-07-10T11:12:00' AS SmallDateTime), N'Post Title', N'Post Body')
INSERT [dbo].[Posts] ([PostID], [DatePublished], [Title], [Body]) VALUES (2, CAST(N'2020-07-10T11:25:00' AS SmallDateTime), N'Post Title', N'Post Body')
INSERT [dbo].[Posts] ([PostID], [DatePublished], [Title], [Body]) VALUES (3, CAST(N'2020-07-10T11:29:00' AS SmallDateTime), N'Post Title', N'Post Body')
SET IDENTITY_INSERT [dbo].[Posts] OFF
USE [master]
GO
ALTER DATABASE [DatabaseFirstDemo2] SET  READ_WRITE 
GO
