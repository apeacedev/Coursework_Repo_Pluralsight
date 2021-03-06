CREATE TABLE [dbo].[Votes](
	[VoteId] [int] IDENTITY(1,1) NOT NULL,
	[ReviewId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[UpVote] [bit] NOT NULL,
	[AddedBy] [int] NOT NULL,
	[AddedWhen] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedWhen] [datetime] NOT NULL,
	[IsApproved] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Votes] PRIMARY KEY CLUSTERED 
(
	[VoteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Votes] ADD  CONSTRAINT [DF_Votes_UpVote]  DEFAULT ((1)) FOR [UpVote]
GO
ALTER TABLE [dbo].[Votes] ADD  CONSTRAINT [DF_Votes_AddedWhen]  DEFAULT (getutcdate()) FOR [AddedWhen]
GO
ALTER TABLE [dbo].[Votes] ADD  CONSTRAINT [DF_Votes_UpdatedWhen]  DEFAULT (getutcdate()) FOR [UpdatedWhen]
GO
ALTER TABLE [dbo].[Votes] ADD  CONSTRAINT [DF_Votes_IsApproved]  DEFAULT ((1)) FOR [IsApproved]
GO
ALTER TABLE [dbo].[Votes] ADD  CONSTRAINT [DF_Votes_IsActive_1]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Votes]  WITH CHECK ADD  CONSTRAINT [FK_Votes_Reviews] FOREIGN KEY([ReviewId])
REFERENCES [dbo].[Reviews] ([ReviewId])
GO
ALTER TABLE [dbo].[Votes] CHECK CONSTRAINT [FK_Votes_Reviews]
GO
ALTER TABLE [dbo].[Votes]  WITH CHECK ADD  CONSTRAINT [FK_Votes_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Votes] CHECK CONSTRAINT [FK_Votes_Users]
GO
