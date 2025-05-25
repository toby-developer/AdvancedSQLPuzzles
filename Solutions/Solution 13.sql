
/*----------------------------------------------------
DDL for Puzzle #13
Inventory Tracking
*/----------------------------------------------------

DROP TABLE IF EXISTS #Inventory;
GO

CREATE TABLE #Inventory
(
InventoryDate       DATE PRIMARY KEY,
QuantityAdjustment  INTEGER NOT NULL
);
GO

INSERT INTO #Inventory (InventoryDate, QuantityAdjustment) VALUES
('7/1/2018',100),('7/2/2018',75),('7/3/2018',-150),
('7/4/2018',50),('7/5/2018',-100);
GO
select * from #inventory
SELECT InventoryDate
,QuantityAdjustment
,Sum(QuantityAdjustment)
    OVER(order by InventoryDate ASC) AS inventory
FROM #inventory