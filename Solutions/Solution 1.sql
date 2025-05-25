
/*----------------------------------------------------
DDL for Puzzle #1
Shopping Carts
*/----------------------------------------------------

DROP TABLE IF EXISTS #Cart1;
DROP TABLE IF EXISTS #Cart2;
GO

CREATE TABLE #Cart1
(
Item  VARCHAR(100) PRIMARY KEY
);
GO

CREATE TABLE #Cart2
(
Item  VARCHAR(100) PRIMARY KEY
);
GO

INSERT INTO #Cart1 (Item) VALUES
('Sugar'),('Bread'),('Juice'),('Soda'),('Flour');
GO

INSERT INTO #Cart2 (Item) VALUES
('Sugar'),('Bread'),('Butter'),('Cheese'),('Fruit');


GO

SELECT c1.Item,c2.Item
FROM #Cart1 AS c1
FULL JOIN #Cart2 AS c2 ON c1.Item = c2.Item
ORDER BY 1 desc,2 desc