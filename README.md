<b>informix Recursive Common Table Expression</b>

Common Table Expression is a SQL standard feature, it can help customers
	•	simplify queries and make queries more readable
	•	use recursive CTE to query hierarchical data, and tree/graph structured data
	•	do programming tasks
 
Informix 14.10 release supports
	•	non-recursive CTE
	•	Recursive CTE
	•	Multiple CTEs, nested recursive CTEs in one query
	•	CTE with Insert, Update, Delete statements 
	•	CTE in view 
	•	CTE in SPL 
	•	CTE in Trigger
	•	CTE in subquery

<b>Recursive CTE</b>
A recursive query starts with either one non-recursive sub-query or
several non-recursive sub-queries joined by UNION or UNION ALL, and ends
with exactly one recursive sub-query joined by UNION ALL.  A recursive
sub-query references the CTE being defined.

An example of a recursive query computing the factorial of numbers from 0 to 9 is the following:
<pre>
WITH temp (n, fact) AS (
    SELECT 0, 1                      -- Initial Subquery
    UNION ALL 
    SELECT n+1, (n+1)*fact FROM temp -- Recursive Subquery 
        WHERE n < 9)
SELECT * FROM temp;

            n             fact 

            0                1
            1                1
            2                2
            3                6
            4               24
            5              120
            6              720
            7             5040
            8            40320
            9           362880
</pre>

query to generate Fibonacci number
<pre>
-- Fibonacci number
WITH fib(p, n) as
(
    select 0, 1
    UNION ALL
    select n, p+n from fib
        where n < 100
)
select * from fib;
          p             n 

          0             1
          1             1
          1             2
          2             3
          3             5
          5             8
          8            13
         13            21
         21            34
         34            55
         55            89
         89           144
</pre>

<b>Example query to display ‘INFORMIX’</b>
<pre>

_1   XXXX   XX   XX XXXXXXX   XXX   XXXXXX  XX   XX  XXXX   XX   XX  
_2    XX    XXX  XX  XX   X  XX XX   XX  XX XXX XXX   XX    XX   XX  
_3    XX    XXXX XX  XX X   XX   XX  XX  XX XXXXXXX   XX     XX XX   
_4    XX    XX XXXX  XXXX   XX   XX  XXXXX  XXXXXXX   XX      XXX    
_5    XX    XX  XXX  XX X   XX   XX  XX XX  XX X XX   XX      XXX    
_6    XX    XX   XX  XX      XX XX   XX  XX XX   XX   XX     XX XX   
_7   XXXX   XX   XX XXXX      XXX   XXX  XX XX   XX  XXXX   XX   XX  
_8                                                                   

</pre>

(0) before the example, we need a aggregation help function to concatenate string
<pre> 
create function plus(s1 lvarchar, s2 lvarchar)
        returning lvarchar;
    return s1 || s2;
end function;
</pre>

(1) public domain 8x8 VGA fonts from https://github.com/dhepper/font8x8
<pre>
with fonts(c, c1, c2,c3,c4,c5,c6,c7,c8) as (
select * from table(multiset{
ROW(' ', '0x00', '0x00', '0x00', '0x00', '0x00', '0x00', '0x00', '0x00'),
ROW('!', '0x18', '0x3C', '0x3C', '0x18', '0x18', '0x00', '0x18', '0x00'),
ROW('A', '0x0C', '0x1E', '0x33', '0x33', '0x3F', '0x33', '0x33', '0x00'),
ROW('B', '0x3F', '0x66', '0x66', '0x3E', '0x66', '0x66', '0x3F', '0x00'),
ROW('C', '0x3C', '0x66', '0x03', '0x03', '0x03', '0x66', '0x3C', '0x00'),
ROW('D', '0x1F', '0x36', '0x66', '0x66', '0x66', '0x36', '0x1F', '0x00'),
ROW('E', '0x7F', '0x46', '0x16', '0x1E', '0x16', '0x46', '0x7F', '0x00'),
ROW('F', '0x7F', '0x46', '0x16', '0x1E', '0x16', '0x06', '0x0F', '0x00'),
ROW('G', '0x3C', '0x66', '0x03', '0x03', '0x73', '0x66', '0x7C', '0x00'),
ROW('H', '0x33', '0x33', '0x33', '0x3F', '0x33', '0x33', '0x33', '0x00'),
ROW('I', '0x1E', '0x0C', '0x0C', '0x0C', '0x0C', '0x0C', '0x1E', '0x00'),
ROW('J', '0x78', '0x30', '0x30', '0x30', '0x33', '0x33', '0x1E', '0x00'),
ROW('K', '0x67', '0x66', '0x36', '0x1E', '0x36', '0x66', '0x67', '0x00'),
ROW('L', '0x0F', '0x06', '0x06', '0x06', '0x46', '0x66', '0x7F', '0x00'),
ROW('M', '0x63', '0x77', '0x7F', '0x7F', '0x6B', '0x63', '0x63', '0x00'),
ROW('N', '0x63', '0x67', '0x6F', '0x7B', '0x73', '0x63', '0x63', '0x00'),
ROW('O', '0x1C', '0x36', '0x63', '0x63', '0x63', '0x36', '0x1C', '0x00'),
ROW('P', '0x3F', '0x66', '0x66', '0x3E', '0x06', '0x06', '0x0F', '0x00'),
ROW('Q', '0x1E', '0x33', '0x33', '0x33', '0x3B', '0x1E', '0x38', '0x00'),
ROW('R', '0x3F', '0x66', '0x66', '0x3E', '0x36', '0x66', '0x67', '0x00'),
ROW('S', '0x1E', '0x33', '0x07', '0x0E', '0x38', '0x33', '0x1E', '0x00'),
ROW('T', '0x3F', '0x2D', '0x0C', '0x0C', '0x0C', '0x0C', '0x1E', '0x00'),
ROW('U', '0x33', '0x33', '0x33', '0x33', '0x33', '0x33', '0x3F', '0x00'),
ROW('V', '0x33', '0x33', '0x33', '0x33', '0x33', '0x1E', '0x0C', '0x00'),
ROW('W', '0x63', '0x63', '0x63', '0x6B', '0x7F', '0x77', '0x63', '0x00'),
ROW('X', '0x63', '0x63', '0x36', '0x1C', '0x1C', '0x36', '0x63', '0x00'),
ROW('Y', '0x33', '0x33', '0x33', '0x1E', '0x0C', '0x0C', '0x1E', '0x00'),
ROW('Z', '0x7F', '0x63', '0x31', '0x18', '0x4C', '0x66', '0x7F', '0x00')
})),
</pre>

