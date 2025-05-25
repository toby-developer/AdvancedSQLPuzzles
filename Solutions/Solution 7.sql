
/*----------------------------------------------------
DDL for Puzzle #7
Mission to Mars
*/----------------------------------------------------

DROP TABLE IF EXISTS #Candidates;
DROP TABLE IF EXISTS #Requirements;
GO

CREATE TABLE #Candidates
(
    CandidateID INTEGER,
    Occupation VARCHAR(100),
    PRIMARY KEY (CandidateID, Occupation)
);
GO

INSERT INTO #Candidates
    (CandidateID, Occupation)
VALUES
    (1001, 'Geologist'),
    (1001, 'Astrogator'),
    (1001, 'Biochemist'),
    (1001, 'Technician'),
    (2002, 'Surgeon'),
    (2002, 'Machinist'),
    (3003, 'Cryologist'),
    (4004, 'Selenologist');
GO

CREATE TABLE #Requirements
(
    Requirement VARCHAR(100) PRIMARY KEY
);
GO

INSERT INTO #Requirements
    (Requirement)
VALUES
    ('Geologist'),
    ('Astrogator'),
    ('Technician');
GO


SELECT *
FROM #Requirements

SELECT *
FROM #Candidates


SELECT DISTINCT CandidateID
FROM #Candidates AS c
INNER JOIN #Requirements AS r
ON  r.Requirement = c.Occupation