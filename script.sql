USE [master]
GO
/****** Object:  Database [Lab1]    Script Date: 05/11/2018 14:44:50 ******/
CREATE DATABASE [Lab1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Lab1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Lab1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Lab1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Lab1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Lab1] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Lab1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Lab1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Lab1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Lab1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Lab1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Lab1] SET ARITHABORT OFF 
GO
ALTER DATABASE [Lab1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Lab1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Lab1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Lab1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Lab1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Lab1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Lab1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Lab1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Lab1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Lab1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Lab1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Lab1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Lab1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Lab1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Lab1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Lab1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Lab1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Lab1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Lab1] SET  MULTI_USER 
GO
ALTER DATABASE [Lab1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Lab1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Lab1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Lab1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Lab1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Lab1] SET QUERY_STORE = OFF
GO
USE [Lab1]
GO
/****** Object:  Table [dbo].[methods]    Script Date: 05/11/2018 14:44:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[methods](
	[id] [int] NOT NULL,
	[id_service] [int] NOT NULL,
	[method] [varchar](100) NOT NULL,
 CONSTRAINT [PK_methods] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[parameters]    Script Date: 05/11/2018 14:44:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[parameters](
	[id] [int] NOT NULL,
	[id_methods] [int] NOT NULL,
	[parameter] [varchar](100) NULL,
 CONSTRAINT [PK_parameters] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[service]    Script Date: 05/11/2018 14:44:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[service](
	[id] [int] NOT NULL,
	[name] [varchar](100) NOT NULL,
	[address] [varchar](100) NOT NULL,
 CONSTRAINT [PK_service] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[methods]  WITH CHECK ADD  CONSTRAINT [FK_methods_service1] FOREIGN KEY([id_service])
REFERENCES [dbo].[service] ([id])
GO
ALTER TABLE [dbo].[methods] CHECK CONSTRAINT [FK_methods_service1]
GO
ALTER TABLE [dbo].[parameters]  WITH CHECK ADD  CONSTRAINT [FK_parameters_methods] FOREIGN KEY([id_methods])
REFERENCES [dbo].[methods] ([id])
GO
ALTER TABLE [dbo].[parameters] CHECK CONSTRAINT [FK_parameters_methods]
GO
USE [master]
GO
ALTER DATABASE [Lab1] SET  READ_WRITE 
GO
