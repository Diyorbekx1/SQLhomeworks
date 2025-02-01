--SQL Exercises, Practice, Solution - Using Boolean and Relational operators
--1
SELECT customer_id, cust_name, city, grade, salesman_id
FROM customer
WHERE grade > 100

--2

SELECT customer_id, cust_name, city, grade, salesman_id
FROM customer
WHERE city = 'New York' AND grade > 100

--3

SELECT customer_id, cust_name, city, grade, salesman_id
FROM customer
WHERE city = 'New York' OR grade > 100;

--4

SELECT customer_id, cust_name, city, grade, salesman_id
FROM customer
WHERE city = 'New York' OR NOT grade > 100;

--5

SELECT customer_id, cust_name, city, grade, salesman_id
FROM customer
WHERE city != 'New York' AND NOT grade > 100;

--6

SELECT ord_no, purch_amt, ord_date, customer_id, salesman_id
FROM orders
WHERE NOT (ord_date = '2012-09-10' AND (salesman_id > 5005 OR purch_amt > 1000));

--7

SELECT salesman_id, name, city, commission
FROM salesman
WHERE commission BETWEEN 0.10 AND 0.12;

--8

SELECT ord_no, purch_amt, ord_date, customer_id, salesman_id
FROM orders
WHERE purch_amt < 200 OR NOT (ord_date >= '2012-02-10' AND customer_id < 3009)

--9

SELECT ord_no, purch_amt, ord_date, customer_id, salesman_id
FROM orders
WHERE NOT (ord_date = '2012-08-17' OR (customer_id > 3005 AND purch_amt < 1000));

--10

SELECT 
    ord_no,
    purch_amt,
    (purch_amt / 6000) * 100 AS achieved_percentage,
    100 - ((purch_amt / 6000) * 100) AS unachieved_percentage
FROM orders
WHERE (purch_amt / 6000) * 100 > 50;

--11

SELECT emp_idno, emp_fname, emp_lname, emp_dept
FROM emp_details
WHERE emp_lname IN ('Dosni', 'Mardy');

--12

SELECT emp_idno, emp_fname, emp_lname, emp_dept
FROM emp_details
WHERE emp_dept IN (47, 63);
