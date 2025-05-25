
/*----------------------------------------------------
DDL for Puzzle #18
Seating Chart
*/----------------------------------------------------

DROP TABLE IF EXISTS #SeatingChart;
GO

CREATE TABLE #SeatingChart
(
    SeatNumber INTEGER PRIMARY KEY
);
GO

INSERT INTO #SeatingChart
    (SeatNumber)
VALUES
    (7),
    (13),
    (14),
    (15),
    (27),
    (28),
    (29),
    (30),
    (31),
    (32),
    (33),
    (34),
    (35),
    (52),
    (53),
    (54);
GO

DECLARE @mx INT = (
		SELECT max(seatnumber) a
		FROM #SeatingChart
		);

WITH cte
AS (
	SELECT 1 AS i
	
	UNION ALL
	
	SELECT i + 1 AS I
	FROM CTE
	WHERE @mx > i
	), seat_gaps
AS (
	SELECT i
	FROM cte
	
	EXCEPT
	
	SELECT DISTINCT seatnumber
	FROM #SeatingChart
	), marked
AS (
	SELECT i, CASE WHEN (
					LEAD(i, 1) OVER (
						ORDER BY i
						) <> i + 1 OR (
						LEAD(i, 1) OVER (
							ORDER BY i
							) IS NULL
						)
					) AND LAG(i, 1) OVER (
					ORDER BY i
					) = i - 1 THEN 'E' WHEN (
					LAG(i, 1) OVER (
						ORDER BY i
						) <> i - 1 OR LAG(i, 1) OVER (
						ORDER BY i
						) IS NULL
					) AND LEAD(i, 1) OVER (
					ORDER BY i
					) = i + 1 THEN 'S' END AS flag
	FROM seat_gaps
	), ranked
AS (
	SELECT i, flag, DENSE_RANK() OVER (
			PARTITION BY flag ORDER BY i
			) AS DR
	FROM marked
	WHERE flag IS NOT NULL
	)
SELECT DISTINCT IIF(a.i < b.i, a.i, b.i) AS GapStart, IIF(b.i > a.i, b.i, a.i) AS GapEnd
FROM ranked AS a
INNER JOIN ranked AS b ON a.flag <> b.flag AND a.dr = b.dr


select  @mx -  count(distinct SeatNumber) AS TotalMissingNumbers FROM #SeatingChart

SELECT 'Even' AS Type,count(SeatNumber) AS [Count] FROM #SeatingChart
WHERE   SeatNumber%2=0
UNION ALL
SELECT 'Odd' AS Type,count(SeatNumber) AS [Count] FROM #SeatingChart
WHERE   SeatNumber%2<>0