USE [master]
GO
/****** Object:  Database [MovieStudio]    Script Date: 09-07-2019 14:29:17 ******/
CREATE DATABASE [MovieStudio]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MovieStudio', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\MovieStudio.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MovieStudio_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\MovieStudio_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MovieStudio] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MovieStudio].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MovieStudio] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MovieStudio] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MovieStudio] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MovieStudio] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MovieStudio] SET ARITHABORT OFF 
GO
ALTER DATABASE [MovieStudio] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MovieStudio] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MovieStudio] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MovieStudio] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MovieStudio] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MovieStudio] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MovieStudio] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MovieStudio] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MovieStudio] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MovieStudio] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MovieStudio] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MovieStudio] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MovieStudio] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MovieStudio] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MovieStudio] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MovieStudio] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MovieStudio] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MovieStudio] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MovieStudio] SET  MULTI_USER 
GO
ALTER DATABASE [MovieStudio] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MovieStudio] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MovieStudio] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MovieStudio] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [MovieStudio] SET DELAYED_DURABILITY = DISABLED 
GO
USE [MovieStudio]
GO
/****** Object:  Table [dbo].[Actor]    Script Date: 09-07-2019 14:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Actor](
	[ActorId] [int] IDENTITY(1,1) NOT NULL,
	[ActorFirstName] [varchar](50) NOT NULL,
	[ActorLastName] [varchar](50) NOT NULL,
	[GenderId] [tinyint] NOT NULL,
 CONSTRAINT [PK_Actor] PRIMARY KEY CLUSTERED 
(
	[ActorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 09-07-2019 14:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gender](
	[GenderId] [tinyint] IDENTITY(1,1) NOT NULL,
	[GenderName] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[GenderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Genre]    Script Date: 09-07-2019 14:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Genre](
	[GenreId] [tinyint] IDENTITY(1,1) NOT NULL,
	[GenreName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Genres] PRIMARY KEY CLUSTERED 
(
	[GenreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Movie]    Script Date: 09-07-2019 14:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Movie](
	[MovieId] [int] IDENTITY(1,1) NOT NULL,
	[MovieTitle] [varchar](50) NOT NULL,
	[MovieDescription] [varchar](100) NOT NULL,
	[MovieReleaseDate] [date] NOT NULL,
	[MovieLength] [tinyint] NOT NULL,
	[GenreId] [tinyint] NOT NULL,
	[RatingId] [int] NOT NULL,
 CONSTRAINT [PK_Movie] PRIMARY KEY CLUSTERED 
(
	[MovieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MovieCast]    Script Date: 09-07-2019 14:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MovieCast](
	[MovieCastId] [int] IDENTITY(1,1) NOT NULL,
	[MovieId] [int] NOT NULL,
	[ActorId] [int] NOT NULL,
	[MovieCastRole] [varchar](50) NOT NULL,
 CONSTRAINT [PK_MovieCast] PRIMARY KEY CLUSTERED 
(
	[MovieCastId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 09-07-2019 14:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rating](
	[RatingId] [int] IDENTITY(1,1) NOT NULL,
	[RatingName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Ratings] PRIMARY KEY CLUSTERED 
(
	[RatingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Actor] ON 

INSERT [dbo].[Actor] ([ActorId], [ActorFirstName], [ActorLastName], [GenderId]) VALUES (1, N'Shahrukh', N'Khan', 1)
INSERT [dbo].[Actor] ([ActorId], [ActorFirstName], [ActorLastName], [GenderId]) VALUES (2, N'Salman', N'Khan', 1)
INSERT [dbo].[Actor] ([ActorId], [ActorFirstName], [ActorLastName], [GenderId]) VALUES (3, N'Varun', N'Dhavan', 1)
INSERT [dbo].[Actor] ([ActorId], [ActorFirstName], [ActorLastName], [GenderId]) VALUES (4, N'Ranvir', N'Singh', 1)
INSERT [dbo].[Actor] ([ActorId], [ActorFirstName], [ActorLastName], [GenderId]) VALUES (5, N'Shahid', N'Kapoor', 1)
INSERT [dbo].[Actor] ([ActorId], [ActorFirstName], [ActorLastName], [GenderId]) VALUES (6, N'Deepika', N'Padukone', 2)
INSERT [dbo].[Actor] ([ActorId], [ActorFirstName], [ActorLastName], [GenderId]) VALUES (7, N'Alia', N'Bhat', 2)
INSERT [dbo].[Actor] ([ActorId], [ActorFirstName], [ActorLastName], [GenderId]) VALUES (8, N'Anushka', N'Sharma', 2)
INSERT [dbo].[Actor] ([ActorId], [ActorFirstName], [ActorLastName], [GenderId]) VALUES (9, N'Katrina', N'Kaif', 2)
SET IDENTITY_INSERT [dbo].[Actor] OFF
SET IDENTITY_INSERT [dbo].[Gender] ON 

INSERT [dbo].[Gender] ([GenderId], [GenderName]) VALUES (1, N'Male')
INSERT [dbo].[Gender] ([GenderId], [GenderName]) VALUES (2, N'Female')
INSERT [dbo].[Gender] ([GenderId], [GenderName]) VALUES (3, N'Other')
SET IDENTITY_INSERT [dbo].[Gender] OFF
SET IDENTITY_INSERT [dbo].[Genre] ON 

INSERT [dbo].[Genre] ([GenreId], [GenreName]) VALUES (1, N'Action')
INSERT [dbo].[Genre] ([GenreId], [GenreName]) VALUES (2, N'Comedy')
INSERT [dbo].[Genre] ([GenreId], [GenreName]) VALUES (3, N'Horror')
INSERT [dbo].[Genre] ([GenreId], [GenreName]) VALUES (4, N'SciFi')
INSERT [dbo].[Genre] ([GenreId], [GenreName]) VALUES (5, N'Animated')
SET IDENTITY_INSERT [dbo].[Genre] OFF
SET IDENTITY_INSERT [dbo].[Movie] ON 

INSERT [dbo].[Movie] ([MovieId], [MovieTitle], [MovieDescription], [MovieReleaseDate], [MovieLength], [GenreId], [RatingId]) VALUES (1, N'Rabne Banadi Jodi', N'NA', CAST(N'2010-03-24' AS Date), 90, 2, 4)
INSERT [dbo].[Movie] ([MovieId], [MovieTitle], [MovieDescription], [MovieReleaseDate], [MovieLength], [GenreId], [RatingId]) VALUES (2, N'Om Shanti Om', N'NA', CAST(N'2011-04-10' AS Date), 90, 1, 4)
INSERT [dbo].[Movie] ([MovieId], [MovieTitle], [MovieDescription], [MovieReleaseDate], [MovieLength], [GenreId], [RatingId]) VALUES (3, N'Ek Tha Tiger', N'NA', CAST(N'2014-01-21' AS Date), 90, 1, 2)
INSERT [dbo].[Movie] ([MovieId], [MovieTitle], [MovieDescription], [MovieReleaseDate], [MovieLength], [GenreId], [RatingId]) VALUES (4, N'BKD', N'NA', CAST(N'2017-08-03' AS Date), 90, 2, 3)
INSERT [dbo].[Movie] ([MovieId], [MovieTitle], [MovieDescription], [MovieReleaseDate], [MovieLength], [GenreId], [RatingId]) VALUES (5, N'Pathshala', N'NA', CAST(N'2013-05-03' AS Date), 90, 2, 3)
INSERT [dbo].[Movie] ([MovieId], [MovieTitle], [MovieDescription], [MovieReleaseDate], [MovieLength], [GenreId], [RatingId]) VALUES (6, N' Bajirao Mastani', N'NA', CAST(N'2015-04-23' AS Date), 90, 1, 4)
SET IDENTITY_INSERT [dbo].[Movie] OFF
SET IDENTITY_INSERT [dbo].[MovieCast] ON 

INSERT [dbo].[MovieCast] ([MovieCastId], [MovieId], [ActorId], [MovieCastRole]) VALUES (2, 1, 1, N'Ram')
INSERT [dbo].[MovieCast] ([MovieCastId], [MovieId], [ActorId], [MovieCastRole]) VALUES (3, 1, 8, N'Pooja')
INSERT [dbo].[MovieCast] ([MovieCastId], [MovieId], [ActorId], [MovieCastRole]) VALUES (4, 2, 1, N'Om')
INSERT [dbo].[MovieCast] ([MovieCastId], [MovieId], [ActorId], [MovieCastRole]) VALUES (5, 2, 6, N'Deepika')
INSERT [dbo].[MovieCast] ([MovieCastId], [MovieId], [ActorId], [MovieCastRole]) VALUES (6, 3, 2, N'Tiger')
INSERT [dbo].[MovieCast] ([MovieCastId], [MovieId], [ActorId], [MovieCastRole]) VALUES (7, 3, 9, N'Katrina')
SET IDENTITY_INSERT [dbo].[MovieCast] OFF
SET IDENTITY_INSERT [dbo].[Rating] ON 

INSERT [dbo].[Rating] ([RatingId], [RatingName]) VALUES (1, N'Very Bad')
INSERT [dbo].[Rating] ([RatingId], [RatingName]) VALUES (2, N'Bad')
INSERT [dbo].[Rating] ([RatingId], [RatingName]) VALUES (3, N'Ok')
INSERT [dbo].[Rating] ([RatingId], [RatingName]) VALUES (4, N'Good')
INSERT [dbo].[Rating] ([RatingId], [RatingName]) VALUES (5, N'Very Good')
SET IDENTITY_INSERT [dbo].[Rating] OFF
ALTER TABLE [dbo].[Actor]  WITH CHECK ADD  CONSTRAINT [FK_Actor_Gender] FOREIGN KEY([GenderId])
REFERENCES [dbo].[Gender] ([GenderId])
GO
ALTER TABLE [dbo].[Actor] CHECK CONSTRAINT [FK_Actor_Gender]
GO
ALTER TABLE [dbo].[Movie]  WITH CHECK ADD  CONSTRAINT [FK_Movie_Genre] FOREIGN KEY([GenreId])
REFERENCES [dbo].[Genre] ([GenreId])
GO
ALTER TABLE [dbo].[Movie] CHECK CONSTRAINT [FK_Movie_Genre]
GO
ALTER TABLE [dbo].[Movie]  WITH CHECK ADD  CONSTRAINT [FK_Movie_Rating] FOREIGN KEY([RatingId])
REFERENCES [dbo].[Rating] ([RatingId])
GO
ALTER TABLE [dbo].[Movie] CHECK CONSTRAINT [FK_Movie_Rating]
GO
ALTER TABLE [dbo].[MovieCast]  WITH CHECK ADD  CONSTRAINT [FK_MovieCast_Actor] FOREIGN KEY([ActorId])
REFERENCES [dbo].[Actor] ([ActorId])
GO
ALTER TABLE [dbo].[MovieCast] CHECK CONSTRAINT [FK_MovieCast_Actor]
GO
ALTER TABLE [dbo].[MovieCast]  WITH CHECK ADD  CONSTRAINT [FK_MovieCast_Movie] FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movie] ([MovieId])
GO
ALTER TABLE [dbo].[MovieCast] CHECK CONSTRAINT [FK_MovieCast_Movie]
GO
/****** Object:  StoredProcedure [dbo].[USP_Get_Cast_Details]    Script Date: 09-07-2019 14:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_Get_Cast_Details]
@movieId INT
AS
BEGIN
SELECT ActorFirstName+' '+ActorLastName AS ActorName, G.GenderName, M.MovieCastRole
	FROM MovieCast M
	INNER JOIN Actor A ON A.ActorId = M.ActorId
	INNER JOIN Gender G ON A.GenderId = G.GenderId 
	WHERE M.MovieId = @movieId
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Get_Movie_Details]    Script Date: 09-07-2019 14:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_Get_Movie_Details]
@movieId INT
AS
BEGIN
SELECT MovieTitle, M.MovieDescription, CONVERT(varchar, MovieReleaseDate, 126) as MovieReleaseDate, G.GenreName, R.RatingName
	FROM Movie M
	INNER JOIN Genre G ON M.GenreId = G.GenreId
	INNER JOIN Rating R ON M.RatingId = R.RatingId
	WHERE M.MovieId = @movieId
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Get_Rating]    Script Date: 09-07-2019 14:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_Get_Rating]
AS
BEGIN
SELECT RatingId, RatingName
FROM Rating
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Search_Movie]    Script Date: 09-07-2019 14:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_Search_Movie]
@name VARCHAR(50),
@genre VARCHAR(50),
@release_date VARCHAR(50),
@rating VARCHAR(50)
AS
BEGIN
	SELECT MovieId, MovieTitle, G.GenreName, CONVERT(varchar, MovieReleaseDate, 126) as MovieReleaseDate, R.RatingName
	FROM Movie M
	INNER JOIN Genre G ON M.GenreId = G.GenreId
	INNER JOIN Rating R ON M.RatingId = R.RatingId
	WHERE(
		MovieTitle LIKE '%'+@name+'%' AND
		G.GenreName LIKE @genre+'%' AND
		MovieReleaseDate LIKE @release_date+'%' AND
		R.RatingId LIKE @rating+'%'
	);
END
GO
USE [master]
GO
ALTER DATABASE [MovieStudio] SET  READ_WRITE 
GO
