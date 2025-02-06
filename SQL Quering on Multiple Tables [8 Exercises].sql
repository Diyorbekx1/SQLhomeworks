--SQL Exercises, Practice, Solution - Query on Multiple Tables

--1
SELECT c.cust_name, s.name, s.city
FROM customer c
JOIN salesman s ON c.salesman_id = s.salesman_id
WHERE c.city = s.city;


--2
SELECT c.cust_name, s.name
FROM customer c
JOIN salesman s ON c.salesman_id = s.salesman_id;


--3
SELECT o.ord_no, c.cust_name, o.customer_id, o.salesman_id
FROM orders o
JOIN customer c ON o.customer_id = c.customer_id
JOIN salesman s ON o.salesman_id = s.salesman_id
WHERE c.city != s.city;


--4
SELECT o.ord_no, c.cust_name
FROM orders o
JOIN customer c ON o.customer_id = c.customer_id;


--5
SELECT c.cust_name AS "Customer", c.grade AS "Grade"
FROM customer c
JOIN salesman s ON c.salesman_id = s.salesman_id
WHERE c.grade IS NOT NULL AND s.city IS NOT NULL;


--6
SELECT c.cust_name AS "Customer", c.city AS "City"
FROM customer c
JOIN salesman s ON c.salesman_id = s.salesman_id
WHERE s.commission BETWEEN 0.12 AND 0.14;


--7
SELECT o.ord_no, c.cust_name, s.commission AS "Commission%", (o.purch_amt * s.commission) AS "Commission"
FROM orders o
JOIN customer c ON o.customer_id = c.customer_id
JOIN salesman s ON o.salesman_id = s.salesman_id
WHERE c.grade >= 200;


--8
SELECT o.ord_no, c.cust_name, s.commission AS "Commission%", (o.purch_amt * s.commission) AS "Commission"
FROM orders o
JOIN customer c ON o.customer_id = c.customer_id
JOIN salesman s ON o.salesman_id = s.salesman_id
WHERE c.grade >= 200;
