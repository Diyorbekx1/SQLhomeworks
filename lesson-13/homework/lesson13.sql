--SQL Exercises, Practice, Solution - JOINS on HR Database

--1
SELECT 
    e.first_name, 
    e.last_name, 
    e.department_id, 
    d.department_name
FROM 
    employees e
JOIN 
    departments d
ON 
    e.department_id = d.department_id;

--2

 SELECT
    e.first_name, 
    e.last_name, 
    d.department_name AS department, 
    l.city, 
    l.state_province
FROM 
    employees e
JOIN 
    departments d
ON 
    e.department_id = d.department_id
JOIN 
    locations l
ON 
    d.location_id = l.location_id;

--3

SELECT
   e.first_name,
   e.last_name,
   e.salary
   j.grade_level AS job_grade
FROM 
    employees e
JOIN
    job_grades j 
	on e.salary between l.lowest_sal and j.highest_sal

--4

SELECT
   e.first_name,
   e.last_name,
   d.department_id,
   d.department_name
   FROM
    employees e
	JOIN
	department d
	on
	e.department_id = d.department_id
	WHERE 
    e.department_id IN (80, 40);

--5

SELECT
  e.first_name, 
    e.last_name, 
	d.department_name AS department, 
    l.city, 
    l.state_province
	FROM 
    employees e
JOIN 
    departments d
ON 
    e.department_id = d.department_id
	JOIN
	locations l
ON	  d.location_id = l.location_id
WHERE e.first_name like '%z%'

--6

SELECT 
    e.first_name, 
    e.last_name, 
    d.department_id, 
    d.department_name
FROM 
    departments d
LEFT JOIN 
    employees e
ON 
    d.department_id = e.department_id;

	--7

	SELECT 
    e.first_name, 
    e.last_name, 
    e.salary
FROM 
    employees e
WHERE 
    e.salary < (
        SELECT  salary
        FROM  employees
        WHERE employee_id = 182);

--8
SELECT 
    e.first_name AS employee_name, 
    m.first_name AS manager_name
FROM 
    employees e
LEFT JOIN 
    employees m
ON 
    e.manager_id = m.employee_id;

--9
SELECT 
    d.department_name, 
    l.city, 
    l.state_province
FROM 
    departments d
JOIN 
    locations l
ON 
    d.location_id = l.location_id;


--10

SELECT 
    e.first_name, 
    e.last_name, 
    e.department_id, 
    d.department_name
FROM 
    employees e
LEFT JOIN 
    departments d
ON 
    e.department_id = d.department_id;



--11

SELECT 
    e.first_name AS employee_name, 
    COALESCE(m.first_name, 'No Manager') AS manager_name
FROM 
    employees e
LEFT JOIN 
    employees m
ON 
    e.manager_id = m.employee_id;
--12

SELECT 
    e.first_name, 
    e.last_name, 
    e.department_id
FROM 
    employees e
WHERE 
    e.department_id = (
        SELECT department_id
        FROM employees
        WHERE  last_name = 'Taylor' )
AND 
    e.last_name <> 'Taylor';

--13
SELECT 
CONCAT(e.first_name, ' ', e.last_name) as employee_name,
  j.job_title, 
    d.department_name, 
	e.hire_date AS joining_date
FROM 
    employees e
JOIN 
    jobs j
	ON 
    e.job_id = j.job_id
JOIN 
    departments d
ON 
    e.department_id = d.department_id
WHERE 
 e.hire_date BETWEEN TO_DATE('1993-01-01', 'YYYY-MM-DD') 
                     AND TO_DATE('1997-08-31', 'YYYY-MM-DD')


--14
SELECT 
    j.job_title, 
  CONCAT(e.first_name, ' ', e.last_name) AS employee_name, 
    (j.max_salary - e.salary) AS salary_difference
FROM 
    employees e
JOIN 
    jobs j
ON 
    e.job_id = j.job_id;


--15
SELECT d.department_name, AVG(e.salary), COUNT(e.commission_pct) 
FROM employees e
JOIN 
    departments d
ON 
    e.department_id = d.department_id
GROUP BY department_name;



