/*----------------------------------------------------
DDL for Puzzle #19
Back to the Future
*/----------------------------------------------------

DROP TABLE IF EXISTS #TimePeriods;
GO

CREATE TABLE #TimePeriods
(
StartDate  DATE,
EndDate    DATE,
PRIMARY KEY (StartDate, EndDate)
);
GO

INSERT INTO #TimePeriods (StartDate, EndDate) VALUES
('1/1/2018','1/5/2018'),
('1/3/2018','1/9/2018'),
('1/10/2018','1/11/2018'),
('1/12/2018','1/16/2018'),
('1/15/2018','1/19/2018');
GO


;WITH periods AS (
    SELECT A.StartDate,B.EndDate
    FROM #TimePeriods AS A
    INNER join #TimePeriods AS B 
    ON B.StartDate  BETWEEN A.STARTDATE AND A.ENDDATE
    AND A.StartDate<> B.StartDate AND A.EndDate<>B.EndDate
)
SELECT StartDate,EndDate   FROM periods 
UNION ALL
SELECT StartDate,EndDate FROM #TimePeriods
EXCEPT
SELECT distinct b.*
FROM periods AS A
INNER JOIN #TimePeriods AS B 
ON (A.StartDate <> B.STARTDATE AND A.ENDDATE = B.EndDate) OR 
(A.StartDate = B.STARTDATE AND A.ENDDATE <> B.EndDate)
