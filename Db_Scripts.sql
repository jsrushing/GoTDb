USE [master]
GO
/****** Object:  Database [BYBGOT]    Script Date: 09/25/2018 17:51:40 ******/
CREATE DATABASE [BYBGOT] ON  PRIMARY 
( NAME = N'BYB_GOT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\BYB_GOT.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BYB_GOT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\BYB_GOT_log.ldf' , SIZE = 11200KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BYBGOT] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BYBGOT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BYBGOT] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [BYBGOT] SET ANSI_NULLS OFF
GO
ALTER DATABASE [BYBGOT] SET ANSI_PADDING OFF
GO
ALTER DATABASE [BYBGOT] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [BYBGOT] SET ARITHABORT OFF
GO
ALTER DATABASE [BYBGOT] SET AUTO_CLOSE ON
GO
ALTER DATABASE [BYBGOT] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [BYBGOT] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [BYBGOT] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [BYBGOT] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [BYBGOT] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [BYBGOT] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [BYBGOT] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [BYBGOT] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [BYBGOT] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [BYBGOT] SET  DISABLE_BROKER
GO
ALTER DATABASE [BYBGOT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [BYBGOT] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [BYBGOT] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [BYBGOT] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [BYBGOT] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [BYBGOT] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [BYBGOT] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [BYBGOT] SET  READ_WRITE
GO
ALTER DATABASE [BYBGOT] SET RECOVERY FULL
GO
ALTER DATABASE [BYBGOT] SET  MULTI_USER
GO
ALTER DATABASE [BYBGOT] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [BYBGOT] SET DB_CHAINING OFF
GO
USE [BYBGOT]
GO
/****** Object:  Table [dbo].[TelephoneTypes]    Script Date: 09/25/2018 17:51:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TelephoneTypes](
	[id] [int] NOT NULL,
	[Description] [varchar](20) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[TelephoneTypes] ([id], [Description]) VALUES (1, N'mobile')
INSERT [dbo].[TelephoneTypes] ([id], [Description]) VALUES (2, N'home')
INSERT [dbo].[TelephoneTypes] ([id], [Description]) VALUES (3, N'work')
INSERT [dbo].[TelephoneTypes] ([id], [Description]) VALUES (4, N'fax')
/****** Object:  Table [dbo].[StudentInfo]    Script Date: 09/25/2018 17:51:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentInfo](
	[MemberId] [int] NOT NULL,
	[SchoolId] [int] NULL,
	[GPA] [decimal](3, 1) NULL,
	[SchoolContactPersonalInfoId] [int] NULL,
	[DepositAccountNumber] [nvarchar](45) NULL,
 CONSTRAINT [PK_StudentInfo] PRIMARY KEY CLUSTERED 
(
	[MemberId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[StudentInfo] ([MemberId], [SchoolId], [GPA], [SchoolContactPersonalInfoId], [DepositAccountNumber]) VALUES (2, 5, CAST(2.5 AS Decimal(3, 1)), 5, N'45678914123XXSss')
INSERT [dbo].[StudentInfo] ([MemberId], [SchoolId], [GPA], [SchoolContactPersonalInfoId], [DepositAccountNumber]) VALUES (6, 11, CAST(5.0 AS Decimal(3, 1)), 9, N'4488557788956685')
INSERT [dbo].[StudentInfo] ([MemberId], [SchoolId], [GPA], [SchoolContactPersonalInfoId], [DepositAccountNumber]) VALUES (10, 3, CAST(2.5 AS Decimal(3, 1)), 30, N'45678914123')
/****** Object:  Table [dbo].[States]    Script Date: 09/25/2018 17:51:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[States](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [varchar](50) NOT NULL,
	[Abbreviation] [varchar](2) NOT NULL,
 CONSTRAINT [PK_States] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[States] ON
INSERT [dbo].[States] ([id], [FullName], [Abbreviation]) VALUES (1, N'Alabama', N'AL')
INSERT [dbo].[States] ([id], [FullName], [Abbreviation]) VALUES (2, N'Alaska', N'AK')
INSERT [dbo].[States] ([id], [FullName], [Abbreviation]) VALUES (3, N'Arizona', N'AZ')
INSERT [dbo].[States] ([id], [FullName], [Abbreviation]) VALUES (4, N'Arkansas', N'AR')
INSERT [dbo].[States] ([id], [FullName], [Abbreviation]) VALUES (5, N'California', N'CA')
INSERT [dbo].[States] ([id], [FullName], [Abbreviation]) VALUES (6, N'Colorado', N'CO')
INSERT [dbo].[States] ([id], [FullName], [Abbreviation]) VALUES (7, N'Connecticut', N'CT')
INSERT [dbo].[States] ([id], [FullName], [Abbreviation]) VALUES (8, N'Delaware', N'DE')
INSERT [dbo].[States] ([id], [FullName], [Abbreviation]) VALUES (9, N'District of Columbia', N'DC')
INSERT [dbo].[States] ([id], [FullName], [Abbreviation]) VALUES (10, N'Florida', N'FL')
INSERT [dbo].[States] ([id], [FullName], [Abbreviation]) VALUES (11, N'Georgia', N'GA')
INSERT [dbo].[States] ([id], [FullName], [Abbreviation]) VALUES (12, N'Hawaii', N'HI')
INSERT [dbo].[States] ([id], [FullName], [Abbreviation]) VALUES (13, N'Idaho', N'ID')
INSERT [dbo].[States] ([id], [FullName], [Abbreviation]) VALUES (14, N'Illinois', N'IL')
INSERT [dbo].[States] ([id], [FullName], [Abbreviation]) VALUES (15, N'Indiana', N'IN')
INSERT [dbo].[States] ([id], [FullName], [Abbreviation]) VALUES (16, N'Iowa', N'IA')
INSERT [dbo].[States] ([id], [FullName], [Abbreviation]) VALUES (17, N'Kansas', N'KS')
INSERT [dbo].[States] ([id], [FullName], [Abbreviation]) VALUES (18, N'Kentucky', N'KY')
INSERT [dbo].[States] ([id], [FullName], [Abbreviation]) VALUES (19, N'Louisiana', N'LA')
INSERT [dbo].[States] ([id], [FullName], [Abbreviation]) VALUES (20, N'Maine', N'ME')
INSERT [dbo].[States] ([id], [FullName], [Abbreviation]) VALUES (21, N'Maryland', N'MD')
INSERT [dbo].[States] ([id], [FullName], [Abbreviation]) VALUES (22, N'Massachusetts', N'MA')
INSERT [dbo].[States] ([id], [FullName], [Abbreviation]) VALUES (23, N'Michigan', N'MI')
INSERT [dbo].[States] ([id], [FullName], [Abbreviation]) VALUES (24, N'Minnesota', N'MN')
INSERT [dbo].[States] ([id], [FullName], [Abbreviation]) VALUES (25, N'Mississippi', N'MS')
INSERT [dbo].[States] ([id], [FullName], [Abbreviation]) VALUES (26, N'Missouri', N'MO')
INSERT [dbo].[States] ([id], [FullName], [Abbreviation]) VALUES (27, N'Montana', N'MT')
INSERT [dbo].[States] ([id], [FullName], [Abbreviation]) VALUES (28, N'Nebraska', N'NE')
INSERT [dbo].[States] ([id], [FullName], [Abbreviation]) VALUES (29, N'Nevada', N'NV')
INSERT [dbo].[States] ([id], [FullName], [Abbreviation]) VALUES (30, N'New Hampshire', N'NH')
INSERT [dbo].[States] ([id], [FullName], [Abbreviation]) VALUES (31, N'New Jersey', N'NJ')
INSERT [dbo].[States] ([id], [FullName], [Abbreviation]) VALUES (32, N'New Mexico', N'NM')
INSERT [dbo].[States] ([id], [FullName], [Abbreviation]) VALUES (33, N'New York', N'NY')
INSERT [dbo].[States] ([id], [FullName], [Abbreviation]) VALUES (34, N'North Carolina', N'NC')
INSERT [dbo].[States] ([id], [FullName], [Abbreviation]) VALUES (35, N'North Dakota', N'ND')
INSERT [dbo].[States] ([id], [FullName], [Abbreviation]) VALUES (36, N'Ohio', N'OH')
INSERT [dbo].[States] ([id], [FullName], [Abbreviation]) VALUES (37, N'Oklahoma', N'OK')
INSERT [dbo].[States] ([id], [FullName], [Abbreviation]) VALUES (38, N'Oregon', N'OR')
INSERT [dbo].[States] ([id], [FullName], [Abbreviation]) VALUES (39, N'Pennsylvania', N'PA')
INSERT [dbo].[States] ([id], [FullName], [Abbreviation]) VALUES (40, N'Puerto Rico', N'PR')
INSERT [dbo].[States] ([id], [FullName], [Abbreviation]) VALUES (41, N'Rhode Island', N'RI')
INSERT [dbo].[States] ([id], [FullName], [Abbreviation]) VALUES (42, N'South Carolina', N'SC')
INSERT [dbo].[States] ([id], [FullName], [Abbreviation]) VALUES (43, N'South Dakota', N'SD')
INSERT [dbo].[States] ([id], [FullName], [Abbreviation]) VALUES (44, N'Tennessee', N'TN')
INSERT [dbo].[States] ([id], [FullName], [Abbreviation]) VALUES (45, N'Texas', N'TX')
INSERT [dbo].[States] ([id], [FullName], [Abbreviation]) VALUES (46, N'Utah', N'UT')
INSERT [dbo].[States] ([id], [FullName], [Abbreviation]) VALUES (47, N'Vermont', N'VT')
INSERT [dbo].[States] ([id], [FullName], [Abbreviation]) VALUES (48, N'Virginia', N'VA')
INSERT [dbo].[States] ([id], [FullName], [Abbreviation]) VALUES (49, N'Washington', N'WA')
INSERT [dbo].[States] ([id], [FullName], [Abbreviation]) VALUES (50, N'West Virginia', N'WV')
INSERT [dbo].[States] ([id], [FullName], [Abbreviation]) VALUES (51, N'Wisconsin', N'WI')
INSERT [dbo].[States] ([id], [FullName], [Abbreviation]) VALUES (52, N'Wyoming', N'WY')
SET IDENTITY_INSERT [dbo].[States] OFF
/****** Object:  Table [dbo].[Ethnicities]    Script Date: 09/25/2018 17:51:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ethnicities](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Description] [varchar](1000) NULL,
	[CreatedBy] [int] NOT NULL,
 CONSTRAINT [PK_Ethnicities] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Ethnicities] ON
INSERT [dbo].[Ethnicities] ([id], [Name], [Description], [CreatedBy]) VALUES (1, N'Caucasian', NULL, 0)
INSERT [dbo].[Ethnicities] ([id], [Name], [Description], [CreatedBy]) VALUES (2, N'Hispanic', NULL, 0)
INSERT [dbo].[Ethnicities] ([id], [Name], [Description], [CreatedBy]) VALUES (3, N'Black_American', N'American black', 0)
INSERT [dbo].[Ethnicities] ([id], [Name], [Description], [CreatedBy]) VALUES (4, N'Black_Carribean', NULL, 0)
INSERT [dbo].[Ethnicities] ([id], [Name], [Description], [CreatedBy]) VALUES (5, N'Black_African', N'Black identifying as from Africa.', 0)
INSERT [dbo].[Ethnicities] ([id], [Name], [Description], [CreatedBy]) VALUES (6, N'Pacific Islander', NULL, 0)
INSERT [dbo].[Ethnicities] ([id], [Name], [Description], [CreatedBy]) VALUES (7, N'American Indian', NULL, 8)
INSERT [dbo].[Ethnicities] ([id], [Name], [Description], [CreatedBy]) VALUES (10, N'Zamboangan', NULL, 13)
SET IDENTITY_INSERT [dbo].[Ethnicities] OFF
/****** Object:  Table [dbo].[EmailsToSend]    Script Date: 09/25/2018 17:51:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmailsToSend](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Subject] [varchar](500) NULL,
	[Message] [varchar](max) NOT NULL,
	[SendTo] [varchar](200) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[SentOn] [datetime] NULL,
 CONSTRAINT [PK_EmailsToSend] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[EmailsToSend] ON
INSERT [dbo].[EmailsToSend] ([id], [Subject], [Message], [SendTo], [CreatedOn], [SentOn]) VALUES (1, N'Melanie Nicholson You have a recipient awaiting approval.', N'Please click the link below to login and select the recipient from Waiting Recipients.<br>
http://www.JasonScottRushing.com/BYB/BigYellowBus/ApproveViaEmail.aspx?tr=3&r=2', N'jscottr@gmail.com', CAST(0x0000A6CC017C3E2C AS DateTime), CAST(0x0000A6CC017C4049 AS DateTime))
INSERT [dbo].[EmailsToSend] ([id], [Subject], [Message], [SendTo], [CreatedOn], [SentOn]) VALUES (2, N'Trusted Three You have a recipient awaiting approval.', N'Please click the link below to login and select the recipient from Waiting Recipients.<br>
http://www.JasonScottRushing.com/BYB/BigYellowBus/ApproveViaEmail.aspx?tr=7&r=2', N'jrushing@epicreg.com', CAST(0x0000A6D4000CFAAC AS DateTime), CAST(0x0000A6D4000CFD14 AS DateTime))
INSERT [dbo].[EmailsToSend] ([id], [Subject], [Message], [SendTo], [CreatedOn], [SentOn]) VALUES (3, N'Trusted Three You have a recipient awaiting approval.', N'Please click the link below to login and select the recipient from Waiting Recipients.<br>
http://www.JasonScottRushing.com/BYB/BigYellowBus/ApproveViaEmail.aspx?tr=7&r=10', N'jrushing@epicreg.com', CAST(0x0000A6DC015AADCF AS DateTime), CAST(0x0000A6DC015AB05B AS DateTime))
INSERT [dbo].[EmailsToSend] ([id], [Subject], [Message], [SendTo], [CreatedOn], [SentOn]) VALUES (4, N'Trusted Two You have a recipient awaiting approval.', N'Please click the link below to login and select the recipient from Waiting Recipients.<br>
http://www.JasonScottRushing.com/BYB/BigYellowBus/ApproveViaEmail.aspx?tr=4&r=2', N'asdfadsf@asdafa.comxxee', CAST(0x0000A9600178717D AS DateTime), CAST(0x0000A9600178A2DB AS DateTime))
SET IDENTITY_INSERT [dbo].[EmailsToSend] OFF
/****** Object:  Table [dbo].[FundingSources]    Script Date: 09/25/2018 17:51:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FundingSources](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](100) NOT NULL,
	[CreatedBy] [int] NOT NULL,
 CONSTRAINT [PK_FundingSources] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[FundingSources] ON
INSERT [dbo].[FundingSources] ([id], [Description], [CreatedBy]) VALUES (1, N'Self', 0)
INSERT [dbo].[FundingSources] ([id], [Description], [CreatedBy]) VALUES (2, N'Parents', 0)
INSERT [dbo].[FundingSources] ([id], [Description], [CreatedBy]) VALUES (3, N'Other Family', 0)
INSERT [dbo].[FundingSources] ([id], [Description], [CreatedBy]) VALUES (4, N'Friends', 0)
INSERT [dbo].[FundingSources] ([id], [Description], [CreatedBy]) VALUES (5, N'Loans', 0)
INSERT [dbo].[FundingSources] ([id], [Description], [CreatedBy]) VALUES (6, N'Grants', 0)
INSERT [dbo].[FundingSources] ([id], [Description], [CreatedBy]) VALUES (7, N'Employer', 0)
INSERT [dbo].[FundingSources] ([id], [Description], [CreatedBy]) VALUES (8, N'Prostitution', 8)
INSERT [dbo].[FundingSources] ([id], [Description], [CreatedBy]) VALUES (9, N' Drugs', 8)
INSERT [dbo].[FundingSources] ([id], [Description], [CreatedBy]) VALUES (12, N'Theft', 13)
INSERT [dbo].[FundingSources] ([id], [Description], [CreatedBy]) VALUES (13, N' Coercion', 13)
INSERT [dbo].[FundingSources] ([id], [Description], [CreatedBy]) VALUES (14, N'Selling Apples', 8)
SET IDENTITY_INSERT [dbo].[FundingSources] OFF
/****** Object:  UserDefinedFunction [dbo].[fn_SplitString_VARCHAR]    Script Date: 09/25/2018 17:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
=============================================
Author:			Scott Rushing
Create date:	10/8/16
Description:	Split a delimited string.  Delimiter = | in v.1.  Copied from
				  https://blogs.msdn.microsoft.com/amitjet/2009/12/11/convert-comma-separated-string-to-table-4-different-approaches/
=============================================
*/
CREATE FUNCTION [dbo].[fn_SplitString_VARCHAR] 
(	
	@stringToSplit VARCHAR(MAX)
)
RETURNS @t TABLE (elementValue NVARCHAR(100))
AS
BEGIN
	DECLARE @x XML 
	SELECT @x = cast('<A>'+ replace(@stringToSplit,'|','</A><A>')+ '</A>' AS XML)
	INSERT INTO @t(elementValue)
		SELECT t.value('.', 'VARCHAR(50)') AS inVal
			FROM @x.nodes('/A') AS x(t)
RETURN 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_SplitString]    Script Date: 09/25/2018 17:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
=============================================
Author:			Scott Rushing
Create date:	10/8/16
Description:	Split a delimited string.  Delimiter = | in v.1.  Copied from
				  https://blogs.msdn.microsoft.com/amitjet/2009/12/11/convert-comma-separated-string-to-table-4-different-approaches/
=============================================
*/
CREATE FUNCTION [dbo].[fn_SplitString] 
(	
	@stringToSplit VARCHAR(MAX)
)
RETURNS @t TABLE (elementValue NVARCHAR(100))
AS
BEGIN
	DECLARE @x XML 
	SELECT @x = cast('<A>'+ replace(@stringToSplit,'|','</A><A>')+ '</A>' AS XML)
	INSERT INTO @t(elementValue)
		SELECT t.value('.', 'int') AS inVal
			FROM @x.nodes('/A') AS x(t)
