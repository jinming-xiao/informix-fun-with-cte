Informix 14.10 supports CTE, here comes a couple of fun queries with CTE
<pre>
steps:
1) download and install informix 14.10
2) create a test database with dbaccess
   create database test with log
3) run plus.sql to create an UDR to concate two lvarchar strings
   dbaccess test plus.sql

    create function plus(s1 lvarchar, s2 lvarchar)
        returning lvarchar;
      return s1 || s2;
    end function;

4) setenv DBACCESS_COLUMNS 180

5) Mandelbrot.sql - produces an ASCII-art image of the Mandelbrot set
   informix version https://wiki.postgresql.org/wiki/Mandelbrot_set

   dbaccess test Mandelbrot.sql |  grep -v '^$'

  -- setenv DBACCESS_COLUMNS 120
  -- dbaccess test Mandelbrot.sql
  -- output to "/tmp/x" without headings 
  WITH x(i) AS ( select 0 UNION ALL SELECT (i + 1)::int FROM x WHERE i < 101),
  Z(Ix, Iy, Cx, Cy, X, Y, II) AS (
    SELECT Ix as Ix, Iy as Iy, X::FLOAT as Cx, Y::FLOAT as Cy, 
        X::FLOAT as X , Y::FLOAT as Y, 0 as II
    FROM (SELECT -2.2 + 0.031 * i, i FROM x) AS xgen(x,ix)
    CROSS JOIN (SELECT -1.5 + 0.031 * i, i FROM x) AS ygen(y,iy)
   UNION ALL
   SELECT Ix, Iy, Cx, Cy, X * X - Y * Y + Cx AS X, 
		Y * X * 2 + Cy, (II + 1)::int
    FROM Z WHERE X * X + Y * Y < 16.0 AND II < 27
  ),
  Zt (Ix, Iy, I) AS (
    SELECT Ix, Iy, MAX(II) AS I FROM Z GROUP BY Iy, Ix ORDER BY Iy, Ix
  )
  SELECT  
    sum(SUBSTR(" .,,,-----++++%%%%@@@@#### ",GREATEST(I,1), 1)::lvarchar) as x
  FROM Zt GROUP BY Iy ORDER BY Iy;

6) Julia.sql beautiful Julia set looks like a snow-covered tree
   Informix version of https://explainextended.com/2013/12/31/happy-new-year-5/

   dbaccess test Julia | grep -v '^$'

7) Fonts process
   dbaccess test informix_is_fun.sql

_1   ####             ###                             ##                      ##                    #######                  
_2    ##             ## ##                                                                           ##   #                  
_3    ##    #####    ##      ####   ## ###  ##  ##   ###    ##   ##          ###     #####           ## #   ##  ##  #####    
_4    ##    ##  ##  ####    ##  ##   ### ## #######   ##     ## ##            ##    ##               ####   ##  ##  ##  ##   
_5    ##    ##  ##   ##     ##  ##   ##  ## #######   ##      ###             ##     ####            ## #   ##  ##  ##  ##   
_6    ##    ##  ##   ##     ##  ##   ##     ## # ##   ##     ## ##            ##        ##           ##     ##  ##  ##  ##   
_7   ####   ##  ##  ####     ####   ####    ##   ##  ####   ##   ##          ####   #####           ####     ### ## ##  ##   
_8                                                                                                                           


</pre>
