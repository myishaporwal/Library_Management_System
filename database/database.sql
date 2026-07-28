/* Novella Library Management - SQL Server database logic */
CREATE DATABASE NovellaLibrary;
GO
USE NovellaLibrary;
GO

CREATE TABLE dbo.Users (
    UserId INT IDENTITY(1,1) CONSTRAINT PK_Users PRIMARY KEY,
    Username NVARCHAR(50) NOT NULL CONSTRAINT UQ_Users_Username UNIQUE,
    PasswordHash NVARCHAR(255) NOT NULL,
    Role NVARCHAR(20) NOT NULL CONSTRAINT CK_Users_Role CHECK (Role IN ('Admin','Librarian')),
    IsActive BIT NOT NULL CONSTRAINT DF_Users_IsActive DEFAULT 1,
    CreatedAt DATETIME2 NOT NULL CONSTRAINT DF_Users_CreatedAt DEFAULT SYSUTCDATETIME()
);

CREATE TABLE dbo.Students (
    StudentId INT IDENTITY(1,1) CONSTRAINT PK_Students PRIMARY KEY,
    StudentName NVARCHAR(120) NOT NULL,
    Email NVARCHAR(160) NOT NULL CONSTRAINT UQ_Students_Email UNIQUE,
    Phone NVARCHAR(25) NULL,
    IsActive BIT NOT NULL CONSTRAINT DF_Students_IsActive DEFAULT 1,
    CreatedAt DATETIME2 NOT NULL CONSTRAINT DF_Students_CreatedAt DEFAULT SYSUTCDATETIME()
);

CREATE TABLE dbo.Librarians (
    LibrarianId INT IDENTITY(1,1) CONSTRAINT PK_Librarians PRIMARY KEY,
    UserId INT NULL CONSTRAINT UQ_Librarians_User UNIQUE,
    Name NVARCHAR(120) NOT NULL,
    Phone NVARCHAR(25) NULL,
    CONSTRAINT FK_Librarians_Users FOREIGN KEY (UserId) REFERENCES dbo.Users(UserId)
);

CREATE TABLE dbo.Books (
    BookId INT IDENTITY(1,1) CONSTRAINT PK_Books PRIMARY KEY,
    Title NVARCHAR(200) NOT NULL,
    Author NVARCHAR(160) NOT NULL,
    ISBN CHAR(13) NOT NULL CONSTRAINT UQ_Books_ISBN UNIQUE,
    PublishedDate DATE NOT NULL,
    TotalCopies INT NOT NULL CONSTRAINT DF_Books_TotalCopies DEFAULT 1,
    AvailableCopies INT NOT NULL CONSTRAINT DF_Books_AvailableCopies DEFAULT 1,
    CreatedAt DATETIME2 NOT NULL CONSTRAINT DF_Books_CreatedAt DEFAULT SYSUTCDATETIME(),
    CONSTRAINT CK_Books_Copies CHECK (TotalCopies > 0 AND AvailableCopies BETWEEN 0 AND TotalCopies)
);

CREATE TABLE dbo.Loans (
    LoanId INT IDENTITY(1,1) CONSTRAINT PK_Loans PRIMARY KEY,
    BookId INT NOT NULL,
    StudentId INT NOT NULL,
    IssuedByLibrarianId INT NULL,
    BorrowedAt DATETIME2 NOT NULL CONSTRAINT DF_Loans_BorrowedAt DEFAULT SYSUTCDATETIME(),
    DueDate DATE NOT NULL,
    ReturnedAt DATETIME2 NULL,
    Notes NVARCHAR(500) NULL,
    CONSTRAINT FK_Loans_Books FOREIGN KEY (BookId) REFERENCES dbo.Books(BookId),
    CONSTRAINT FK_Loans_Students FOREIGN KEY (StudentId) REFERENCES dbo.Students(StudentId),
    CONSTRAINT FK_Loans_Librarians FOREIGN KEY (IssuedByLibrarianId) REFERENCES dbo.Librarians(LibrarianId),
    CONSTRAINT CK_Loans_DueDate CHECK (DueDate >= CAST(BorrowedAt AS DATE))
);

CREATE TABLE dbo.Periodicals (
    PeriodicalId INT IDENTITY(1,1) CONSTRAINT PK_Periodicals PRIMARY KEY,
    Title NVARCHAR(160) NOT NULL,
    Category NVARCHAR(30) NOT NULL CONSTRAINT CK_Periodicals_Category CHECK (Category IN ('Magazine','Newspaper','Journal')),
    IssueLabel NVARCHAR(80) NOT NULL,
    PublishedDate DATE NOT NULL,
    IsAvailable BIT NOT NULL CONSTRAINT DF_Periodicals_IsAvailable DEFAULT 1
);
GO

CREATE INDEX IX_Books_Title_Author ON dbo.Books(Title, Author);
CREATE INDEX IX_Loans_Student_Open ON dbo.Loans(StudentId, ReturnedAt) INCLUDE (BookId, DueDate);
CREATE INDEX IX_Loans_DueDate_Open ON dbo.Loans(DueDate) WHERE ReturnedAt IS NULL;
GO

CREATE OR ALTER PROCEDURE dbo.BorrowBook
    @BookId INT, @StudentId INT, @DueDate DATE, @LibrarianId INT = NULL
AS
BEGIN
    SET NOCOUNT ON; SET XACT_ABORT ON;
    BEGIN TRANSACTION;
    UPDATE dbo.Books WITH (UPDLOCK, ROWLOCK)
    SET AvailableCopies = AvailableCopies - 1
    WHERE BookId = @BookId AND AvailableCopies > 0;
    IF @@ROWCOUNT = 0
    BEGIN ROLLBACK; THROW 50001, 'This book is unavailable or does not exist.', 1; END;
    INSERT dbo.Loans(BookId, StudentId, IssuedByLibrarianId, DueDate)
    VALUES(@BookId, @StudentId, @LibrarianId, @DueDate);
    COMMIT;
END;
GO

CREATE OR ALTER PROCEDURE dbo.ReturnBook @LoanId INT
AS
BEGIN
    SET NOCOUNT ON; SET XACT_ABORT ON;
    BEGIN TRANSACTION;
    DECLARE @BookId INT;
    SELECT @BookId = BookId FROM dbo.Loans WITH (UPDLOCK) WHERE LoanId = @LoanId AND ReturnedAt IS NULL;
    IF @BookId IS NULL BEGIN ROLLBACK; THROW 50002, 'Open loan not found.', 1; END;
    UPDATE dbo.Loans SET ReturnedAt = SYSUTCDATETIME() WHERE LoanId = @LoanId;
    UPDATE dbo.Books SET AvailableCopies = AvailableCopies + 1 WHERE BookId = @BookId;
    COMMIT;
END;
GO

INSERT dbo.Periodicals(Title,Category,IssueLabel,PublishedDate) VALUES
('The Reader','Magazine','July 2026','2026-07-01'),
('Monocle','Magazine','Issue 48','2026-07-01'),
('The Daily','Newspaper','Weekend edition','2026-07-26'),
('Architecture Now','Journal','Volume 12','2026-07-15');
