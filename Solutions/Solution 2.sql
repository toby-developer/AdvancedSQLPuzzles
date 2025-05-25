/*----------------------------------------------------
DDL for Puzzle #2
Managers and Employees
*/----------------------------------------------------


DROP TABLE IF EXISTS #Employees;
GO

CREATE TABLE #Employees
(
EmployeeID  INTEGER PRIMARY KEY,
ManagerID   INTEGER NULL,
JobTitle    VARCHAR(100) NOT NULL
);
GO

INSERT INTO #Employees (EmployeeID, ManagerID, JobTitle) VALUES
(1001,NULL,'President'),(2002,1001,'Director'),
(3003,1001,'Office Manager'),(4004,2002,'Engineer'),
(5005,2002,'Engineer'),(6006,2002,'Engineer');
GO

;WITH CTE AS (
	SELECT e.EmployeeID,e.ManagerID,e.JobTitle, 0 AS Depth
	FROM #Employees e
	WHERE ManagerID IS NULL

	UNION ALL

	SELECT e.EmployeeID,e.ManagerID,e.JobTitle, c.Depth+1 AS Depth
	FROM #Employees AS e,CTE AS c
	WHERE c.EmployeeID = e.ManagerID
	AND e.ManagerID IS NOT NULL
)
SELECT * from CTE
