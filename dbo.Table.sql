CREATE TABLE [dbo].[UserTable]
(
	[username] NVARCHAR(255) NOT NULL, 
    [password] NVARCHAR(255) NOT NULL, 
    [email] NVARCHAR(255) NOT NULL, 
    [gender] BIT NOT NULL, 
    [region] NVARCHAR(255) NOT NULL, 
    [games] NVARCHAR(255) NOT NULL,
	PRIMARY KEY ([Username])
)
