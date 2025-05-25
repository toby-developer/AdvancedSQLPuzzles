
/*----------------------------------------------------
DDL for Puzzle #16
Reciprocals
*/----------------------------------------------------

DROP TABLE IF EXISTS #PlayerScores;
GO

CREATE TABLE #PlayerScores
(
PlayerA  INTEGER,
PlayerB  INTEGER,
Score    INTEGER NOT NULL,
PRIMARY KEY (PlayerA, PlayerB)
);
GO

INSERT INTO #PlayerScores (PlayerA, PlayerB, Score) VALUES
(1001,2002,150),(3003,4004,15),(4004,3003,125);
GO

select playerA,playerB,SUM(score) score from (
select  
    IIF(playerA<playerB,playerA,PlayerB) playerA 
    ,IIF(playerA<playerB,playerB,PlayerA) playerB 
    ,score 
from #PlayerScores
) reorder
GROUP by playera,playerb