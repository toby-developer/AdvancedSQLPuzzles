
/*----------------------------------------------------
DDL for Puzzle #15
Group Concatenation
*/----------------------------------------------------

DROP TABLE IF EXISTS #DMLTable;
GO

CREATE TABLE #DMLTable
(
SequenceNumber  INTEGER PRIMARY KEY,
String          VARCHAR(100) NOT NULL
);
GO

INSERT INTO #DMLTable (SequenceNumber, String) VALUES
(1,'SELECT'),
(2,'Product,'),
(3,'UnitPrice,'),
(4,'EffectiveDate'),
(5,'FROM'),
(6,'Products'),
(7,'WHERE'),
(8,'UnitPrice'),
(9,'> 100');
GO

select string_agg(string,' ')within group(order by sequenceNumber) from #DMLTable