RETURN 
END
GO
/****** Object:  Table [dbo].[Donations]    Script Date: 09/25/2018 17:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Donations](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[DonorId] [int] NULL,
	[RecipientId] [int] NOT NULL,
	[Amount] [decimal](8, 2) NOT NULL,
	[HoldForBalance] [decimal](8, 2) NULL,
	[HoldForDate] [date] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[DisbursedOn] [datetime] NULL,
 CONSTRAINT [PK_Donations] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Donations] ON
INSERT [dbo].[Donations] ([id], [DonorId], [RecipientId], [Amount], [HoldForBalance], [HoldForDate], [CreatedOn], [DisbursedOn]) VALUES (1, 1, 2, CAST(50.00 AS Decimal(8, 2)), NULL, NULL, CAST(0x0000A6CC017CA071 AS DateTime), CAST(0x0000A6CC017CA071 AS DateTime))
INSERT [dbo].[Donations] ([id], [DonorId], [RecipientId], [Amount], [HoldForBalance], [HoldForDate], [CreatedOn], [DisbursedOn]) VALUES (2, 5, 2, CAST(100.00 AS Decimal(8, 2)), NULL, CAST(0x423C0B00 AS Date), CAST(0x0000A6D001289DA2 AS DateTime), NULL)
INSERT [dbo].[Donations] ([id], [DonorId], [RecipientId], [Amount], [HoldForBalance], [HoldForDate], [CreatedOn], [DisbursedOn]) VALUES (3, 1, 2, CAST(50.00 AS Decimal(8, 2)), NULL, CAST(0x493C0B00 AS Date), CAST(0x0000A6D201534EED AS DateTime), NULL)
INSERT [dbo].[Donations] ([id], [DonorId], [RecipientId], [Amount], [HoldForBalance], [HoldForDate], [CreatedOn], [DisbursedOn]) VALUES (4, 1, 6, CAST(100.00 AS Decimal(8, 2)), CAST(1000.00 AS Decimal(8, 2)), NULL, CAST(0x0000A6D301818D52 AS DateTime), NULL)
INSERT [dbo].[Donations] ([id], [DonorId], [RecipientId], [Amount], [HoldForBalance], [HoldForDate], [CreatedOn], [DisbursedOn]) VALUES (5, 1, 6, CAST(50.00 AS Decimal(8, 2)), NULL, NULL, CAST(0x0000A6D301819A91 AS DateTime), CAST(0x0000A6D301819A91 AS DateTime))
INSERT [dbo].[Donations] ([id], [DonorId], [RecipientId], [Amount], [HoldForBalance], [HoldForDate], [CreatedOn], [DisbursedOn]) VALUES (6, 1, 6, CAST(500.00 AS Decimal(8, 2)), CAST(1500.00 AS Decimal(8, 2)), NULL, CAST(0x0000A6D700361F34 AS DateTime), NULL)
INSERT [dbo].[Donations] ([id], [DonorId], [RecipientId], [Amount], [HoldForBalance], [HoldForDate], [CreatedOn], [DisbursedOn]) VALUES (7, 1, 6, CAST(100.00 AS Decimal(8, 2)), NULL, CAST(0x553C0B00 AS Date), CAST(0x0000A6D7003D89C6 AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Donations] OFF
/****** Object:  Table [dbo].[Degrees]    Script Date: 09/25/2018 17:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Degrees](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](150) NOT NULL,
	[CreatedBy] [int] NOT NULL,
 CONSTRAINT [PK_Degrees] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Degrees] ON
INSERT [dbo].[Degrees] ([id], [Description], [CreatedBy]) VALUES (1, N'DDDM', 8)
INSERT [dbo].[Degrees] ([id], [Description], [CreatedBy]) VALUES (2, N'HHSM', 5)
INSERT [dbo].[Degrees] ([id], [Description], [CreatedBy]) VALUES (3, N'XMXS', 2)
SET IDENTITY_INSERT [dbo].[Degrees] OFF
/****** Object:  Table [dbo].[Classes]    Script Date: 09/25/2018 17:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Classes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[ClassNumber] [nvarchar](50) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[Instructor] [varchar](100) NULL,
	[Description] [varchar](4000) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[EditedOn] [datetime] NULL,
 CONSTRAINT [PK_Classes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Classes] ON
INSERT [dbo].[Classes] ([id], [MemberId], [Name], [ClassNumber], [StartDate], [EndDate], [Instructor], [Description], [CreatedOn], [EditedOn]) VALUES (1, 2, N'The Best Class Ever', N'ss8804xkkxx', CAST(0x0000A6CF00000000 AS DateTime), CAST(0x0000A70E00000000 AS DateTime), N'Prof. Dalrymple', N'This is the best class.', CAST(0x0000A6D701087908 AS DateTime), CAST(0x0000A6D70114763C AS DateTime))
INSERT [dbo].[Classes] ([id], [MemberId], [Name], [ClassNumber], [StartDate], [EndDate], [Instructor], [Description], [CreatedOn], [EditedOn]) VALUES (3, 2, N'How To Pick Cherries', N'cherry_29$dd', CAST(0x0000A6DE00000000 AS DateTime), CAST(0x0000A70800000000 AS DateTime), N'Chris Cherry', N'A farming class', CAST(0x0000A6D701146CA9 AS DateTime), NULL)
INSERT [dbo].[Classes] ([id], [MemberId], [Name], [ClassNumber], [StartDate], [EndDate], [Instructor], [Description], [CreatedOn], [EditedOn]) VALUES (4, 6, N'A whoopie class', N'ddkk8833', CAST(0x0000A96900000000 AS DateTime), CAST(0x0000A98C00000000 AS DateTime), N'Mr. Manchester', N'The greatest whoopie class ever.', CAST(0x0000A966011224FE AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Classes] OFF
/****** Object:  Table [dbo].[CharacterSceneXref]    Script Date: 09/25/2018 17:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CharacterSceneXref](
	[CharacterId] [varchar](3) NULL,
	[SceneId] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[CharacterSceneXref] ([CharacterId], [SceneId]) VALUES (N'14', 56)
INSERT [dbo].[CharacterSceneXref] ([CharacterId], [SceneId]) VALUES (N'20', 57)
INSERT [dbo].[CharacterSceneXref] ([CharacterId], [SceneId]) VALUES (N'1', 57)
INSERT [dbo].[CharacterSceneXref] ([CharacterId], [SceneId]) VALUES (N'4', 34)
INSERT [dbo].[CharacterSceneXref] ([CharacterId], [SceneId]) VALUES (N'1', 34)
INSERT [dbo].[CharacterSceneXref] ([CharacterId], [SceneId]) VALUES (N'7', 34)
INSERT [dbo].[CharacterSceneXref] ([CharacterId], [SceneId]) VALUES (N'6', 57)
INSERT [dbo].[CharacterSceneXref] ([CharacterId], [SceneId]) VALUES (N'2', 56)
INSERT [dbo].[CharacterSceneXref] ([CharacterId], [SceneId]) VALUES (N'4', 56)
INSERT [dbo].[CharacterSceneXref] ([CharacterId], [SceneId]) VALUES (N'6', 46)
INSERT [dbo].[CharacterSceneXref] ([CharacterId], [SceneId]) VALUES (N'31', 46)
INSERT [dbo].[CharacterSceneXref] ([CharacterId], [SceneId]) VALUES (N'58', 46)
INSERT [dbo].[CharacterSceneXref] ([CharacterId], [SceneId]) VALUES (N'14', 49)
INSERT [dbo].[CharacterSceneXref] ([CharacterId], [SceneId]) VALUES (N'1', 49)
INSERT [dbo].[CharacterSceneXref] ([CharacterId], [SceneId]) VALUES (N'5', 49)
INSERT [dbo].[CharacterSceneXref] ([CharacterId], [SceneId]) VALUES (N'5', 50)
INSERT [dbo].[CharacterSceneXref] ([CharacterId], [SceneId]) VALUES (N'17', 50)
INSERT [dbo].[CharacterSceneXref] ([CharacterId], [SceneId]) VALUES (N'10', 50)
INSERT [dbo].[CharacterSceneXref] ([CharacterId], [SceneId]) VALUES (N'6', 52)
INSERT [dbo].[CharacterSceneXref] ([CharacterId], [SceneId]) VALUES (N'14', 52)
INSERT [dbo].[CharacterSceneXref] ([CharacterId], [SceneId]) VALUES (N'59', 52)
INSERT [dbo].[CharacterSceneXref] ([CharacterId], [SceneId]) VALUES (N'15', 25)
INSERT [dbo].[CharacterSceneXref] ([CharacterId], [SceneId]) VALUES (N'16', 25)
INSERT [dbo].[CharacterSceneXref] ([CharacterId], [SceneId]) VALUES (N'15', 26)
INSERT [dbo].[CharacterSceneXref] ([CharacterId], [SceneId]) VALUES (N'16', 26)
INSERT [dbo].[CharacterSceneXref] ([CharacterId], [SceneId]) VALUES (N'15', 27)
INSERT [dbo].[CharacterSceneXref] ([CharacterId], [SceneId]) VALUES (N'16', 27)
INSERT [dbo].[CharacterSceneXref] ([CharacterId], [SceneId]) VALUES (N'15', 28)
INSERT [dbo].[CharacterSceneXref] ([CharacterId], [SceneId]) VALUES (N'16', 28)
INSERT [dbo].[CharacterSceneXref] ([CharacterId], [SceneId]) VALUES (N'15', 29)
INSERT [dbo].[CharacterSceneXref] ([CharacterId], [SceneId]) VALUES (N'16', 29)
INSERT [dbo].[CharacterSceneXref] ([CharacterId], [SceneId]) VALUES (N'15', 30)
INSERT [dbo].[CharacterSceneXref] ([CharacterId], [SceneId]) VALUES (N'16', 30)
INSERT [dbo].[CharacterSceneXref] ([CharacterId], [SceneId]) VALUES (N'3', 39)
INSERT [dbo].[CharacterSceneXref] ([CharacterId], [SceneId]) VALUES (N'2', 39)
INSERT [dbo].[CharacterSceneXref] ([CharacterId], [SceneId]) VALUES (N'12', 43)
INSERT [dbo].[CharacterSceneXref] ([CharacterId], [SceneId]) VALUES (N'13', 43)
INSERT [dbo].[CharacterSceneXref] ([CharacterId], [SceneId]) VALUES (N'15', 59)
INSERT [dbo].[CharacterSceneXref] ([CharacterId], [SceneId]) VALUES (N'16', 59)
INSERT [dbo].[CharacterSceneXref] ([CharacterId], [SceneId]) VALUES (N'3', 54)
INSERT [dbo].[CharacterSceneXref] ([CharacterId], [SceneId]) VALUES (N'6', 54)
INSERT [dbo].[CharacterSceneXref] ([CharacterId], [SceneId]) VALUES (N'1', 54)
INSERT [dbo].[CharacterSceneXref] ([CharacterId], [SceneId]) VALUES (N'9', 55)
INSERT [dbo].[CharacterSceneXref] ([CharacterId], [SceneId]) VALUES (N'1', 60)
INSERT [dbo].[CharacterSceneXref] ([CharacterId], [SceneId]) VALUES (N'2', 60)
INSERT [dbo].[CharacterSceneXref] ([CharacterId], [SceneId]) VALUES (N'31', 60)
INSERT [dbo].[CharacterSceneXref] ([CharacterId], [SceneId]) VALUES (N'12', 60)
INSERT [dbo].[CharacterSceneXref] ([CharacterId], [SceneId]) VALUES (N'10', 60)
INSERT [dbo].[CharacterSceneXref] ([CharacterId], [SceneId]) VALUES (N'55', 60)
INSERT [dbo].[CharacterSceneXref] ([CharacterId], [SceneId]) VALUES (N'15', 60)
INSERT [dbo].[CharacterSceneXref] ([CharacterId], [SceneId]) VALUES (N'13', 60)
INSERT [dbo].[CharacterSceneXref] ([CharacterId], [SceneId]) VALUES (N'14', 60)
/****** Object:  Table [dbo].[Characters]    Script Date: 09/25/2018 17:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Characters](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NOT NULL,
	[Notes] [varchar](4000) NULL,
	[CreatedOn] [datetime] NULL,
	[EditedOn] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[EditedBy] [varchar](50) NULL,
 CONSTRAINT [PK_Characters] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Characters] ON
INSERT [dbo].[Characters] ([Id], [FirstName], [LastName], [Notes], [CreatedOn], [EditedOn], [CreatedBy], [EditedBy]) VALUES (1, N'Jamie', N'Lannister', N'', CAST(0x0000A831004F285D AS DateTime), NULL, N'unknown', NULL)
INSERT [dbo].[Characters] ([Id], [FirstName], [LastName], [Notes], [CreatedOn], [EditedOn], [CreatedBy], [EditedBy]) VALUES (2, N'Sandor', N'Clegane', N'AKA ''The Hound''', CAST(0x0000A8310050ADB8 AS DateTime), NULL, N'unknown', NULL)
INSERT [dbo].[Characters] ([Id], [FirstName], [LastName], [Notes], [CreatedOn], [EditedOn], [CreatedBy], [EditedBy]) VALUES (3, N'Arya', N'Stark', N'', CAST(0x0000A8310050C7F1 AS DateTime), NULL, N'unknown', NULL)
INSERT [dbo].[Characters] ([Id], [FirstName], [LastName], [Notes], [CreatedOn], [EditedOn], [CreatedBy], [EditedBy]) VALUES (4, N'Cerci', N'Lannister', N'', CAST(0x0000A83701700FD4 AS DateTime), NULL, N'unknown', NULL)
INSERT [dbo].[Characters] ([Id], [FirstName], [LastName], [Notes], [CreatedOn], [EditedOn], [CreatedBy], [EditedBy]) VALUES (5, N'Jon', N'Snow', N'', CAST(0x0000A83800F9F7C7 AS DateTime), NULL, N'unknown', NULL)
INSERT [dbo].[Characters] ([Id], [FirstName], [LastName], [Notes], [CreatedOn], [EditedOn], [CreatedBy], [EditedBy]) VALUES (6, N'Eddard (Ned)', N'Stark', N'', CAST(0x0000A8380109AD70 AS DateTime), NULL, N'unknown', NULL)
INSERT [dbo].[Characters] ([Id], [FirstName], [LastName], [Notes], [CreatedOn], [EditedOn], [CreatedBy], [EditedBy]) VALUES (7, N'Tywin', N'Lannister', N'', CAST(0x0000A83801474848 AS DateTime), NULL, N'unknown', NULL)
INSERT [dbo].[Characters] ([Id], [FirstName], [LastName], [Notes], [CreatedOn], [EditedOn], [CreatedBy], [EditedBy]) VALUES (8, N'Thoros', N'of Myr', N'', CAST(0x0000A8380148850B AS DateTime), NULL, N'unknown', NULL)
INSERT [dbo].[Characters] ([Id], [FirstName], [LastName], [Notes], [CreatedOn], [EditedOn], [CreatedBy], [EditedBy]) VALUES (9, N'Young', N'Cerci Lannister', N'', CAST(0x0000A839000CF9BA AS DateTime), NULL, N'unknown', NULL)
INSERT [dbo].[Characters] ([Id], [FirstName], [LastName], [Notes], [CreatedOn], [EditedOn], [CreatedBy], [EditedBy]) VALUES (10, N'Marjorie', N'Tyrell', N'', CAST(0x0000A839000E3BFE AS DateTime), NULL, N'unknown', NULL)
INSERT [dbo].[Characters] ([Id], [FirstName], [LastName], [Notes], [CreatedOn], [EditedOn], [CreatedBy], [EditedBy]) VALUES (11, N'Meryn', N'Trant', N'a.k.a. The Mountain', CAST(0x0000A839000E52EB AS DateTime), NULL, N'unknown', NULL)
INSERT [dbo].[Characters] ([Id], [FirstName], [LastName], [Notes], [CreatedOn], [EditedOn], [CreatedBy], [EditedBy]) VALUES (12, N'Tyrion', N'Lannister', N'', CAST(0x0000A839000FD6CC AS DateTime), NULL, N'unknown', NULL)
INSERT [dbo].[Characters] ([Id], [FirstName], [LastName], [Notes], [CreatedOn], [EditedOn], [CreatedBy], [EditedBy]) VALUES (13, N'Varys', N'', N'a.k.a. The Spider', CAST(0x0000A839000FFFB1 AS DateTime), NULL, N'unknown', NULL)
INSERT [dbo].[Characters] ([Id], [FirstName], [LastName], [Notes], [CreatedOn], [EditedOn], [CreatedBy], [EditedBy]) VALUES (14, N'Illyrio', N'Mopatis', N'', CAST(0x0000A83900110BA2 AS DateTime), NULL, N'unknown', NULL)
INSERT [dbo].[Characters] ([Id], [FirstName], [LastName], [Notes], [CreatedOn], [EditedOn], [CreatedBy], [EditedBy]) VALUES (15, N'White', N'Rat', N'An Unsullied who is killed by a prostitute in S5e1.', CAST(0x0000A839001322EB AS DateTime), NULL, N'unknown', NULL)
INSERT [dbo].[Characters] ([Id], [FirstName], [LastName], [Notes], [CreatedOn], [EditedOn], [CreatedBy], [EditedBy]) VALUES (16, N'Vala', N'', N'A prostitute in Meereen.  Kills White Rat in S5e1.', CAST(0x0000A839001365DB AS DateTime), NULL, N'unknown', NULL)
INSERT [dbo].[Characters] ([Id], [FirstName], [LastName], [Notes], [CreatedOn], [EditedOn], [CreatedBy], [EditedBy]) VALUES (17, N'Jeoffrey', N'Baratheon', N'', CAST(0x0000A839013A40A1 AS DateTime), NULL, N'unknown', NULL)
INSERT [dbo].[Characters] ([Id], [FirstName], [LastName], [Notes], [CreatedOn], [EditedOn], [CreatedBy], [EditedBy]) VALUES (20, N'AAron', N'TestCharacter', N'', CAST(0x0000A83B0113110F AS DateTime), NULL, N'unknown', N'unknown')
INSERT [dbo].[Characters] ([Id], [FirstName], [LastName], [Notes], [CreatedOn], [EditedOn], [CreatedBy], [EditedBy]) VALUES (31, N'Briene', N'of Tarth', N'', CAST(0x0000A83E0055DC1D AS DateTime), NULL, N'unknown', N'unknown')
INSERT [dbo].[Characters] ([Id], [FirstName], [LastName], [Notes], [CreatedOn], [EditedOn], [CreatedBy], [EditedBy]) VALUES (55, N'Podrick', N'', N'', CAST(0x0000A84300D2F55E AS DateTime), NULL, N'unknown', N'unknown')
INSERT [dbo].[Characters] ([Id], [FirstName], [LastName], [Notes], [CreatedOn], [EditedOn], [CreatedBy], [EditedBy]) VALUES (56, N'test', N'1', N'', CAST(0x0000A84300ED6F9F AS DateTime), NULL, N'unknown', N'unknown')
INSERT [dbo].[Characters] ([Id], [FirstName], [LastName], [Notes], [CreatedOn], [EditedOn], [CreatedBy], [EditedBy]) VALUES (57, N'test', N'2', N'', CAST(0x0000A84300EE0071 AS DateTime), NULL, N'unknown', N'unknown')
INSERT [dbo].[Characters] ([Id], [FirstName], [LastName], [Notes], [CreatedOn], [EditedOn], [CreatedBy], [EditedBy]) VALUES (58, N'test', N'ch2', N'', CAST(0x0000A84400299F5C AS DateTime), NULL, N'unknown', N'unknown')
INSERT [dbo].[Characters] ([Id], [FirstName], [LastName], [Notes], [CreatedOn], [EditedOn], [CreatedBy], [EditedBy]) VALUES (59, N'tc', N'3', N'', CAST(0x0000A846001CCCDD AS DateTime), NULL, N'unknown', N'unknown')
SET IDENTITY_INSERT [dbo].[Characters] OFF
/****** Object:  Table [dbo].[BlogPosts]    Script Date: 09/25/2018 17:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BlogPosts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
	[Post] [varchar](max) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[IsPublic] [bit] NOT NULL,
 CONSTRAINT [PK_BlogPosts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[BlogPosts] ON
INSERT [dbo].[BlogPosts] ([id], [MemberId], [Post], [CreatedOn], [IsPublic]) VALUES (1, 1, N'Donor''s public blog post.', CAST(0x0000A6CC017C0912 AS DateTime), 1)
INSERT [dbo].[BlogPosts] ([id], [MemberId], [Post], [CreatedOn], [IsPublic]) VALUES (2, 2, N'Student One''s public blog post.', CAST(0x0000A6CC017D748C AS DateTime), 1)
INSERT [dbo].[BlogPosts] ([id], [MemberId], [Post], [CreatedOn], [IsPublic]) VALUES (3, 1, N'Non-public post from Donor 1 - Bob Jones.', CAST(0x0000A6D0012B7834 AS DateTime), 0)
INSERT [dbo].[BlogPosts] ([id], [MemberId], [Post], [CreatedOn], [IsPublic]) VALUES (4, 2, N'Now I''m making a new blog post which is not public.', CAST(0x0000A6D3012661DB AS DateTime), 0)
INSERT [dbo].[BlogPosts] ([id], [MemberId], [Post], [CreatedOn], [IsPublic]) VALUES (5, 2, N'Now I''m making a new blog post which is not public.', CAST(0x0000A6D30126D65F AS DateTime), 0)
INSERT [dbo].[BlogPosts] ([id], [MemberId], [Post], [CreatedOn], [IsPublic]) VALUES (6, 2, N'Now here''s my fourth post.', CAST(0x0000A6D30127B906 AS DateTime), 1)
INSERT [dbo].[BlogPosts] ([id], [MemberId], [Post], [CreatedOn], [IsPublic]) VALUES (7, 2, N'All I need now is a post that''ll run over the x-axis, so here it goes.  A quick brown fox jumped over the lazy dog.', CAST(0x0000A6D301286783 AS DateTime), 1)
INSERT [dbo].[BlogPosts] ([id], [MemberId], [Post], [CreatedOn], [IsPublic]) VALUES (8, 6, N'Hey why haven''t I made a blog post yet!?  I''m Student Two!', CAST(0x0000A6D301840392 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[BlogPosts] OFF
/****** Object:  UserDefinedFunction [dbo].[SplitString]    Script Date: 09/25/2018 17:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JSR
-- Create date: 12/01/17
-- Description:	Return a 1-column list table from a comma-delimited string.
-- =============================================
CREATE FUNCTION [dbo].[SplitString]
(    
      @Input NVARCHAR(MAX),
      @Character CHAR(1)
)
RETURNS @Output TABLE (
      Item NVARCHAR(1000)
)
AS
BEGIN
	DECLARE @StartIndex INT, @EndIndex INT
	
	--IF @trimSpacesAfterSeparator = 1
	--	BEGIN
			WHILE(CHARINDEX(@Character + ' ', @Input) > 0) 
				BEGIN
					SET @Input = REPLACE(@Input, @Character + ' ', @Character)
				END	
		--END

	SET @StartIndex = 1
	IF SUBSTRING(@Input, LEN(@Input) - 1, LEN(@Input)) <> @Character
	BEGIN
		SET @Input = @Input + @Character
	END

	WHILE CHARINDEX(@Character, @Input) > 0
	BEGIN
		SET @EndIndex = CHARINDEX(@Character, @Input)
	   
		INSERT INTO @Output(Item)
		SELECT SUBSTRING(@Input, @StartIndex, @EndIndex - 1)
	   
		SET @Input = SUBSTRING(@Input, @EndIndex + 1, LEN(@Input))
	END

	RETURN
END
GO
/****** Object:  Table [dbo].[SeasonInfo]    Script Date: 09/25/2018 17:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SeasonInfo](
	[SeasonNumber] [int] NOT NULL,
	[EpisodeCount] [int] NOT NULL,
 CONSTRAINT [PK_SeasonInfo] PRIMARY KEY CLUSTERED 
(
	[SeasonNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[SeasonInfo] ([SeasonNumber], [EpisodeCount]) VALUES (1, 10)
INSERT [dbo].[SeasonInfo] ([SeasonNumber], [EpisodeCount]) VALUES (2, 10)
INSERT [dbo].[SeasonInfo] ([SeasonNumber], [EpisodeCount]) VALUES (3, 10)
INSERT [dbo].[SeasonInfo] ([SeasonNumber], [EpisodeCount]) VALUES (4, 10)
INSERT [dbo].[SeasonInfo] ([SeasonNumber], [EpisodeCount]) VALUES (5, 10)
INSERT [dbo].[SeasonInfo] ([SeasonNumber], [EpisodeCount]) VALUES (6, 10)
INSERT [dbo].[SeasonInfo] ([SeasonNumber], [EpisodeCount]) VALUES (7, 7)
/****** Object:  Table [dbo].[SchoolTypes]    Script Date: 09/25/2018 17:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SchoolTypes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](75) NOT NULL,
	[Description] [varchar](500) NULL,
 CONSTRAINT [PK_SchoolTypes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[SchoolTypes] ON
INSERT [dbo].[SchoolTypes] ([id], [Type], [Description]) VALUES (1, N'1', N'public university')
INSERT [dbo].[SchoolTypes] ([id], [Type], [Description]) VALUES (2, N'2', N'public college')
INSERT [dbo].[SchoolTypes] ([id], [Type], [Description]) VALUES (3, N'3', N'community college')
INSERT [dbo].[SchoolTypes] ([id], [Type], [Description]) VALUES (4, N'4', N'private university')
INSERT [dbo].[SchoolTypes] ([id], [Type], [Description]) VALUES (5, N'5', N'private college')
INSERT [dbo].[SchoolTypes] ([id], [Type], [Description]) VALUES (6, N'6', N'military')
SET IDENTITY_INSERT [dbo].[SchoolTypes] OFF
/****** Object:  Table [dbo].[Schools]    Script Date: 09/25/2018 17:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Schools](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [int] NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[Website] [varchar](150) NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Schools] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Schools] ON
INSERT [dbo].[Schools] ([id], [Type], [Name], [Website], [CreatedBy], [CreatedOn]) VALUES (1, 3, N'Central Piedmont Com. College', N'www.CPCC.com', 1, CAST(0x0000A69D01430E4F AS DateTime))
INSERT [dbo].[Schools] ([id], [Type], [Name], [Website], [CreatedBy], [CreatedOn]) VALUES (2, 2, N'University of Florida', N'www.UF.com', 1, CAST(0x0000A6A000D8B693 AS DateTime))
INSERT [dbo].[Schools] ([id], [Type], [Name], [Website], [CreatedBy], [CreatedOn]) VALUES (3, 1, N'University of Michigan', N'www.UM.com', 1, CAST(0x0000A6A2000660CB AS DateTime))
INSERT [dbo].[Schools] ([id], [Type], [Name], [Website], [CreatedBy], [CreatedOn]) VALUES (4, 1, N'University of North Carolina', N'www.UNC.com', 1, CAST(0x0000A6A200078440 AS DateTime))
INSERT [dbo].[Schools] ([id], [Type], [Name], [Website], [CreatedBy], [CreatedOn]) VALUES (5, 5, N'School of Hard Knocks', N'www.UHK.com', 1, CAST(0x0000A6A4013444EE AS DateTime))
INSERT [dbo].[Schools] ([id], [Type], [Name], [Website], [CreatedBy], [CreatedOn]) VALUES (6, 1, N'Teton University', N'www.TU.com', 1, CAST(0x0000A6A800BA58CA AS DateTime))
INSERT [dbo].[Schools] ([id], [Type], [Name], [Website], [CreatedBy], [CreatedOn]) VALUES (7, 1, N'A Test School', N'www.TEST.com', 1, CAST(0x0000A6BD0096B133 AS DateTime))
INSERT [dbo].[Schools] ([id], [Type], [Name], [Website], [CreatedBy], [CreatedOn]) VALUES (8, 4, N'Penny Marshall College', N'www.PMU.com', 1, CAST(0x0000A6BE0168F17F AS DateTime))
INSERT [dbo].[Schools] ([id], [Type], [Name], [Website], [CreatedBy], [CreatedOn]) VALUES (11, 3, N'Winstone University', N'www.wu.com', 1, CAST(0x0000A6CA001F42A1 AS DateTime))
INSERT [dbo].[Schools] ([id], [Type], [Name], [Website], [CreatedBy], [CreatedOn]) VALUES (12, 6, N'My Mommas School', N'www.YoMomma.com', 1, CAST(0x0000A7D700489863 AS DateTime))
SET IDENTITY_INSERT [dbo].[Schools] OFF
/****** Object:  Table [dbo].[Scenes]    Script Date: 09/25/2018 17:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Scenes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Season] [varchar](1) NOT NULL,
	[Episode] [varchar](2) NOT NULL,
	[LocationId] [int] NOT NULL,
	[Timestamp] [varchar](7) NULL,
	[TimestampAsDecimal] [decimal](18, 2) NULL,
	[Description] [varchar](max) NULL,
	[CreatedOn] [datetime] NULL,
	[EditedOn] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[EditedBy] [varchar](50) NULL,
 CONSTRAINT [PK_Scenes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Scenes] ON
INSERT [dbo].[Scenes] ([Id], [Season], [Episode], [LocationId], [Timestamp], [TimestampAsDecimal], [Description], [CreatedOn], [EditedOn], [CreatedBy], [EditedBy]) VALUES (34, N'5', N'1', 1, N'9:00', CAST(9.00 AS Decimal(18, 2)), N'Cerci arrives to view Tywin lying in state.  Jamie is there already.  They talk.', CAST(0x0000A839014A963E AS DateTime), CAST(0x0000A839014A963E AS DateTime), N'unknown', N'unknown')
INSERT [dbo].[Scenes] ([Id], [Season], [Episode], [LocationId], [Timestamp], [TimestampAsDecimal], [Description], [CreatedOn], [EditedOn], [CreatedBy], [EditedBy]) VALUES (39, N'4', N'3', 3, N'16:48', CAST(16.80 AS Decimal(18, 2)), N'Arya and The Hound meet farmer while watering horse under bridge.  Stay with farmer overnight.  The Hound robs farmer in the morning.', CAST(0x0000A83A003302C9 AS DateTime), CAST(0x0000A83A003302C9 AS DateTime), N'unknown', N'unknown')
INSERT [dbo].[Scenes] ([Id], [Season], [Episode], [LocationId], [Timestamp], [TimestampAsDecimal], [Description], [CreatedOn], [EditedOn], [CreatedBy], [EditedBy]) VALUES (43, N'5', N'1', 8, N'12:14', CAST(12.23 AS Decimal(18, 2)), N'Tyrion and Varys arrive at the home of Illyio Mopatis after travelling incognito across The Narrow Sea.  Tyrion is released from his boxf', CAST(0x0000A83C000E523D AS DateTime), CAST(0x0000A83C000E523D AS DateTime), N'unknown', N'unknown')
INSERT [dbo].[Scenes] ([Id], [Season], [Episode], [LocationId], [Timestamp], [TimestampAsDecimal], [Description], [CreatedOn], [EditedOn], [CreatedBy], [EditedBy]) VALUES (46, N'4', N'10', 27, N'12:55', CAST(12.92 AS Decimal(18, 2)), N'dafsasd', CAST(0x0000A8440029C055 AS DateTime), NULL, N'unknown', N'unknown')
INSERT [dbo].[Scenes] ([Id], [Season], [Episode], [LocationId], [Timestamp], [TimestampAsDecimal], [Description], [CreatedOn], [EditedOn], [CreatedBy], [EditedBy]) VALUES (49, N'4', N'7', 5, N'1:59', CAST(1.98 AS Decimal(18, 2)), N'Another test scene.', CAST(0x0000A84500004A80 AS DateTime), NULL, N'unknown', N'unknown')
INSERT [dbo].[Scenes] ([Id], [Season], [Episode], [LocationId], [Timestamp], [TimestampAsDecimal], [Description], [CreatedOn], [EditedOn], [CreatedBy], [EditedBy]) VALUES (50, N'2', N'2', 9, N'19:48', CAST(19.80 AS Decimal(18, 2)), N'This is a test scene.ttt', CAST(0x0000A846001C9F7A AS DateTime), CAST(0x0000A846001C9F7A AS DateTime), N'unknown', N'unknown')
INSERT [dbo].[Scenes] ([Id], [Season], [Episode], [LocationId], [Timestamp], [TimestampAsDecimal], [Description], [CreatedOn], [EditedOn], [CreatedBy], [EditedBy]) VALUES (52, N'2', N'10', 27, N'33:22', CAST(33.37 AS Decimal(18, 2)), N'sadfadsf', CAST(0x0000A846001D0D14 AS DateTime), CAST(0x0000A846001D0D14 AS DateTime), N'unknown', N'unknown')
INSERT [dbo].[Scenes] ([Id], [Season], [Episode], [LocationId], [Timestamp], [TimestampAsDecimal], [Description], [CreatedOn], [EditedOn], [CreatedBy], [EditedBy]) VALUES (54, N'4', N'3', 5, N'8:44', CAST(8.73 AS Decimal(18, 2)), N'Test scene and testx', CAST(0x0000A8470003A245 AS DateTime), CAST(0x0000A8470003A245 AS DateTime), N'unknown', N'unknown')
INSERT [dbo].[Scenes] ([Id], [Season], [Episode], [LocationId], [Timestamp], [TimestampAsDecimal], [Description], [CreatedOn], [EditedOn], [CreatedBy], [EditedBy]) VALUES (55, N'5', N'1', 7, N'5:00', CAST(5.00 AS Decimal(18, 2)), N'Young Cerci sneaks away in the woods to see a witch.  Hears her future is not to wed the prince, but the king.  She will be Queen until another younger one comes.  She will have three children.', CAST(0x0000A847003DF6F1 AS DateTime), CAST(0x0000A847003DF6F1 AS DateTime), N'unknown', N'unknown')
INSERT [dbo].[Scenes] ([Id], [Season], [Episode], [LocationId], [Timestamp], [TimestampAsDecimal], [Description], [CreatedOn], [EditedOn], [CreatedBy], [EditedBy]) VALUES (56, N'4', N'6', 3, N'33:22', CAST(33.37 AS Decimal(18, 2)), N'asdf', CAST(0x0000A84800DD5685 AS DateTime), CAST(0x0000A84800DD5685 AS DateTime), N'unknown', N'unknown')
INSERT [dbo].[Scenes] ([Id], [Season], [Episode], [LocationId], [Timestamp], [TimestampAsDecimal], [Description], [CreatedOn], [EditedOn], [CreatedBy], [EditedBy]) VALUES (57, N'1', N'1', 4, N'4:30', CAST(4.50 AS Decimal(18, 2)), N'asdfasdfzxvczvcx', CAST(0x0000A84A000561BA AS DateTime), CAST(0x0000A84A000561B6 AS DateTime), N'unknown', N'unknown')
INSERT [dbo].[Scenes] ([Id], [Season], [Episode], [LocationId], [Timestamp], [TimestampAsDecimal], [Description], [CreatedOn], [EditedOn], [CreatedBy], [EditedBy]) VALUES (59, N'5', N'1', 9, N'15:44', CAST(15.73 AS Decimal(18, 2)), N'White Rat visits Vala and is murdered by a Sons of the Harpy soldier.', CAST(0x0000A84A0005E427 AS DateTime), CAST(0x0000A84A0005E427 AS DateTime), N'unknown', N'unknown')
INSERT [dbo].[Scenes] ([Id], [Season], [Episode], [LocationId], [Timestamp], [TimestampAsDecimal], [Description], [CreatedOn], [EditedOn], [CreatedBy], [EditedBy]) VALUES (60, N'4', N'7', 2, N'22:45', CAST(22.75 AS Decimal(18, 2)), N'A test scene.', CAST(0x0000A84B002F6B7E AS DateTime), CAST(0x0000A84B002F6B79 AS DateTime), N'unknown', N'unknown')
SET IDENTITY_INSERT [dbo].[Scenes] OFF
/****** Object:  Table [dbo].[ResourceRecipients]    Script Date: 09/25/2018 17:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResourceRecipients](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ResourceId] [int] NOT NULL,
	[RecipientId] [int] NOT NULL,
	[ApprovedOn] [datetime] NULL,
	[CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_ResourceRecipients] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ResourceRecipients] ON
INSERT [dbo].[ResourceRecipients] ([id], [ResourceId], [RecipientId], [ApprovedOn], [CreatedOn]) VALUES (1, 3, 2, CAST(0x0000A6CC017C77A9 AS DateTime), CAST(0x0000A6CC017C404E AS DateTime))
INSERT [dbo].[ResourceRecipients] ([id], [ResourceId], [RecipientId], [ApprovedOn], [CreatedOn]) VALUES (3, 4, 6, CAST(0x0000A6D601703968 AS DateTime), CAST(0x0000A6CF005C557E AS DateTime))
INSERT [dbo].[ResourceRecipients] ([id], [ResourceId], [RecipientId], [ApprovedOn], [CreatedOn]) VALUES (4, 7, 6, CAST(0x0000A6CF014A81EA AS DateTime), CAST(0x0000A6CF014A7C90 AS DateTime))
INSERT [dbo].[ResourceRecipients] ([id], [ResourceId], [RecipientId], [ApprovedOn], [CreatedOn]) VALUES (5, 7, 2, CAST(0x0000A6D4000D3EA6 AS DateTime), CAST(0x0000A6D4000CFD23 AS DateTime))
INSERT [dbo].[ResourceRecipients] ([id], [ResourceId], [RecipientId], [ApprovedOn], [CreatedOn]) VALUES (6, 7, 10, NULL, CAST(0x0000A6DC015AB060 AS DateTime))
INSERT [dbo].[ResourceRecipients] ([id], [ResourceId], [RecipientId], [ApprovedOn], [CreatedOn]) VALUES (7, 4, 2, NULL, CAST(0x0000A9600178A2DD AS DateTime))
SET IDENTITY_INSERT [dbo].[ResourceRecipients] OFF
/****** Object:  Table [dbo].[ResourceInfo]    Script Date: 09/25/2018 17:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ResourceInfo](
	[MemberId] [int] NOT NULL,
	[SchoolId] [int] NULL,
	[Position] [varchar](200) NULL,
	[URL] [varchar](150) NULL,
	[SupvName] [varchar](50) NULL,
	[SupvPosition] [varchar](50) NULL,
	[SupvURL] [varchar](150) NULL,
	[SupvEmail] [varchar](150) NULL,
	[SupvPhone] [varchar](15) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[EditedOn] [datetime] NULL,
	[ApprovedOn] [datetime] NULL,
	[ApprovedBy] [int] NULL,
 CONSTRAINT [PK_ResourceInfo] PRIMARY KEY CLUSTERED 
(
	[MemberId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[ResourceInfo] ([MemberId], [SchoolId], [Position], [URL], [SupvName], [SupvPosition], [SupvURL], [SupvEmail], [SupvPhone], [CreatedOn], [EditedOn], [ApprovedOn], [ApprovedBy]) VALUES (3, 3, N'Head Verifier', N'not my street', N'Bob Bombast', N'Head Verifier Supv.', N'http://mycollege/bobspic', N'email@emial.com', N'3212196871', CAST(0x0000A6CC017B4CFC AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[ResourceInfo] ([MemberId], [SchoolId], [Position], [URL], [SupvName], [SupvPosition], [SupvURL], [SupvEmail], [SupvPhone], [CreatedOn], [EditedOn], [ApprovedOn], [ApprovedBy]) VALUES (4, 2, N'Head Verifierx', N'234 awsefr', N'Bob Bombastx', N'Head Verifier Supv.x', N'http://mycollege/bobspicxx', N'jscottr@gmail.com', N'3212196871', CAST(0x0000A6CE014B90F0 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[ResourceInfo] ([MemberId], [SchoolId], [Position], [URL], [SupvName], [SupvPosition], [SupvURL], [SupvEmail], [SupvPhone], [CreatedOn], [EditedOn], [ApprovedOn], [ApprovedBy]) VALUES (7, 6, N'Head Verifier2', N'234 awsefr', N'Bob Bombast2', N'Head Verifier Supv.2', N'http://mycollege/bobspicx', N'jscottr@gmail.com', N'7042545397', CAST(0x0000A6CF014A5AA2 AS DateTime), NULL, NULL, NULL)
/****** Object:  Table [dbo].[RecipientPasswordApprovals]    Script Date: 09/25/2018 17:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RecipientPasswordApprovals](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[RecipientId] [int] NOT NULL,
	[Password] [varchar](150) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UsedOn] [datetime] NULL,
 CONSTRAINT [PK_RecipientPasswordApprovals] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[RecipientPasswordApprovals] ON
INSERT [dbo].[RecipientPasswordApprovals] ([id], [RecipientId], [Password], [CreatedOn], [UsedOn]) VALUES (1, 6, N'JM60AV', CAST(0x0000A6CF00517327 AS DateTime), CAST(0x0000A6D601703968 AS DateTime))
INSERT [dbo].[RecipientPasswordApprovals] ([id], [RecipientId], [Password], [CreatedOn], [UsedOn]) VALUES (2, 6, N'7TZE8X', CAST(0x0000A6CF014A1AA9 AS DateTime), CAST(0x0000A6D601703968 AS DateTime))
SET IDENTITY_INSERT [dbo].[RecipientPasswordApprovals] OFF
/****** Object:  Table [dbo].[Reasons]    Script Date: 09/25/2018 17:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Reasons](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MemberType] [int] NOT NULL,
	[Description] [varchar](100) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Reasons] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Reasons] ON
INSERT [dbo].[Reasons] ([id], [MemberType], [Description], [CreatedBy], [CreatedOn]) VALUES (1, 2, N'To supplement my loans', 1, CAST(0x0000A69D012C2CCD AS DateTime))
INSERT [dbo].[Reasons] ([id], [MemberType], [Description], [CreatedBy], [CreatedOn]) VALUES (2, 2, N'To supplement funds from parents', 2, CAST(0x0000A69D012C2CCD AS DateTime))
INSERT [dbo].[Reasons] ([id], [MemberType], [Description], [CreatedBy], [CreatedOn]) VALUES (3, 2, N'To supplement funds from other family/friends', 3, CAST(0x0000A69D012C2CCD AS DateTime))
INSERT [dbo].[Reasons] ([id], [MemberType], [Description], [CreatedBy], [CreatedOn]) VALUES (4, 2, N'To supplement my own funds', 4, CAST(0x0000A69D012C2CCD AS DateTime))
INSERT [dbo].[Reasons] ([id], [MemberType], [Description], [CreatedBy], [CreatedOn]) VALUES (5, 1, N'To support my alma mater', 3, CAST(0x0000A69D012C2CCD AS DateTime))
INSERT [dbo].[Reasons] ([id], [MemberType], [Description], [CreatedBy], [CreatedOn]) VALUES (6, 1, N'To support someone in my field', 2, CAST(0x0000A69D012C2CCD AS DateTime))
INSERT [dbo].[Reasons] ([id], [MemberType], [Description], [CreatedBy], [CreatedOn]) VALUES (7, 1, N'To reduce college loans in general', 1, CAST(0x0000A69D012C2CCD AS DateTime))
INSERT [dbo].[Reasons] ([id], [MemberType], [Description], [CreatedBy], [CreatedOn]) VALUES (8, 1, N'To support a family member', 2, CAST(0x0000A69D012C2CCD AS DateTime))
INSERT [dbo].[Reasons] ([id], [MemberType], [Description], [CreatedBy], [CreatedOn]) VALUES (9, 1, N'To support someone from my church', 3, CAST(0x0000A69D012C2CCD AS DateTime))
INSERT [dbo].[Reasons] ([id], [MemberType], [Description], [CreatedBy], [CreatedOn]) VALUES (10, 1, N'To support someone from my work', 4, CAST(0x0000A69D012C2CCD AS DateTime))
INSERT [dbo].[Reasons] ([id], [MemberType], [Description], [CreatedBy], [CreatedOn]) VALUES (12, 2, N'to make money', 4, CAST(0x0000A6A10161B476 AS DateTime))
INSERT [dbo].[Reasons] ([id], [MemberType], [Description], [CreatedBy], [CreatedOn]) VALUES (13, 2, N'to give back', 4, CAST(0x0000A6A10161B476 AS DateTime))
INSERT [dbo].[Reasons] ([id], [MemberType], [Description], [CreatedBy], [CreatedOn]) VALUES (15, 0, N'I have too much money', 8, CAST(0x0000A6A10162A89C AS DateTime))
INSERT [dbo].[Reasons] ([id], [MemberType], [Description], [CreatedBy], [CreatedOn]) VALUES (18, 0, N'to meet women', 13, CAST(0x0000A6A4013587B1 AS DateTime))
INSERT [dbo].[Reasons] ([id], [MemberType], [Description], [CreatedBy], [CreatedOn]) VALUES (19, 3, N'To make money for my organization', 1, CAST(0x0000A6B5000C43CF AS DateTime))
INSERT [dbo].[Reasons] ([id], [MemberType], [Description], [CreatedBy], [CreatedOn]) VALUES (20, 3, N'To help a family', 1, CAST(0x0000A6B5000C641B AS DateTime))
INSERT [dbo].[Reasons] ([id], [MemberType], [Description], [CreatedBy], [CreatedOn]) VALUES (21, 3, N'To help a student', 1, CAST(0x0000A6B5000C6FC7 AS DateTime))
INSERT [dbo].[Reasons] ([id], [MemberType], [Description], [CreatedBy], [CreatedOn]) VALUES (22, 3, N'To help my department', 1, CAST(0x0000A6B5000C9E5F AS DateTime))
SET IDENTITY_INSERT [dbo].[Reasons] OFF
/****** Object:  Table [dbo].[PersonalInfo]    Script Date: 09/25/2018 17:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PersonalInfo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
	[FirstName] [varchar](50) NULL,
	[MiddleName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Street1] [varchar](50) NULL,
	[Street2] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[StateId] [int] NULL,
	[Province] [varchar](10) NULL,
	[PostalCode] [varchar](12) NULL,
	[Telephone1] [varchar](12) NULL,
	[Telephone1Type] [int] NULL,
	[Telephone2] [varchar](12) NULL,
	[Telephone2Type] [int] NULL,
	[Email] [varchar](150) NULL,
	[Website] [varchar](250) NULL,
	[AllowContact] [bit] NOT NULL,
	[SchoolCost] [decimal](18, 2) NULL,
	[AboutMe] [varchar](max) NULL,
	[Age] [int] NULL,
	[ShowInPublicSearch] [bit] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[EditedOn] [datetime] NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[PersonalInfo] ON
INSERT [dbo].[PersonalInfo] ([id], [MemberId], [FirstName], [MiddleName], [LastName], [Street1], [Street2], [City], [StateId], [Province], [PostalCode], [Telephone1], [Telephone1Type], [Telephone2], [Telephone2Type], [Email], [Website], [AllowContact], [SchoolCost], [AboutMe], [Age], [ShowInPublicSearch], [CreatedOn], [EditedOn]) VALUES (4, 3, N'Melanie', N'', N'Nicholson', N'702 Forest Street NW', N'', N'Concord', 1, NULL, N'28025', N'7047064529', 2, N'7047064529', 2, N'jscottr@gmail.com', N'', 0, CAST(-1.00 AS Decimal(18, 2)), N'', -1, 0, CAST(0x0000A6CC017B71D0 AS DateTime), CAST(0x0000A6CC017B71D5 AS DateTime))
INSERT [dbo].[PersonalInfo] ([id], [MemberId], [FirstName], [MiddleName], [LastName], [Street1], [Street2], [City], [StateId], [Province], [PostalCode], [Telephone1], [Telephone1Type], [Telephone2], [Telephone2Type], [Email], [Website], [AllowContact], [SchoolCost], [AboutMe], [Age], [ShowInPublicSearch], [CreatedOn], [EditedOn]) VALUES (5, -1, N'Bob', NULL, N'Rushing', NULL, NULL, NULL, NULL, NULL, NULL, N'7047064529', 1, NULL, 2, N'jrushing@epicreg.com', N'www.alan@myschool.com', 0, NULL, NULL, NULL, 1, CAST(0x0000A6CC017C577E AS DateTime), NULL)
INSERT [dbo].[PersonalInfo] ([id], [MemberId], [FirstName], [MiddleName], [LastName], [Street1], [Street2], [City], [StateId], [Province], [PostalCode], [Telephone1], [Telephone1Type], [Telephone2], [Telephone2Type], [Email], [Website], [AllowContact], [SchoolCost], [AboutMe], [Age], [ShowInPublicSearch], [CreatedOn], [EditedOn]) VALUES (8, 6, N'Student', N'', N'Two', N'654 asdf', N'234 awsefr', N'asdfasd', 1, NULL, N'44556', N'', 1, N'', 1, N'', N'', 0, CAST(-1.00 AS Decimal(18, 2)), N'', -1, 0, CAST(0x0000A6CF00505CBD AS DateTime), CAST(0x0000A6CF00505CBD AS DateTime))
INSERT [dbo].[PersonalInfo] ([id], [MemberId], [FirstName], [MiddleName], [LastName], [Street1], [Street2], [City], [StateId], [Province], [PostalCode], [Telephone1], [Telephone1Type], [Telephone2], [Telephone2Type], [Email], [Website], [AllowContact], [SchoolCost], [AboutMe], [Age], [ShowInPublicSearch], [CreatedOn], [EditedOn]) VALUES (9, -1, N'Aaron', NULL, N'Witsoe', NULL, NULL, NULL, NULL, NULL, NULL, N'7047064529', 1, NULL, 2, N'jscottr@gmail.com', N'www.alan@myschool.com', 0, NULL, NULL, NULL, 1, CAST(0x0000A6CF005863F9 AS DateTime), NULL)
INSERT [dbo].[PersonalInfo] ([id], [MemberId], [FirstName], [MiddleName], [LastName], [Street1], [Street2], [City], [StateId], [Province], [PostalCode], [Telephone1], [Telephone1Type], [Telephone2], [Telephone2Type], [Email], [Website], [AllowContact], [SchoolCost], [AboutMe], [Age], [ShowInPublicSearch], [CreatedOn], [EditedOn]) VALUES (11, 5, N'Donor', N'', N'Two', N'654 asdf', N'234 awsefr', N'asdfasd', 1, NULL, N'44556', N'', 2, N'', 2, N'', N'', 1, CAST(3344.00 AS Decimal(18, 2)), N'My profile is complete.', 33, 1, CAST(0x0000A6D00129A424 AS DateTime), CAST(0x0000A6D00129A424 AS DateTime))
INSERT [dbo].[PersonalInfo] ([id], [MemberId], [FirstName], [MiddleName], [LastName], [Street1], [Street2], [City], [StateId], [Province], [PostalCode], [Telephone1], [Telephone1Type], [Telephone2], [Telephone2Type], [Email], [Website], [AllowContact], [SchoolCost], [AboutMe], [Age], [ShowInPublicSearch], [CreatedOn], [EditedOn]) VALUES (12, 2, N'Richard', N'', N'Macary', N'not my street', N'not my street', N'no city', 1, NULL, N'99339', N'', 2, N'', 2, N'jrushing@epicreg.com', N'', 1, CAST(5588.00 AS Decimal(18, 2)), N'I AM STUDENT ONE!', -1, 1, CAST(0x0000A6D00129FFC0 AS DateTime), CAST(0x0000A6D00129FFC0 AS DateTime))
INSERT [dbo].[PersonalInfo] ([id], [MemberId], [FirstName], [MiddleName], [LastName], [Street1], [Street2], [City], [StateId], [Province], [PostalCode], [Telephone1], [Telephone1Type], [Telephone2], [Telephone2Type], [Email], [Website], [AllowContact], [SchoolCost], [AboutMe], [Age], [ShowInPublicSearch], [CreatedOn], [EditedOn]) VALUES (17, 8, N'Donor', N'', N'Three', N'100 Donor St.', N'', N'Donorville', 1, NULL, N'77889', N'1234567890', 2, N'3216549875', 4, N'jscottr@gmail.com', N'www.com', 0, CAST(-1.00 AS Decimal(18, 2)), N'', 88, 0, CAST(0x0000A6D3012074A9 AS DateTime), CAST(0x0000A6D3012074AE AS DateTime))
INSERT [dbo].[PersonalInfo] ([id], [MemberId], [FirstName], [MiddleName], [LastName], [Street1], [Street2], [City], [StateId], [Province], [PostalCode], [Telephone1], [Telephone1Type], [Telephone2], [Telephone2Type], [Email], [Website], [AllowContact], [SchoolCost], [AboutMe], [Age], [ShowInPublicSearch], [CreatedOn], [EditedOn]) VALUES (18, 9, N'Tom', N'', N'Jones', N'', N'', N'', 1, NULL, N'', N'', 1, N'', 1, N'', N'', 0, CAST(-1.00 AS Decimal(18, 2)), N'', -1, 0, CAST(0x0000A6D40176799C AS DateTime), CAST(0x0000A6D4017679A1 AS DateTime))
INSERT [dbo].[PersonalInfo] ([id], [MemberId], [FirstName], [MiddleName], [LastName], [Street1], [Street2], [City], [StateId], [Province], [PostalCode], [Telephone1], [Telephone1Type], [Telephone2], [Telephone2Type], [Email], [Website], [AllowContact], [SchoolCost], [AboutMe], [Age], [ShowInPublicSearch], [CreatedOn], [EditedOn]) VALUES (22, 7, N'Trusted', N'', N'Three', N'not my street', N'not my street', N'no city', 1, NULL, N'99339', N'1234567890', 3, N'1234567890', 4, N'jrushing@epicreg.com', N'www.pmc.comxx', 0, CAST(-1.00 AS Decimal(18, 2)), N'', -1, 0, CAST(0x0000A6D600279B52 AS DateTime), CAST(0x0000A6D600279B52 AS DateTime))
INSERT [dbo].[PersonalInfo] ([id], [MemberId], [FirstName], [MiddleName], [LastName], [Street1], [Street2], [City], [StateId], [Province], [PostalCode], [Telephone1], [Telephone1Type], [Telephone2], [Telephone2Type], [Email], [Website], [AllowContact], [SchoolCost], [AboutMe], [Age], [ShowInPublicSearch], [CreatedOn], [EditedOn]) VALUES (24, 4, N'Trusted', N'', N'Two', N'654 asdf', N'234 awsefr', N'asdfasd', 1, NULL, N'44556', N'1234567890', 2, N'1234567890', 3, N'asdfadsf@asdafa.comxxee', N'www.wu.comxxxaa', 0, CAST(-1.00 AS Decimal(18, 2)), N'', -1, 0, CAST(0x0000A6D60028002A AS DateTime), CAST(0x0000A6D60028002A AS DateTime))
INSERT [dbo].[PersonalInfo] ([id], [MemberId], [FirstName], [MiddleName], [LastName], [Street1], [Street2], [City], [StateId], [Province], [PostalCode], [Telephone1], [Telephone1Type], [Telephone2], [Telephone2Type], [Email], [Website], [AllowContact], [SchoolCost], [AboutMe], [Age], [ShowInPublicSearch], [CreatedOn], [EditedOn]) VALUES (28, 1, N'Bob', N'', N'Jones', N'234 asdf st.', N'', N'asdf', 26, NULL, N'98995', N'1234567890', 2, N'1234567890', 3, N'email@emial.com', N'', 0, CAST(-1.00 AS Decimal(18, 2)), N'', -1, 0, CAST(0x0000A6D9013BC451 AS DateTime), CAST(0x0000A6D9013BC46D AS DateTime))
INSERT [dbo].[PersonalInfo] ([id], [MemberId], [FirstName], [MiddleName], [LastName], [Street1], [Street2], [City], [StateId], [Province], [PostalCode], [Telephone1], [Telephone1Type], [Telephone2], [Telephone2Type], [Email], [Website], [AllowContact], [SchoolCost], [AboutMe], [Age], [ShowInPublicSearch], [CreatedOn], [EditedOn]) VALUES (29, 10, N'Student', N'', N'K-dog', N'not my street', N'not my street', N'no city', 0, NULL, N'99339', N'123-456-7890', 1, N'123-456-7890', 1, N'jrushing@epicreg.com', N'', 0, CAST(-1.00 AS Decimal(18, 2)), N'', -1, 0, CAST(0x0000A6DC015AA9AE AS DateTime), CAST(0x0000A6DC015AA9AE AS DateTime))
INSERT [dbo].[PersonalInfo] ([id], [MemberId], [FirstName], [MiddleName], [LastName], [Street1], [Street2], [City], [StateId], [Province], [PostalCode], [Telephone1], [Telephone1Type], [Telephone2], [Telephone2Type], [Email], [Website], [AllowContact], [SchoolCost], [AboutMe], [Age], [ShowInPublicSearch], [CreatedOn], [EditedOn]) VALUES (30, -1, N'Don', NULL, N'Mr', NULL, NULL, NULL, NULL, NULL, NULL, N'2343433322', 1, NULL, 2, N'asdf@asdf.coma', N'www.markatmsu.com', 0, NULL, NULL, NULL, 1, CAST(0x0000A6DC015AEC0F AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[PersonalInfo] OFF
/****** Object:  Table [dbo].[MessageTargets]    Script Date: 09/25/2018 17:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MessageTargets](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MessageId] [int] NOT NULL,
	[TargetId] [int] NOT NULL,
 CONSTRAINT [PK_MessageTargets] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Messages]    Script Date: 09/25/2018 17:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Messages](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[OriginatorId] [int] NOT NULL,
	[Message] [varchar](max) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[DeliveredOn] [datetime] NULL,
	[IsPublic] [bit] NOT NULL,
 CONSTRAINT [PK_Messges] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Messages] ON
INSERT [dbo].[Messages] ([id], [OriginatorId], [Message], [CreatedOn], [DeliveredOn], [IsPublic]) VALUES (1, 2, N'Here''s a message which Donor Two and Bob Jones should see.', CAST(0x0000A6D0012906EC AS DateTime), NULL, 0)
INSERT [dbo].[Messages] ([id], [OriginatorId], [Message], [CreatedOn], [DeliveredOn], [IsPublic]) VALUES (2, 2, N'This message is a really long one to help test the new blog and message displays.', CAST(0x0000A6D3012BF572 AS DateTime), NULL, 0)
INSERT [dbo].[Messages] ([id], [OriginatorId], [Message], [CreatedOn], [DeliveredOn], [IsPublic]) VALUES (3, 2, N'This message is a really long one to help test the new blog and message displays.', CAST(0x0000A6D3012C1DE5 AS DateTime), NULL, 0)
SET IDENTITY_INSERT [dbo].[Messages] OFF
/****** Object:  Table [dbo].[MemberTypes]    Script Date: 09/25/2018 17:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MemberTypes](
	[Id] [int] NOT NULL,
	[Type] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[MemberTypes] ([Id], [Type]) VALUES (1, N'Donor')
INSERT [dbo].[MemberTypes] ([Id], [Type]) VALUES (2, N'Student')
INSERT [dbo].[MemberTypes] ([Id], [Type]) VALUES (3, N'Trusted Resource')
INSERT [dbo].[MemberTypes] ([Id], [Type]) VALUES (4, N'Administrator')
INSERT [dbo].[MemberTypes] ([Id], [Type]) VALUES (5, N'System')
INSERT [dbo].[MemberTypes] ([Id], [Type]) VALUES (6, N'School Contact')
/****** Object:  Table [dbo].[MemberSchools]    Script Date: 09/25/2018 17:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberSchools](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
	[SchoolId] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_MemberSchools] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MemberSchools] ON
INSERT [dbo].[MemberSchools] ([id], [MemberId], [SchoolId], [CreatedOn]) VALUES (4, 3, 0, CAST(0x0000A6CC017B71D0 AS DateTime))
INSERT [dbo].[MemberSchools] ([id], [MemberId], [SchoolId], [CreatedOn]) VALUES (7, 6, 0, CAST(0x0000A6CF00505CBD AS DateTime))
INSERT [dbo].[MemberSchools] ([id], [MemberId], [SchoolId], [CreatedOn]) VALUES (9, 5, 8, CAST(0x0000A6D00129A424 AS DateTime))
INSERT [dbo].[MemberSchools] ([id], [MemberId], [SchoolId], [CreatedOn]) VALUES (10, 5, 6, CAST(0x0000A6D00129A424 AS DateTime))
INSERT [dbo].[MemberSchools] ([id], [MemberId], [SchoolId], [CreatedOn]) VALUES (11, 2, 1, CAST(0x0000A6D00129FFC0 AS DateTime))
INSERT [dbo].[MemberSchools] ([id], [MemberId], [SchoolId], [CreatedOn]) VALUES (18, 8, 7, CAST(0x0000A6D3012074AE AS DateTime))
INSERT [dbo].[MemberSchools] ([id], [MemberId], [SchoolId], [CreatedOn]) VALUES (19, 8, 8, CAST(0x0000A6D3012074AE AS DateTime))
INSERT [dbo].[MemberSchools] ([id], [MemberId], [SchoolId], [CreatedOn]) VALUES (20, 8, 2, CAST(0x0000A6D3012074AE AS DateTime))
INSERT [dbo].[MemberSchools] ([id], [MemberId], [SchoolId], [CreatedOn]) VALUES (21, 9, 0, CAST(0x0000A6D4017679A1 AS DateTime))
INSERT [dbo].[MemberSchools] ([id], [MemberId], [SchoolId], [CreatedOn]) VALUES (25, 7, 0, CAST(0x0000A6D600279B52 AS DateTime))
INSERT [dbo].[MemberSchools] ([id], [MemberId], [SchoolId], [CreatedOn]) VALUES (27, 4, 0, CAST(0x0000A6D60028002A AS DateTime))
INSERT [dbo].[MemberSchools] ([id], [MemberId], [SchoolId], [CreatedOn]) VALUES (31, 1, 0, CAST(0x0000A6D9013BC451 AS DateTime))
INSERT [dbo].[MemberSchools] ([id], [MemberId], [SchoolId], [CreatedOn]) VALUES (32, 10, 0, CAST(0x0000A6DC015AA9AE AS DateTime))
SET IDENTITY_INSERT [dbo].[MemberSchools] OFF
/****** Object:  Table [dbo].[Members]    Script Date: 09/25/2018 17:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Members](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MemberType] [int] NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Members] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Members] ON
INSERT [dbo].[Members] ([id], [MemberType], [UserName], [Password], [CreatedOn], [IsActive]) VALUES (1, 1, N'b', N'EAAAACiCOiHONlbwOZYbbfIh+MNulAB7oMqYTx5P/UCu8YaJ', CAST(0x0000A6CC017B1419 AS DateTime), 1)
INSERT [dbo].[Members] ([id], [MemberType], [UserName], [Password], [CreatedOn], [IsActive]) VALUES (2, 2, N'c', N'EAAAAN5XnzlNYuGX+a0fKIvHO2TlV17wsHccvkXpriR07w9H', CAST(0x0000A6CC017B29D4 AS DateTime), 1)
INSERT [dbo].[Members] ([id], [MemberType], [UserName], [Password], [CreatedOn], [IsActive]) VALUES (3, 3, N'd', N'EAAAAGdcymwHK6+H8Y9wSsKC0QAi9pEPAk+E/9mOauVYz9xF', CAST(0x0000A6CC017B43AD AS DateTime), 1)
INSERT [dbo].[Members] ([id], [MemberType], [UserName], [Password], [CreatedOn], [IsActive]) VALUES (4, 3, N'e', N'EAAAAHYKkgzMg+l8lc7xIOWD4CxDtvJhj78nssSFMi9Nb8bY', CAST(0x0000A6CE014B79DD AS DateTime), 1)
INSERT [dbo].[Members] ([id], [MemberType], [UserName], [Password], [CreatedOn], [IsActive]) VALUES (5, 1, N'f', N'EAAAAN9MgNkBu0HwW+Izwng/esg07146SHGEB55DzZS8rHCx', CAST(0x0000A6CF00501EFC AS DateTime), 1)
INSERT [dbo].[Members] ([id], [MemberType], [UserName], [Password], [CreatedOn], [IsActive]) VALUES (6, 2, N'g', N'EAAAAEcCV87nLkFV4af1zUAnjndq0wtO97kVWS2HY9FnjEro', CAST(0x0000A6CF0050466B AS DateTime), 1)
INSERT [dbo].[Members] ([id], [MemberType], [UserName], [Password], [CreatedOn], [IsActive]) VALUES (7, 3, N'h', N'EAAAAJXi/n4QEy8ON3d2yvtD0H9WDTIKsXk6Wy9vCnWlgk00', CAST(0x0000A6CF014A3C48 AS DateTime), 1)
INSERT [dbo].[Members] ([id], [MemberType], [UserName], [Password], [CreatedOn], [IsActive]) VALUES (8, 1, N'i', N'EAAAADOxKJ7PmBxV8VCV+Zvi5tVijWyXwNwz1rSSPOilBlgb', CAST(0x0000A6D2014B6765 AS DateTime), 1)
INSERT [dbo].[Members] ([id], [MemberType], [UserName], [Password], [CreatedOn], [IsActive]) VALUES (9, 1, N'j', N'EAAAAM0Vol+hc50EkA8XaVnpQuRnoLkeYbPRt4w5ry6vFQJs', CAST(0x0000A6D401765953 AS DateTime), 1)
INSERT [dbo].[Members] ([id], [MemberType], [UserName], [Password], [CreatedOn], [IsActive]) VALUES (10, 2, N'k', N'EAAAAMdQXQOBwh5FYkH6efHEKuPgoV956V/RAnk4QNYXh86M', CAST(0x0000A6DC015AA989 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Members] OFF
/****** Object:  Table [dbo].[MemberReasons]    Script Date: 09/25/2018 17:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberReasons](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
	[ReasonId] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_MemberReasons] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MemberReasons] ON
INSERT [dbo].[MemberReasons] ([id], [MemberId], [ReasonId], [CreatedOn]) VALUES (4, 3, 0, CAST(0x0000A6CC017B71D0 AS DateTime))
INSERT [dbo].[MemberReasons] ([id], [MemberId], [ReasonId], [CreatedOn]) VALUES (7, 6, 0, CAST(0x0000A6CF00505CBD AS DateTime))
INSERT [dbo].[MemberReasons] ([id], [MemberId], [ReasonId], [CreatedOn]) VALUES (9, 5, 7, CAST(0x0000A6D00129A424 AS DateTime))
INSERT [dbo].[MemberReasons] ([id], [MemberId], [ReasonId], [CreatedOn]) VALUES (10, 5, 5, CAST(0x0000A6D00129A424 AS DateTime))
INSERT [dbo].[MemberReasons] ([id], [MemberId], [ReasonId], [CreatedOn]) VALUES (11, 2, 13, CAST(0x0000A6D00129FFC0 AS DateTime))
INSERT [dbo].[MemberReasons] ([id], [MemberId], [ReasonId], [CreatedOn]) VALUES (12, 2, 3, CAST(0x0000A6D00129FFC0 AS DateTime))
INSERT [dbo].[MemberReasons] ([id], [MemberId], [ReasonId], [CreatedOn]) VALUES (18, 8, 7, CAST(0x0000A6D3012074AE AS DateTime))
INSERT [dbo].[MemberReasons] ([id], [MemberId], [ReasonId], [CreatedOn]) VALUES (19, 8, 5, CAST(0x0000A6D3012074AE AS DateTime))
INSERT [dbo].[MemberReasons] ([id], [MemberId], [ReasonId], [CreatedOn]) VALUES (20, 9, 0, CAST(0x0000A6D4017679A1 AS DateTime))
INSERT [dbo].[MemberReasons] ([id], [MemberId], [ReasonId], [CreatedOn]) VALUES (24, 7, 0, CAST(0x0000A6D600279B52 AS DateTime))
INSERT [dbo].[MemberReasons] ([id], [MemberId], [ReasonId], [CreatedOn]) VALUES (26, 4, 0, CAST(0x0000A6D60028002A AS DateTime))
INSERT [dbo].[MemberReasons] ([id], [MemberId], [ReasonId], [CreatedOn]) VALUES (30, 1, 0, CAST(0x0000A6D9013BC451 AS DateTime))
INSERT [dbo].[MemberReasons] ([id], [MemberId], [ReasonId], [CreatedOn]) VALUES (31, 10, 0, CAST(0x0000A6DC015AA9AE AS DateTime))
SET IDENTITY_INSERT [dbo].[MemberReasons] OFF
/****** Object:  Table [dbo].[MemberMajors]    Script Date: 09/25/2018 17:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberMajors](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
	[MajorId] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_MemberMajors] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MemberMajors] ON
INSERT [dbo].[MemberMajors] ([id], [MemberId], [MajorId], [CreatedOn]) VALUES (4, 3, 0, CAST(0x0000A6CC017B71D5 AS DateTime))
INSERT [dbo].[MemberMajors] ([id], [MemberId], [MajorId], [CreatedOn]) VALUES (7, 6, 0, CAST(0x0000A6CF00505CBD AS DateTime))
INSERT [dbo].[MemberMajors] ([id], [MemberId], [MajorId], [CreatedOn]) VALUES (9, 5, 9, CAST(0x0000A6D00129A424 AS DateTime))
INSERT [dbo].[MemberMajors] ([id], [MemberId], [MajorId], [CreatedOn]) VALUES (10, 2, 6, CAST(0x0000A6D00129FFC0 AS DateTime))
INSERT [dbo].[MemberMajors] ([id], [MemberId], [MajorId], [CreatedOn]) VALUES (15, 8, 0, CAST(0x0000A6D3012074AE AS DateTime))
INSERT [dbo].[MemberMajors] ([id], [MemberId], [MajorId], [CreatedOn]) VALUES (16, 9, 0, CAST(0x0000A6D4017679A1 AS DateTime))
INSERT [dbo].[MemberMajors] ([id], [MemberId], [MajorId], [CreatedOn]) VALUES (20, 7, 0, CAST(0x0000A6D600279B52 AS DateTime))
INSERT [dbo].[MemberMajors] ([id], [MemberId], [MajorId], [CreatedOn]) VALUES (22, 4, 0, CAST(0x0000A6D60028002A AS DateTime))
INSERT [dbo].[MemberMajors] ([id], [MemberId], [MajorId], [CreatedOn]) VALUES (26, 1, 0, CAST(0x0000A6D9013BC46D AS DateTime))
INSERT [dbo].[MemberMajors] ([id], [MemberId], [MajorId], [CreatedOn]) VALUES (27, 10, 0, CAST(0x0000A6DC015AA9AE AS DateTime))
SET IDENTITY_INSERT [dbo].[MemberMajors] OFF
/****** Object:  Table [dbo].[MemberInterests]    Script Date: 09/25/2018 17:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberInterests](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
	[InterestId] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_MemberInterests] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MemberInterests] ON
INSERT [dbo].[MemberInterests] ([id], [MemberId], [InterestId], [CreatedOn]) VALUES (19, 3, 43, CAST(0x0000A6CC017B71D0 AS DateTime))
INSERT [dbo].[MemberInterests] ([id], [MemberId], [InterestId], [CreatedOn]) VALUES (20, 3, 4, CAST(0x0000A6CC017B71D0 AS DateTime))
INSERT [dbo].[MemberInterests] ([id], [MemberId], [InterestId], [CreatedOn]) VALUES (21, 3, 3, CAST(0x0000A6CC017B71D0 AS DateTime))
INSERT [dbo].[MemberInterests] ([id], [MemberId], [InterestId], [CreatedOn]) VALUES (22, 3, 8, CAST(0x0000A6CC017B71D0 AS DateTime))
INSERT [dbo].[MemberInterests] ([id], [MemberId], [InterestId], [CreatedOn]) VALUES (23, 3, 2, CAST(0x0000A6CC017B71D0 AS DateTime))
INSERT [dbo].[MemberInterests] ([id], [MemberId], [InterestId], [CreatedOn]) VALUES (24, 3, 42, CAST(0x0000A6CC017B71D0 AS DateTime))
INSERT [dbo].[MemberInterests] ([id], [MemberId], [InterestId], [CreatedOn]) VALUES (25, 3, 6, CAST(0x0000A6CC017B71D0 AS DateTime))
INSERT [dbo].[MemberInterests] ([id], [MemberId], [InterestId], [CreatedOn]) VALUES (35, 6, 43, CAST(0x0000A6CF00505CBD AS DateTime))
INSERT [dbo].[MemberInterests] ([id], [MemberId], [InterestId], [CreatedOn]) VALUES (36, 6, 4, CAST(0x0000A6CF00505CBD AS DateTime))
INSERT [dbo].[MemberInterests] ([id], [MemberId], [InterestId], [CreatedOn]) VALUES (37, 6, 3, CAST(0x0000A6CF00505CBD AS DateTime))
INSERT [dbo].[MemberInterests] ([id], [MemberId], [InterestId], [CreatedOn]) VALUES (38, 6, 8, CAST(0x0000A6CF00505CBD AS DateTime))
INSERT [dbo].[MemberInterests] ([id], [MemberId], [InterestId], [CreatedOn]) VALUES (39, 6, 2, CAST(0x0000A6CF00505CBD AS DateTime))
INSERT [dbo].[MemberInterests] ([id], [MemberId], [InterestId], [CreatedOn]) VALUES (44, 5, 43, CAST(0x0000A6D00129A424 AS DateTime))
INSERT [dbo].[MemberInterests] ([id], [MemberId], [InterestId], [CreatedOn]) VALUES (45, 5, 4, CAST(0x0000A6D00129A424 AS DateTime))
INSERT [dbo].[MemberInterests] ([id], [MemberId], [InterestId], [CreatedOn]) VALUES (46, 5, 3, CAST(0x0000A6D00129A424 AS DateTime))
INSERT [dbo].[MemberInterests] ([id], [MemberId], [InterestId], [CreatedOn]) VALUES (47, 5, 8, CAST(0x0000A6D00129A424 AS DateTime))
INSERT [dbo].[MemberInterests] ([id], [MemberId], [InterestId], [CreatedOn]) VALUES (48, 2, 43, CAST(0x0000A6D00129FFC0 AS DateTime))
INSERT [dbo].[MemberInterests] ([id], [MemberId], [InterestId], [CreatedOn]) VALUES (49, 2, 4, CAST(0x0000A6D00129FFC0 AS DateTime))
INSERT [dbo].[MemberInterests] ([id], [MemberId], [InterestId], [CreatedOn]) VALUES (50, 2, 3, CAST(0x0000A6D00129FFC0 AS DateTime))
INSERT [dbo].[MemberInterests] ([id], [MemberId], [InterestId], [CreatedOn]) VALUES (51, 2, 8, CAST(0x0000A6D00129FFC0 AS DateTime))
INSERT [dbo].[MemberInterests] ([id], [MemberId], [InterestId], [CreatedOn]) VALUES (52, 2, 2, CAST(0x0000A6D00129FFC0 AS DateTime))
INSERT [dbo].[MemberInterests] ([id], [MemberId], [InterestId], [CreatedOn]) VALUES (53, 2, 42, CAST(0x0000A6D00129FFC0 AS DateTime))
INSERT [dbo].[MemberInterests] ([id], [MemberId], [InterestId], [CreatedOn]) VALUES (73, 8, 43, CAST(0x0000A6D3012074AE AS DateTime))
INSERT [dbo].[MemberInterests] ([id], [MemberId], [InterestId], [CreatedOn]) VALUES (74, 8, 4, CAST(0x0000A6D3012074AE AS DateTime))
INSERT [dbo].[MemberInterests] ([id], [MemberId], [InterestId], [CreatedOn]) VALUES (75, 8, 3, CAST(0x0000A6D3012074AE AS DateTime))
INSERT [dbo].[MemberInterests] ([id], [MemberId], [InterestId], [CreatedOn]) VALUES (76, 8, 6, CAST(0x0000A6D3012074AE AS DateTime))
INSERT [dbo].[MemberInterests] ([id], [MemberId], [InterestId], [CreatedOn]) VALUES (77, 9, 0, CAST(0x0000A6D4017679A1 AS DateTime))
INSERT [dbo].[MemberInterests] ([id], [MemberId], [InterestId], [CreatedOn]) VALUES (92, 7, 43, CAST(0x0000A6D600279B52 AS DateTime))
INSERT [dbo].[MemberInterests] ([id], [MemberId], [InterestId], [CreatedOn]) VALUES (93, 7, 4, CAST(0x0000A6D600279B52 AS DateTime))
INSERT [dbo].[MemberInterests] ([id], [MemberId], [InterestId], [CreatedOn]) VALUES (94, 7, 3, CAST(0x0000A6D600279B52 AS DateTime))
INSERT [dbo].[MemberInterests] ([id], [MemberId], [InterestId], [CreatedOn]) VALUES (95, 7, 8, CAST(0x0000A6D600279B52 AS DateTime))
INSERT [dbo].[MemberInterests] ([id], [MemberId], [InterestId], [CreatedOn]) VALUES (101, 4, 43, CAST(0x0000A6D60028002A AS DateTime))
INSERT [dbo].[MemberInterests] ([id], [MemberId], [InterestId], [CreatedOn]) VALUES (102, 4, 4, CAST(0x0000A6D60028002A AS DateTime))
INSERT [dbo].[MemberInterests] ([id], [MemberId], [InterestId], [CreatedOn]) VALUES (103, 4, 3, CAST(0x0000A6D60028002A AS DateTime))
INSERT [dbo].[MemberInterests] ([id], [MemberId], [InterestId], [CreatedOn]) VALUES (104, 4, 8, CAST(0x0000A6D60028002A AS DateTime))
INSERT [dbo].[MemberInterests] ([id], [MemberId], [InterestId], [CreatedOn]) VALUES (105, 4, 2, CAST(0x0000A6D60028002A AS DateTime))
INSERT [dbo].[MemberInterests] ([id], [MemberId], [InterestId], [CreatedOn]) VALUES (121, 1, 43, CAST(0x0000A6D9013BC451 AS DateTime))
INSERT [dbo].[MemberInterests] ([id], [MemberId], [InterestId], [CreatedOn]) VALUES (122, 1, 4, CAST(0x0000A6D9013BC451 AS DateTime))
INSERT [dbo].[MemberInterests] ([id], [MemberId], [InterestId], [CreatedOn]) VALUES (123, 1, 3, CAST(0x0000A6D9013BC451 AS DateTime))
INSERT [dbo].[MemberInterests] ([id], [MemberId], [InterestId], [CreatedOn]) VALUES (124, 1, 8, CAST(0x0000A6D9013BC451 AS DateTime))
INSERT [dbo].[MemberInterests] ([id], [MemberId], [InterestId], [CreatedOn]) VALUES (125, 1, 2, CAST(0x0000A6D9013BC451 AS DateTime))
INSERT [dbo].[MemberInterests] ([id], [MemberId], [InterestId], [CreatedOn]) VALUES (126, 10, 43, CAST(0x0000A6DC015AA9AE AS DateTime))
SET IDENTITY_INSERT [dbo].[MemberInterests] OFF
/****** Object:  Table [dbo].[MemberHobbies]    Script Date: 09/25/2018 17:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberHobbies](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
	[HobbyId] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_MemberHobbies] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MemberHobbies] ON
INSERT [dbo].[MemberHobbies] ([id], [MemberId], [HobbyId], [CreatedOn]) VALUES (4, 3, 0, CAST(0x0000A6CC017B71D0 AS DateTime))
INSERT [dbo].[MemberHobbies] ([id], [MemberId], [HobbyId], [CreatedOn]) VALUES (7, 6, 0, CAST(0x0000A6CF00505CBD AS DateTime))
INSERT [dbo].[MemberHobbies] ([id], [MemberId], [HobbyId], [CreatedOn]) VALUES (9, 5, 5, CAST(0x0000A6D00129A424 AS DateTime))
INSERT [dbo].[MemberHobbies] ([id], [MemberId], [HobbyId], [CreatedOn]) VALUES (10, 5, 4, CAST(0x0000A6D00129A424 AS DateTime))
INSERT [dbo].[MemberHobbies] ([id], [MemberId], [HobbyId], [CreatedOn]) VALUES (11, 5, 2, CAST(0x0000A6D00129A424 AS DateTime))
INSERT [dbo].[MemberHobbies] ([id], [MemberId], [HobbyId], [CreatedOn]) VALUES (12, 2, 5, CAST(0x0000A6D00129FFC0 AS DateTime))
INSERT [dbo].[MemberHobbies] ([id], [MemberId], [HobbyId], [CreatedOn]) VALUES (13, 2, 1, CAST(0x0000A6D00129FFC0 AS DateTime))
INSERT [dbo].[MemberHobbies] ([id], [MemberId], [HobbyId], [CreatedOn]) VALUES (14, 2, 9, CAST(0x0000A6D00129FFC0 AS DateTime))
INSERT [dbo].[MemberHobbies] ([id], [MemberId], [HobbyId], [CreatedOn]) VALUES (21, 8, 13, CAST(0x0000A6D3012074A9 AS DateTime))
INSERT [dbo].[MemberHobbies] ([id], [MemberId], [HobbyId], [CreatedOn]) VALUES (22, 8, 6, CAST(0x0000A6D3012074A9 AS DateTime))
INSERT [dbo].[MemberHobbies] ([id], [MemberId], [HobbyId], [CreatedOn]) VALUES (23, 8, 2, CAST(0x0000A6D3012074A9 AS DateTime))
INSERT [dbo].[MemberHobbies] ([id], [MemberId], [HobbyId], [CreatedOn]) VALUES (24, 9, 0, CAST(0x0000A6D4017679A1 AS DateTime))
INSERT [dbo].[MemberHobbies] ([id], [MemberId], [HobbyId], [CreatedOn]) VALUES (28, 7, 0, CAST(0x0000A6D600279B52 AS DateTime))
INSERT [dbo].[MemberHobbies] ([id], [MemberId], [HobbyId], [CreatedOn]) VALUES (30, 4, 0, CAST(0x0000A6D60028002A AS DateTime))
INSERT [dbo].[MemberHobbies] ([id], [MemberId], [HobbyId], [CreatedOn]) VALUES (34, 1, 0, CAST(0x0000A6D9013BC451 AS DateTime))
INSERT [dbo].[MemberHobbies] ([id], [MemberId], [HobbyId], [CreatedOn]) VALUES (35, 10, 0, CAST(0x0000A6DC015AA9AE AS DateTime))
SET IDENTITY_INSERT [dbo].[MemberHobbies] OFF
/****** Object:  Table [dbo].[MemberFunding]    Script Date: 09/25/2018 17:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberFunding](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
	[FundingSourceId] [int] NOT NULL,
	[Percentage] [int] NULL,
	[CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_MemberFunding] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MemberFunding] ON
INSERT [dbo].[MemberFunding] ([id], [MemberId], [FundingSourceId], [Percentage], [CreatedOn]) VALUES (1, 5, 4, 50, CAST(0x0000A6D00129A424 AS DateTime))
INSERT [dbo].[MemberFunding] ([id], [MemberId], [FundingSourceId], [Percentage], [CreatedOn]) VALUES (2, 5, 3, 50, CAST(0x0000A6D00129A424 AS DateTime))
INSERT [dbo].[MemberFunding] ([id], [MemberId], [FundingSourceId], [Percentage], [CreatedOn]) VALUES (3, 2, 4, 30, CAST(0x0000A6D00129FFC0 AS DateTime))
INSERT [dbo].[MemberFunding] ([id], [MemberId], [FundingSourceId], [Percentage], [CreatedOn]) VALUES (4, 2, 6, 30, CAST(0x0000A6D00129FFC0 AS DateTime))
INSERT [dbo].[MemberFunding] ([id], [MemberId], [FundingSourceId], [Percentage], [CreatedOn]) VALUES (5, 2, 5, 35, CAST(0x0000A6D00129FFC0 AS DateTime))
INSERT [dbo].[MemberFunding] ([id], [MemberId], [FundingSourceId], [Percentage], [CreatedOn]) VALUES (6, 8, 7, 30, CAST(0x0000A6D3012074AE AS DateTime))
INSERT [dbo].[MemberFunding] ([id], [MemberId], [FundingSourceId], [Percentage], [CreatedOn]) VALUES (7, 8, 4, 30, CAST(0x0000A6D3012074AE AS DateTime))
INSERT [dbo].[MemberFunding] ([id], [MemberId], [FundingSourceId], [Percentage], [CreatedOn]) VALUES (8, 8, 6, 40, CAST(0x0000A6D3012074AE AS DateTime))
SET IDENTITY_INSERT [dbo].[MemberFunding] OFF
/****** Object:  Table [dbo].[MemberEthnicity]    Script Date: 09/25/2018 17:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberEthnicity](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
	[EthnicityId] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_MemberEthnicity_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MemberEthnicity] ON
INSERT [dbo].[MemberEthnicity] ([id], [MemberId], [EthnicityId], [CreatedOn]) VALUES (4, 3, 0, CAST(0x0000A6CC017B71D5 AS DateTime))
INSERT [dbo].[MemberEthnicity] ([id], [MemberId], [EthnicityId], [CreatedOn]) VALUES (7, 6, 0, CAST(0x0000A6CF00505CBD AS DateTime))
INSERT [dbo].[MemberEthnicity] ([id], [MemberId], [EthnicityId], [CreatedOn]) VALUES (9, 5, 4, CAST(0x0000A6D00129A424 AS DateTime))
INSERT [dbo].[MemberEthnicity] ([id], [MemberId], [EthnicityId], [CreatedOn]) VALUES (10, 2, 6, CAST(0x0000A6D00129FFC0 AS DateTime))
INSERT [dbo].[MemberEthnicity] ([id], [MemberId], [EthnicityId], [CreatedOn]) VALUES (16, 8, 1, CAST(0x0000A6D3012074AE AS DateTime))
INSERT [dbo].[MemberEthnicity] ([id], [MemberId], [EthnicityId], [CreatedOn]) VALUES (17, 8, 4, CAST(0x0000A6D3012074AE AS DateTime))
INSERT [dbo].[MemberEthnicity] ([id], [MemberId], [EthnicityId], [CreatedOn]) VALUES (18, 9, 0, CAST(0x0000A6D4017679A1 AS DateTime))
INSERT [dbo].[MemberEthnicity] ([id], [MemberId], [EthnicityId], [CreatedOn]) VALUES (22, 7, 0, CAST(0x0000A6D600279B52 AS DateTime))
INSERT [dbo].[MemberEthnicity] ([id], [MemberId], [EthnicityId], [CreatedOn]) VALUES (24, 4, 0, CAST(0x0000A6D60028002A AS DateTime))
INSERT [dbo].[MemberEthnicity] ([id], [MemberId], [EthnicityId], [CreatedOn]) VALUES (28, 1, 0, CAST(0x0000A6D9013BC46D AS DateTime))
INSERT [dbo].[MemberEthnicity] ([id], [MemberId], [EthnicityId], [CreatedOn]) VALUES (29, 10, 0, CAST(0x0000A6DC015AA9AE AS DateTime))
SET IDENTITY_INSERT [dbo].[MemberEthnicity] OFF
/****** Object:  Table [dbo].[MemberDegrees]    Script Date: 09/25/2018 17:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberDegrees](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
	[DegreeId] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_MemberDegrees] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MemberDegrees] ON
INSERT [dbo].[MemberDegrees] ([id], [MemberId], [DegreeId], [CreatedOn]) VALUES (4, 3, 0, CAST(0x0000A6CC017B71D5 AS DateTime))
INSERT [dbo].[MemberDegrees] ([id], [MemberId], [DegreeId], [CreatedOn]) VALUES (7, 6, 0, CAST(0x0000A6CF00505CBD AS DateTime))
INSERT [dbo].[MemberDegrees] ([id], [MemberId], [DegreeId], [CreatedOn]) VALUES (9, 5, 2, CAST(0x0000A6D00129A424 AS DateTime))
INSERT [dbo].[MemberDegrees] ([id], [MemberId], [DegreeId], [CreatedOn]) VALUES (10, 2, 3, CAST(0x0000A6D00129FFC0 AS DateTime))
INSERT [dbo].[MemberDegrees] ([id], [MemberId], [DegreeId], [CreatedOn]) VALUES (15, 8, 0, CAST(0x0000A6D3012074AE AS DateTime))
INSERT [dbo].[MemberDegrees] ([id], [MemberId], [DegreeId], [CreatedOn]) VALUES (16, 9, 0, CAST(0x0000A6D4017679A1 AS DateTime))
INSERT [dbo].[MemberDegrees] ([id], [MemberId], [DegreeId], [CreatedOn]) VALUES (20, 7, 0, CAST(0x0000A6D600279B52 AS DateTime))
INSERT [dbo].[MemberDegrees] ([id], [MemberId], [DegreeId], [CreatedOn]) VALUES (22, 4, 0, CAST(0x0000A6D60028002A AS DateTime))
INSERT [dbo].[MemberDegrees] ([id], [MemberId], [DegreeId], [CreatedOn]) VALUES (26, 1, 0, CAST(0x0000A6D9013BC46D AS DateTime))
INSERT [dbo].[MemberDegrees] ([id], [MemberId], [DegreeId], [CreatedOn]) VALUES (27, 10, 0, CAST(0x0000A6DC015AA9AE AS DateTime))
SET IDENTITY_INSERT [dbo].[MemberDegrees] OFF
/****** Object:  Table [dbo].[MemberClasses]    Script Date: 09/25/2018 17:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberClasses](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
	[ClassId] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_MemberClasses] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Majors]    Script Date: 09/25/2018 17:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Majors](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[CreatedBy] [int] NOT NULL,
 CONSTRAINT [PK_Majors] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Majors] ON
INSERT [dbo].[Majors] ([id], [Description], [CreatedBy]) VALUES (1, N'English', 1)
INSERT [dbo].[Majors] ([id], [Description], [CreatedBy]) VALUES (2, N'History', 2)
INSERT [dbo].[Majors] ([id], [Description], [CreatedBy]) VALUES (3, N'Physics', 3)
INSERT [dbo].[Majors] ([id], [Description], [CreatedBy]) VALUES (4, N'Computer Science', 4)
INSERT [dbo].[Majors] ([id], [Description], [CreatedBy]) VALUES (5, N'Journalism', 3)
INSERT [dbo].[Majors] ([id], [Description], [CreatedBy]) VALUES (6, N'Ethnic Studies', 2)
INSERT [dbo].[Majors] ([id], [Description], [CreatedBy]) VALUES (7, N'Womens Studies', 1)
INSERT [dbo].[Majors] ([id], [Description], [CreatedBy]) VALUES (8, N'Auto Mechanics', 2)
INSERT [dbo].[Majors] ([id], [Description], [CreatedBy]) VALUES (9, N'Electronics Technology', 3)
INSERT [dbo].[Majors] ([id], [Description], [CreatedBy]) VALUES (10, N'General Science', 8)
INSERT [dbo].[Majors] ([id], [Description], [CreatedBy]) VALUES (13, N'Natural Nature Nurturing', 13)
SET IDENTITY_INSERT [dbo].[Majors] OFF
/****** Object:  Table [dbo].[Locations]    Script Date: 09/25/2018 17:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Locations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[Notes] [varchar](4000) NULL,
	[CreatedOn] [datetime] NULL,
	[EditedOn] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[EditedBy] [varchar](50) NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Locations] ON
INSERT [dbo].[Locations] ([Id], [Name], [Notes], [CreatedOn], [EditedOn], [CreatedBy], [EditedBy]) VALUES (1, N'King''s Landing', N'', CAST(0x0000A8310048B029 AS DateTime), NULL, N'unknown', NULL)
INSERT [dbo].[Locations] ([Id], [Name], [Notes], [CreatedOn], [EditedOn], [CreatedBy], [EditedBy]) VALUES (2, N'Dorne', N'', CAST(0x0000A83100496268 AS DateTime), NULL, N'unknown', NULL)
INSERT [dbo].[Locations] ([Id], [Name], [Notes], [CreatedOn], [EditedOn], [CreatedBy], [EditedBy]) VALUES (3, N'Travelling', N'General location for scenes happening while travelling.', CAST(0x0000A83701431F6B AS DateTime), NULL, N'unknown', NULL)
INSERT [dbo].[Locations] ([Id], [Name], [Notes], [CreatedOn], [EditedOn], [CreatedBy], [EditedBy]) VALUES (4, N'Brazos', N'', CAST(0x0000A8370171FC20 AS DateTime), NULL, N'unknown', NULL)
INSERT [dbo].[Locations] ([Id], [Name], [Notes], [CreatedOn], [EditedOn], [CreatedBy], [EditedBy]) VALUES (5, N'The Iron Islands', N'', CAST(0x0000A83801095F09 AS DateTime), NULL, N'unknown', NULL)
INSERT [dbo].[Locations] ([Id], [Name], [Notes], [CreatedOn], [EditedOn], [CreatedBy], [EditedBy]) VALUES (6, N'The Wall', N'', CAST(0x0000A83801098267 AS DateTime), NULL, N'unknown', NULL)
INSERT [dbo].[Locations] ([Id], [Name], [Notes], [CreatedOn], [EditedOn], [CreatedBy], [EditedBy]) VALUES (7, N'Woods', N'', CAST(0x0000A839000D6B38 AS DateTime), NULL, N'unknown', NULL)
INSERT [dbo].[Locations] ([Id], [Name], [Notes], [CreatedOn], [EditedOn], [CreatedBy], [EditedBy]) VALUES (8, N'Pentos', N'', CAST(0x0000A8390010DD11 AS DateTime), NULL, N'unknown', NULL)
INSERT [dbo].[Locations] ([Id], [Name], [Notes], [CreatedOn], [EditedOn], [CreatedBy], [EditedBy]) VALUES (9, N'Meereen', N'', CAST(0x0000A8390012EEAA AS DateTime), NULL, N'unknown', NULL)
INSERT [dbo].[Locations] ([Id], [Name], [Notes], [CreatedOn], [EditedOn], [CreatedBy], [EditedBy]) VALUES (25, N'Dragonstone', N'', CAST(0x0000A84300D2E49B AS DateTime), NULL, N'unknown', N'unknown')
INSERT [dbo].[Locations] ([Id], [Name], [Notes], [CreatedOn], [EditedOn], [CreatedBy], [EditedBy]) VALUES (26, N'test1', N'', CAST(0x0000A84300EE24CF AS DateTime), NULL, N'unknown', N'unknown')
INSERT [dbo].[Locations] ([Id], [Name], [Notes], [CreatedOn], [EditedOn], [CreatedBy], [EditedBy]) VALUES (27, N'test2', N'', CAST(0x0000A8440029BC60 AS DateTime), NULL, N'unknown', N'unknown')
INSERT [dbo].[Locations] ([Id], [Name], [Notes], [CreatedOn], [EditedOn], [CreatedBy], [EditedBy]) VALUES (28, N'A Ship At Sea', N'', CAST(0x0000A8460177E059 AS DateTime), NULL, N'unknown', N'unknown')
SET IDENTITY_INSERT [dbo].[Locations] OFF
/****** Object:  Table [dbo].[KeywordSceneXref]    Script Date: 09/25/2018 17:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KeywordSceneXref](
	[KeywordId] [int] NULL,
	[SceneId] [int] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[KeywordSceneXref] ([KeywordId], [SceneId]) VALUES (10, 39)
INSERT [dbo].[KeywordSceneXref] ([KeywordId], [SceneId]) VALUES (6, 39)
INSERT [dbo].[KeywordSceneXref] ([KeywordId], [SceneId]) VALUES (8, 39)
INSERT [dbo].[KeywordSceneXref] ([KeywordId], [SceneId]) VALUES (7, 43)
INSERT [dbo].[KeywordSceneXref] ([KeywordId], [SceneId]) VALUES (9, 50)
INSERT [dbo].[KeywordSceneXref] ([KeywordId], [SceneId]) VALUES (13, 50)
INSERT [dbo].[KeywordSceneXref] ([KeywordId], [SceneId]) VALUES (15, 50)
INSERT [dbo].[KeywordSceneXref] ([KeywordId], [SceneId]) VALUES (12, 50)
INSERT [dbo].[KeywordSceneXref] ([KeywordId], [SceneId]) VALUES (11, 56)
INSERT [dbo].[KeywordSceneXref] ([KeywordId], [SceneId]) VALUES (16, 34)
INSERT [dbo].[KeywordSceneXref] ([KeywordId], [SceneId]) VALUES (3, 34)
INSERT [dbo].[KeywordSceneXref] ([KeywordId], [SceneId]) VALUES (5, 56)
INSERT [dbo].[KeywordSceneXref] ([KeywordId], [SceneId]) VALUES (19, 57)
INSERT [dbo].[KeywordSceneXref] ([KeywordId], [SceneId]) VALUES (20, 46)
INSERT [dbo].[KeywordSceneXref] ([KeywordId], [SceneId]) VALUES (14, 60)
INSERT [dbo].[KeywordSceneXref] ([KeywordId], [SceneId]) VALUES (1, 49)
INSERT [dbo].[KeywordSceneXref] ([KeywordId], [SceneId]) VALUES (2, 52)
INSERT [dbo].[KeywordSceneXref] ([KeywordId], [SceneId]) VALUES (18, 54)
INSERT [dbo].[KeywordSceneXref] ([KeywordId], [SceneId]) VALUES (17, 55)
INSERT [dbo].[KeywordSceneXref] ([KeywordId], [SceneId]) VALUES (4, 55)
INSERT [dbo].[KeywordSceneXref] ([KeywordId], [SceneId]) VALUES (21, 57)
INSERT [dbo].[KeywordSceneXref] ([KeywordId], [SceneId]) VALUES (22, 59)
INSERT [dbo].[KeywordSceneXref] ([KeywordId], [SceneId]) VALUES (23, 59)
INSERT [dbo].[KeywordSceneXref] ([KeywordId], [SceneId]) VALUES (24, 60)
/****** Object:  Table [dbo].[Keywords]    Script Date: 09/25/2018 17:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Keywords](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Keyword] [varchar](150) NOT NULL,
	[CreatedOn] [date] NOT NULL,
	[CreatedBy] [varchar](50) NULL,
 CONSTRAINT [PK_Keywords] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Keywords] ON
INSERT [dbo].[Keywords] ([Id], [Keyword], [CreatedOn], [CreatedBy]) VALUES (1, N'asdf', CAST(0xA43D0B00 AS Date), NULL)
INSERT [dbo].[Keywords] ([Id], [Keyword], [CreatedOn], [CreatedBy]) VALUES (2, N'asdfasdf', CAST(0xA43D0B00 AS Date), NULL)
INSERT [dbo].[Keywords] ([Id], [Keyword], [CreatedOn], [CreatedBy]) VALUES (3, N'dead', CAST(0xA43D0B00 AS Date), NULL)
INSERT [dbo].[Keywords] ([Id], [Keyword], [CreatedOn], [CreatedBy]) VALUES (4, N'fortune teller', CAST(0xA43D0B00 AS Date), NULL)
INSERT [dbo].[Keywords] ([Id], [Keyword], [CreatedOn], [CreatedBy]) VALUES (5, N'hound', CAST(0xA43D0B00 AS Date), NULL)
INSERT [dbo].[Keywords] ([Id], [Keyword], [CreatedOn], [CreatedBy]) VALUES (6, N'i''m standing on it', CAST(0xA43D0B00 AS Date), NULL)
INSERT [dbo].[Keywords] ([Id], [Keyword], [CreatedOn], [CreatedBy]) VALUES (7, N'illyio mopatis', CAST(0xA43D0B00 AS Date), NULL)
INSERT [dbo].[Keywords] ([Id], [Keyword], [CreatedOn], [CreatedBy]) VALUES (8, N'it''s my land', CAST(0xA43D0B00 AS Date), NULL)
INSERT [dbo].[Keywords] ([Id], [Keyword], [CreatedOn], [CreatedBy]) VALUES (9, N'jon', CAST(0xA43D0B00 AS Date), NULL)
INSERT [dbo].[Keywords] ([Id], [Keyword], [CreatedOn], [CreatedBy]) VALUES (10, N'long prayer', CAST(0xA43D0B00 AS Date), NULL)
INSERT [dbo].[Keywords] ([Id], [Keyword], [CreatedOn], [CreatedBy]) VALUES (11, N'scene', CAST(0xA43D0B00 AS Date), NULL)
INSERT [dbo].[Keywords] ([Id], [Keyword], [CreatedOn], [CreatedBy]) VALUES (12, N'scenettt', CAST(0xA43D0B00 AS Date), NULL)
INSERT [dbo].[Keywords] ([Id], [Keyword], [CreatedOn], [CreatedBy]) VALUES (13, N'snow', CAST(0xA43D0B00 AS Date), NULL)
INSERT [dbo].[Keywords] ([Id], [Keyword], [CreatedOn], [CreatedBy]) VALUES (14, N'tadf', CAST(0xA43D0B00 AS Date), NULL)
INSERT [dbo].[Keywords] ([Id], [Keyword], [CreatedOn], [CreatedBy]) VALUES (15, N'test', CAST(0xA43D0B00 AS Date), NULL)
INSERT [dbo].[Keywords] ([Id], [Keyword], [CreatedOn], [CreatedBy]) VALUES (16, N'tywin', CAST(0xA43D0B00 AS Date), NULL)
INSERT [dbo].[Keywords] ([Id], [Keyword], [CreatedOn], [CreatedBy]) VALUES (17, N'witch', CAST(0xA43D0B00 AS Date), NULL)
INSERT [dbo].[Keywords] ([Id], [Keyword], [CreatedOn], [CreatedBy]) VALUES (18, N'xxx', CAST(0xA43D0B00 AS Date), NULL)
INSERT [dbo].[Keywords] ([Id], [Keyword], [CreatedOn], [CreatedBy]) VALUES (19, N'zvzvvz', CAST(0xA43D0B00 AS Date), NULL)
INSERT [dbo].[Keywords] ([Id], [Keyword], [CreatedOn], [CreatedBy]) VALUES (20, N'ooppiiu', CAST(0xA43D0B00 AS Date), NULL)
INSERT [dbo].[Keywords] ([Id], [Keyword], [CreatedOn], [CreatedBy]) VALUES (21, N' hope', CAST(0xA53D0B00 AS Date), NULL)
INSERT [dbo].[Keywords] ([Id], [Keyword], [CreatedOn], [CreatedBy]) VALUES (22, N'hope2', CAST(0xA53D0B00 AS Date), NULL)
INSERT [dbo].[Keywords] ([Id], [Keyword], [CreatedOn], [CreatedBy]) VALUES (23, N' and now', CAST(0xA53D0B00 AS Date), NULL)
INSERT [dbo].[Keywords] ([Id], [Keyword], [CreatedOn], [CreatedBy]) VALUES (24, N'mongoid', CAST(0xA63D0B00 AS Date), NULL)
SET IDENTITY_INSERT [dbo].[Keywords] OFF
/****** Object:  Table [dbo].[Interests]    Script Date: 09/25/2018 17:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Interests](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[CreatedBy] [int] NOT NULL,
 CONSTRAINT [PK_Interests] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Interests] ON
INSERT [dbo].[Interests] ([id], [Description], [CreatedBy]) VALUES (1, N'Plants', 1)
INSERT [dbo].[Interests] ([id], [Description], [CreatedBy]) VALUES (2, N'Flowers', 2)
INSERT [dbo].[Interests] ([id], [Description], [CreatedBy]) VALUES (3, N'Cars', 3)
INSERT [dbo].[Interests] ([id], [Description], [CreatedBy]) VALUES (4, N'Airplanes', 4)
INSERT [dbo].[Interests] ([id], [Description], [CreatedBy]) VALUES (5, N'Social Justice', 3)
INSERT [dbo].[Interests] ([id], [Description], [CreatedBy]) VALUES (6, N'Physics', 2)
INSERT [dbo].[Interests] ([id], [Description], [CreatedBy]) VALUES (8, N'Computer Programming', 1)
INSERT [dbo].[Interests] ([id], [Description], [CreatedBy]) VALUES (42, N'Geography', 13)
INSERT [dbo].[Interests] ([id], [Description], [CreatedBy]) VALUES (43, N' Zebras', 13)
SET IDENTITY_INSERT [dbo].[Interests] OFF
/****** Object:  Table [dbo].[Hobbies]    Script Date: 09/25/2018 17:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Hobbies](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[CreatedBy] [int] NOT NULL,
 CONSTRAINT [PK_Hobbies] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Hobbies] ON
INSERT [dbo].[Hobbies] ([id], [Description], [CreatedBy]) VALUES (1, N'Football', 1)
INSERT [dbo].[Hobbies] ([id], [Description], [CreatedBy]) VALUES (2, N'Gaming', 2)
INSERT [dbo].[Hobbies] ([id], [Description], [CreatedBy]) VALUES (3, N'World of Warcraft', 3)
INSERT [dbo].[Hobbies] ([id], [Description], [CreatedBy]) VALUES (4, N'Flight Simulator', 4)
INSERT [dbo].[Hobbies] ([id], [Description], [CreatedBy]) VALUES (5, N'Basket Weaving', 2)
INSERT [dbo].[Hobbies] ([id], [Description], [CreatedBy]) VALUES (6, N'Crochet', 3)
INSERT [dbo].[Hobbies] ([id], [Description], [CreatedBy]) VALUES (9, N'Shoe Repair', 8)
INSERT [dbo].[Hobbies] ([id], [Description], [CreatedBy]) VALUES (12, N'Small engine repair', 13)
INSERT [dbo].[Hobbies] ([id], [Description], [CreatedBy]) VALUES (13, N' Wood chipping', 13)
SET IDENTITY_INSERT [dbo].[Hobbies] OFF
/****** Object:  Table [dbo].[HelpTicketTypes]    Script Date: 09/25/2018 17:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HelpTicketTypes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](50) NOT NULL,
	[Description] [varchar](2000) NULL,
 CONSTRAINT [PK_HelpTicketTypes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[HelpTicketTypes] ON
INSERT [dbo].[HelpTicketTypes] ([id], [Type], [Description]) VALUES (1, N'Bug', N'Bug type')
INSERT [dbo].[HelpTicketTypes] ([id], [Type], [Description]) VALUES (2, N'Suggestion', N'Suggestion type')
SET IDENTITY_INSERT [dbo].[HelpTicketTypes] OFF
/****** Object:  Table [dbo].[HelpTickets]    Script Date: 09/25/2018 17:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HelpTickets](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TicketType] [int] NOT NULL,
	[TicketReport] [varchar](4000) NOT NULL,
	[SubmittedOn] [datetime] NOT NULL,
	[SubmittedBy] [int] NULL,
 CONSTRAINT [PK_HelpTickets] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[HelpTickets] ON
INSERT [dbo].[HelpTickets] ([id], [TicketType], [TicketReport], [SubmittedOn], [SubmittedBy]) VALUES (1, 0, N'Here''s a test ticket', CAST(0x0000A6D8004A453D AS DateTime), -1)
INSERT [dbo].[HelpTickets] ([id], [TicketType], [TicketReport], [SubmittedOn], [SubmittedBy]) VALUES (2, 0, N'asdfasdf', CAST(0x0000A6D8004ACC72 AS DateTime), -1)
INSERT [dbo].[HelpTickets] ([id], [TicketType], [TicketReport], [SubmittedOn], [SubmittedBy]) VALUES (3, 0, N'test bug report', CAST(0x0000A6D8004C1D12 AS DateTime), 2)
INSERT [dbo].[HelpTickets] ([id], [TicketType], [TicketReport], [SubmittedOn], [SubmittedBy]) VALUES (4, 0, N'a bug from bob', CAST(0x0000A6D8004EA0ED AS DateTime), 1)
INSERT [dbo].[HelpTickets] ([id], [TicketType], [TicketReport], [SubmittedOn], [SubmittedBy]) VALUES (5, 1, N'a bug type', CAST(0x0000A6D8004F18FE AS DateTime), -1)
INSERT [dbo].[HelpTickets] ([id], [TicketType], [TicketReport], [SubmittedOn], [SubmittedBy]) VALUES (6, 2, N'a suggestion type', CAST(0x0000A6D8004F20D7 AS DateTime), -1)
SET IDENTITY_INSERT [dbo].[HelpTickets] OFF
/****** Object:  StoredProcedure [dbo].[GetScene]    Script Date: 09/25/2018 17:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JSR
-- Create date: 11/28/17
-- Description:	Get Scene.
-- =============================================
CREATE PROCEDURE [dbo].[GetScene]
	@sceneId VARCHAR(5)
AS
BEGIN
	SELECT CreatedBy, CreatedOn, Description, EditedOn, EditedBy, Episode, Season, Timestamp, LocationId 
	FROM Scenes 
	WHERE Id = @sceneId

	SELECT CharacterId
	FROM CharacterSceneXref
	WHERE SceneId = @sceneId
	
	SELECT k.Keyword FROM Keywords k
	JOIN KeywordSceneXref ksx ON ksx.KeywordId = k.Id
	WHERE ksx.SceneId = @sceneId	
END
GO
/****** Object:  StoredProcedure [dbo].[GetLocations]    Script Date: 09/25/2018 17:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JSR
-- Create date: 11/20/17
-- Description:	Get Locations for dropdown selection.
-- =============================================
CREATE PROCEDURE [dbo].[GetLocations]
AS
BEGIN
	SELECT Name, Id 
	FROM Locations
	ORDER BY Name
END
GO
/****** Object:  StoredProcedure [dbo].[GetEpisodeCount]    Script Date: 09/25/2018 17:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JSR
-- Create date: 11/26/17
-- Description:	Get episode count per season.
-- =============================================
CREATE PROCEDURE [dbo].[GetEpisodeCount]
	@seasonNumber INT
	, @episodeCount INT OUTPUT
AS
BEGIN
	SET @episodeCount = 
		(SELECT EpisodeCount
		FROM SeasonInfo
		WHERE SeasonNumber = @seasonNumber)
END
GO
/****** Object:  StoredProcedure [dbo].[GetCharacters]    Script Date: 09/25/2018 17:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JSR
-- Create date: 11/20/17
-- Description:	Get Characters.
-- =============================================
CREATE PROCEDURE [dbo].[GetCharacters]
AS
BEGIN
	SELECT * FROM Characters
	ORDER BY FirstName
END
GO
/****** Object:  StoredProcedure [dbo].[SearchScenes]    Script Date: 09/25/2018 17:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JSR
-- Create date: 11/20/17
-- Description:	Search scenes
-- =============================================
CREATE PROCEDURE [dbo].[SearchScenes] 
	@seasonNumber VARCHAR(3) = NULL
	, @episodeNumber VARCHAR(3) = NULL
	, @locationId VARCHAR(3) = NULL
	, @characters VARCHAR(1000) = NULL
	, @keywords VARCHAR(1000) = NULL
	, @useAndComparison BIT = 1
AS
BEGIN
	SET NOCOUNT ON;
	IF @seasonNumber = 0 BEGIN SET @seasonNumber = NULL END
	IF @episodeNumber = 0 BEGIN SET @episodeNumber = NULL END
	IF @locationId = 0 BEGIN SET @locationId = NULL END
	
	-- Get dataset of all scenes meeting season, episode, and/or location parameters.
	SELECT TOP 1000 s.Id AS SceneId, s.Season, s.Episode, s.Timestamp
			, CAST(s.Season AS INT) AS SeasonAsInt
			, CAST(s.Episode AS INT) AS EpisodeAsInt
			, s.TimeStampAsDecimal
			, s.Description
			, l.Name AS LocationName, l.Id AS LocationId
		INTO #gotSearch
		FROM Scenes s
			JOIN Locations l ON l.Id = s.LocationId
		WHERE
			(Season = @seasonNumber OR ISNULL(@seasonNumber, '') = '')
			AND
			(Episode = @episodeNumber OR ISNULL(@episodeNumber, '') = '')
			AND
			(LocationId = @locationId OR ISNULL(@locationId, '') = '')	
	
	-- Get all characters associated with found scenes.
	SELECT csx.SceneId AS sId, * 
		INTO #tblChars
		FROM CharacterSceneXref csx
		JOIN Characters c ON csx.CharacterId = c.Id
	WHERE 
		csx.SceneId IN (SELECT SceneId FROM #gotSearch)
		AND
		csx.CharacterId IN (SELECT * FROM dbo.SplitString(@characters, ',')) OR ISNULL(@characters, '') IN ('') 		

	-- Remove scenes from #gotSearch which don't contain any found characters.  If no characters found (because @characters = null), nothing will happen to #gotSearch.
	DELETE FROM #gotSearch WHERE SceneId NOT IN (SELECT sId FROM #tblChars)
	
	IF @useAndComparison = 1	-- e.g. Find all scenes including Character1 AND Character2.  This is a narrower set than using OR.
		BEGIN
			IF @characters IS NOT NULL
				BEGIN
					DELETE FROM #gotSearch WHERE SceneId NOT IN
						(SELECT sId FROM #tblChars GROUP BY sId HAVING COUNT(sId) = (SELECT COUNT(Item) FROM dbo.SplitString(@characters, ',')) )		
				END
		END
	
	-- Get all keywords associated with any remaining scenes.
	IF @keywords IS NOT NULL
		BEGIN
			SELECT ksx.SceneId AS sId, * 
				INTO #tblKeywords
				FROM Keywords k
				JOIN KeywordSceneXref ksx ON ksx.KeywordId = k.Id 
				WHERE 
				ksx.SceneId IN (SELECT SceneId FROM #gotSearch)
				AND
				k.Keyword IN (SELECT * FROM dbo.SplitString(@keywords, ',')) OR ISNULL(@keywords, '') IN ('') 
			
			-- Remove scenes from #gotSearch which don't contain any found keywords.  If nothing found (because @keywords = null), nothing will happen to #gotSearch.
			DELETE FROM #gotSearch WHERE SceneId NOT IN (SELECT SceneId FROM #tblKeywords)			
		END
		
	-- Delete characters who are in scenes which don't match the scenes with the found keywords.  Again if @keywords = null, nothing happens to #tblChars.
	DELETE FROM #tblChars WHERE sId NOT IN (SELECT SceneId FROM #gotSearch)
	
	-- Delete found keywords which are in scenes which don't match #gotSearch.  This only happens with @keywords = null.
	IF @keywords IS NOT NULL 
		BEGIN
			DELETE FROM #tblKeywords WHERE sId NOT IN (SELECT SceneId FROM #gotSearch)
		END
	
	INSERT INTO #tblChars
		SELECT csx.SceneId, *
		FROM CharacterSceneXref csx
		JOIN Characters c ON csx.CharacterId = c.Id
		WHERE csx.SceneId IN (SELECT SceneId FROM #gotSearch)
			AND c.Id NOT IN (SELECT CharacterId FROM #tblChars) 

IF @keywords IS NOT NULL 
		BEGIN			
			INSERT INTO #tblKeywords
				SELECT ksx.SceneId AS sId, *
				FROM Keywords k
				JOIN KeywordSceneXref ksx ON ksx.KeywordId = k.Id 	
				WHERE ksx.SceneId IN (SELECT SceneId FROM #gotSearch)
					AND k.Id NOT IN (SELECT KeywordId FROM #tblKeywords)
		END
	ELSE
		BEGIN
				SELECT ksx.SceneId AS sId, *
				INTO #tblKeywords2
				FROM Keywords k
				JOIN KeywordSceneXref ksx ON ksx.KeywordId = k.Id 	
				WHERE ksx.SceneId IN (SELECT SceneId FROM #gotSearch)			
		END

	-- Generate three output tables; Scenes, Characters, and Keywords.
	SELECT * FROM #gotSearch ORDER BY SeasonAsInt, EpisodeAsInt, TimeStampAsDecimal
	SELECT * FROM #tblChars
	
	IF @keywords IS NOT NULL
		SELECT * FROM #tblKeywords
	ELSE
		SELECT * FROM #tblKeywords2

END
GO
/****** Object:  StoredProcedure [dbo].[sproc_GetMailToSend]    Script Date: 09/25/2018 17:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
=============================================
Author:			Scott Rushing
Create date:	11/03/16
Description:	Gets all waiting emails.
=============================================
*/
CREATE PROCEDURE [dbo].[sproc_GetMailToSend]
AS
BEGIN
	SELECT id, Subject, Message, SendTo FROM EmailsToSend WHERE SentOn IS NULL	
