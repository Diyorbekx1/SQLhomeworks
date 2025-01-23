CREATE TABLE salesmen (
    salesman_id INT,
    name VARCHAR(100),
    city VARCHAR(100),
    commission DECIMAL(5, 2))

-- Insert data into the table
INSERT INTO salesmen (salesman_id, name, city, commission)
VALUES
    (5001, 'James Hoog', 'New York', 0.15),
    (5002, 'Nail Knite', 'Paris', 0.13),
    (5005, 'Pit Alex', 'London', 0.11),
    (5006, 'Mc Lyon', 'Paris', 0.14),
    (5007, 'Paul Adam', 'Rome', 0.13),
    (5003, 'Lauson Hen', 'San Jose', 0.12);

	CREATE TABLE customers (
    customer_id INT,
    cust_name VARCHAR(100),
    city VARCHAR(100),
    grade INT,
    salesman_id INT)

-- Insert data into the customers table
INSERT INTO customers (customer_id, cust_name, city, grade, salesman_id)
VALUES
    (3002, 'Nick Rimando', 'New York', 100, 5001),
    (3007, 'Brad Davis', 'New York', 200, 5001),
    (3005, 'Graham Zusi', 'California', 200, 5002),
    (3008, 'Julian Green', 'London', 300, 5002),
    (3004, 'Fabian Johnson', 'Paris', 300, 5006),
    (3009, 'Geoff Cameron', 'Berlin', 100, 5003),
    (3003, 'Jozy Altidor', 'Moscow', 200, 5007);
	 --1
-- Find all salespeople and customers located in London
SELECT 'Salesperson' AS type, salesman_id AS id, name, city
FROM salespeople
WHERE city = 'London'
UNION
SELECT 'Customer' AS type, customer_id AS id, name, city
FROM customers
WHERE city = 'London';
--2
SELECT DISTINCT salesman_id, city
FROM salesmen;
--3
SELECT DISTINCT s.salesman_id, c.customer_id
FROM salesmen s
JOIN customers c ON s.salesman_id = c.salesman_id;
--4
SELECT a.salesman_id, name, ord_no, 'highest on', ord_date
FROM salesman a, orders b
WHERE a.salesman_id = b.salesman_id
AND b.purch_amt = (
    SELECT MAX(purch_amt)
    FROM orders c
    WHERE c.ord_date = b.ord_date)
UNION
SELECT a.salesman_id, name, ord_no, 'lowest on', ord_date
FROM salesman a, orders b
WHERE a.salesman_id = b.salesman_id
AND b.purch_amt = (   SELECT MIN(purch_amt)
    FROM orders c
    WHERE c.ord_date = b.ord_date)
	--5
SELECT a.salesman_id, name, ord_no, 'highest on', ord_date
FROM salesman a, orders b
WHERE a.salesman_id = b.salesman_id
AND b.purch_amt = (
    SELECT MAX(purch_amt)
    FROM orders c
    WHERE c.ord_date = b.ord_date)
	UNION
SELECT a.salesman_id, name, ord_no, 'lowest on', ord_date
FROM salesman a, orders b
WHERE a.salesman_id = b.salesman_id
AND b.purch_amt = (
    SELECT MIN(purch_amt)
    FROM orders c
    WHERE c.ord_date = b.ord_date)
	ORDER BY 3
	--6
	SELECT 
    s.salesman_id,
    s.name,
    COALESCE(c.cust_name, 'NO MATCH') AS customer_name,
    s.commission
FROM salesmen s
LEFT JOIN customers c
    ON s.salesman_id = c.salesman_id
    AND s.city = c.city
UNION
SELECT 
    s.salesman_id,
    s.name,
    'NO MATCH' AS customer_name,
    s.commission
FROM salesmen s
WHERE NOT EXISTS (
    SELECT 1
    FROM customers c
    WHERE s.salesman_id = c.salesman_id
    AND s.city = c.city)
ORDER BY s.name DESC;
--7
SELECT 
    s.salesman_id,
    s.name,
    s.city,
    CASE 
        WHEN EXISTS (
            SELECT 1
            FROM customers c
            WHERE c.city = s.city
        ) THEN 'MATCHED'
        ELSE 'NO MATCH'
    END AS match_status
FROM salesmen s
ORDER BY s.name DESC
