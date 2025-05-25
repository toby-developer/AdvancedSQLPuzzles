/*----------------------------------------------------
DDL for Puzzle #17
De-Grouping
*/----------------------------------------------------

DROP TABLE IF EXISTS #Ungroup;
GO

CREATE TABLE #Ungroup
(
ProductDescription  VARCHAR(100) PRIMARY KEY,
Quantity            INTEGER NOT NULL
);
GO

INSERT INTO #Ungroup (ProductDescription, Quantity) VALUES
('Pencil',3),('Eraser',4),('Notebook',2);
GO

;WITH cte as (
    SELECT ProductDescription,Quantity,1 as i FROM #UNGROUP
    UNION ALL
    SELECT ProductDescription,Quantity,i+1 as i FROM CTE
    WHERE Quantity>i
)

select ProductDescription,1 AS Quantity from CTE
order by ProductDescription,i,Quantity