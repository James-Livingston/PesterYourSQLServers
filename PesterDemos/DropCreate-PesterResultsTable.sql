USE [Demo0]
GO

/****** Object:  Table [dbo].[PesterResults]    Script Date: 3/22/2018 3:55:49 PM ******/
DROP TABLE [dbo].[PesterResults]
GO

/****** Object:  Table [dbo].[PesterResults]    Script Date: 3/22/2018 3:55:49 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PesterResults](
	[Describe] [varchar](255) NULL,
	[Context] [varchar](255) NULL,
	[Name] [varchar](255) NULL,
	[Result] [varchar](255) NULL,
	[UpdateDate] [datetime] NULL
) ON [PRIMARY]
GO