(2) set the text we want to processing
<pre>
text(str) as (
    -- change this to other content 
    select 'INFORMIX’
),
</pre>
                                                                                                            
(3) get the text font data from above CTE ‘fonts’:
<pre>
xword(str, o, c, c1, c2,c3,c4,c5,c6,c7,c8) as (
    select str, 1, c, c1, c2,c3,c4,c5,c6,c7,c8
        from text, fonts where c = substr(str, 1, 1)
    union all
    select str, o+1, c, c1, c2,c3,c4,c5,c6,c7,c8 from fonts, xword
        where fonts.c = substr(str, o+1, 1) and o < length(str)
    — ‘o’ is the order for each character in the text
),
</pre>

(4) for loop to get 0x80, 0x40, 0x20, 0x10, 0x08, 0x04, 0x02, 0x01
<pre>
x(n, p) as (
    select 1, 128 union all select n+1, p/2 from x where n < 8
),
</pre>

(5) print ‘X’ or ‘ ‘ for each bit in the font data for each character
<pre>
show as (
select
        sum((case when bitand(to_number(c1)::int, p) > 0
                then 'X' else ' ' end)::lvarchar)::char(8) as c1,
        sum((case when bitand(to_number(c2)::int, p) > 0
                then 'X' else ' ' end)::lvarchar)::char(8) as c2,
        sum((case when bitand(to_number(c3)::int, p) > 0
                then 'X' else ' ' end)::lvarchar)::char(8) as c3,
        sum((case when bitand(to_number(c4)::int, p) > 0
                then 'X' else ' ' end)::lvarchar)::char(8) as c4,
        sum((case when bitand(to_number(c5)::int, p) > 0
                then 'X' else ' ' end)::lvarchar)::char(8) as c5,
        sum((case when bitand(to_number(c6)::int, p) > 0
                then 'X' else ' ' end)::lvarchar)::char(8) as c6,
        sum((case when bitand(to_number(c7)::int, p) > 0
                then 'X' else ' ' end)::lvarchar)::char(8) as c7,
        sum((case when bitand(to_number(c8)::int, p) > 0
                then 'X' else ' ' end)::lvarchar)::char(8) as c8
from x cross join xword
group by xword.o
order by xword.o desc)
</pre>

steps to run fun queries:

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

7) Fonts processing
   dbaccess test informix_is_fun.sql
<pre>

_1   ####             ###                             ##                      ##                    #######                  
_2    ##             ## ##                                                                           ##   #                  
_3    ##    #####    ##      ####   ## ###  ##  ##   ###    ##   ##          ###     #####           ## #   ##  ##  #####    
_4    ##    ##  ##  ####    ##  ##   ### ## #######   ##     ## ##            ##    ##               ####   ##  ##  ##  ##   
_5    ##    ##  ##   ##     ##  ##   ##  ## #######   ##      ###             ##     ####            ## #   ##  ##  ##  ##   
_6    ##    ##  ##   ##     ##  ##   ##     ## # ##   ##     ## ##            ##        ##           ##     ##  ##  ##  ##   
_7   ####   ##  ##  ####     ####   ####    ##   ##  ####   ##   ##          ####   #####           ####     ### ## ##  ##   
_8                                                                                                                           
</pre>