END
GO
/****** Object:  StoredProcedure [dbo].[sproc_GetFoundMemberData]    Script Date: 09/25/2018 17:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
=============================================
Author:			Scott Rushing
Create date:	10/15/16
Description:	Get data for member found in search.
=============================================
*/
CREATE PROCEDURE [dbo].[sproc_GetFoundMemberData]
	@memberId INT
AS
BEGIN
	-- datatable 0
	SELECT FirstName + ' ' + LastName AS Name, City, s.Abbreviation AS [State] , PostalCode
	FROM dbo.PersonalInfo pinf
		INNER JOIN States s ON pinf.StateId = s.id
	WHERE memberId = @memberId
	
	-- datatable 1
	SELECT Description, a.id FROM Interests a
		INNER JOIN MemberInterests b
			ON b.InterestId = a.id
		WHERE b.MemberId = @memberId
			
	-- datatable 2
	SELECT Description, a.id FROM Hobbies a
		 JOIN MemberHobbies b
			ON b.HobbyId = a.id
		WHERE b.MemberId = @memberId
			
	-- datatable 3
	SELECT Name, a.id FROM Schools a
		INNER JOIN MemberSchools b
			ON b.SchoolId = a.id
		WHERE b.MemberId = @memberId
			
	-- datatable 4
	SELECT Description, a.id FROM Reasons a
		INNER JOIN MemberReasons b
			ON b.ReasonId = a.id
		WHERE b.MemberId = @memberId
			
	-- datatable 5
	SELECT Name, a.id FROM Ethnicities a
		INNER JOIN MemberEthnicity b
			ON b.EthnicityId = a.id
		WHERE b.MemberId = @memberId
			
	-- datatable 6
	SELECT Description, a.id FROM Degrees a
		INNER JOIN MemberDegrees b
			ON b.DegreeId = a.id
		WHERE b.MemberId = @memberId
		
	-- datatable 7
	SELECT Description, a.id FROM Majors a
		INNER JOIN MemberMajors b
			ON b.MajorId = a.id
		WHERE b.MemberId = @memberId
			
	-- datatable 8
	SELECT 
		Description
		,a.id 
		,Description + ' ' + CONVERT(VARCHAR(3), Percentage) + '%' AS ListData
		FROM FundingSources a
		INNER JOIN MemberFunding b
			ON b.FundingSourceId = a.id
		WHERE b.MemberId = @memberId

	-- datatable 9
	SELECT 
		FirstName
		, MiddleName
		, LastName
		, Age
		, Street1
		, Street2
		, City
		, StateId
		, PostalCode
		, Telephone1
		, Telephone2
		, Telephone1Type
		, Telephone2Type
		, Email
		, Website
		, SchoolCost
		, AboutMe
		, ShowInPublicSearch
	FROM PersonalInfo
	WHERE MemberId = @memberId
	
	---- datatable 10
	SELECT FundingSourceId, Percentage 
	FROM MemberFunding
	WHERE MemberId = @memberId
