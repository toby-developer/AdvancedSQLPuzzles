/*----------------------------------------------------
DDL for Puzzle #10
Mean, Median, Mode and Range
*/----------------------------------------------------

DROP TABLE IF EXISTS #SampleData;
GO

CREATE TABLE #SampleData
(
IntegerValue  INTEGER NOT NULL
);
GO

INSERT INTO #SampleData (IntegerValue) VALUES
(5),(6),(10),(10),(13),(14),(17),(20),(81),(90),(76);
GO

-- SELECT * FROM #SampleData


SELECT AVG(IntegerValue) AS Mean FROM #SampleData

;WITH nums AS (SELECT 
    CAST(IntegerValue AS Float) AS IntegerValue
    ,ROW_NUMBER()OVER(ORDER BY IntegerValue ASC) AS RN 
FROM #SampleData)
SELECT AVG(IntegerValue) AS Median 
FROM nums 
WHERE rn  BETWEEN (
    SELECT COUNT(IntegerValue)/2-1 FROM nums
    ) AND (
        SELECT COUNT(IntegerValue)/2 FROM nums
        )

;WITH cnts AS (  
    SELECT  IntegerValue, COUNT(IntegerValue) AS cnt
    FROM #SampleData
    GROUP BY IntegerValue
    ),
    mcnt    AS (
        SELECT MAX(cnt) mcnt FROM cnts)
SELECT IntegerValue AS Mode FROM cnts
 WHERE cnt = (SELECT mcnt FROM mcnt)

 SELECT MAX(IntegerValue) -MIN(IntegerValue) AS [Range] FROM #SampleData