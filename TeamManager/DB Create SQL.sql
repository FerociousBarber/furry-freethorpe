USE [master]
GO
/****** Object:  Database [TeamManager1]    Script Date: 17/05/2016 21:27:25 ******/
CREATE DATABASE [TeamManager1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TeamManager1.mdf', FILENAME = N'C:\Development\FT\furry-freethorpe\TeamManager\TeamManager\App_Data\TeamManager1.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TeamManager1_log.ldf', FILENAME = N'C:\Development\FT\furry-freethorpe\TeamManager\TeamManager\App_Data\TeamManager1_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TeamManager1] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TeamManager1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TeamManager1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TeamManager1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TeamManager1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TeamManager1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TeamManager1] SET ARITHABORT OFF 
GO
ALTER DATABASE [TeamManager1] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [TeamManager1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TeamManager1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TeamManager1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TeamManager1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TeamManager1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TeamManager1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TeamManager1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TeamManager1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TeamManager1] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TeamManager1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TeamManager1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TeamManager1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TeamManager1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TeamManager1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TeamManager1] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [TeamManager1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TeamManager1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TeamManager1] SET  MULTI_USER 
GO
ALTER DATABASE [TeamManager1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TeamManager1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TeamManager1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TeamManager1] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [TeamManager1] SET DELAYED_DURABILITY = DISABLED 
GO
USE [TeamManager1]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 17/05/2016 21:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Location]    Script Date: 17/05/2016 21:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[LocationID] [int] IDENTITY(1,1) NOT NULL,
	[ClubName] [nvarchar](max) NOT NULL,
	[AddressLine1] [nvarchar](max) NULL,
	[AddressLine2] [nvarchar](max) NULL,
	[AddressLine3] [nvarchar](max) NULL,
	[AddressPostCode] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Location] PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Match]    Script Date: 17/05/2016 21:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Match](
	[MatchID] [int] IDENTITY(1,1) NOT NULL,
	[MatchDatetime] [datetime] NOT NULL,
	[LocationID] [int] NOT NULL,
	[OppositionName] [nvarchar](max) NOT NULL,
	[Duration] [int] NOT NULL,
	[Formation] [int] NOT NULL,
	[MatchNotes] [nvarchar](max) NULL,
	[SelectedMatchType] [nvarchar](max) NULL,
	[TeamID] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Match] PRIMARY KEY CLUSTERED 
(
	[MatchID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MatchEvent]    Script Date: 17/05/2016 21:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MatchEvent](
	[MatchEventID] [int] IDENTITY(1,1) NOT NULL,
	[PlayerID] [int] NOT NULL,
	[MatchID] [int] NOT NULL,
	[MatchEventType] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.MatchEvent] PRIMARY KEY CLUSTERED 
