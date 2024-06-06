
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
	A.CurecnyCode
FROM
	Customer as C
LEFT JOIN Account
ON C.CustID = A.CustID;


#Pregunta 04
SELECT
	P.product,
	B.betdate,
	count(*) as counter
FROM betting as B
GROUP BY product, betdate
LEFT JOIN product as P
ON B.calssid = P.calssid AND B.categoryid = P.categoryid;

#Pregunta 05
SELECT
	P.product,
	B.betdate,
	count(*) as counter
FROM betting as B
GROUP BY product, betdate
LEFT JOIN product as P
ON B.calssid = P.calssid AND B.categoryid = P.categoryid;
WHERE B.betdate > '01-11-2012' AND product = 'Sportsbook';

#Pregunta 06