END
GO
/****** Object:  StoredProcedure [dbo].[sproc_GetDonationHistoryAndStudentInfo]    Script Date: 09/25/2018 17:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
=============================================
Author:			Scott Rushing
Create date:	10/13/16
Description:	Get donation history.
EDITED:
	10/14/16	JSR		Added two extra datasets for students.
	11/12/16	JSR		Added student info dataset.
=============================================
*/
CREATE PROCEDURE [dbo].[sproc_GetDonationHistoryAndStudentInfo]
	@memberId INT
AS
BEGIN
	DECLARE @history TABLE 
	(
		Total DECIMAL(8 , 2)
		, Disbursed DECIMAL(10, 2)
	)
	
	DECLARE @holdForBalances TABLE
	(
		Amount  DECIMAL(8, 2)
		, Target  DECIMAL(8, 2)
		, Remaining  DECIMAL(8, 2)
	)
	
	DECLARE @holdForDates TABLE
	(
		Amount  DECIMAL(10, 2)
		, Target DATE
		, DaysLeft INT
	)
	
	DECLARE @memberType INT
	SET @memberType = (SELECT MemberType FROM dbo.Members WHERE id = @memberId)
	
	IF @memberType = 1	-- Donor
		BEGIN
			INSERT INTO @history
				(Total, Disbursed)
			VALUES
			(
				(SELECT SUM(Amount) FROM dbo.Donations WHERE DonorId = @memberId) 
		 		, (SELECT SUM(Amount) FROM Donations 
		 			WHERE DonorId = @memberId AND DisbursedOn IS NOT NULL)
			 )
		END	
		
	IF @memberType = 2	-- Student
		BEGIN
			INSERT INTO @history
				(Total, Disbursed)
			VALUES
			(
				(SELECT SUM(Amount) FROM dbo.Donations WHERE RecipientId = @memberId)
				, (SELECT SUM(Amount) FROM dbo.Donations WHERE RecipientId = @memberId AND DisbursedOn IS NOT NULL)
			 )
	
			IF EXISTS
				(SELECT id FROM dbo.Donations 
					WHERE HoldForBalance IS NOT NULL 
					AND RecipientId = @memberId
					AND DisbursedOn IS NULL
				)
				BEGIN
					DECLARE @currentBalance DECIMAL(8, 2)
					SET @currentBalance = (SELECT Total FROM @history) - (SELECT Disbursed FROM @history)
					SET @currentBalance = @currentBalance - 
						(SELECT SUM(Amount) 
						FROM Donations
						WHERE RecipientId = @memberId
							AND HoldForDate IS NOT NULL
							AND DisbursedOn IS NULL
						)
					
					INSERT INTO @holdForBalances
						(Amount, Target, Remaining)
					SELECT 
						Amount
						, HoldForBalance
						, HoldForBalance - @currentBalance
						FROM dbo.Donations 
						WHERE RecipientId = @memberId 
							AND HoldForBalance IS NOT NULL
							AND DisbursedOn IS NULL
				END
			
			IF EXISTS
				(SELECT id FROM dbo.Donations 
					WHERE HoldForDate IS NOT NULL 
					AND RecipientId = @memberId
					AND DisbursedOn IS NULL
				)
				BEGIN
					INSERT INTO @holdForDates
						(Amount, Target, DaysLeft)
					SELECT
						Amount
						, HoldForDate
						, DATEDIFF(DAY, GETDATE(), HoldForDate)
						FROM dbo.Donations WHERE RecipientId = @memberId AND HoldForDate IS NOT NULL			
				END
			
			SELECT Amount, DisbursedOn 
			FROM Donations
			WHERE RecipientId = @memberId
				AND DisbursedOn IS NOT NULL

			SELECT * FROM @holdForBalances
			SELECT * FROM @holdForDates
			
			--SELECT si.SchoolId AS id, s.Name AS [School Name], GPA 
			--FROM StudentInfo si
			--	JOIN  Schools s ON si.SchoolId = s.id
			--WHERE MemberId = @memberId
		END	
		
	SELECT * FROM @history
