
/*----------------------------------------------------
DDL for Puzzle #12
Average Days
*/----------------------------------------------------

DROP TABLE IF EXISTS #ProcessLog;
GO

CREATE TABLE #ProcessLog
(
    WorkFlow VARCHAR(100),
    ExecutionDate DATE,
    PRIMARY KEY (WorkFlow, ExecutionDate)
);
GO

INSERT INTO #ProcessLog
    (WorkFlow, ExecutionDate)
VALUES
    ('Alpha', '6/01/2018'),
    ('Alpha', '6/14/2018'),
    ('Alpha', '6/15/2018'),
    ('Bravo', '6/1/2018'),
    ('Bravo', '6/2/2018'),
    ('Bravo', '6/19/2018'),
    ('Charlie', '6/1/2018'),
    ('Charlie', '6/15/2018'),
    ('Charlie', '6/30/2018');
GO

SELECT workflow, avg(diff) AS AverageDays
FROM (
    SELECT Workflow
    , ExecutionDate
    , DATEDIFF(day,ExecutionDate,LEAD(ExecutionDate,1)OVER( partition by workflow ORDER BY (select null))) AS DIFF
    FROM #ProcessLog
) DiffTable
GROUP BY WorkFlow