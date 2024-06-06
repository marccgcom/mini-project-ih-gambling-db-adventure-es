
#Pregunta 01
SELECT
	title,
	FirstName,
	LastName,
	date(DateOfBirth)
FROM 
	customer;
	

#Pregunta 02
SELECT
	CustomerGroup,
	count(*) as counter
FROM
	Customer
Group by CustomerGroup;


#Pregunta 03
SELECT
	C.*,
	A.CurrencyCode
FROM
	Customer as C
LEFT JOIN `Account` as A
ON C.CustID = A.CustID;

#Pregunta 04
SELECT
	P.product,
	B.BetDate,
	count(*) as counter
FROM betting as B
LEFT JOIN product as P
ON B.ClassId = P.ClassId AND B.CategoryId = P.CategoryId
GROUP BY product, betdate;

#Pregunta 05
SELECT
	P.product,
	B.BetDate,
	count(*) as counter
FROM betting as B
LEFT JOIN product as P
ON B.ClassId = P.ClassId AND B.CategoryId = P.CategoryId
WHERE B.betdate > date('2012-11-01') AND P.product = 'Sportsbook'
GROUP BY P.product, B.BetDate;

#Pregunta 06
SELECT
	P.product,
	B.BetDate,
	count(*) as counter
FROM betting as B
LEFT JOIN product as P
ON B.ClassId = P.ClassId AND B.CategoryId = P.CategoryId
WHERE B.betdate > date('2012-11-01') AND P.product = 'Sportsbook'
GROUP BY P.product, B.BetDate;


#Pregunta 07
SELECT
	C.title,
	C.FirstName,
	C.LastName,
	SUM(B.Bet_Amt)
FROM 
	customer as C
LEFT JOIN account  as A
ON C.CustId = A.CustId
LEFT JOIN betting as B
ON A.AccountNo = B.AccountNo
WHERE MONTH(B.betdate) > 11
GROUP BY C.title, C.FirstName, C.LastName;

#Pregunta 08
SELECT
	C.CustId,
    count(DISTINCT B.Product)
FROM customer as C
LEFT JOIN account as A
ON C.CustId = A.CustId
LEFT JOIN betting as B
ON B.AccountNo = A.AccountNo
GROUP BY C.CustId, B.Product;

SELECT
	B.Product,
    C.CustId
FROM customer as C
LEFT JOIN account as A
ON C.CustId = A.CustId
LEFT JOIN betting as B
ON B.AccountNo = A.AccountNo
WHERE B.Product IN ('Sportsbook', 'Vegas');

#Pregunta 09
SELECT
	C.CustId,
    count(DISTINCT B.Product) as counter
FROM customer as C
LEFT JOIN account as A
ON C.CustId = A.CustId
LEFT JOIN betting as B
ON B.AccountNo = A.AccountNo
GROUP BY C.CustId, B.Product
HAVING COUNT(DISTINCT B.Product) = 1;

#Pregunta 10
SELECT
    a.AccountNo,
    c.FirstName,
    c.LastName,
    p.product AS ProductoFavorito,
    MAX(total_bet) AS MaximaApuestaTotal
FROM (
    SELECT
        b.AccountNo,
        b.Product,
        SUM(b.Bet_Amt) AS total_bet
    FROM
        betting b
    GROUP BY
        b.AccountNo, b.Product
) AS bet_totals
JOIN account a ON bet_totals.AccountNo = a.AccountNo
JOIN customer c ON a.CustId = c.CustId
JOIN product p ON bet_totals.Product = p.product
GROUP BY
    a.AccountNo,
    c.FirstName,
    c.LastName
ORDER BY
    a.AccountNo;