END
GO
/****** Object:  StoredProcedure [dbo].[sproc_GetClassInfo]    Script Date: 09/25/2018 17:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
=============================================
Author:			Scott Rushing
Create date:	11/06/16
Description:	Get class info.
=============================================
*/
CREATE PROCEDURE [dbo].[sproc_GetClassInfo]
	@classId INT
AS
BEGIN
	SELECT id
	, Name
	, ClassNumber
	, Instructor
	, Description
	, StartDate
	, EndDate
	, CreatedOn
	FROM Classes
	WHERE id = @classId
END
GO
/****** Object:  StoredProcedure [dbo].[sproc_GetClasses]    Script Date: 09/25/2018 17:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
=============================================
Author:			Scott Rushing
Create date:	11/06/16
Description:	Get classes for student.
=============================================
*/
CREATE PROCEDURE [dbo].[sproc_GetClasses]
	@memberId INT
AS
BEGIN
	SELECT Name
	, id
	, ClassNumber
	, Instructor
	, Description
	, StartDate
	, EndDate
	, CreatedOn
	FROM Classes
	WHERE MemberId = @memberId
END
GO
/****** Object:  StoredProcedure [dbo].[sproc_GetBlogPostsAndMessages]    Script Date: 09/25/2018 17:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
=============================================
Author:			Scott Rushing
Create date:	10/31/16
Description:	Gets blog posts and messages.
=============================================
*/
CREATE PROCEDURE [dbo].[sproc_GetBlogPostsAndMessages]
	@memberId INT
	, @returnValue TINYINT OUTPUT
