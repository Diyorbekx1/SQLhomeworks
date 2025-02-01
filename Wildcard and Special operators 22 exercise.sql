	--SQL Exercises, Practice, Solution - Wildcard and Special operators

	--1

SELECT salesman_id, name, city, commission
FROM salesman
WHERE city IN ('Paris', 'Rome')

--2

SELECT salesman_id, name, city, commission
FROM salesman
WHERE city IN ('Paris', 'Rome');


--3

SELECT salesman_id, name, city, commission
FROM salesman
WHERE city NOT IN ('Paris', 'Rome');

--4

SELECT customer_id, cust_name, city, grade, salesman_id
FROM customer
WHERE customer_id IN (3007, 3008, 3009);

--5

SELECT salesman_id, name, city, commission
FROM salesman
WHERE commission BETWEEN 0.12 AND 0.14;

--6

SELECT ord_no, purch_amt, ord_date, customer_id, salesman_id
FROM orders
WHERE purch_amt BETWEEN 500 AND 4000
  AND purch_amt NOT IN (948.50, 1983.43);

  --7

  SELECT salesman_id, name, city, commission
FROM salesman
WHERE name >= 'N' AND name < 'P';

--8

SELECT salesman_id, name, city, commission
FROM salesman
WHERE name NOT BETWEEN 'A' AND 'M';

--9

SELECT customer_id, cust_name, city, grade, salesman_id
FROM customer
WHERE cust_name LIKE 'B%';


--10

SELECT customer_id, cust_name, city, grade, salesman_id
FROM customer
WHERE cust_name LIKE '%n';


--11


SELECT salesman_id, name, city, commission
FROM salesman
WHERE name LIKE 'N__l%';


--12

SELECT col1
FROM testtable
WHERE col1 LIKE '%\_%' ESCAPE '\';


--13

SELECT col1
FROM testtable
WHERE col1 NOT LIKE '%\_%' ESCAPE '\';

--14

SELECT col1
FROM testtable
WHERE col1 LIKE '%/%';


--15

SELECT col1
FROM testtable
WHERE col1 NOT LIKE '%/%';


--16

SELECT col1
FROM testtable
WHERE col1 LIKE '%_/%';


--17

SELECT col1
FROM testtable
WHERE col1 NOT LIKE '%_/%';

--18

SELECT col1
FROM testtable
WHERE col1 LIKE '%\%%' ESCAPE '\';


--19

SELECT col1
FROM testtable
WHERE col1 NOT LIKE '%\%%' ESCAPE '\';


--20

SELECT customer_id, cust_name, city, grade, salesman_id
FROM customer
WHERE grade IS NULL OR grade = '';

--21

SELECT customer_id, cust_name, city, grade, salesman_id
FROM customer
WHERE grade IS NOT NULL AND grade != '';

--22

SELECT emp_idno, emp_fname, emp_lname, emp_dept
FROM emp_details
WHERE emp_lname LIKE 'D%';


