

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
	p.Title,
	p.[FirstName],
	p.[MiddleName],
	p.[LastName],
	e.[JobTitle]
FROM [HumanResources].[Employee]e
		INNER JOIN [Person].[Person] p
		ON p.[BusinessEntityID] =e. [BusinessEntityID]

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


