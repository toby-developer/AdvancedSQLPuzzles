/*----------------------------------------------------
DDL for Puzzle #20
Price Points
*/----------------------------------------------------

DROP TABLE IF EXISTS #ValidPrices;
GO

CREATE TABLE #ValidPrices
(
    ProductID      INTEGER,
    UnitPrice      MONEY,
    EffectiveDate  DATE,
    PRIMARY KEY (ProductID, UnitPrice, EffectiveDate)
);
GO

INSERT INTO #ValidPrices (ProductID, UnitPrice, EffectiveDate) VALUES
(1001,1.99,'1/01/2018'),
(1001,2.99,'4/15/2018'),
(1001,3.99,'6/8/2018'),
(2002,1.99,'4/17/2018'),
(2002,2.99,'5/19/2018');
GO

SELECT * FROM #VALIDPRICES