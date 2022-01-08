USE AdventureWorks2019
Go
/***   MODULE 7		***/
--tạo một thủ tục lưu trữ lấy ra toàn bộ nhân viên vào làm theo năm có tham số đầu vào là  một năm
CREATE PROCEDURE sp_DisplayEmployeesHireYear
	@HireYear int
AS
SELECT * FROM HumanResources.Employee
WHERE DATEPART(YY, HireDate)=@hireYear
GO
--để chạy thut tục này cần phải truyền tham số vàp là năm mà nhân viên vào làm
EXECUTE sp_DisplayEmployeesHireYear 1999
GO

--tạo thủ tục lưu trữ điểm số người vào làm trong một năm xác định có tham số đầu vào là một năm 
CREATE PROCEDURE sp_EmployeesHireYearCount
	@HireYear int,
	@Count int OUTput
AS
SELECT @Count=COUNT(*) FROM HumanResources.Employee
WHERE DATEPART(YY, HireDate)=@HireYear
GO

--chạy thut tục lưu trữ cần phải truyền vào 1 tham số đầu vào một tham số đầu ra
DECLARE @Number int
EXECUTE sp_EmployeesHireYearCount 1999, @number OUTPUT
PRINT @Number
Go

--tạo thut tục lưu trữ điểm số người vào làm trong một năm xác định có tham số đầu vào là một năm , hàm tra về số người vào làm năm đó
CREATE PROCEDURE sp_EmployeesHiresYearCount2
	@HireYear int
AS
DECLARE @Count int
SELECT @Count=Count(*) FROM HumanResources.Employee
WHERE DATEPART (YY, HireDate) = @HireYear
RETURN @Count
Go

--chạy thủ tục lưu trữ cần phải truyền vào 1 tham số đầu và lấy về số người làm trong năm đó 
DECLARE @Number int
EXECUTE @Number = sp_EmployeesHiresYearCount2 1999
PRINT @number
Go

--tạo bảng tạm #students
CREATE TABLE #Students
(
	Rollno varchar(6) CONSTRAINT pk_Students PRIMARy KEY,
	FullName nvarchar(100),
	Birthday datetime constraint DF_StudentsBirthday DEFAULT DATEADD (yy, -18, GETDATE())
)

Go

--tạo thủ tục lưu trữ tạm để chèn dữ liệu vào bảng tạm
CREATE PROCEDURE #spInsertStudents
	@rollno varchar(6),
	@fullname varchar(100),
	@birthday datetime
AS BEGIN 
	IF (@birthday IS NULL)
		SET @birthday=DATEADD(YY, -18, GETDATE())
	INSERT INTO #Students(Rollno, FullName, Birthday)
		VALUES(@rollno, @fullname, @birthday)
END
GO

--sử dụng thủ tục lưu trữ để chèn dữ liệu vào bảng tạm
EXEC #spStudents 'A12345', 'abc', NULL
EXEC #spStudents 'A54321', 'abc', '12/24/2011'
SELECT PROCEDURE #spDeleteStudents 
--tạo thủ tục lưu trữ tạm để xoá dữ liệu từ bảng tạm theo rollno
CREATE PROCEDURE #spDeleteStudents
	@rollno varchar(6)
AS BEGIN 
	DELETE FROM #Students WHERE Rollno=rollno
And
--xoá dữ liệu sử dụng thủ tục lưu trữ 
EXECUTE #spDeleteStudents '12345'
GO

--tạo một thủ tục lưu trữ sử dụng lệnh RETURN dể trả về một số nguyên
CREATE PROCEDURE Cal_Spuare 2num int = 0 AS
BEGIN 
	RETURN (@num * @num);
end
Go

--chạy thủ tục lưu trữ
DECLARE @square int;
EXEC @square = Cal_Square 10;
PRINT @square
GO


/***	MODULE8		***/
--xem định nghĩa lưu trữ bằng hàm OBJECT_DEFINITION