(
	[MatchEventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MatchTeam]    Script Date: 17/05/2016 21:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MatchTeam](
	[MatchTeamID] [int] IDENTITY(1,1) NOT NULL,
	[MatchID] [int] NULL,
	[PlayerID] [int] NOT NULL,
	[RoleID] [int] NULL,
	[PlayerRating] [int] NULL,
	[TrainingID] [int] NULL,
 CONSTRAINT [PK_dbo.MatchTeam] PRIMARY KEY CLUSTERED 
(
	[MatchTeamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Player]    Script Date: 17/05/2016 21:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Player](
	[PlayerID] [int] IDENTITY(1,1) NOT NULL,
	[TeamID] [int] NOT NULL,
	[FirstNames] [nvarchar](max) NOT NULL,
	[Surname] [nvarchar](max) NOT NULL,
	[DOB] [datetime] NOT NULL,
	[Goals] [int] NULL,
	[Appearances] [int] NULL,
	[MinutesPlayed] [int] NULL,
	[PersonalNotes] [nvarchar](max) NULL,
	[CoachingNotes] [nvarchar](max) NULL,
	[ContactEmail] [nvarchar](max) NULL,
	[YellowCards] [int] NULL,
	[RedCards] [int] NULL,
 CONSTRAINT [PK_dbo.Player] PRIMARY KEY CLUSTERED 
(
	[PlayerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PlayerRole]    Script Date: 17/05/2016 21:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayerRole](
	[PlayerRoleID] [int] IDENTITY(1,1) NOT NULL,
	[PlayerRoleDesc] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.PlayerRole] PRIMARY KEY CLUSTERED 
(
	[PlayerRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Team]    Script Date: 17/05/2016 21:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Team](
	[TeamID] [int] IDENTITY(1,1) NOT NULL,
	[TeamName] [nvarchar](max) NOT NULL,
	[SelectedTeamSize] [int] NULL,
 CONSTRAINT [PK_dbo.Team] PRIMARY KEY CLUSTERED 
(
	[TeamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Training]    Script Date: 17/05/2016 21:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Training](
	[TrainingID] [int] IDENTITY(1,1) NOT NULL,
	[TrainingDatetime] [datetime] NOT NULL,
	[TrainingNotes] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Training] PRIMARY KEY CLUSTERED 
(
	[TrainingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Index [IX_LocationID]    Script Date: 17/05/2016 21:27:25 ******/
CREATE NONCLUSTERED INDEX [IX_LocationID] ON [dbo].[Match]
(
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_MatchID]    Script Date: 17/05/2016 21:27:25 ******/
CREATE NONCLUSTERED INDEX [IX_MatchID] ON [dbo].[MatchEvent]
(
	[MatchID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PlayerID]    Script Date: 17/05/2016 21:27:25 ******/
CREATE NONCLUSTERED INDEX [IX_PlayerID] ON [dbo].[MatchEvent]
(
	[PlayerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_MatchID]    Script Date: 17/05/2016 21:27:25 ******/
CREATE NONCLUSTERED INDEX [IX_MatchID] ON [dbo].[MatchTeam]
(
	[MatchID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PlayerID]    Script Date: 17/05/2016 21:27:25 ******/
CREATE NONCLUSTERED INDEX [IX_PlayerID] ON [dbo].[MatchTeam]
(
	[PlayerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TrainingID]    Script Date: 17/05/2016 21:27:25 ******/
CREATE NONCLUSTERED INDEX [IX_TrainingID] ON [dbo].[MatchTeam]
(
	[TrainingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Match]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Match_dbo.Location_LocationID] FOREIGN KEY([LocationID])
REFERENCES [dbo].[Location] ([LocationID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Match] CHECK CONSTRAINT [FK_dbo.Match_dbo.Location_LocationID]
GO
ALTER TABLE [dbo].[MatchEvent]  WITH CHECK ADD  CONSTRAINT [FK_dbo.MatchEvent_dbo.Match_MatchID] FOREIGN KEY([MatchID])
REFERENCES [dbo].[Match] ([MatchID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MatchEvent] CHECK CONSTRAINT [FK_dbo.MatchEvent_dbo.Match_MatchID]
GO
ALTER TABLE [dbo].[MatchEvent]  WITH CHECK ADD  CONSTRAINT [FK_dbo.MatchEvent_dbo.Player_PlayerID] FOREIGN KEY([PlayerID])
REFERENCES [dbo].[Player] ([PlayerID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MatchEvent] CHECK CONSTRAINT [FK_dbo.MatchEvent_dbo.Player_PlayerID]
GO
ALTER TABLE [dbo].[MatchTeam]  WITH CHECK ADD  CONSTRAINT [FK_dbo.MatchTeam_dbo.Match_MatchID] FOREIGN KEY([MatchID])
REFERENCES [dbo].[Match] ([MatchID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MatchTeam] CHECK CONSTRAINT [FK_dbo.MatchTeam_dbo.Match_MatchID]
GO
ALTER TABLE [dbo].[MatchTeam]  WITH CHECK ADD  CONSTRAINT [FK_dbo.MatchTeam_dbo.Player_PlayerID] FOREIGN KEY([PlayerID])
REFERENCES [dbo].[Player] ([PlayerID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MatchTeam] CHECK CONSTRAINT [FK_dbo.MatchTeam_dbo.Player_PlayerID]
GO
ALTER TABLE [dbo].[MatchTeam]  WITH CHECK ADD  CONSTRAINT [FK_dbo.MatchTeam_dbo.Training_TrainingID] FOREIGN KEY([TrainingID])
REFERENCES [dbo].[Training] ([TrainingID])
GO
ALTER TABLE [dbo].[MatchTeam] CHECK CONSTRAINT [FK_dbo.MatchTeam_dbo.Training_TrainingID]
GO
USE [master]
GO
ALTER DATABASE [TeamManager1] SET  READ_WRITE 
GO
