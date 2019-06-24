CREATE DATABASE [FileArchive]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FileArchive', FILENAME = N'D:\Databases\FileArchive\FileArchive.mdf' , SIZE = 4096KB , FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FileArchive_log', FILENAME = N'D:\Databases\FileArchive\FileArchive_log.ldf' , SIZE = 1024KB , FILEGROWTH = 10%)
GO
ALTER DATABASE [FileArchive] SET COMPATIBILITY_LEVEL = 110
GO
ALTER DATABASE [FileArchive] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FileArchive] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FileArchive] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FileArchive] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FileArchive] SET ARITHABORT OFF 
GO
ALTER DATABASE [FileArchive] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FileArchive] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [FileArchive] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FileArchive] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FileArchive] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FileArchive] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FileArchive] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FileArchive] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FileArchive] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FileArchive] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FileArchive] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FileArchive] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FileArchive] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FileArchive] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FileArchive] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FileArchive] SET  READ_WRITE 
GO
ALTER DATABASE [FileArchive] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FileArchive] SET  MULTI_USER 
GO
ALTER DATABASE [FileArchive] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FileArchive] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [FileArchive]
GO
IF NOT EXISTS (SELECT name FROM sys.filegroups WHERE is_default=1 AND name = N'PRIMARY') ALTER DATABASE [FileArchive] MODIFY FILEGROUP [PRIMARY] DEFAULT
GO


 --Add FileStream

use FileArchive
go

ALTER DATABASE FileArchive
ADD FILEGROUP FileArchive_FileGroup CONTAINS FILESTREAM
GO

ALTER DATABASE FileArchive
ADD FILE (NAME='FileArchive_Body_File', FILENAME='D:\Databases\FileArchive_FileBody')
TO FILEGROUP FileArchive_FileGroup 
GO

--USE FileArchive
--ALTER Table Files
--Add Id uniqueidentifier not null ROWGUIDCOL unique default NEWSEQUENTIALID()
--GO

--USE FileArchive
--ALTER Table Files
--SET (filestream_on=FileArchive_FileGroup)
--GO

--USE FileArchive
--ALTER Table Files
--Add Body varbinary(max) FILESTREAM null

--GO

