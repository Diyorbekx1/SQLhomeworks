--SQL Functions and Group by - Exercises, Practice, Solution

--1

SELECT SUM(purch_amt) AS total_purchase_amount
FROM orders;

--2

SELECT AVG(purch_amt) AS average_purchase_amount
FROM orders;

--3

SELECT COUNT(DISTINCT salesman_id) AS number_of_salespeople
FROM orders;

--4

SELECT COUNT(customer_id) AS number_of_customers
FROM customer;

--5

Select COUNT(All grade) from custumer;

--6

select max(purch_amt) from orders;

--7

SELECT MIN(purch_amt) AS min FROM orders;

--8

SELECT city, MAX(grade) AS max FROM customer GROUP BY city;


--9

SELECT customer_id, MAX(purch_amt) AS max FROM orders GROUP BY customer_id;

--10

SELECT customer_id, ord_date, MAX(purch_amt) AS max FROM orders GROUP BY customer_id, ord_date;


--11

SELECT salesman_id, MAX(purch_amt) AS max FROM orders WHERE ord_date = '2012-08-17' GROUP BY salesman_id;

--12

SELECT customer_id, ord_date, MAX(purch_amt) AS max FROM orders 
WHERE purch_amt > 2000 GROUP BY customer_id, ord_date;


--13

SELECT customer_id, ord_date, MAX(purch_amt) AS max 
FROM orders 
WHERE purch_amt BETWEEN 2000 AND 6000 
GROUP BY customer_id, ord_date;


--14

SELECT customer_id, ord_date, MAX(purch_amt) AS max 
FROM orders 
WHERE purch_amt IN (2000, 3000, 5760, 6000) 
GROUP BY customer_id, ord_date;


--15

SELECT customer_id, MAX(purch_amt) AS max 
FROM orders 
WHERE customer_id BETWEEN 3002 AND 3007 
GROUP BY customer_id;


--16


SELECT customer_id, MAX(purch_amt) AS max 
FROM orders 
WHERE customer_id BETWEEN 3002 AND 3007 AND purch_amt > 1000 
GROUP BY customer_id;

--17

SELECT salesman_id, MAX(purch_amt) AS max 
FROM orders 
WHERE salesman_id BETWEEN 5003 AND 5008 
GROUP BY salesman_id;


--18

SELECT COUNT(*) AS num_orders 
FROM orders 
WHERE ord_date = '2012-08-17';


--19

SELECT city, COUNT(*) AS count
FROM salesman
GROUP BY city;


--20

SELECT ord_date, salesman_id, COUNT(*) AS count
FROM orders
GROUP BY ord_date, salesman_id;


--21

SELECT AVG(PRO_PRICE) AS average_price
FROM item_mast;


--22

SELECT COUNT(*) AS number_of_products
FROM item_mast
WHERE PRO_PRICE >= 350;


--23

SELECT AVG(PRO_PRICE) AS average_price, PRO_COM AS company_id
FROM item_mast
GROUP BY PRO_COM;


--24

SELECT SUM(DPT_ALLOTMENT) AS sum
FROM emp_department;


--25

SELECT EMP_DEPT, COUNT(*) AS number_of_employees
FROM emp_details
GROUP BY EMP_DEPT;
