--Formatting Output - Exercises, Practice, Solution

--1

SELECT salesman_id, name, city, CONCAT('%', FORMAT(commission * 100, 2)) AS commission
FROM salesman;


--2

SELECT CONCAT('For ', ord_date, ' there are ', COUNT(*) , ' orders.') AS result
FROM orders
GROUP BY ord_date
ORDER BY ord_date;


--3

SELECT * FROM orders
ORDER BY ord_no ASC;

--4

SELECT * FROM orders
ORDER BY ord_date DESC;


--5
SELECT * FROM orders
ORDER BY ord_date DESC, purch_amt DESC;


--6

SELECT cust_name, city, grade
FROM customer
ORDER BY customer_id;


--7

SELECT salesman_id, ord_date, MAX(purch_amt) AS max_purchase
FROM orders
GROUP BY salesman_id, ord_date
ORDER BY salesman_id, ord_date;


--8

SELECT cust_name, city, grade
FROM customer
ORDER BY grade DESC;

--9

SELECT customer_id, COUNT(DISTINCT ord_no) AS count, MAX(purch_amt) AS max_purchase
FROM orders
GROUP BY customer_id
ORDER BY count DESC;


--10

SELECT ord_date, 
       SUM(purch_amt) AS total_purchase,
       SUM(purch_amt) * 0.15 AS total_commission
FROM orders
GROUP BY ord_date
ORDER BY ord_date;
