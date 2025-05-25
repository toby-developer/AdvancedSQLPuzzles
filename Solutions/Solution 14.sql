
/*----------------------------------------------------
DDL for Puzzle #14
Indeterminate Process Log
*/----------------------------------------------------

DROP TABLE IF EXISTS #ProcessLog;
GO

CREATE TABLE #ProcessLog
(
    Workflow VARCHAR(100),
    StepNumber INTEGER,
    RunStatus VARCHAR(100) NOT NULL,
    PRIMARY KEY (Workflow, StepNumber)
);
GO

INSERT INTO #ProcessLog
    (Workflow, StepNumber, RunStatus)
VALUES
    ('Alpha', 1, 'Error'),
    ('Alpha', 2, 'Complete'),
    ('Alpha', 3, 'Running'),
    ('Bravo', 1, 'Complete'),
    ('Bravo', 2, 'Complete'),
    ('Charlie', 1, 'Running'),
    ('Charlie', 2, 'Running'),
    ('Delta', 1, 'Error'),
    ('Delta', 2, 'Error'),
    ('Echo', 1, 'Running'),
    ('Echo', 2, 'Complete');
GO

;WITH distinct_status
AS (
	SELECT DISTINCT Workflow, RunStatus AS STATUS
	FROM #processlog
	WHERE workflow IN (
			SELECT workflow
			FROM #ProcessLog
			GROUP BY Workflow
			HAVING count(DISTINCT RunStatus) = 1
			)
	), indeterminate_status
AS (
	SELECT DISTINCT Workflow, 'Indeterminate' AS STATUS
	FROM #processlog
	WHERE workflow IN (
			SELECT DISTINCT workflow
			FROM #ProcessLog
			GROUP BY Workflow
			HAVING count(DISTINCT RunStatus) > 1
			
			INTERSECT
			
			SELECT DISTINCT Workflow
			FROM #ProcessLog
			WHERE Runstatus = 'Error'
			)
	), running_status
AS (
	SELECT DISTINCT workflow, 'Running' AS STATUS
	FROM #ProcessLog
	WHERE RunStatus = 'Complete'
	
	INTERSECT
	
	SELECT DISTINCT workflow, 'Running' AS STATUS
	FROM #ProcessLog
	WHERE RunStatus = 'Running'
	
	EXCEPT
	
	SELECT DISTINCT workflow, 'Running' AS STATUS
	FROM #ProcessLog
	WHERE RunStatus = 'Error'
	)
SELECT workflow, STATUS FROM distinct_status
UNION
SELECT workflow, STATUS FROM indeterminate_status
UNION
SELECT workflow, STATUS FROM running_status