AS
BEGIN
	BEGIN TRY
		SET @returnValue = 1
		DECLARE @memberType TINYINT = (SELECT MemberType FROM Members WHERE id = @memberId)
		DECLARE @associatedMemberIds TABLE (id INT)
		
		IF @memberType = 1	-- Donor : Get associated recipients
			BEGIN
				INSERT INTO @associatedMemberIds
					SELECT RecipientId FROM Donations WHERE DonorId = @memberId
			END
			
		IF @memberType = 2	-- Student : Get associated donors.
			BEGIN
				INSERT INTO @associatedMemberIds
					SELECT DonorId FROM Donations WHERE RecipientId = @memberId
			END
		
		--select * from @associatedMemberIds
		
		SELECT pinf.FirstName + ' ' + pinf.LastName AS Name
		, mt.Type
		, Post
		, bp.CreatedOn
		, IsPublic
		, bp.MemberId AS id
		FROM BlogPosts bp
			JOIN Members m ON m.id = bp.MemberId
			JOIN PersonalInfo pinf ON pinf.MemberId = m.id
			JOIN MemberTypes mt ON mt.Id = m.MemberType
		WHERE bp.MemberId = @memberId
			OR bp.MemberId IN (SELECT id FROM @associatedMemberIds)
		ORDER BY bp.CreatedOn DESC
		
		SELECT pinf.FirstName + ' ' + pinf.LastName AS Name
		, mt.Type
		,Message
		, msg.CreatedOn
		, OriginatorId AS id
		FROM Messages msg
			JOIN Members m ON m.id = msg.OriginatorId
			JOIN PersonalInfo pinf ON pinf.MemberId = m.id
			JOIN MemberTypes mt ON mt.Id = m.MemberType
		WHERE OriginatorId = @memberId
			OR OriginatorId IN (SELECT id FROM @associatedMemberIds)	
		ORDER BY msg.CreatedOn DESC
	END TRY
	BEGIN CATCH
		SET @returnValue = 0
	END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[sproc_GetApprovedRecipients]    Script Date: 09/25/2018 17:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
=============================================
Author:			Scott Rushing
Create date:	10/31/16
Description:	Get approved recipients for a TR.
=============================================
*/
CREATE PROCEDURE [dbo].[sproc_GetApprovedRecipients]
	@resourceId INT
AS
BEGIN
	
	SELECT 
		rr.RecipientId AS id
		, pinf.FirstName + ' ' + pinf.LastName AS Name
		, pinf.City
		, s.Abbreviation AS [State]
		, pinf.PostalCode
		, sch.Name AS School
		FROM ResourceRecipients rr
			JOIN PersonalInfo pinf ON pinf.MemberId = rr.RecipientId
			LEFT JOIN States s ON pinf.StateId = s.id
			LEFT JOIN StudentInfo si ON si.MemberId = pinf.MemberId
			LEFT JOIN Schools sch ON si.SchoolId = sch.id	
	WHERE rr.ResourceId = @resourceId
		AND rr.ApprovedOn IS NOT NULL
END
GO
/****** Object:  StoredProcedure [dbo].[sproc_GetAllMembersWithInfo]    Script Date: 09/25/2018 17:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
=============================================
Author:			Scott Rushing
Create date:	12/01/16
Description:	Get all members with some personal info.  Only used in testing.
=============================================
*/
CREATE PROCEDURE [dbo].[sproc_GetAllMembersWithInfo]
AS
BEGIN
	SELECT 
		m.id
		, mt.Type
		, m.UserName
		, pinf.FirstName + ' ' + pinf.LastName AS Name
		, rr.ApprovedOn
	FROM Members m
		INNER JOIN PersonalInfo pinf ON pinf.MemberId = m.id
		INNER JOIN MemberTypes mt ON mt.Id = m.MemberType
		LEFT JOIN ResourceRecipients rr ON rr.RecipientId = m.id
	ORDER BY m.id
END
GO
/****** Object:  StoredProcedure [dbo].[sproc_CreateUser]    Script Date: 09/25/2018 17:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
=============================================
Author:			Scott Rushing
Create date:	10/8/16
Description:	Create basic user (username, pwd. only).
=============================================
*/
CREATE PROCEDURE [dbo].[sproc_CreateUser]
	@userName VARCHAR(50) 
	, @password VARCHAR(50)
	, @memberType INT
	, @returnValue INT OUTPUT
AS
BEGIN
	SET @returnValue = 1
	BEGIN TRY
		INSERT INTO dbo.Members
			(MemberType, UserName, Password)
		VALUES
			(@memberType, @userName, @password)
		SET @returnValue = SCOPE_IDENTITY()
	END TRY
	BEGIN CATCH
		SET @returnValue = 0
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sproc_CheckRequiredData]    Script Date: 09/25/2018 17:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
=============================================
Author:			Scott Rushing
Create date:	10/23/16
Description:	Check for required data complete.
=============================================
*/
CREATE PROCEDURE [dbo].[sproc_CheckRequiredData]
	@memberId INT  
	, @returnValue TINYINT OUTPUT
AS
BEGIN
	DECLARE @memberType INT = (SELECT MemberType FROM Members WHERE id = @memberId)
	SET @returnValue = 1
	
	IF @memberType = 2	-- STUDENT
		BEGIN
			IF NOT EXISTS						-- Not associated with a TR
				(SELECT id 
					FROM ResourceRecipients 
					WHERE RecipientId = @memberId
				)
			BEGIN
				SET @returnValue = 0
				IF EXISTS (SELECT id FROM RecipientPasswordApprovals WHERE RecipientId = @memberId AND UsedOn IS NULL)
					BEGIN
						SET @returnValue = 1
					END
				IF @returnValue = 0 BEGIN RETURN END
			END	
				
			IF EXISTS							-- No school or no contact info
			(SELECT MemberId 
				FROM StudentInfo 
					WHERE 
						MemberId = @memberId 
						AND (
								SchoolId IS NULL
								OR SchoolContactPersonalInfoId IS NULL
								OR DepositAccountNumber IS NULL
								OR GPA IS NULL
							)
			)	
			BEGIN
				SET @returnValue = 0
				RETURN				
			END	
			
			IF EXISTS							-- At least one piece of contact info missing
			(SELECT id FROM PersonalInfo
				WHERE
					id = (SELECT SchoolContactPersonalInfoId FROM StudentInfo WHERE MemberId = @memberId)
					AND (FirstName IS NULL
					OR LastName IS NULL
					OR Telephone1 IS NULL
					OR Email IS NULL
					OR Website IS NULL)
			)
			BEGIN
				SET @returnValue = 0
				RETURN				
			END					
		END
		
	IF @memberType = 3	--TR
		BEGIN
			IF EXISTS
			(SELECT MemberId FROM ResourceInfo
				WHERE MemberId = @memberId
					AND (SchoolId IS NULL
					OR Position IS NULL
					OR URL IS NULL
					OR SupvName IS NULL
					OR SupvPosition IS NULL
					OR SupvURL IS NULL
					OR SupvEmail IS NULL
					OR SupvPhone IS NULL)
				)
				BEGIN
					SET @returnValue = 0
				END					
		END
	
END
GO
/****** Object:  StoredProcedure [dbo].[sproc_ApproveRecipient]    Script Date: 09/25/2018 17:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
=============================================
Author:			Scott Rushing
Create date:	10/22/16
Description:	Approve a recipient.
Edited:
	10/29/16	JSR		Added marking a password as 'used' if found.

=============================================
*/
CREATE PROCEDURE [dbo].[sproc_ApproveRecipient]
	@recipientId	INT	= NULL
	, @resourceId	INT
	, @returnValue	TINYINT OUTPUT
AS
BEGIN
	BEGIN TRY
		SET @returnValue = 1
		UPDATE ResourceRecipients		-- Set date that resource approved recipient.
			SET ApprovedOn = GETDATE()
		WHERE RecipientId = @recipientId AND ResourceId = @resourceId
		UPDATE RecipientPasswordApprovals		-- If the recipient had a password, mark it 'used'.
			SET UsedOn = GETDATE()
		WHERE RecipientId = @recipientId
	END TRY
	BEGIN CATCH
		SET @returnValue = 0
	END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[sproc_AddSchool]    Script Date: 09/25/2018 17:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
=============================================
Author:			Scott Rushing
Create date:	10/16/16
Description:	Add a school.
Edited:
11/20/16	SR	Removed contact and location (city, etc.) info.  Contact info now part of StudentInfo, user can visit school website for details.
=============================================
*/
CREATE PROCEDURE [dbo].[sproc_AddSchool]
	@createdBy			INT
	, @Name				VARCHAR(150)	= NULL
	, @Website			VARCHAR(250)	= NULL
	, @schoolType		INT
	, @returnValue		INT OUTPUT
	, @returnMessage	VARCHAR(2000) OUTPUT
AS
BEGIN
	SET @returnValue = 1
	BEGIN TRY
		BEGIN TRANSACTION
			SET @returnValue = 1
			SET @returnMessage = ''
			
			INSERT INTO Schools
				(Name, Type, Website, CreatedBy)
			VALUES
				(@Name, @schoolType, @Website, @createdBy)
				
		COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		SET @returnMessage = ERROR_MESSAGE()
		SET @returnValue = 0
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sproc_AddRecipientToTrustedResource]    Script Date: 09/25/2018 17:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
=============================================
Author:			Scott Rushing
Create date:	10/22/16
Description:	Create association between TR and recipient.
=============================================
*/
CREATE PROCEDURE [dbo].[sproc_AddRecipientToTrustedResource]
	@password VARCHAR(150) = NULL
	, @recipientId	INT
	, @resourceId	INT
	, @rtrnXrefId	INT OUTPUT
AS
BEGIN
	BEGIN TRANSACTION TR1
	BEGIN TRY
		SET @rtrnXrefId = 0
		
		IF @password IS NOT NULL
			BEGIN
				SET @recipientId = 
					(
						SELECT RecipientId 
						FROM RecipientPasswordApprovals 
						WHERE Password = @password
						AND UsedOn IS NULL
					)
			END
		
		IF @recipientId IS NULL		-- Password did not exist or has already been used.
			BEGIN
				SET @rtrnXrefId = -1
				RETURN
			END
		
		IF NOT EXISTS(
			SELECT id FROM ResourceRecipients WHERE ResourceId = @resourceId AND RecipientId = @recipientId
		)
			BEGIN
				INSERT INTO ResourceRecipients
					(ResourceId, RecipientId)
				VALUES
					(@resourceId, @recipientId)
				
				SET @rtrnXrefId = SCOPE_IDENTITY()	
				
				UPDATE RecipientPasswordApprovals
					SET UsedOn = GETDATE()
				WHERE RecipientId = @recipientId
					AND UsedOn IS NULL					
			END	
		ELSE
			BEGIN
				SET @rtrnXrefId = -2			
			END
	
			COMMIT TRANSACTION TR1
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION TR1
	END CATCH
	
END
GO
/****** Object:  StoredProcedure [dbo].[sproc_AddRecipientPasswordForResourceApproval]    Script Date: 09/25/2018 17:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
=============================================
Author:			Scott Rushing
Create date:	10/8/16
Description:	Create row in RecipientPasswordApprovals so TR can enter student password and get their profile.
=============================================
*/
CREATE PROCEDURE [dbo].[sproc_AddRecipientPasswordForResourceApproval]
	@memberId INT
	,@password VARCHAR(100) 
	, @returnValue INT OUTPUT
AS
BEGIN
	IF EXISTS (
		SELECT id FROM RecipientPasswordApprovals WHERE RecipientId = @memberId AND UsedOn IS NULL
	)
		BEGIN
			SET @returnValue = -1	-- Member already has an unused password.
			RETURN
		END
	
	INSERT INTO RecipientPasswordApprovals
		(RecipientId, Password)
	VALUES
		(@memberId, @password)	
	SET @returnValue = SCOPE_IDENTITY()		
END
GO
/****** Object:  StoredProcedure [dbo].[sproc_AddMessage]    Script Date: 09/25/2018 17:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
=============================================
Author:			Scott Rushing
Create date:	10/31/16
Description:	Adds a messages.
=============================================
*/
CREATE PROCEDURE [dbo].[sproc_AddMessage]
	@memberId INT
	, @message VARCHAR(MAX)
	, @returnValue TINYINT OUTPUT
AS
BEGIN
	BEGIN TRY
		SET @returnValue = 1
		INSERT INTO Messages 
			(OriginatorId, Message)
		VALUES
			(@memberId, @message)
	END TRY
	BEGIN CATCH
		SET @returnValue = 0
	END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[sproc_AddHelpTicket]    Script Date: 09/25/2018 17:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
=============================================
Author:			Scott Rushing
Create date:	12/10/16
Description:	Adds a help ticket.
=============================================
*/
CREATE PROCEDURE [dbo].[sproc_AddHelpTicket]
	@submittedBy INT
	, @ticketType INT
	, @report VARCHAR(4000)
	, @returnValue TINYINT OUTPUT
AS
BEGIN
	BEGIN TRY
		SET @returnValue = 1
		INSERT INTO HelpTickets 
			(TicketType, TicketReport, SubmittedBy)
		VALUES
			(@ticketType, @report, @submittedBy)
	END TRY
	BEGIN CATCH
		SET @returnValue = 0
	END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[sproc_AddFundingSource]    Script Date: 09/25/2018 17:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
=============================================
Author:			Scott Rushing
Create date:	10/21/16
Description:	Add a funding source.
=============================================
*/
CREATE PROCEDURE [dbo].[sproc_AddFundingSource]
	@createdBy			INT
	, @FundingSource	VARCHAR(30)
AS
BEGIN
	INSERT INTO FundingSources
		(CreatedBy, Description)
	VALUES
		(@createdBy, @FundingSource)
END
GO
/****** Object:  StoredProcedure [dbo].[sproc_AddEmailToSend]    Script Date: 09/25/2018 17:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
=============================================
Author:			Scott Rushing
Create date:	11/03/16
Description:	Persist an email message to send later.  Return the new email id.
=============================================
*/
CREATE PROCEDURE [dbo].[sproc_AddEmailToSend]
	@subject VARCHAR(500)
	, @message VARCHAR(MAX)
	, @sendTo VARCHAR(200)
	, @newEmailId INT OUTPUT
AS
BEGIN
	BEGIN TRY
		SET @newEmailId = 0
		INSERT INTO EmailsToSend
			(Subject, Message, SendTo)
		VALUES
			(@subject, @message, @sendTo)
		SET @newEmailId = SCOPE_IDENTITY()
	END TRY
	BEGIN CATCH
		SET @newEmailId = -1
	END CATCH	
END
GO
/****** Object:  StoredProcedure [dbo].[sproc_AddEditClass]    Script Date: 09/25/2018 17:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
=============================================
Author:			Scott Rushing
Create date:	11/06/16
Description:	Add a class for a student.
=============================================
*/
CREATE PROCEDURE [dbo].[sproc_AddEditClass]
	@memberId INT
	, @classId INT = NULL
	, @Name VARCHAR(200)
	, @ClassNumber VARCHAR(50)
	, @Instructor VARCHAR(100)
	, @Description VARCHAR(4000)
	, @StartDate DATE
	, @EndDate DATE
	, @returnValue TINYINT OUTPUT
AS
BEGIN
	BEGIN TRY
		SET @returnValue = 1
		
		IF @classId = -1
			BEGIN
				INSERT INTO Classes(
					MemberId
					, Name
					, ClassNumber
					, Instructor
					, Description
					, StartDate
					, EndDate		
				)
				VALUES (
					@memberId
					, @Name
					, @ClassNumber
					, @Instructor
					, @Description
					, @StartDate
					, @EndDate
				)			
			END
		ELSE
			UPDATE Classes
				SET 
					Name = @Name
					, ClassNumber = @ClassNumber
					, Instructor = @Instructor
					, Description = @Description
					, StartDate = @StartDate
					, EndDate = @EndDate
					, EditedOn = GETDATE()
			WHERE id = @classId

	END TRY
	BEGIN CATCH
		SET @returnValue = 0
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sproc_AddBlogPost]    Script Date: 09/25/2018 17:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
=============================================
Author:			Scott Rushing
Create date:	10/31/16
Description:	Adds a blog post.
=============================================
*/
CREATE PROCEDURE [dbo].[sproc_AddBlogPost]
	@memberId INT
	, @post VARCHAR(MAX)
	, @isPublic BIT
	, @returnValue TINYINT OUTPUT
AS
BEGIN
	BEGIN TRY
		SET @returnValue = 1
		INSERT INTO BlogPosts 
			(MemberId, Post, IsPublic)
		VALUES
			(@memberId, @post, @isPublic)
	END TRY
	BEGIN CATCH
		SET @returnValue = 0
	END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[AddScene]    Script Date: 09/25/2018 17:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JSR
-- Create date: 11/26/17
-- Description:	Add Scene.
-- =============================================
CREATE PROCEDURE [dbo].[AddScene] 
	@seasonNumber VARCHAR(1)
	, @episodeNumber VARCHAR(2)
	, @locationId VARCHAR(4)
	, @timeStamp VARCHAR(6)
	, @timeStampAsDecimal DECIMAL(18,2)
	, @description VARCHAR(4000)
	, @characters VARCHAR(1000) = NULL
	, @keywords VARCHAR(1000) = NULL
	, @editedOn DATETIME = NULL
	, @returnValue INT OUTPUT
AS
BEGIN
	BEGIN TRY
		IF EXISTS	-- Verify scene does not already exist.
			(
				SELECT Id
				FROM Scenes
				WHERE 
					Season = @seasonNumber AND
					Episode = @episodeNumber AND
					ABS(TimestampAsDecimal - @timeStampAsDecimal) < .5
			)
			BEGIN
				SET @returnValue = -1
				RETURN
			END
			
		INSERT INTO Scenes (Season, Episode, LocationId, Timestamp
			, TimestampAsDecimal, Description, EditedOn)
		VALUES
		(@seasonNumber, @episodeNumber, @locationId, @timeStamp
			, @timeStampAsDecimal, @description, @editedOn)
		
		DECLARE @newSceneId INT
		SET @newSceneId = (SELECT SCOPE_IDENTITY())
		
		SELECT @newSceneId, Item
		FROM dbo.SplitString(@characters, ',')
		
		IF @characters IS NOT NULL
			BEGIN
				INSERT INTO CharacterSceneXref (CharacterId, SceneId)
					SELECT Item, @newSceneId
					FROM dbo.SplitString(@characters, ',')
			END
			
		IF @keywords IS NOT NULL
			BEGIN
				SET @keywords = REPLACE(@keywords, ', ', ',')
				IF (SELECT COUNT(*) FROM dbo.SplitString(@keywords, ',')
						WHERE Item NOT IN (
						SELECT Keyword from Keywords)) 
					> 0		-- There are new keywords in the string,
				BEGIN
					INSERT INTO Keywords (Keyword)	--  so insert them into Keywords.
						SELECT Item FROM dbo.SplitString(@keywords, ',')
						WHERE Item NOT IN (
						SELECT Keyword from Keywords)
				END

				INSERT INTO KeywordSceneXref (KeywordId, SceneId)
					SELECT Id, @newSceneId FROM Keywords
					WHERE Keyword IN (SELECT Item FROM dbo.SplitString(@keywords, ','))							
			END

		SET @returnValue = 1
	END TRY
	BEGIN CATCH
		SET @returnValue = 0
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[AddLocation]    Script Date: 09/25/2018 17:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JSR
-- Create date: 11/20/17
-- Description:	Check to see if a scene already exists before adding.
-- =============================================
CREATE PROCEDURE [dbo].[AddLocation]
	@notes varchar(4000) = NULL
	, @name varchar(200)
	, @returnValue INT OUTPUT
AS
BEGIN
	BEGIN TRY
		IF EXISTS
		(
			SELECT Id FROM Locations WHERE Name = @name
		)
			BEGIN
				SET @returnValue = -1
				RETURN
			END
			
		INSERT INTO Locations (Name, Notes)
		VALUES (@name, @notes)	
		SET @returnValue = (SELECT SCOPE_IDENTITY())
	END TRY
	BEGIN CATCH
		SET @returnValue = 0
	END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[AddCharacter]    Script Date: 09/25/2018 17:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JSR
-- Create date: 11/20/17
-- Description:	Add A Character.
-- =============================================
CREATE PROCEDURE [dbo].[AddCharacter]
	@notes varchar(2000) = NULL
	, @firstName varchar(50)
	, @lastName varchar(50) = NULL
	, @returnValue INT OUTPUT
