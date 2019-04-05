-- setenv DBACCESS_COLUMNS 180
-- dbaccess test Julia.sql
-- output to "/tmp/x" without headings 
WITH    x(n) AS
	(
	select -40
	UNION ALL
	select n+1 from x where n < 40
	),
	y(j) AS
	(
	select -40
	UNION ALL
	select j+1 from y where j < 40
	),
        q (r, i, rx, ix, g) AS
        (
        SELECT  x + r::float * step, y + i::float * step,
                x + r::float * step, y + i::float * step,
                0
        FROM    (
                SELECT  0.25 x, -0.55 y, 0.002 step, r, i
		FROM 	(select n as r from x) 
		cross join 
		(select j as i from y)
                )
        UNION ALL
        SELECT  r, i,
                CASE WHEN (rx * rx + ix * ix) < 1E8 THEN 
		    pow((rx * rx + ix * ix), 0.75) * COS(1.5 * ATAN2(ix, rx)) END - 0.2,
                CASE WHEN (rx * rx + ix * ix) < 1E8 THEN 
		    pow((rx * rx + ix * ix), 0.75) * SIN(1.5 * ATAN2(ix, rx)) END,
                g + 1
        FROM    q
        WHERE   rx IS NOT NULL
                AND g < 99
        ),
	Zt (i, r, x) AS (
	SELECT i, r, SUBSTR(" .:-=+*#%@", (MAX(g) /10 +1)::int, 1) as x
	-- SELECT i, r, (MAX(g) /10 +1)::int as x
	FROM q
	GROUP BY i, r
	order by r
	)
SELECT  
	sum(x::lvarchar) as x
	from Zt 
	group by i
	order by i;
