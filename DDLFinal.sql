USE [master]
GO
/****** Object:  Database [MSIS-2603-Project-Daredevils]    Script Date: 12/1/2015 11:17:38 PM ******/
CREATE DATABASE [MSIS-2603-Project-Daredevils]
 CONTAINMENT = NONE
ALTER DATABASE [MSIS-2603-Project-Daredevils] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MSIS-2603-Project-Daredevils].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MSIS-2603-Project-Daredevils] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MSIS-2603-Project-Daredevils] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MSIS-2603-Project-Daredevils] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MSIS-2603-Project-Daredevils] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MSIS-2603-Project-Daredevils] SET ARITHABORT OFF 
GO
ALTER DATABASE [MSIS-2603-Project-Daredevils] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MSIS-2603-Project-Daredevils] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MSIS-2603-Project-Daredevils] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MSIS-2603-Project-Daredevils] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MSIS-2603-Project-Daredevils] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MSIS-2603-Project-Daredevils] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MSIS-2603-Project-Daredevils] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MSIS-2603-Project-Daredevils] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MSIS-2603-Project-Daredevils] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MSIS-2603-Project-Daredevils] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MSIS-2603-Project-Daredevils] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MSIS-2603-Project-Daredevils] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MSIS-2603-Project-Daredevils] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MSIS-2603-Project-Daredevils] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MSIS-2603-Project-Daredevils] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MSIS-2603-Project-Daredevils] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MSIS-2603-Project-Daredevils] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MSIS-2603-Project-Daredevils] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MSIS-2603-Project-Daredevils] SET  MULTI_USER 
GO
ALTER DATABASE [MSIS-2603-Project-Daredevils] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MSIS-2603-Project-Daredevils] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MSIS-2603-Project-Daredevils] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MSIS-2603-Project-Daredevils] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [MSIS-2603-Project-Daredevils] SET DELAYED_DURABILITY = DISABLED 
GO
USE [MSIS-2603-Project-Daredevils]
GO
/****** Object:  Table [dbo].[Event]    Script Date: 12/1/2015 11:17:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Event](
	[Event_ID] [int] IDENTITY(100,1) NOT NULL,
	[Event_Name] [varchar](20) NOT NULL,
	[Budget] [decimal](10, 2) NOT NULL,
	[Type_of_Sport] [varchar](15) NOT NULL,
	[Status] [varchar](10) NOT NULL CONSTRAINT [DF_Event_Status]  DEFAULT ('Pending'),
	[Host_ID] [int] NOT NULL,
	[Manager_ID] [int] NULL,
	[Venue_ID] [int] NOT NULL,
	[Registration_Time] [datetime] NOT NULL,
	[Event_Start_Time] [datetime] NOT NULL,
	[Event_End_Time] [datetime] NOT NULL,
	[Star__Player_ID] [int] NULL,
	[Winning_Team_ID] [int] NULL,
	[Total_Cost] [decimal](10, 2) NULL,
	[Organization_Name] [varchar](20) NULL,
 CONSTRAINT [PK_Event] PRIMARY KEY CLUSTERED 
(
	[Event_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Event_Referee]    Script Date: 12/1/2015 11:17:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Event_Referee](
	[Referee_ID] [int] NOT NULL,
	[Event_ID] [int] NOT NULL,
	[Status] [varchar](10) NULL,
 CONSTRAINT [PK_Event_Referee] PRIMARY KEY CLUSTERED 
(
	[Referee_ID] ASC,
	[Event_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Players]    Script Date: 12/1/2015 11:17:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Players](
	[Player_ID] [int] IDENTITY(1,1) NOT NULL,
	[Team_ID] [int] NOT NULL,
	[Player_Name] [varchar](15) NOT NULL,
 CONSTRAINT [PK_Players] PRIMARY KEY CLUSTERED 
(
	[Player_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Referee]    Script Date: 12/1/2015 11:17:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Referee](
	[Referee_ID] [int] IDENTITY(1,1) NOT NULL,
	[Referee_Name] [varchar](20) NOT NULL,
	[Type_of_Sport] [varchar](15) NOT NULL,
	[Email_ID] [varchar](20) NOT NULL,
	[Contact_No] [decimal](10, 0) NULL,
 CONSTRAINT [PK_Referee] PRIMARY KEY CLUSTERED 
(
	[Referee_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sponsorship]    Script Date: 12/1/2015 11:17:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sponsorship](
	[Sponsorship_ID] [int] IDENTITY(10,1) NOT NULL,
	[Sponsor_ID] [int] NOT NULL,
	[Event_ID] [int] NOT NULL,
	[Type_of_Sponsorship] [varchar](15) NOT NULL,
	[Amount] [decimal](10, 2) NOT NULL,
	[Status] [varchar](15) NOT NULL,
	[Organization_Name] [varchar](20) NULL,
	[Registration_Time] [datetime] NOT NULL,
 CONSTRAINT [PK_Sponsorship] PRIMARY KEY CLUSTERED 
(
	[Sponsorship_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Teams]    Script Date: 12/1/2015 11:17:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Teams](
	[Team_ID] [int] IDENTITY(1,1) NOT NULL,
	[Team_Name] [varchar](20) NOT NULL,
	[Registration_Time] [datetime] NOT NULL,
	[Registered_By_ID] [int] NOT NULL,
 CONSTRAINT [PK_Teams] PRIMARY KEY CLUSTERED 
(
	[Team_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Teams_Playing]    Script Date: 12/1/2015 11:17:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Teams_Playing](
	[Team_ID] [int] NOT NULL,
	[Event_ID] [int] NOT NULL,
	[Status] [varchar](10) NOT NULL,
	[No_of_Games_Played] [int] NOT NULL CONSTRAINT [DF_Teams_Playing_No_of_Games_Played]  DEFAULT ((0)),
	[No_of_Games_Won] [int] NOT NULL CONSTRAINT [DF_Teams_Playing_No_of_Games_Won]  DEFAULT ((0)),
 CONSTRAINT [PK_Teams_Playing] PRIMARY KEY CLUSTERED 
(
	[Team_ID] ASC,
	[Event_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ticket_Pricing]    Script Date: 12/1/2015 11:17:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ticket_Pricing](
	[Venue_ID] [int] NOT NULL,
	[Event_ID] [int] NOT NULL,
	[Stand_Type] [varchar](10) NOT NULL,
	[Stand_Price] [decimal](6, 2) NULL,
	[Stand_Capacity] [int] NOT NULL,
 CONSTRAINT [PK_Ticket_Pricing] PRIMARY KEY CLUSTERED 
(
	[Venue_ID] ASC,
	[Event_ID] ASC,
	[Stand_Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tickets_Booked]    Script Date: 12/1/2015 11:17:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tickets_Booked](
	[Ticket_ID] [int] NOT NULL,
	[Event_ID] [int] NOT NULL,
	[User_ID] [int] NOT NULL,
	[Ticket_Type] [varchar](10) NOT NULL,
	[Price] [decimal](4, 2) NOT NULL,
	[Payment_Status] [varchar](20) NOT NULL,
	[Booking_Time] [datetime] NOT NULL,
 CONSTRAINT [PK_Tickets_Booked] PRIMARY KEY CLUSTERED 
(
	[Ticket_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User_Details]    Script Date: 12/1/2015 11:17:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User_Details](
	[User_ID] [int] IDENTITY(1,1) NOT NULL,
	[First_Name] [varchar](20) NOT NULL,
	[Last_Name] [varchar](20) NOT NULL,
	[User_Type] [varchar](10) NOT NULL CONSTRAINT [DF_User_Details_User_Type]  DEFAULT ('SPONSOR'',''AUDIENCE'',''HOST'',''MANAGER'),
	[Username] [varchar](15) NOT NULL,
	[Password] [varchar](15) NOT NULL,
	[Address] [varchar](50) NULL,
	[Phone] [decimal](10, 0) NULL,
	[Email_ID] [varchar](20) NOT NULL,
	[Registration_Time] [datetime] NOT NULL,
 CONSTRAINT [PK_User_Details] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Venue]    Script Date: 12/1/2015 11:17:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Venue](
	[Venue_ID] [int] IDENTITY(1,1) NOT NULL,
	[Venue_Name] [varchar](20) NOT NULL,
	[Venue_Address] [varchar](50) NULL,
	[Type_of_Sport] [varchar](15) NOT NULL,
	[Venue_Manager_Name] [varchar](20) NOT NULL,
	[Manager_Contact_No] [decimal](10, 0) NOT NULL,
 CONSTRAINT [PK_Venue] PRIMARY KEY CLUSTERED 
(
	[Venue_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Index [IX_Event]    Script Date: 12/1/2015 11:17:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_Event] ON [dbo].[Event]
(
	[Event_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_Event] FOREIGN KEY([Event_ID])
REFERENCES [dbo].[Event] ([Event_ID])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK_Event_Event]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_Players] FOREIGN KEY([Star__Player_ID])
REFERENCES [dbo].[Players] ([Player_ID])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK_Event_Players]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_Teams] FOREIGN KEY([Winning_Team_ID])
REFERENCES [dbo].[Teams] ([Team_ID])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK_Event_Teams]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_User_Details] FOREIGN KEY([Host_ID])
REFERENCES [dbo].[User_Details] ([User_ID])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK_Event_User_Details]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_User_Details1] FOREIGN KEY([Manager_ID])
REFERENCES [dbo].[User_Details] ([User_ID])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK_Event_User_Details1]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_Venue] FOREIGN KEY([Venue_ID])
REFERENCES [dbo].[Venue] ([Venue_ID])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK_Event_Venue]
GO
ALTER TABLE [dbo].[Event_Referee]  WITH CHECK ADD  CONSTRAINT [FK_Event_Referee_Event] FOREIGN KEY([Event_ID])
REFERENCES [dbo].[Event] ([Event_ID])
GO
ALTER TABLE [dbo].[Event_Referee] CHECK CONSTRAINT [FK_Event_Referee_Event]
GO
ALTER TABLE [dbo].[Event_Referee]  WITH CHECK ADD  CONSTRAINT [FK_Event_Referee_Referee] FOREIGN KEY([Referee_ID])
REFERENCES [dbo].[Referee] ([Referee_ID])
GO
ALTER TABLE [dbo].[Event_Referee] CHECK CONSTRAINT [FK_Event_Referee_Referee]
GO
ALTER TABLE [dbo].[Players]  WITH CHECK ADD  CONSTRAINT [FK_Players_Teams] FOREIGN KEY([Team_ID])
REFERENCES [dbo].[Teams] ([Team_ID])
GO
ALTER TABLE [dbo].[Players] CHECK CONSTRAINT [FK_Players_Teams]
GO
ALTER TABLE [dbo].[Sponsorship]  WITH CHECK ADD  CONSTRAINT [FK_Sponsorship_Event] FOREIGN KEY([Event_ID])
REFERENCES [dbo].[Event] ([Event_ID])
GO
ALTER TABLE [dbo].[Sponsorship] CHECK CONSTRAINT [FK_Sponsorship_Event]
GO
ALTER TABLE [dbo].[Sponsorship]  WITH CHECK ADD  CONSTRAINT [FK_Sponsorship_User_Details] FOREIGN KEY([Sponsor_ID])
REFERENCES [dbo].[User_Details] ([User_ID])
GO
ALTER TABLE [dbo].[Sponsorship] CHECK CONSTRAINT [FK_Sponsorship_User_Details]
GO
ALTER TABLE [dbo].[Teams]  WITH CHECK ADD  CONSTRAINT [FK_Teams_User_Details] FOREIGN KEY([Registered_By_ID])
REFERENCES [dbo].[User_Details] ([User_ID])
GO
ALTER TABLE [dbo].[Teams] CHECK CONSTRAINT [FK_Teams_User_Details]
GO
ALTER TABLE [dbo].[Teams_Playing]  WITH CHECK ADD  CONSTRAINT [FK_Teams_Playing_Event] FOREIGN KEY([Event_ID])
REFERENCES [dbo].[Event] ([Event_ID])
GO
ALTER TABLE [dbo].[Teams_Playing] CHECK CONSTRAINT [FK_Teams_Playing_Event]
GO
ALTER TABLE [dbo].[Teams_Playing]  WITH CHECK ADD  CONSTRAINT [FK_Teams_Playing_Teams] FOREIGN KEY([Team_ID])
REFERENCES [dbo].[Teams] ([Team_ID])
GO
ALTER TABLE [dbo].[Teams_Playing] CHECK CONSTRAINT [FK_Teams_Playing_Teams]
GO
ALTER TABLE [dbo].[Ticket_Pricing]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Pricing_Event] FOREIGN KEY([Event_ID])
REFERENCES [dbo].[Event] ([Event_ID])
GO
ALTER TABLE [dbo].[Ticket_Pricing] CHECK CONSTRAINT [FK_Ticket_Pricing_Event]
GO
ALTER TABLE [dbo].[Ticket_Pricing]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Pricing_Venue] FOREIGN KEY([Venue_ID])
REFERENCES [dbo].[Venue] ([Venue_ID])
GO
ALTER TABLE [dbo].[Ticket_Pricing] CHECK CONSTRAINT [FK_Ticket_Pricing_Venue]
GO
ALTER TABLE [dbo].[Tickets_Booked]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_Booked_Event] FOREIGN KEY([Event_ID])
REFERENCES [dbo].[Event] ([Event_ID])
GO
ALTER TABLE [dbo].[Tickets_Booked] CHECK CONSTRAINT [FK_Tickets_Booked_Event]
GO
ALTER TABLE [dbo].[Tickets_Booked]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_Booked_User_Details] FOREIGN KEY([User_ID])
REFERENCES [dbo].[User_Details] ([User_ID])
GO
ALTER TABLE [dbo].[Tickets_Booked] CHECK CONSTRAINT [FK_Tickets_Booked_User_Details]
GO
ALTER TABLE [dbo].[User_Details]  WITH CHECK ADD  CONSTRAINT [FK_User_Details_User_Details] FOREIGN KEY([User_ID])
REFERENCES [dbo].[User_Details] ([User_ID])
GO
ALTER TABLE [dbo].[User_Details] CHECK CONSTRAINT [FK_User_Details_User_Details]
GO
USE [master]
GO
ALTER DATABASE [MSIS-2603-Project-Daredevils] SET  READ_WRITE 
GO
