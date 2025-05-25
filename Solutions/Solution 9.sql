/*----------------------------------------------------
DDL for Puzzle #9
Matching Sets
*/----------------------------------------------------

DROP TABLE IF EXISTS #Employees;
GO

CREATE TABLE #Employees
(
EmployeeID  INTEGER,
License     VARCHAR(100),
PRIMARY KEY (EmployeeID, License)
);
GO

INSERT INTO #Employees (EmployeeID, License) VALUES
(1001,'Class A'),(1001,'Class B'),(1001,'Class C'),
(2002,'Class A'),(2002,'Class B'),(2002,'Class C'),
(3003,'Class A'),(3003,'Class D'),
(4004,'Class A'),(4004,'Class B'),(4004,'Class D'),
(5005,'Class A'),(5005,'Class B'),(5005,'Class D');
GO


;WITH LicenseTable AS 
(
    SELECT EmployeeID
    ,STRING_AGG(License,',') WITHIN GROUP(ORDER BY License) AS Licenses
    ,COUNT(License) AS Count
    FROM #Employees
    GROUP BY EmployeeID
)
SELECT Distinct L1.EmployeeID,L2.EmployeeID,L1.[count]
FROM LicenseTable as L1 
INNER JOIN LicenseTable as L2
ON L1.Licenses = L2.Licenses and L1.[count]= L2.[count]
WHERE L1.EmployeeID <> L2.EmployeeID