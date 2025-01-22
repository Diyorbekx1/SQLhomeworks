--1

CREATE TABLE salesman (
    salesman_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    commission DECIMAL(4, 2))

-- Insert data into the salesman table
INSERT INTO salesman (salesman_id, name, city, commission) VALUES
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5007, 'Paul Adam', 'Rome', 0.13),
(5003, 'Lauson Hen', 'San Jose', 0.12);

Select*from salesman

--2
SELECT 'This is SQL Exercise, Practice and Solution' as message

--3
SELECT 10 AS number1, 20 AS number2, 30 AS number3

--4
SELECT 10 + 15 AS sum
--5
SELECT (20 * 5) + (100 / 4) - 10 AS result
--6
SELECT name, city 
FROM salesman
--7
CREATE TABLE orders1 (
    ord_no INT PRIMARY KEY,
    purch_amt DECIMAL(10, 2),
    ord_date DATE,
    customer_id INT,
    salesman_id INT
);

INSERT INTO orders1 (ord_no, purch_amt, ord_date, customer_id, salesman_id)
VALUES 
(70001, 150.50, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.50, '2012-08-17', 3009, 5003),
(70007, 948.50, '2012-09-10', 3005, 5002),
(70005, 2400.60, '2012-07-27', 3007, 5001),
(70008, 5760.00, '2012-09-10', 3002, 5001),
(70010, 1983.43, '2012-10-10', 3004, 5006),
(70003, 2480.40, '2012-10-10', 3009, 5003),
(70012, 250.45, '2012-06-27', 3008, 5002),
(70011, 75.29, '2012-08-17', 3003, 5007),
(70013, 3045.60, '2012-04-25', 3002, 5001)

SELECT ord_date, salesman_id, ord_no, purch_amt
FROM orders
--8
SELECT DISTINCT salesman_id
FROM orders1
--9
SELECT name, city
FROM salesman
WHERE city = 'Paris'
--10
CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    cust_name VARCHAR(50),
    city VARCHAR(50),
    grade INT,
    salesman_id INT)

INSERT INTO customer (customer_id, cust_name, city, grade, salesman_id)
VALUES
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3008, 'Julian Green', 'London', 300, 5002),
(3004, 'Fabian Johnson', 'Paris', 300, 5006),
(3009, 'Geoff Cameron', 'Berlin', 100, 5003),
(3003, 'Jozy Altidor', 'Moscow', 200, 5007),
(3001, 'Brad Guzan', 'London', NULL, 5005);

SELECT customer_id, cust_name, city, grade, salesman_id FROM customer
WHERE grade = 200;
--11
SELECT ord_no, ord_date, purch_amt
FROM orders
WHERE salesman_id = 5001;
--12
CREATE TABLE nobel_win (
    year INT,
    subject VARCHAR(50),
    winner VARCHAR(100),
    country VARCHAR(50),
    category VARCHAR(50))

