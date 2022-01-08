

--vidu1
CREATE VIEW viewProductInfo As
SELECT ProductID, ProductNumber, Name, SafetyStockLevel
FROM Production.Product;
GO

--vidu2
SELECT * from viewProductInfo
Go

--vidu3
CREATE VIEW vwPersonDetails AS
SELECT 
	p.Title
	,p.[FirstName]
	,p.[MiddleName]
	,p.[LastName]
	,e.[JobTitle]
FROM [HumanResources].[Employee] e
		INNER JOIN [Person].[Person] p
		ON p.[BusinessEntityID] =e.[BusinessEntityID]

--vidu4
SELECT * FROM vwPersonDetails

--vidu5
CREATE VIEW vnPersonDetails New
as
SELECT 
	COALESCE(p.Title, '') AS Title,
	p.[FirstName],
	COALESCE (p.MiddleName,'') AS MiddleName,
	p.[LastName],
	e.[JobTitle]
FROM [HumanResources].[Employee] e
	INNER JOIN [Person].[Person] p
	ON p.[BusinessEntityID] = e.[BusinessEntityID]

GO

--vidu6

CREATE VIEW vwSortedPersonDetails AS
SELECT TOP 10 COALESCE(p.Title, ' ') AS Title
,p.[FirstName]
,COALESCE(p.MiddleName, '' ) AS MiddleName
,p.[LastName]
,e.[JobTitle]
FROM [HumanResources].[Employee] e INNER JOIN [Person].[Person] p 
ON p.[BusinessEntityID] = e.[BusinessEntityID] ORDER BY p.FirstName 
GO
--Retrieve records from the view
SELECT * FROM vwSortedPersonDetails

Go


--vidu7
CREATE TABLE Employee_Personal_Details(
EmpID int NOT NULL,
FirstName varchar(30) NOT NULL,
LastName varchar(30) NOT NULL, Address
varchar(30)
)

GO


--vidu8
CREATE TABLE Employee_Salary_Details(
EmpID 
int not null,
Designation varchar(30),
Salary int not null
)
Go

--vidu9
CREATE VIEW vwEMployee_Personal_Details
AS
SELECT e1.EmpID, FirstName, LastName, Designation, Salary
FROM Employee_Personal_Details e1 
JOIN Employee_Personal_Details e2 
ON e1.empID = e2.EmpID 
GO

--vidu10

INSERT vwEMployee_Personal_Details VALUES (2, 'Jack', 'Wilson', 'Sodtware Developer', 1600)
GO


--vidu11

CREATE VIEW vwEmpDetails  AS
SELECT FirstName, Address 
FROM Employee_Personal_Details
GO

--vidu12
INSERT INTO vwEmpDetails VALUES ('Jack','NYC')
GO

--vidu13
CREATE TABLE Product_Details(
ProductID int, ProductName
varchar(30), Rate money
)
GO

--vidu14
CREATE VIEW vwProduct_Details
as
SELECT ProductName, Rate FROM Product_Details
Go

--vidu15
UPDATE vwProduct_Details
SET Rate=3000
WHERE ProductName='DVDWriter'
GO


--vidu16
CREATE VIEW vwProduct_Details AS
SELECT 
ProductName,
Description,
Rate FROM Product_Details
GO


--vidu17
UPDATE vwProduct_Details
SET Descriptionn.WRITE(N'Ex',0,2)
WHERE ProductName='Protable Hard Drive'
GO


--vidu18
DELETE FROM vwCustDetails WHERE CustID ='C004'
Go


--viidu19
ALTER VIEW vwProduct Info AS
SELECT ProductID, ProductNumber, Name, SafetyStookLeel, ReOrderProint
FROM Production.Product;
GO

--vidu20
DROP VIEW vwProduct Info
Go

--vidu21
EXEC sp_helptext vwEmployee_Personal_datails
GO

--vidu22
CREATE VIEW vwProduct_Details AS
SELECT 
ProducName,
AVG(Rate) AS VerageRate FROM 
Product_Details GROUP BY ProductName
GO

