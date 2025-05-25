/*----------------------------------------------------
DDL for Puzzle #5
Phone Directory
*/----------------------------------------------------

DROP TABLE IF EXISTS #PhoneDirectory;
GO

CREATE TABLE #PhoneDirectory
(
CustomerID   INTEGER,
[Type]       VARCHAR(100),
PhoneNumber  VARCHAR(12) NOT NULL,
PRIMARY KEY (CustomerID, [Type])
);
GO

INSERT INTO #PhoneDirectory (CustomerID, [Type], PhoneNumber) VALUES
(1001,'Cellular','555-897-5421'),
(1001,'Work','555-897-6542'),
(1001,'Home','555-698-9874'),
(2002,'Cellular','555-963-6544'),
(2002,'Work','555-812-9856'),
(3003,'Cellular','555-987-6541');
GO

SELECT * FROM #PhoneDirectory

SELECT CustomerID
	,MAX(CASE WHEN [Type]='Cellular' Then PhoneNumber END)	AS Cellular
	,MAX(CASE WHEN [Type]='Work' Then PhoneNumber END)		AS Work
	,MAX(CASE WHEN [Type]='Home' Then PhoneNumber END)		AS Home
FROM #PhoneDirectory
GROUP BY CustomerID



--SELECT * 
--FROM (
--SELECT CustomerID,PhoneNumber
--FROM #PhoneDirectory
--) AS SourceTable
--PIVOT (
--	MAX(PhoneNumber) For CustomerID IN ([Cellular],[Work],[Home] )
--) AS PivotTable
------ Pivot table with one row and five columns
----SELECT 'AverageCost' AS CostSortedByProductionDays,
----    [0], [1], [2], [3], [4]
----FROM (
----    SELECT DaysToManufacture,
----        StandardCost
----    FROM Production.Product
----) AS SourceTable
----PIVOT (
----    AVG(StandardCost) FOR DaysToManufacture IN
----    ([0], [1], [2], [3], [4])
----) AS PivotTable;