INSERT INTO nobel_win (year, subject, winner, country, category)
VALUES
(1970, 'Physics', 'Hannes Alfven', 'Sweden', 'Scientist'),
(1970, 'Physics', 'Louis Neel', 'France', 'Scientist'),
(1970, 'Chemistry', 'Luis Federico Leloir', 'France', 'Scientist'),
(1970, 'Physiology', 'Ulf von Euler', 'Sweden', 'Scientist'),
(1970, 'Physiology', 'Bernard Katz', 'Germany', 'Scientist'),
(1970, 'Literature', 'Aleksandr Solzhenitsyn', 'Russia', 'Linguist'),
(1970, 'Economics', 'Paul Samuelson', 'USA', 'Economist'),
(1970, 'Physiology', 'Julius Axelrod', 'USA', 'Scientist'),
(1971, 'Physics', 'Dennis Gabor', 'Hungary', 'Scientist'),
(1971, 'Chemistry', 'Gerhard Herzberg', 'Germany', 'Scientist'),
(1971, 'Peace', 'Willy Brandt', 'Germany', 'Chancellor'),
(1971, 'Literature', 'Pablo Neruda', 'Chile', 'Linguist'),
(1971, 'Economics', 'Simon Kuznets', 'Russia', 'Economist'),
(1978, 'Peace', 'Anwar al-Sadat', 'Egypt', 'President'),
(1978, 'Peace', 'Menachem Begin', 'Israel', 'Prime Minister'),
(1987, 'Chemistry', 'Donald J. Cram', 'USA', 'Scientist'),
(1987, 'Chemistry', 'Jean-Marie Lehn', 'France', 'Scientist'),
(1987, 'Physiology', 'Susumu Tonegawa', 'Japan', 'Scientist'),
(1994, 'Economics', 'Reinhard Selten', 'Germany', 'Economist'),
(1994, 'Peace', 'Yitzhak Rabin', 'Israel', 'Prime Minister'),
(1987, 'Physics', 'Johannes Georg Bednorz', 'Germany', 'Scientist'),
(1987, 'Literature', 'Joseph Brodsky', 'Russia', 'Linguist'),
(1987, 'Economics', 'Robert Solow', 'USA', 'Economist'),
(1994, 'Literature', 'Kenzaburo Oe', 'Japan', 'Linguist');
SELECT year, subject, winner
FROM nobel_win
WHERE year = 1970;
--13
SELECT winner
FROM nobel_win
WHERE year = 1971 AND subject = 'Literature'
--14
SELECT year, subject
FROM nobel_win
WHERE winner = 'Dennis Gabor';
--15
SELECT winner
FROM nobel_win
WHERE subject = 'Physics' AND year >= 1950;
--16
SELECT year, subject, winner, country
FROM nobel_win
WHERE subject = 'Chemistry' AND year BETWEEN 1965 AND 1975;
--17
SELECT year, subject, winner, country, category
FROM nobel_win
WHERE category = 'Prime Minister' AND winner IN ('Menachem Begin', 'Yitzhak Rabin') AND year > 1972;
--18
SELECT year, subject, winner, country, category
FROM nobel_win
WHERE winner LIKE 'Louis%';
--19
SELECT year, subject, winner, country, category
FROM nobel_win
WHERE (subject = 'Physics' AND year = 1970) 
   OR (subject = 'Economics' AND year = 1971);
   --20
   SELECT year, subject, winner, country, category
FROM nobel_win
WHERE year = 1970 AND subject NOT IN ('Physiology', 'Economics')
--21
SELECT year, subject, winner, country, category
FROM nobel_win
WHERE (subject = 'Physiology' AND year < 1971) 
   OR (subject = 'Peace' AND year >= 1974);
   --22
   SELECT year, subject, winner, country, category
FROM nobel_win
WHERE winner = 'Johannes Georg Bednorz';
--23
SELECT year, subject, winner, country, category
FROM nobel_win
WHERE subject NOT LIKE 'P%'
ORDER BY year DESC, winner ASC;
--24
SELECT year, subject, winner, country, category
FROM nobel_win
WHERE year = 1970
ORDER BY 
    CASE  WHEN subject = 'Chemistry' OR subject = 'Economics' THEN 2 
   ELSE 1  END, subject ASC;
   --25
   SELECT pro_id, pro_name, pro_price, pro_com
FROM products
WHERE pro_price BETWEEN 200 AND 600;
--26
SELECT AVG(pro_price) AS average_price
FROM products
WHERE pro_com = 16;
--27
SELECT pro_name AS 'Item Name', pro_price AS 'Price in Rs.'
FROM products;
--28
SELECT pro_name, pro_price
FROM products
WHERE pro_price >= 250
ORDER BY pro_price DESC, pro_name ASC
--29	
SELECT pro_com AS company_code, AVG(pro_price) AS average_price
FROM products
GROUP BY pro_com;
