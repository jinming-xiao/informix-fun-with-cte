-- setenv DBACCESS_COLUMNS 180
-- dbaccess test Mandelbrot.sql
-- output to "/tmp/x" without headings 
WITH x(i) AS ( select 0 UNION ALL SELECT (i + 1)::int FROM x WHERE i < 101),
Z(Ix, Iy, Cx, Cy, X, Y, II) AS (
    SELECT Ix as Ix, Iy as Iy, X::FLOAT as Cx, Y::FLOAT as Cy, 
	X::FLOAT as X , Y::FLOAT as Y, 0 as II
    FROM (SELECT -2.2 + 0.031 * i, i FROM x) AS xgen(x,ix)
    CROSS JOIN (SELECT -1.5 + 0.031 * i, i FROM x) AS ygen(y,iy)
   UNION ALL
   SELECT Ix, Iy, Cx, Cy, X * X - Y * Y + Cx AS X, Y * X * 2 + Cy, (II + 1)::int
    FROM Z WHERE X * X + Y * Y < 16.0 AND II < 27
),
Zt (Ix, Iy, I) AS (
    SELECT Ix, Iy, MAX(II) AS I FROM Z GROUP BY Iy, Ix ORDER BY Iy, Ix
)
SELECT  sum(SUBSTR(" .,,,-----++++%%%%@@@@#### ",GREATEST(I,1), 1)::lvarchar) as x
FROM Zt GROUP BY Iy ORDER BY Iy;