AS
BEGIN
	BEGIN TRY
		IF EXISTS
		(
			SELECT Id FROM Characters WHERE FirstName = @firstName AND LastName = @lastName
		)
			BEGIN
				SET @returnValue = -1
				RETURN
			END
			
		INSERT INTO Characters (FirstName, LastName, Notes)
		VALUES (@firstName, @lastName, @notes)	
		SET @returnValue = (SELECT SCOPE_IDENTITY())
	END TRY
	BEGIN CATCH
		SET @returnValue = 0
	END CATCH

END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetMyRecipientInfo]    Script Date: 09/25/2018 17:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
-- =============================================
-- Author:		Scott Rushing
-- Create date: 10/?/16
-- Description:	1 = total disbursements
				2 = total donations
				3 = held for date
				4 = held for balance
				5 = last blog post date
-- =============================================
*/
CREATE FUNCTION [dbo].[fn_GetMyRecipientInfo] 
(
	@dataTypeToGet INT
	, @memberId INT
)
RETURNS VARCHAR(1000)
AS
BEGIN
	IF @dataTypeToGet = 1
		BEGIN
			RETURN
				(SELECT SUM(don.Amount) 
				FROM Donations don
				WHERE don.RecipientId = @memberId AND DisbursedOn IS NOT NULL)
		END
		
	IF @dataTypeToGet = 2
		BEGIN
			RETURN
				(SELECT SUM(don.Amount) 
				FROM Donations don
				WHERE don.RecipientId = @memberId)		
		END

	IF @dataTypeToGet = 3
		BEGIN
			RETURN
				(SELECT SUM(Amount) FROM dbo.Donations 
					WHERE HoldForDate IS NOT NULL 
					AND RecipientId = @memberId
					AND DisbursedOn IS NULL)
		END
		

					
	IF @dataTypeToGet = 4
		BEGIN
			RETURN
				(SELECT SUM(Amount) FROM dbo.Donations 
					WHERE HoldForBalance IS NOT NULL 
					AND RecipientId = @memberId
					AND DisbursedOn IS NULL)		
		END

	IF @dataTypeToGet = 5
		BEGIN
			RETURN
				(SELECT TOP 1 CreatedOn
				FROM BlogPosts
				WHERE MemberId = @memberId
				ORDER BY CreatedOn DESC)	
		END
		
	RETURN NULL
END
GO
/****** Object:  StoredProcedure [dbo].[sproc_UserNameExists]    Script Date: 09/25/2018 17:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
=============================================
Author:			Scott Rushing
Create date:	10/8/16
Description:	Check for username availability.
=============================================
*/
CREATE PROCEDURE [dbo].[sproc_UserNameExists]
	@userNameToCheck VARCHAR(100) 
	, @returnValue TINYINT OUTPUT
AS
BEGIN
	SET @returnValue = 0
	IF EXISTS
		(SELECT * FROM Members WHERE UserName = @userNameToCheck)
		SET @returnValue = 1
END
GO
/****** Object:  StoredProcedure [dbo].[sproc_UpdateSpecificInfo_Student]    Script Date: 09/25/2018 17:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
=============================================
Author:			Scott Rushing
Create date:	10/8/16
Description:	Update student specific info.
=============================================
*/
CREATE PROCEDURE [dbo].[sproc_UpdateSpecificInfo_Student]
	@memberId INT
	, @schoolId INT
	, @GPA	DECIMAL(3,2)
	, @ContactFirstName VARCHAR(50)	= NULL
	, @ContactLastName VARCHAR(50)	= NULL
	, @ContactWebsite VARCHAR(150)	= NULL
	, @ContactEmail VARCHAR(150)	= NULL
	, @ContactTelephone VARCHAR(15)	= NULL	
	, @DepositAccountNumber VARCHAR(50) = NULL
	, @returnValue INT OUTPUT
AS
BEGIN
	BEGIN TRY
		SET @returnValue = 1
		
		IF @ContactFirstName = '' BEGIN SET @ContactFirstName = NULL END
		IF @ContactLastName = '' BEGIN SET @ContactLastName = NULL END
		IF @ContactWebsite = '' BEGIN SET @ContactWebsite = NULL END
		IF @ContactEmail = '' BEGIN SET @ContactEmail = NULL END
		IF @ContactTelephone = '' BEGIN SET @ContactTelephone = NULL END
		IF @DepositAccountNumber = '' BEGIN SET @DepositAccountNumber = NULL END
		
		IF @schoolId > 0
			BEGIN
				UPDATE StudentInfo
					SET SchoolId = @schoolId
					WHERE MemberId = @memberId
			END
		ELSE
			BEGIN
				DECLARE @SchoolContactPersInfoId INT = 
					(SELECT SchoolContactPersonalInfoId FROM StudentInfo WHERE MemberId = @memberId)
					
				IF @SchoolContactPersInfoId IS NULL
					BEGIN
						INSERT INTO PersonalInfo
							(MemberId, FirstName, LastName, Website, Telephone1, Email)
						VALUES
							(-1, @ContactFirstName, @ContactLastName, @ContactWebsite, @ContactTelephone, @ContactEmail)
						
						UPDATE StudentInfo 
							SET
								GPA = @GPA
								, DepositAccountNumber = @DepositAccountNumber
								, SchoolContactPersonalInfoId = SCOPE_IDENTITY()
							WHERE MemberId = @memberId
					END
				ELSE
					BEGIN
						UPDATE StudentInfo
							SET
								GPA = @GPA
								, DepositAccountNumber = @DepositAccountNumber
							WHERE MemberId = @memberId		
						
						UPDATE PersonalInfo
							SET FirstName = @ContactFirstName
								, LastName = @ContactLastName
								, Website = @ContactWebsite
								, Email = @ContactEmail
								, Telephone1 = @ContactTelephone
							WHERE id = @SchoolContactPersInfoId
					END	
			END
	END TRY
	BEGIN CATCH
		SET @returnValue = 0
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sproc_UpdateSpecificInfo_Resource]    Script Date: 09/25/2018 17:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
=============================================
Author:			Scott Rushing
Create date:	10/8/16
Description:	Update TR specific info.
=============================================
*/
CREATE PROCEDURE [dbo].[sproc_UpdateSpecificInfo_Resource]
	@memberId INT
	, @schoolId INT
	, @position VARCHAR(200)
	, @url VARCHAR(150)
	, @SupvName VARCHAR(50)
	, @SupvPosition VARCHAR(50)
	, @SupvURL VARCHAR(150)
	, @SupvEmail VARCHAR(150)
	, @SupvPhone VARCHAR(15)
	, @returnValue INT OUTPUT
AS
BEGIN
	BEGIN TRY
		SET @returnValue = 1
		IF @position = '' BEGIN SET @position = NULL END
		IF @url = '' BEGIN SET @url = NULL END
		IF @SupvName = '' BEGIN SET @SupvName = NULL END
		IF @SupvPosition = '' BEGIN SET @SupvPosition = NULL END
		IF @SupvURL = '' BEGIN SET @SupvURL = NULL END
		IF @SupvEmail = '' BEGIN SET @SupvEmail = NULL END
		IF @SupvPhone = '' BEGIN SET @SupvPhone = NULL END
		
		IF @schoolId > 0
			BEGIN
			UPDATE ResourceInfo
				SET SchoolId = @schoolId
				WHERE MemberId = @memberId
			END
		
		UPDATE ResourceInfo
			SET Position = @position
				, URL = @url
				, SupvName = @SupvName
				, SupvPosition = @SupvPosition
				, SupvURL = @SupvURL
				, SupvEmail = @SupvEmail
				, SupvPhone = @SupvPhone
			WHERE MemberId = @memberId
	END TRY
	BEGIN CATCH
		PRINT ERROR_MESSAGE()
		SET @returnValue = 0
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sproc_UpdateMailSentOnDate]    Script Date: 09/25/2018 17:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
=============================================
Author:			Scott Rushing
Create date:	11/05/16
Description:	Update email to send SentOn date.
=============================================
*/
CREATE PROCEDURE [dbo].[sproc_UpdateMailSentOnDate]
	@emailId INT
	, @returnValue TINYINT OUTPUT
AS
BEGIN
	BEGIN TRY
		SET @returnValue = 1
		UPDATE EmailsToSend
		SET SentOn = GETDATE()
		WHERE id = @emailId	
	END TRY
	BEGIN CATCH
		SET @returnValue = 0
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sproc_Search]    Script Date: 09/25/2018 17:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
=============================================
Author:			Scott Rushing
Create date:	10/15/16
Description:	Search for members.
=============================================
*/
CREATE PROCEDURE [dbo].[sproc_Search]
	@memberType INT 
	, @strHobbies VARCHAR(100) = NULL
	, @strInterests VARCHAR(100) = NULL
	, @strReasons VARCHAR(100) = NULL
	, @strSchools VARCHAR(100) = NULL
	, @strEthnicities VARCHAR(100) = NULL
	, @strMajors VARCHAR(100) = NULL
	, @strFunding VARCHAR(100) = NULL
	, @firstName VARCHAR(50) = NULL
	, @lastName VARCHAR(50) = NULL
	, @city VARCHAR(50) = NULL
	, @stateId INT = 0
	, @postalCode VARCHAR(15) = NULL
AS
BEGIN
	DECLARE @innerTable TABLE
	(
		[type] VARCHAR(50)
		, [description] VARCHAR(100)
		, memberId INT
	)

	INSERT INTO @innerTable
		SELECT 'hobby' AS Type, h.Description, m.id FROM Members m
			INNER JOIN MemberHobbies mb
				ON m.id = mb.MemberId
			INNER JOIN Hobbies h
				ON h.id = mb.HobbyId
		WHERE m.MemberType = @memberType 
			AND mb.HobbyId IN (SELECT * FROM fn_SplitString(@strHobbies))
		UNION ALL
		SELECT 'interest' AS Type, i.Description, m.id FROM Members m
			INNER JOIN MemberInterests mi
				ON m.id = mi.MemberId
			INNER JOIN Interests i
				ON i.id = mi.InterestId
		WHERE m.MemberType = @memberType 
			AND mi.InterestId IN (SELECT * FROM fn_SplitString(@strInterests))
		UNION ALL
		SELECT 'school' AS Type, s.Name, m.id FROM Members m
			INNER JOIN MemberSchools ms
				ON m.id = ms.MemberId
			INNER JOIN Schools s
				ON s.id = ms.SchoolId
		WHERE m.MemberType = @memberType 
			AND ms.SchoolId IN (SELECT * FROM fn_SplitString(@strSchools))		
		UNION ALL
		SELECT 'reason' AS Type, r.Description, m.id FROM Members m
			INNER JOIN MemberReasons mr
				ON m.id = mr.MemberId
			INNER JOIN Reasons r
				ON r.id = mr.ReasonId
		WHERE m.MemberType = @memberType 
			AND mr.ReasonId IN (SELECT * FROM fn_SplitString(@strReasons))
		UNION ALL	
		SELECT 'ethnicity' AS Type, e.Name, m.id FROM Members m
			INNER JOIN MemberEthnicity me
				ON m.id = me.MemberId
			INNER JOIN Ethnicities e
				ON e.id = me.EthnicityId
		WHERE m.MemberType = @memberType 
			AND me.EthnicityId IN (SELECT * FROM fn_SplitString(@strEthnicities))
		UNION ALL	
		SELECT 'major' AS Type, ma.Description, m.id FROM Members m
			INNER JOIN MemberMajors mm
				ON m.id = mm.MemberId
			INNER JOIN Majors ma
				ON ma.id = mm.MajorId
		WHERE m.MemberType = @memberType 
			AND mm.MajorId IN (SELECT * FROM fn_SplitString(@strMajors))

		UNION ALL	
		SELECT 'funding' AS Type, f.Description, m.id FROM Members m
			INNER JOIN MemberFunding mf
				ON m.id = mf.MemberId
			INNER JOIN FundingSources f
				ON f.id = mf.FundingSourceId
		WHERE m.MemberType = @memberType 
			AND mf.FundingSourceId IN (SELECT * FROM fn_SplitString(@strFunding))
		
	DECLARE @rtrnTable TABLE
	(
		Type VARCHAR(50)
		, [Description] VARCHAR(100)
		, MemberId INT
		, FirstName VARCHAR(100)
		, LastName VARCHAR(100)
		, City VARCHAR(100)
		, [State] VARCHAR(2)
		, [StateId] INT
		, PostalCode VARCHAR(10)
	)

	DECLARE @rtrnTmpTable TABLE
	(
		Type VARCHAR(50)
		, [Description] VARCHAR(100)
		, MemberId INT
		, FirstName VARCHAR(100)
		, LastName VARCHAR(100)
		, City VARCHAR(100)
		, [State] VARCHAR(2)
		, [StateId] INT
		, PostalCode VARCHAR(10)
	)

	INSERT INTO @rtrnTable
		(Type, Description, MemberId, FirstName, LastName, City, State, StateId, PostalCode)
	SELECT Type, Description, memberId, 
		(SELECT FirstName FROM dbo.PersonalInfo p WHERE p.memberId = iT.memberId)
		, (SELECT LastName FROM dbo.PersonalInfo p WHERE p.memberId = iT.memberId)
		, (SELECT City FROM dbo.PersonalInfo p WHERE p.memberId = iT.memberId)
		, (SELECT s.Abbreviation FROM dbo.PersonalInfo p INNER JOIN States s ON p.StateId = s.id WHERE p.memberId = iT.memberId)
		, (SELECT s.id FROM dbo.PersonalInfo p INNER JOIN States s ON p.StateId = s.id WHERE p.memberId = iT.memberId)
		, (SELECT PostalCode FROM dbo.PersonalInfo p WHERE p.memberId = iT.memberId)
	FROM @innerTable iT	
	
	IF LEN(@firstName) > 0
		BEGIN		
			INSERT INTO @rtrnTmpTable SELECT * FROM @rtrnTable WHERE FirstName = @firstName
			DELETE FROM @rtrnTable
			INSERT INTO @rtrnTable SELECT * FROM @rtrnTmpTable
		END
	IF LEN(@lastName) > 0
		BEGIN
			DELETE FROM @rtrnTmpTable
			INSERT INTO @rtrnTmpTable SELECT * FROM @rtrnTable WHERE LastName = @lastName
			DELETE FROM @rtrnTable
			INSERT INTO @rtrnTable SELECT * FROM @rtrnTmpTable
		END
	IF LEN(@city) > 0
		BEGIN
			DELETE FROM @rtrnTmpTable
			INSERT INTO @rtrnTmpTable SELECT * FROM @rtrnTable WHERE City = @city
			DELETE FROM @rtrnTable
			INSERT INTO @rtrnTable SELECT * FROM @rtrnTmpTable
		END
	IF LEN(@postalCode) > 0
		BEGIN
			DELETE FROM @rtrnTmpTable
			INSERT INTO @rtrnTmpTable SELECT * FROM @rtrnTable WHERE PostalCode = @postalCode
			DELETE FROM @rtrnTable
			INSERT INTO @rtrnTable SELECT * FROM @rtrnTmpTable
		END
	IF @stateId > 0
		BEGIN
			DELETE FROM @rtrnTmpTable
			INSERT INTO @rtrnTmpTable SELECT * FROM @rtrnTable WHERE StateId = @stateId
			DELETE FROM @rtrnTable
			INSERT INTO @rtrnTable SELECT * FROM @rtrnTmpTable		
		END

	SELECT * from @rtrnTable ORDER BY [Type]		

END
GO
/****** Object:  StoredProcedure [dbo].[sproc_PopulateMemberInformation]    Script Date: 09/25/2018 17:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
=============================================
Author:			Scott Rushing
Create date:	10/8/16
Description:	Populate Member information.
=============================================
*/
CREATE PROCEDURE [dbo].[sproc_PopulateMemberInformation]
	@isEdit				BIT
	, @MemberId			INT
	, @FirstName		VARCHAR(50)
	, @MiddleName		VARCHAR(50)		= NULL
	, @LastName			VARCHAR(50)
	, @Street1			VARCHAR(50)
	, @Street2			VARCHAR(50)		= NULL
	, @City				VARCHAR(50)
	, @StateId			INT
	, @Province			VARCHAR(10)		= NULL
	, @PostalCode		VARCHAR(10)
	, @Telephone1		VARCHAR(12)		= NULL
	, @Telephone2		VARCHAR(12)		= NULL
	, @Email			VARCHAR(150)	= NULL
	, @Website			VARCHAR(250)	= NULL
	, @ShowInPublicSearch BIT
	, @InterestString	VARCHAR(100)
	, @HobbyString		VARCHAR(100)
	, @ReasonString		VARCHAR(100)
	, @SchoolString		VARCHAR(100)
	, @EthnicityString	VARCHAR(100)
	, @MajorString		VARCHAR(100)
	, @DegreeString		VARCHAR(100)
	, @FundingString	XML
	
	, @Interests_New	VARCHAR(100)	= NULL
	, @Hobbies_New		VARCHAR(100)	= NULL
	, @Reasons_New		VARCHAR(100)	= NULL
	, @Ethnicities_New	VARCHAR(100)	= NULL
	, @Majors_New		VARCHAR(100)	= NULL
	, @Degrees_New		VARCHAR(100)	= NULL
	
	, @memberType INT = NULL
	
	, @AboutMe			VARCHAR(MAX)	= NULL
	, @Telephone1Type	INT				= NULL
	, @Telephone2Type	INT				= NULL
	, @AllowContact		BIT
	, @SchoolCost		DECIMAL(12,2)
	, @Age				INT
	, @returnValue		TINYINT OUTPUT	-- 1 = TRUE/SUCCESS
	, @returnMessage	VARCHAR(2000) OUTPUT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			SET @returnValue = 1
			SET @returnMessage = ''
			
			IF @isEdit = 0
				BEGIN
					IF @memberType = 2
						BEGIN		
							INSERT INTO StudentInfo (MemberId) 
							VALUES (@MemberId)	
						END
					IF @memberType = 3
						BEGIN		
							INSERT INTO ResourceInfo (MemberId) 
							VALUES (@MemberId)	
						END						
				END
			
			IF @isEdit = 1
				BEGIN
					DELETE FROM PersonalInfo WHERE MemberId = @MemberId
					DELETE FROM MemberHobbies WHERE MemberId = @MemberId			
					DELETE FROM MemberInterests WHERE MemberId = @MemberId			
					DELETE FROM MemberSchools WHERE MemberId = @MemberId			
					DELETE FROM MemberEthnicity WHERE MemberId = @MemberId			
					DELETE FROM MemberMajors WHERE MemberId = @MemberId			
					DELETE FROM MemberFunding WHERE MemberId = @MemberId			
					DELETE FROM MemberDegrees WHERE MemberId = @MemberId			
					DELETE FROM MemberReasons WHERE MemberId = @MemberId					
				END
			
			INSERT INTO dbo.PersonalInfo
				(memberId, FirstName, MiddleName, LastName, Street1, Street2, City
				, StateId, PostalCode
				, Telephone1, Telephone2, Email, Website, AboutMe
				, Telephone1Type, Telephone2Type, AllowContact, SchoolCost, Age, ShowInPublicSearch)
			VALUES
				(@MemberId, @FirstName, @MiddleName, @LastName, @Street1, @Street2, @City
				, @StateId, @PostalCode
				, @Telephone1, @Telephone2, @Email, @Website, @AboutMe
				, @Telephone1Type, @Telephone2Type, @AllowContact, @SchoolCost, @Age, @ShowInPublicSearch)
			
			-- Populate category tables from @New... strings.
			print 'populating new categories'
			DECLARE @new TABLE (descrip VARCHAR(50), createdBy INT)
			DECLARE @newString VARCHAR(1000)
			
			IF @Interests_New IS NOT NULL
				BEGIN
					INSERT INTO @new (descrip) SELECT elementValue FROM dbo.fn_SplitString_VARCHAR(@Interests_New)
					UPDATE @new SET createdBy = @MemberId
					INSERT INTO Interests (Description, CreatedBy) SELECT descrip, createdBy FROM @new
					SET @newString = ''
					SELECT @newString = @newString + CAST(id AS VARCHAR(5)) + '|' FROM Interests WHERE Description IN (SELECT descrip FROM @new)
					SET @newString = SUBSTRING(@newString, 1, LEN(@newString) - 1)
					IF @InterestString = ''
						SET @InterestString = @newString
					ELSE
						SET @InterestString = @InterestString + '|' + @newString
					DELETE FROM @new
				END
			
			IF @Hobbies_New IS NOT NULL
				BEGIN
					INSERT INTO @new (descrip) SELECT elementValue FROM dbo.fn_SplitString_VARCHAR(@Hobbies_New)
					UPDATE @new SET createdBy = @MemberId
					INSERT INTO Hobbies (Description, CreatedBy) SELECT descrip, createdBy FROM @new
					SET @newString = ''
					SELECT @newString = @newString + CAST(id AS VARCHAR(5)) + '|' FROM Hobbies WHERE Description IN (SELECT descrip FROM @new)
					SET @newString = SUBSTRING(@newString, 1, LEN(@newString) - 1)
					DELETE FROM @new
					IF @HobbyString = ''
						SET @HobbyString = @newString
					ELSE
						SET @HobbyString = @HobbyString + '|' + @newString
					DELETE FROM @new
				END
			
			IF @Reasons_New IS NOT NULL
				BEGIN
					INSERT INTO @new (descrip) SELECT elementValue FROM dbo.fn_SplitString_VARCHAR(@Reasons_New)
					UPDATE @new SET createdBy = @MemberId
					INSERT INTO Reasons (Description, CreatedBy, MemberType) SELECT descrip, createdBy, @memberType FROM @new
					SET @newString = ''
					SELECT @newString = @newString + CAST(id AS VARCHAR(5)) + '|' FROM Reasons WHERE Description IN (SELECT descrip FROM @new)
					SET @newString = SUBSTRING(@newString, 1, LEN(@newString) - 1)
					IF @ReasonString = ''
						SET @ReasonString = @newString
					ELSE
						SET @ReasonString = @ReasonString + '|' + @newString
					DELETE FROM @new
				END
			
			IF @Ethnicities_New IS NOT NULL
				BEGIN
					INSERT INTO @new (descrip) SELECT elementValue FROM dbo.fn_SplitString_VARCHAR(@Ethnicities_New)
					UPDATE @new SET createdBy = @MemberId
					INSERT INTO Ethnicities (Name, CreatedBy) SELECT descrip, createdBy FROM @new
					SET @newString = ''
					SELECT @newString = @newString + CAST(id AS VARCHAR(5)) + '|' FROM Ethnicities WHERE Name IN (SELECT descrip FROM @new)
					SET @newString = SUBSTRING(@newString, 1, LEN(@newString) - 1)
					IF @EthnicityString = ''
						SET @EthnicityString = @newString
					ELSE
						SET @EthnicityString = @EthnicityString + '|' + @newString
					DELETE FROM @new
				END
				
			IF @Majors_New IS NOT NULL
				BEGIN
					INSERT INTO @new (descrip) SELECT elementValue FROM dbo.fn_SplitString_VARCHAR(@Majors_New)
					UPDATE @new SET createdBy = @MemberId
					INSERT INTO Majors (Description, CreatedBy) SELECT descrip, createdBy FROM @new
					SET @newString = ''
					SELECT @newString = @newString + CAST(id AS VARCHAR(5)) + '|' FROM Majors WHERE Description IN (SELECT descrip FROM @new)
					SET @newString = SUBSTRING(@newString, 1, LEN(@newString) - 1)
					IF @MajorString = ''
						SET @MajorString = @newString
					ELSE
						SET @MajorString = @MajorString + '|' + @newString
					DELETE FROM @new
				END
			
			IF @Degrees_New IS NOT NULL
				BEGIN
					INSERT INTO @new (descrip) SELECT elementValue FROM dbo.fn_SplitString_VARCHAR(@Degrees_New)
					UPDATE @new SET createdBy = @MemberId
					INSERT INTO Degrees (Description, CreatedBy) SELECT descrip, createdBy FROM @new
					SET @newString = ''
					SELECT @newString = @newString + CAST(id AS VARCHAR(5)) + '|' FROM Degrees WHERE Description IN (SELECT descrip FROM @new)
					SET @newString = SUBSTRING(@newString, 1, LEN(@newString) - 1)
					IF @DegreeString = ''
						SET @DegreeString = @newString
					ELSE
						SET @DegreeString = @DegreeString + '|' + @newString
					DELETE FROM @new
				END
			
			-- Populate category tables
			print 'populating category tables'
			DECLARE @tmp TABLE (id INT, itemId INT)
			
			DELETE FROM @tmp
			INSERT INTO @tmp (itemId) SELECT elementValue FROM dbo.fn_SplitString(@HobbyString)
			UPDATE @tmp SET id = @MemberId
			INSERT INTO MemberHobbies (MemberId, HobbyId)
				SELECT id, itemId FROM @tmp
			
			DELETE FROM @tmp
			INSERT INTO @tmp (itemId) SELECT elementValue FROM dbo.fn_SplitString(@InterestString)
			UPDATE @tmp SET id = @MemberId
			INSERT INTO MemberInterests (MemberId, InterestId)
				SELECT id, itemId FROM @tmp
			
			DELETE FROM @tmp
			INSERT INTO @tmp (itemId) SELECT elementValue FROM dbo.fn_SplitString(@ReasonString)
			UPDATE @tmp SET id = @MemberId
			INSERT INTO MemberReasons (MemberId, ReasonId)
				SELECT id, itemId FROM @tmp
			
			DELETE FROM @tmp
			INSERT INTO @tmp (itemId) SELECT elementValue FROM dbo.fn_SplitString(@SchoolString)
			UPDATE @tmp SET id = @MemberId
			INSERT INTO MemberSchools (MemberId, SchoolId)
				SELECT id, itemId FROM @tmp
			
			DELETE FROM @tmp
			INSERT INTO @tmp (itemId) SELECT elementValue FROM dbo.fn_SplitString(@EthnicityString)
			UPDATE @tmp SET id = @MemberId
			INSERT INTO MemberEthnicity (MemberId, EthnicityId)
				SELECT id, itemId FROM @tmp
			
			DELETE FROM @tmp
			INSERT INTO @tmp (itemId) SELECT elementValue FROM dbo.fn_SplitString(@MajorString)
			UPDATE @tmp SET id = @MemberId
			INSERT INTO MemberMajors (MemberId, MajorId)
				SELECT id, itemId FROM @tmp

			INSERT INTO MemberFunding (MemberId, FundingSourceId, Percentage)
				SELECT
					@MemberId
					, XCol.value('(value)[1]','INT')
					, XCol.value('(value)[2]','INT')
			   FROM 
				  @FundingString.nodes('data/row') AS XTbl(XCol)			
			
			DELETE FROM @tmp
			INSERT INTO @tmp (itemId) SELECT elementValue FROM dbo.fn_SplitString(@DegreeString)
			UPDATE @tmp SET id = @MemberId
			INSERT INTO MemberDegrees (MemberId, DegreeId)
				SELECT id, itemId FROM @tmp
			
			UPDATE PersonalInfo SET EditedOn = GETDATE() WHERE MemberId = @MemberId
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		SET @returnMessage = ERROR_MESSAGE()
		SET @returnValue = 0
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sproc_MakeDonation]    Script Date: 09/25/2018 17:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
=============================================
Author:			Scott Rushing
Create date:	10/17/16
Description:	Make a donation.
=============================================
*/
CREATE PROCEDURE [dbo].[sproc_MakeDonation]
	@donorId INT
	, @recipientId INT
	, @amount DECIMAL(8,2)
	, @holdForBalance DECIMAL(8,2) = NULL
	, @holdForDate DATE = NULL
	, @returnedDonationId INT OUTPUT
