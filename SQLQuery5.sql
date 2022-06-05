CREATE DATABASE BookLibrary4
USE BookLibrary4
GO 
CREATE TABLE Book7(
	BookCode INT NOT NULL,
	CONSTRAINT fk PRIMARY KEY(BookCode),
	BookTitle varchar(100) NOT NULL,
	Author varchar(50) NOT NULL,
	Edition  int ,
	BookPrice money, 
	copies int 
)
CREATE TABLE Member3(
	MemberCode int NOT NULL,
	CONSTRAINT vk PRIMARY KEY(MemberCode),
	Name varchar(50) NOT NULL,
	Address varchar(100) NOT NULL,
	PhoneNumber int
)
GO
INSERT INTO Book7(BookCode,BookTitle,Author,Edition,BookPrice,copies)
VALUES(10,'doreamon','OngnguoiJAP',8,22000,4)
INSERT INTO Member3(MemberCode,Name,Address,PhoneNumber) VALUES(123,'BCa','JAP',090010000)
GO
SELECT *FROM Book7
SELECT *FROM Member3
GO
CREATE TABLE IssueDetails3(
BookCode int , CONSTRAINT nk FOREIGN KEY(BookCode) REFERENCES Book7(BookCode) ,
MemberCode int , CONSTRAINT ck FOREIGN KEY(MemberCode) REFERENCES Member3(MemberCode),
IssueDate datetime,
ReturnDate datetime 
)
SELECT *FROM IssueDetails3
GO
INSERT INTO IssueDetails3(BookCode,MemberCode,IssueDate,ReturnDate) VALUES(10,123,'06-06-2022','08-06-2022')
GO
ALTER TABLE IssueDetails3
	DROP CONSTRAINT nk
GO
ALTER TABLE Book7
	DROP CONSTRAINT fk
GO
ALTER TABLE Member3
	DROP CONSTRAINT vk
GO
ALTER TABLE IssueDetails3
	ADD CONSTRAINT ck FOREIGN KEY(BookCode) REFERENCES Book7(BookCode)
ALTER TABLE IssueDetails3
	ADD CONSTRAINT xk FOREIGN KEY(MemberCode) REFERENCES Member3(MemberCode)
GO
ALTER TABLE Book7
	ADD CONSTRAINT yk CHECK(BookPrice>0 and BookPrice<23000)
GO 
ALTER TABLE Member3
	ADD CONSTRAINT ok UNIQUE(PhoneNumber)
ALTER TABLE IssueDetails3
	ALTER COLUMN BookCode INT NOT NULL
ALTER TABLE IssueDetails3
	ALTER COLUMN MemberCode INT NOT NULL
GO
ALTER TABLE IssueDetails3
	ADD CONSTRAINT zk PRIMARY KEY (BookCode,MemberCode)
GO

