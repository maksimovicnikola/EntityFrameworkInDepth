USE [master]
GO
/****** Object:  Database [Vidzy]    Script Date: 10.7.2020. 17:32:53 ******/
CREATE DATABASE [Vidzy]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Vidzy', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Vidzy.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Vidzy_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Vidzy_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Vidzy] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Vidzy].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Vidzy] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Vidzy] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Vidzy] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Vidzy] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Vidzy] SET ARITHABORT OFF 
GO
ALTER DATABASE [Vidzy] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Vidzy] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Vidzy] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Vidzy] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Vidzy] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Vidzy] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Vidzy] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Vidzy] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Vidzy] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Vidzy] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Vidzy] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Vidzy] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Vidzy] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Vidzy] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Vidzy] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Vidzy] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Vidzy] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Vidzy] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Vidzy] SET  MULTI_USER 
GO
ALTER DATABASE [Vidzy] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Vidzy] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Vidzy] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Vidzy] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Vidzy] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Vidzy] SET QUERY_STORE = OFF
GO
USE [Vidzy]
GO
/****** Object:  Table [dbo].[Classifications]    Script Date: 10.7.2020. 17:32:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classifications](
	[Id] [tinyint] NOT NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Classifications] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genres]    Script Date: 10.7.2020. 17:32:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genres](
	[Id] [tinyint] NOT NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Genres] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Videos]    Script Date: 10.7.2020. 17:32:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Videos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[ReleaseDate] [datetime] NOT NULL,
	[GenreId] [tinyint] NOT NULL,
	[ClassificationId] [tinyint] NOT NULL,
 CONSTRAINT [PK_Videos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Classifications] ([Id], [Name]) VALUES (1, N'Silver')
INSERT [dbo].[Classifications] ([Id], [Name]) VALUES (2, N'Gold')
INSERT [dbo].[Classifications] ([Id], [Name]) VALUES (3, N'Platinum')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (1, N'Comedy')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (2, N'Action')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (3, N'Horror')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (4, N'Thriller')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (5, N'Family')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (6, N'Romance')
ALTER TABLE [dbo].[Videos]  WITH CHECK ADD  CONSTRAINT [FK_Videos_Classifications] FOREIGN KEY([ClassificationId])
REFERENCES [dbo].[Classifications] ([Id])
GO
ALTER TABLE [dbo].[Videos] CHECK CONSTRAINT [FK_Videos_Classifications]
GO
ALTER TABLE [dbo].[Videos]  WITH CHECK ADD  CONSTRAINT [FK_Videos_Genres] FOREIGN KEY([GenreId])
REFERENCES [dbo].[Genres] ([Id])
GO
ALTER TABLE [dbo].[Videos] CHECK CONSTRAINT [FK_Videos_Genres]
GO
/****** Object:  StoredProcedure [dbo].[spAddVideo]    Script Date: 10.7.2020. 17:32:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Batch submitted through debugger: SQLQuery55.sql|7|0|C:\Users\Nikola\AppData\Local\Temp\~vsA81D.sql
CREATE PROCEDURE [dbo].[spAddVideo]
(
	@Name varchar(255),
	@ReleaseDate datetime,
	@GenreId tinyInt,
	@ClassificationId tinyInt
)
AS
	DECLARE @defaultClassificationId tinyInt

	--If classification is null, we should set 1 because it is a default value 
	IF (@ClassificationId IS NULL)
	BEGIN
		SET @defaultClassificationId = 1;
	END
	ELSE
	BEGIN
		SET @defaultClassificationId = @ClassificationId;
	END


	INSERT INTO Videos (Name, ReleaseDate, GenreId, ClassificationId)
	VALUES (@Name, @ReleaseDate, @GenreId, @defaultClassificationId)
GO
USE [master]
GO
ALTER DATABASE [Vidzy] SET  READ_WRITE 
GO