--vidu23
CREATE VIEW vwProduct Info AS
SELECT ProductID, ProductNumber, Name, SafetyStockLevel,
ReOrderPoint 
FROM Production.Product
WHere SafetyStockLevel <=1000
WITH CHECK OPTION;
GO

--vidu24
UPDATE vwProductInfo SET SafetystockLevel = 2500
WHERE ProductID = 321
GO

--vidu25
CREATE VIEW vwNEWProductInfo WITH SCHEMABINDING AS
SELECT ProductID, ProductNumber, SafetystockLevel 
FROM Production.Product;
GO

--vidu26
CREATE TABLE Customers
(
CustID int,
CustName varchar(50),
Address varchar(60)
)
GO


--vidu27
CREATE VIEW Custmoers AS
SELECT * FROM Customers
Go

--vidu28
SELECT * FROM vwCustomers
Go

--vidu29
ALTER TABLE Customers ADD Age int 
Go

--vidu30

SELECT * FROM vwCustomers
GO

--vidu31
EXEC sp_Refreshview 'vwCustomers'
GO

--vidu32
ALTER TABLE Production.Product ALTER COLUMN ProductID varchar(7)
Go

--vidu33
EXECUTE xp_fileexist 'c:MyTest.txt'
Go

--vidu34
CREATE PROCEDURE uspGetCustTerritory
AS
SELECT TOP 10 CustmoersID, Custmoers.TerritoryID, Sales.SalesTerritory.Name
FROM Sales.Customer JOIN sales.salesTerritory On Sales.Customer.TerritoryID= Sales.SalesTerritory.TerritoryID
Go

--vidu35
EXEC uspGetCustTerriTory

GO

--vidu36

CREATE PROCEDURE uspGtSales @territoryvarchar(40) AS 
SELECT BusinessEntitylD, B.SalesYTD, B.SalesLastYear FROM Sales.Salesperson A
JOIN Sales.SalesTerritory B
ON A.TerritoryID = B.TerritoryID WHERE
B.Name = @territory;
--Execute the storedprocedure EXEC 
uspGetSales'Northwest'
Go

--vidu37
CREATE PROCEDURE uspGetTotalSales @territory 
varchar (40}, @sum int OUTPUT AS
SELECT @sum=SUM(B.SalesYTD) FROM
Sales.Salesperson A JOIN
Sales.SalesTerritory B
ONA.TerritoryID = B.TerritoryID
WHERE B.Name = @territory 
Go

--vidu38
DECLARE @sumsales money
EXEc uspGetTotalSales'Northwest', @surnsales OUTPUT
PRINT 'The year-to-date sales figure for this territory is ' +convert (varchar (100),
@sumsales)
GO

--vidu39
ALTER PROCEDURE [dbo].[uspGetTotals]
@territory varchar = 40
AS
SELECT BusinessEntityID, B.SalesYTD, B.CostYTD, B.SalesLastYear FROM
Sales.Salesperson A JOIN Sales.SalesTerritory B
ON A. TerritoryID = B.TerritoryID
WHERE B. Name = @territory;
Go

--vidu40
DROP PROCEDURE uspGettotals 
Go

--vidu41
CREATE PROCEDURE NestedProcedure AS BEGIN
EXEC uspGetCustTerritory
EXEC uspGetSales 'France'
END
GO

--vidu42
SELECT name, oBject_id, type, type_desc
FROM sys.table;
Go

--vidu43
SELECT TABLE_CÂTLOG, TABLE_SCHEMA, TABLE_NAME, TABLE_TYPE 
FROM INFORMATION_SCHEMA.TAVLES;
Go

--vidu44
SELECT SERVERPROPERTY('EDITION') aS EditionName;
GO

--vidu45
SELECT session_id, login_time, program_name FROM sys.dm_exec_sessions
WHERE login_name='sa' and is_user_process=1
Go