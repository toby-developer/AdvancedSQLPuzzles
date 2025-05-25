
/*----------------------------------------------------
DDL for Puzzle #11
Permutations
*/----------------------------------------------------

DROP TABLE IF EXISTS #TestCases;
GO

CREATE TABLE #TestCases
(
TestCase  VARCHAR(1) PRIMARY KEY
);
GO

INSERT INTO #TestCases (TestCase) VALUES
('A'),('B'),('C'),('D'),('E');
GO


-- ;WITH CTE AS (
--     SELECT STRING_AGG(testcase,'') AS combination,1 AS position,1 as increment,1 as cnt
--     FROM #TestCases
--     UNION ALL
--     SELECT TRANSLATE(combination,SUBSTRING(combination,position,1)+SUBSTRING(combination,position+increment,1),SUBSTRING(combination,position+increment,1)+SUBSTRING(combination,position,1)) AS combination
--       ,IIF(len(combination)-1=position ,1,position+1) as position
--       ,IIF(cnt%((len(combination)-1)*len(combination))=0,increment+1,increment) AS increment
--       ,cnt+1 as cnt
--     FROM cte as cte
    
-- )
-- select * from cte               

DECLARE @vTotalElements INTEGER = (SELECT COUNT(*) FROM #TestCases);

--Recursion
WITH cte_Permutations (Permutation, Id, Depth)
AS
(
SELECT  CAST(TestCase AS VARCHAR(MAX)),
        CONCAT(CAST(TestCase AS VARCHAR(MAX)),';'),
        1 AS Depth
FROM    #TestCases
UNION ALL
SELECT  CONCAT(a.Permutation,',',b.TestCase),
        CONCAT(a.Id,b.TestCase,';'),
        a.Depth + 1
FROM    cte_Permutations a,
        #TestCases b
WHERE   a.Depth < @vTotalElements AND
        a.Id NOT LIKE CONCAT('%',b.TestCase,';%')
)
SELECT  *
FROM    cte_Permutations
WHERE   Depth = @vTotalElements;
GO