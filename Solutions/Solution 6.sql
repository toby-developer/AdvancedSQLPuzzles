
/*----------------------------------------------------
DDL for Puzzle #6
Workflow Steps
*/----------------------------------------------------

DROP TABLE IF EXISTS #WorkflowSteps;
GO

CREATE TABLE #WorkflowSteps
(
Workflow        VARCHAR(100),
StepNumber      INTEGER,
CompletionDate  DATE NULL,
PRIMARY KEY (Workflow, StepNumber)
);
GO

INSERT INTO #WorkflowSteps (Workflow, StepNumber, CompletionDate) VALUES
('Alpha',1,'7/2/2018'),('Alpha',2,'7/2/2018'),('Alpha',3,'7/1/2018'),
('Bravo',1,'6/25/2018'),('Bravo',2,NULL),('Bravo',3,'6/27/2018'),
('Charlie',1,NULL),('Charlie',2,'7/1/2018');
GO

SELECT Workflow FROM #WorkflowSteps
WHERE CompletionDate IS NOT NULL
INTERSECT
SELECT Workflow FROM #WorkflowSteps
WHERE CompletionDate IS NULL


SELECT WORKFLOW
FROM #WorkflowSteps
GROUP BY Workflow
HAVING COUNT(CASE WHEN CompletionDate IS NOT NULL THEN 1 END) <> COUNT(StepNumber) 