AS
BEGIN
	INSERT INTO Donations
		(DonorId, RecipientId, Amount, HoldForBalance, HoldForDate)
	VALUES
		(@donorId, @recipientId, @amount, @holdForBalance, @holdForDate)
	SET @returnedDonationId = SCOPE_IDENTITY()
	
	IF (@holdForBalance IS NULL AND @holdForDate IS NULL)
		BEGIN
			UPDATE Donations 
				SET DisbursedOn = GETDATE() 
			WHERE id = @returnedDonationId
		END
END
GO
/****** Object:  StoredProcedure [dbo].[sproc_GetTrustedResources]    Script Date: 09/25/2018 17:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
=============================================
Author:			Scott Rushing
Create date:	10/22/16
Description:	Get all trusted resources.
Edited:
11/30/16	SR	Do not return TR already associated with @memberId.
=============================================
*/
CREATE PROCEDURE [dbo].[sproc_GetTrustedResources]
	@memberId INT
AS
BEGIN
	SELECT
		pinf.FirstName + ' ' + pinf.LastName + ' : ' + s.Name AS Name
		, ri.MemberId AS id
		FROM ResourceInfo ri
			JOIN Schools s ON ri.SchoolId = s.id
			JOIN PersonalInfo pinf ON pinf.MemberId = ri.MemberId
		WHERE ri.MemberId NOT IN (SELECT ResourceId FROM ResourceRecipients WHERE RecipientId = @memberId)
		ORDER BY pinf.FirstName
END
GO
/****** Object:  StoredProcedure [dbo].[sproc_GetTelephoneTypes]    Script Date: 09/25/2018 17:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
=============================================
Author:			Scott Rushing
Create date:	10/16/16
Description:	Get telephone types.
=============================================
*/
CREATE PROCEDURE [dbo].[sproc_GetTelephoneTypes]
AS
BEGIN
	SELECT Description, id FROM TelephoneTypes
END
GO
/****** Object:  StoredProcedure [dbo].[sproc_GetStudentInfo]    Script Date: 09/25/2018 17:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
=============================================
--Author:			Scott Rushing
Create date:	11/06/16
Description:	Get student data for member id.
Edited:
12/10/16
=============================================
*/
CREATE PROCEDURE [dbo].[sproc_GetStudentInfo]
	@memberId INT
AS
BEGIN
	SELECT 
		SchoolId 
		, s.Name AS School_Name
		, s.Website AS School_Website
		, GPA
		, DepositAccountNumber
	FROM StudentInfo si
		LEFT JOIN Schools s ON si.SchoolId = S.id
	WHERE si.MemberId = @memberId
	
	SELECT
		CASE 
			WHEN rr.ApprovedOn IS NULL THEN pinf.FirstName + ' ' + pinf.LastName + ' (not approved)'
			WHEN rr.ApprovedOn IS NOT NULL THEN pinf.FirstName + ' ' + pinf.LastName + ' (' + CONVERT(VARCHAR(15), rr.ApprovedOn, 101) + ')'
		END
		AS Name
		--, pinf.FirstName + ' ' + pinf.LastName + ' (' + COALESCE(CONVERT(VARCHAR(15), rr.ApprovedOn, 101), 'not approved') + ')' AS Name 
		, rr.ResourceId	
	FROM ResourceRecipients rr
		JOIN PersonalInfo pinf ON pinf.MemberId = rr.ResourceId
	WHERE RecipientId = @memberId
		
	SELECT Password
		FROM RecipientPasswordApprovals
		WHERE RecipientId = @memberId AND UsedOn IS NULL
		
	SELECT id
		FROM ResourceRecipients
		WHERE RecipientId = @memberId AND ApprovedOn IS NOT NULL
		
	SELECT 
		rr.ResourceId AS TrID
		, (SELECT FirstName + ' ' + LastName FROM PersonalInfo WHERE MemberId = rr.ResourceId) AS Tr_Name
		, pinf.FirstName AS First
		, pinf.LastName AS Last
		, pinf.Website AS Website
		, pinf.Email AS Email
		, pinf.Telephone1 AS Phone	
		, rr.ApprovedOn
	FROM PersonalInfo pinf	
		JOIN ResourceRecipients rr ON rr.ResourceId = pinf.MemberId
	WHERE rr.RecipientId = @memberId
	
	SELECT
		FirstName AS First
		, LastName AS Last
		, Website
		, Email
		, Telephone1 AS Phone
		FROM PersonalInfo
		WHERE id = (SELECT SchoolContactPersonalInfoId FROM StudentInfo WHERE MemberId = @memberId)
	
END
GO
/****** Object:  StoredProcedure [dbo].[sproc_GetStates]    Script Date: 09/25/2018 17:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
=============================================
Author:			Scott Rushing
Create date:	12/09/16
Description:	Get school names.
=============================================
*/
CREATE PROCEDURE [dbo].[sproc_GetStates]
AS
BEGIN
	DECLARE @tbl TABLE (id INT, Abbreviation VARCHAR(2), FullName VARCHAR(30))
	INSERT INTO @tbl (id, Abbreviation, FullName) VALUES (0, '', '')
	INSERT INTO @tbl
		SELECT id, Abbreviation, FullName FROM States
	SELECT * FROM @tbl
END
GO
/****** Object:  StoredProcedure [dbo].[sproc_GetSentEmailsForRecipient]    Script Date: 09/25/2018 17:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
=============================================
Author:			Scott Rushing
Create date:	11/03/16
Description:	Gets all sent emails for recipient.
=============================================
*/
CREATE PROCEDURE [dbo].[sproc_GetSentEmailsForRecipient]
	@recipient VARCHAR(200)
AS
BEGIN
	SELECT Subject, Message, SentOn FROM EmailsToSend WHERE SendTo = @recipient
END
GO
/****** Object:  StoredProcedure [dbo].[sproc_GetSchoolTypes]    Script Date: 09/25/2018 17:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
=============================================
Author:			Scott Rushing
Create date:	10/16/16
Description:	Get school types.
=============================================
*/
CREATE PROCEDURE [dbo].[sproc_GetSchoolTypes]
AS
BEGIN
	SELECT Description, id FROM SchoolTypes
END
GO
/****** Object:  StoredProcedure [dbo].[sproc_GetSchools]    Script Date: 09/25/2018 17:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
=============================================
Author:			Scott Rushing
Create date:	10/16/16
Description:	Get school names.
=============================================
*/
CREATE PROCEDURE [dbo].[sproc_GetSchools]
AS
BEGIN
	SELECT Name, id FROM Schools
END
GO
/****** Object:  StoredProcedure [dbo].[sproc_GetSchoolInfo]    Script Date: 09/25/2018 17:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
=============================================
Author:			Scott Rushing
Create date:	11/13/16
Description:	Get school info.
=============================================
*/
CREATE PROCEDURE [dbo].[sproc_GetSchoolInfo]
	@schoolId INT
AS
BEGIN
	SELECT 
		Name
		, Website
	FROM Schools s
	WHERE s.id = @schoolId
END
GO
/****** Object:  StoredProcedure [dbo].[sproc_GetResourceInfo]    Script Date: 09/25/2018 17:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
=============================================
Author:			Scott Rushing
Create date:	11/25/16
Description:	Get resource data for member id.
=============================================
*/
CREATE PROCEDURE [dbo].[sproc_GetResourceInfo]
	@memberId INT
AS
BEGIN
	SELECT
		Position
		, URL
		, SupvName 
		, SupvPosition
		, SupvEmail
		, SupvPhone
		, SupvURL
		, s.Name AS School_Name
		, s.Website AS School_Website
		FROM ResourceInfo
			INNER JOIN Schools s ON s.id = SchoolId
		WHERE MemberId = @memberId
	
END
GO
/****** Object:  StoredProcedure [dbo].[sproc_GetRecipientsAwaitingApproval]    Script Date: 09/25/2018 17:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
=============================================
Author:			Scott Rushing
Create date:	10/22/16
Description:	Get waiting recipient info.
=============================================
*/
CREATE PROCEDURE [dbo].[sproc_GetRecipientsAwaitingApproval]
	@resourceId			INT
AS
BEGIN
	SELECT 
		pinf.MemberId AS id
		, pinf.FirstName + ' ' + pinf.LastName AS Name
		, rr.CreatedOn
	FROM ResourceRecipients rr
		INNER JOIN PersonalInfo pinf ON pinf.MemberId = rr.RecipientId
	WHERE ResourceId = @resourceId AND ApprovedOn IS NULL
END
GO
/****** Object:  StoredProcedure [dbo].[sproc_GetRawPassword]    Script Date: 09/25/2018 17:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
=============================================
Author:			Scott Rushing
Create date:	10/8/16
Description:	Get the encrypted password.
=============================================
*/
CREATE PROCEDURE [dbo].[sproc_GetRawPassword]
	@userName VARCHAR(100) 
	, @returnString VARCHAR(50) OUTPUT
AS
BEGIN
	SET @returnString = (SELECT password FROM Members WHERE UserName = @userName)
END
GO
/****** Object:  StoredProcedure [dbo].[sproc_GetProfileLists]    Script Date: 09/25/2018 17:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
=============================================
Author:			Scott Rushing
Create date:	10/8/16
Description:	Get all profile list values (hobbies, interests, etc.).
=============================================
*/
CREATE PROCEDURE [dbo].[sproc_GetProfileLists]
	@memberType INT
AS
BEGIN
	-- datatable 0
	SELECT Description, id FROM Interests ORDER BY Description
	-- datatable 1
	SELECT Description, id FROM Hobbies ORDER BY Description
	-- datatable 2
	SELECT Name, id FROM Schools ORDER BY Name
	-- datatable 3
	SELECT Description, id FROM Reasons WHERE MemberType = @memberType ORDER BY Description
	-- datatable 4
	SELECT Name, id FROM Ethnicities ORDER BY Description
	-- datatable 5
	SELECT Description, id FROM Degrees ORDER BY Description
	-- datatable 6
	SELECT Description, id FROM Majors ORDER BY Description
	-- datatable 7
	SELECT Description, id FROM FundingSources ORDER BY Description
END
GO
/****** Object:  StoredProcedure [dbo].[sproc_GetMemberTypeAndId]    Script Date: 09/25/2018 17:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
=============================================
Author:			Scott Rushing
Create date:	10/8/16
Description:	Get the member type.
Edited
				10/16/16 : SR : Added return of Id.
=============================================
*/
CREATE PROCEDURE [dbo].[sproc_GetMemberTypeAndId]
	@userName VARCHAR(100) 
	, @memberType INT OUTPUT
	, @memberId INT OUTPUT
AS
BEGIN
	SET @memberType = (SELECT MemberType FROM Members WHERE UserName = @userName)
	SET @memberId = (SELECT id FROM Members WHERE UserName = @userName)
END
GO
/****** Object:  StoredProcedure [dbo].[sproc_GetMemberType]    Script Date: 09/25/2018 17:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
=============================================
Author:			Scott Rushing
Create date:	10/18/16
Description:	Get the member type from member id.
=============================================
*/
CREATE PROCEDURE [dbo].[sproc_GetMemberType]
	@memberId INT
	, @returnValue INT OUTPUT
AS
BEGIN
	SET @returnValue = (SELECT MemberType FROM Members WHERE id = @memberId)
END
GO
/****** Object:  StoredProcedure [dbo].[sproc_GetMemberData]    Script Date: 09/25/2018 17:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
=============================================
Author:			Scott Rushing
Create date:	10/17/16
Description:	Get member data.
=============================================
*/
CREATE PROCEDURE [dbo].[sproc_GetMemberData]
	@memberId INT
AS
BEGIN
	-- recipient type, id, and name, last blog post, last profile edit, current donations, current disbursements
	DECLARE @memberType INT
	SET @memberType = (SELECT MemberType FROM dbo.Members WHERE id = @memberId)
	DECLARE @recipientsOrDonors TABLE (id INT)
	
	IF @memberType = 1
		BEGIN
			INSERT INTO @recipientsOrDonors
				SELECT DISTINCT RecipientId FROM Donations WHERE DonorId = @memberId
				
			SELECT 
				mT.Type
				, m.id
				, pinf.FirstName + ' ' + pinf.LastName AS Name
				, dbo.fn_GetMyRecipientInfo(5, m.id) AS [Last Blog Post]
				, pinf.EditedOn AS [Last Profile Edit]
				, dbo.fn_GetMyRecipientInfo(2, m.id) AS Donations
				, dbo.fn_GetMyRecipientInfo(1, m.id) AS Disbursements
				, dbo.fn_GetMyRecipientInfo(4, m.id) AS [Held For Balance]
				, dbo.fn_GetMyRecipientInfo(3, m.id) AS [Held For Date]
				FROM Members m
					INNER JOIN PersonalInfo pinf ON m.id = pinf.MemberId
					INNER JOIN MemberTypes mT ON m.MemberType = mT.Id
			WHERE m.id IN (SELECT id FROM @recipientsOrDonors)

			SELECT pinf.MemberId
				, pinf.FirstName + ' ' + pinf.LastName AS [Donated To]
				, don.CreatedOn AS [Donated On], Amount,  
				HoldForBalance, HoldForDate, DisbursedOn AS [Disbursed On]
			FROM Donations don
				INNER JOIN PersonalInfo pinf ON pinf.MemberId = don.RecipientId
			WHERE DonorId = @memberId	
			ORDER BY don.CreatedOn DESC, [Donated To]
			
			SELECT SUM(Amount) AS [Total Donations] 
			FROM Donations don
			WHERE DonorId = @memberId
			
			SELECT SUM(Amount) AS [Total Disbursements]
			FROM Donations don
			WHERE don.DonorId = @memberId AND DisbursedOn IS NOT NULL		
		END
	ELSE IF @memberType = 2
		BEGIN
			SELECT 
				m.id
				,pinf.FirstName + ' ' + pinf.LastName AS [Donor Name]
				, don.Amount
				, don.CreatedOn
				, don.HoldForDate
				, don.HoldForBalance
				, don.DisbursedOn
			FROM Donations don	
				INNER JOIN PersonalInfo pinf ON pinf.MemberId = don.DonorId
				INNER JOIN Members m ON m.id = don.DonorId
			WHERE RecipientId = @memberId
			
			SELECT SUM(Amount) AS [Total Donations] 
			FROM Donations don
			WHERE RecipientId = @memberId		
			
			SELECT SUM(Amount) AS [Total Disbursements]
			FROM Donations don
			WHERE don.RecipientId = @memberId AND DisbursedOn IS NOT NULL					
			
		END
END
GO
/****** Object:  StoredProcedure [dbo].[EditScene]    Script Date: 09/25/2018 17:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JSR
-- Create date: 11/26/17
-- Description:	Edit Scene.
-- =============================================
CREATE PROCEDURE [dbo].[EditScene] 
	@sceneId INT
	, @seasonNumber VARCHAR(1)
	, @episodeNumber VARCHAR(2)
	, @locationId VARCHAR(4)
	, @timeStamp VARCHAR(6)
	, @timeStampAsDecimal DECIMAL(18,2)
	, @description VARCHAR(4000)
	, @characters VARCHAR(1000) = NULL
	, @keywords VARCHAR(1000) = NULL
	, @returnValue TINYINT OUTPUT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			SET @returnValue = 1
			DELETE FROM Scenes WHERE Id = @sceneId
			DELETE FROM CharacterSceneXref WHERE SceneId = @sceneId
			DELETE FROM KeywordSceneXref WHERE SceneId = @sceneId
			
			DECLARE @editDate DATETIME = GETDATE()
			EXEC dbo.AddScene
				@seasonNumber, @episodeNumber, @locationId
				, @timeStamp, @timeStampAsDecimal, @description
				, @characters, @keywords, @editDate, @returnValue
				
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		SET @returnValue = 0
	END CATCH
END
GO
/****** Object:  Default [DF_Ethnicities_CreatedBy]    Script Date: 09/25/2018 17:51:41 ******/
ALTER TABLE [dbo].[Ethnicities] ADD  CONSTRAINT [DF_Ethnicities_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
/****** Object:  Default [DF_EmailsToSend_CreatedOn]    Script Date: 09/25/2018 17:51:41 ******/
ALTER TABLE [dbo].[EmailsToSend] ADD  CONSTRAINT [DF_EmailsToSend_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  Default [DF_FundingSources_CreatedBy]    Script Date: 09/25/2018 17:51:41 ******/
ALTER TABLE [dbo].[FundingSources] ADD  CONSTRAINT [DF_FundingSources_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
/****** Object:  Default [DF_Donations_Amount]    Script Date: 09/25/2018 17:51:42 ******/
ALTER TABLE [dbo].[Donations] ADD  CONSTRAINT [DF_Donations_Amount]  DEFAULT ((0)) FOR [Amount]
GO
/****** Object:  Default [DF_Donations_CreatedOn]    Script Date: 09/25/2018 17:51:42 ******/
ALTER TABLE [dbo].[Donations] ADD  CONSTRAINT [DF_Donations_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  Default [DF_Degrees_CreatedBy]    Script Date: 09/25/2018 17:51:42 ******/
ALTER TABLE [dbo].[Degrees] ADD  CONSTRAINT [DF_Degrees_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
/****** Object:  Default [DF_Classes_CreatedOn]    Script Date: 09/25/2018 17:51:42 ******/
ALTER TABLE [dbo].[Classes] ADD  CONSTRAINT [DF_Classes_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  Default [DF_Characters_CreatedOn]    Script Date: 09/25/2018 17:51:42 ******/
ALTER TABLE [dbo].[Characters] ADD  CONSTRAINT [DF_Characters_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  Default [DF_Characters_CreatedBy]    Script Date: 09/25/2018 17:51:42 ******/
ALTER TABLE [dbo].[Characters] ADD  CONSTRAINT [DF_Characters_CreatedBy]  DEFAULT ('unknown') FOR [CreatedBy]
GO
/****** Object:  Default [DF_Characters_EditedBy]    Script Date: 09/25/2018 17:51:42 ******/
ALTER TABLE [dbo].[Characters] ADD  CONSTRAINT [DF_Characters_EditedBy]  DEFAULT ('unknown') FOR [EditedBy]
GO
/****** Object:  Default [DF_BlogPosts_CreatedOn]    Script Date: 09/25/2018 17:51:42 ******/
ALTER TABLE [dbo].[BlogPosts] ADD  CONSTRAINT [DF_BlogPosts_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  Default [DF_BlogPosts_IsPublic]    Script Date: 09/25/2018 17:51:42 ******/
ALTER TABLE [dbo].[BlogPosts] ADD  CONSTRAINT [DF_BlogPosts_IsPublic]  DEFAULT ((0)) FOR [IsPublic]
GO
/****** Object:  Default [DF_Schools_CreatedOn]    Script Date: 09/25/2018 17:51:42 ******/
ALTER TABLE [dbo].[Schools] ADD  CONSTRAINT [DF_Schools_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  Default [DF_Scenes_LocationId]    Script Date: 09/25/2018 17:51:42 ******/
ALTER TABLE [dbo].[Scenes] ADD  CONSTRAINT [DF_Scenes_LocationId]  DEFAULT ((-1)) FOR [LocationId]
GO
/****** Object:  Default [DF_Scenes_Timestamp]    Script Date: 09/25/2018 17:51:42 ******/
ALTER TABLE [dbo].[Scenes] ADD  CONSTRAINT [DF_Scenes_Timestamp]  DEFAULT ('0:00:00') FOR [Timestamp]
GO
/****** Object:  Default [DF_Scenes_CreatedOn]    Script Date: 09/25/2018 17:51:42 ******/
ALTER TABLE [dbo].[Scenes] ADD  CONSTRAINT [DF_Scenes_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  Default [DF_Scenes_CreatedBy]    Script Date: 09/25/2018 17:51:42 ******/
ALTER TABLE [dbo].[Scenes] ADD  CONSTRAINT [DF_Scenes_CreatedBy]  DEFAULT ('unknown') FOR [CreatedBy]
GO
/****** Object:  Default [DF_Scenes_EditedBy]    Script Date: 09/25/2018 17:51:42 ******/
ALTER TABLE [dbo].[Scenes] ADD  CONSTRAINT [DF_Scenes_EditedBy]  DEFAULT ('unknown') FOR [EditedBy]
GO
/****** Object:  Default [DF_ResourceRecipients_CreatedOn]    Script Date: 09/25/2018 17:51:42 ******/
ALTER TABLE [dbo].[ResourceRecipients] ADD  CONSTRAINT [DF_ResourceRecipients_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  Default [DF_TrustedResources_CreatedOn]    Script Date: 09/25/2018 17:51:42 ******/
ALTER TABLE [dbo].[ResourceInfo] ADD  CONSTRAINT [DF_TrustedResources_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  Default [DF_RecipientPasswordApprovals_CreatedOn]    Script Date: 09/25/2018 17:51:42 ******/
ALTER TABLE [dbo].[RecipientPasswordApprovals] ADD  CONSTRAINT [DF_RecipientPasswordApprovals_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  Default [DF_Reasons_CreatedOn]    Script Date: 09/25/2018 17:51:42 ******/
ALTER TABLE [dbo].[Reasons] ADD  CONSTRAINT [DF_Reasons_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  Default [DF_PersonalInfo_MemberId]    Script Date: 09/25/2018 17:51:42 ******/
ALTER TABLE [dbo].[PersonalInfo] ADD  CONSTRAINT [DF_PersonalInfo_MemberId]  DEFAULT ((-1)) FOR [MemberId]
GO
/****** Object:  Default [DF_PersonalInfo_Telephone1Type]    Script Date: 09/25/2018 17:51:42 ******/
ALTER TABLE [dbo].[PersonalInfo] ADD  CONSTRAINT [DF_PersonalInfo_Telephone1Type]  DEFAULT ((1)) FOR [Telephone1Type]
GO
/****** Object:  Default [DF_PersonalInfo_Telephone2Type]    Script Date: 09/25/2018 17:51:42 ******/
ALTER TABLE [dbo].[PersonalInfo] ADD  CONSTRAINT [DF_PersonalInfo_Telephone2Type]  DEFAULT ((2)) FOR [Telephone2Type]
GO
/****** Object:  Default [DF_PersonalInfo_AllowContact]    Script Date: 09/25/2018 17:51:42 ******/
ALTER TABLE [dbo].[PersonalInfo] ADD  CONSTRAINT [DF_PersonalInfo_AllowContact]  DEFAULT ((0)) FOR [AllowContact]
GO
/****** Object:  Default [DF_PersonalInfo_ShowInPublicSearch]    Script Date: 09/25/2018 17:51:42 ******/
ALTER TABLE [dbo].[PersonalInfo] ADD  CONSTRAINT [DF_PersonalInfo_ShowInPublicSearch]  DEFAULT ((1)) FOR [ShowInPublicSearch]
GO
/****** Object:  Default [DF_PersonalInfo_CreatedOn]    Script Date: 09/25/2018 17:51:42 ******/
ALTER TABLE [dbo].[PersonalInfo] ADD  CONSTRAINT [DF_PersonalInfo_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  Default [DF_Messges_CreatedOn]    Script Date: 09/25/2018 17:51:42 ******/
ALTER TABLE [dbo].[Messages] ADD  CONSTRAINT [DF_Messges_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  Default [DF_Messages_IsPublic]    Script Date: 09/25/2018 17:51:42 ******/
ALTER TABLE [dbo].[Messages] ADD  CONSTRAINT [DF_Messages_IsPublic]  DEFAULT ((0)) FOR [IsPublic]
GO
/****** Object:  Default [DF_MemberSchools_CreatedOn]    Script Date: 09/25/2018 17:51:42 ******/
ALTER TABLE [dbo].[MemberSchools] ADD  CONSTRAINT [DF_MemberSchools_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  Default [DF_Members_CreatedOn]    Script Date: 09/25/2018 17:51:42 ******/
ALTER TABLE [dbo].[Members] ADD  CONSTRAINT [DF_Members_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  Default [DF_Members_IsActive]    Script Date: 09/25/2018 17:51:42 ******/
ALTER TABLE [dbo].[Members] ADD  CONSTRAINT [DF_Members_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_MemberReasons_CreatedOn]    Script Date: 09/25/2018 17:51:42 ******/
ALTER TABLE [dbo].[MemberReasons] ADD  CONSTRAINT [DF_MemberReasons_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  Default [DF_MemberMajors_CreatedOn]    Script Date: 09/25/2018 17:51:42 ******/
ALTER TABLE [dbo].[MemberMajors] ADD  CONSTRAINT [DF_MemberMajors_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  Default [DF_MemberInterests_CreatedOn]    Script Date: 09/25/2018 17:51:42 ******/
ALTER TABLE [dbo].[MemberInterests] ADD  CONSTRAINT [DF_MemberInterests_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  Default [DF_MemberHobbies_CreatedOn]    Script Date: 09/25/2018 17:51:42 ******/
ALTER TABLE [dbo].[MemberHobbies] ADD  CONSTRAINT [DF_MemberHobbies_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  Default [DF_MemberFunding_CreatedOn]    Script Date: 09/25/2018 17:51:42 ******/
ALTER TABLE [dbo].[MemberFunding] ADD  CONSTRAINT [DF_MemberFunding_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  Default [DF_MemberEthnicity_CreatedOn]    Script Date: 09/25/2018 17:51:42 ******/
ALTER TABLE [dbo].[MemberEthnicity] ADD  CONSTRAINT [DF_MemberEthnicity_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  Default [DF_MemberDegrees_CreatedOn]    Script Date: 09/25/2018 17:51:42 ******/
ALTER TABLE [dbo].[MemberDegrees] ADD  CONSTRAINT [DF_MemberDegrees_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  Default [DF_MemberClasses_CreatedOn]    Script Date: 09/25/2018 17:51:42 ******/
ALTER TABLE [dbo].[MemberClasses] ADD  CONSTRAINT [DF_MemberClasses_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  Default [DF_Locations_CreatedOn]    Script Date: 09/25/2018 17:51:42 ******/
ALTER TABLE [dbo].[Locations] ADD  CONSTRAINT [DF_Locations_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  Default [DF_Locations_CreatedBy]    Script Date: 09/25/2018 17:51:42 ******/
ALTER TABLE [dbo].[Locations] ADD  CONSTRAINT [DF_Locations_CreatedBy]  DEFAULT ('unknown') FOR [CreatedBy]
GO
/****** Object:  Default [DF_Locations_EditedBy]    Script Date: 09/25/2018 17:51:42 ******/
ALTER TABLE [dbo].[Locations] ADD  CONSTRAINT [DF_Locations_EditedBy]  DEFAULT ('unknown') FOR [EditedBy]
GO
/****** Object:  Default [DF_Keywords_CreatedOn]    Script Date: 09/25/2018 17:51:42 ******/
ALTER TABLE [dbo].[Keywords] ADD  CONSTRAINT [DF_Keywords_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  Default [DF_HelpTickets_SubmittedOn]    Script Date: 09/25/2018 17:51:42 ******/
ALTER TABLE [dbo].[HelpTickets] ADD  CONSTRAINT [DF_HelpTickets_SubmittedOn]  DEFAULT (getdate()) FOR [SubmittedOn]
GO
