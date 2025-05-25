/*----------------------------------------------------
DDL for Puzzle #8
Workflow Cases
*/----------------------------------------------------

DROP TABLE IF EXISTS #WorkflowCases;
GO

CREATE TABLE #WorkflowCases
(
    Workflow  VARCHAR(100) PRIMARY KEY,
    Case1     INTEGER NOT NULL DEFAULT 0,
    Case2     INTEGER NOT NULL DEFAULT 0,
    Case3     INTEGER NOT NULL DEFAULT 0
);
GO

INSERT INTO #WorkflowCases (Workflow, Case1, Case2, Case3) VALUES
('Alpha',0,0,0),('Bravo',0,1,1),('Charlie',1,0,0),('Delta',0,0,0);
GO


SELECT * FROM #WorkflowCases

SELECT Workflow,Case1+Case2+Case3 AS PASSED FROM #WorkflowCases
