--HR Database - SORT FILTER: Exercises, Practice, Solution

--1

Select FIRST_NAME , LAST_NAME,  salary from empolyees
where salary <=6000

--2


Select FIRST_NAME , LAST_NAME, DEPARTMENT_ID,  salary from empolyees
where salary >=8000

--3

Select first_name , last_name, department_id from empoyees
where last_name='McEwen'

--4

select* from employes
where department_id is null

--5

select*from departments
where department_name='Marketing'

--6
 select Concat(first_name, ' ', last_name) as full_name from empoyees
 where first_name not like '%M%'
 order by department_id

 --7

 select* from employees
 where salary  between 8000 and  12000
 and commission_pct IS NOT NULL
 and hire_date < '1987-06-05'
 and department_id not in(40,120,70
 
 --8

 select Concat(first_name, ' ', last_name) as full_name , salary from empoyees
 where commision_pct is null

 --9
 select  Concat(first_name, ' ', last_name) as full_name , contact_details , salary from empoyees
 where  salary in (9000, 17000)

 --10

select  first_name, last_name,   salary
from employees
where	 first_name LIKE '%m'

--11

SELECT 
  CONCAT(first_name, ' ', last_name) as full_name, 
  salary
from employees
where salary NOT BETWEEN 7000 AND 15000 
order by full_name 

--12

select concat( first_name , ' ', last_name) as full_name ,job_id, hire_date from empoyees
where hire_date BETWEEN '2007-11-05' AND '2009-07-05'
order by hire_date

--13

select 
  concat(first_name, ' ', last_name) as full_name, 
  department_id
from employees
where department_id in (70, 90)

--14

select 
  concat(first_name, ' ', last_name) as full_name, 
  salary, 
  manager_id
from employees
where manager_id is not null

--15


select * from employees 
where hire_date < '2002-06-21'

--16

select first_name, last_name, email, salary, manager_id
from employees
where manager_id in (120, 103, 145)

--17

select *from employees
where first_name like '%d%' 
   or first_name like '%s%' 
   or first_name like '%n%'
order by salary desc

--18

select  concat(first_name, ' ', last_name) as full_name,  hire_date, commission_pct, email, 
    concat(substr(phone_number, 1, 6), '-', substr(phone_number, 7)) as formatted_phone_number,   salary
from employees
where salary > 11000 
   or substr(phone_number, 7, 1) = '3'
order by first_name desc

--19

select first_name, last_name, department_id
from employees
where substr(first_name, 3, 1) = 's'

--20

select employee_id, first_name, job_id, department_id
from employees
where department_id not in (50, 30, 80)

--21

select employee_id, first_name, job_id, department_id
from employees
where department_id in (30, 40, 90)

--22

select employee_id
from job_history
group by employee_id
having count(job_id) > 2

--23

select  job_id,
    count(*) as employee_count,
    sum(salary) as total_salary,
    max(salary) - min(salary) as salary_difference
from  employees
group by job_id

--24
 select  job_id
from employees
where  ( hire_date) > 300
group by  job_id
having  count(*) >= 2;
 --25
 select  country_id, 
    count(city) as number_of_cities
from locations
group by country_id

--26

select country_id, 
 count(city) as number_of_cities
from locations
group by country_id


--27

select * 
from jobs 
order by job_title desc

--28

select first_name, last_name, hire_date
from employees
where job_id in ('Sales Representative', 'Salesman')

--29

select department_id, avg(salary) as average_salary
from employees
where commission_pct is not null
group by department_id

--30

select department_id
from employees
group by department_id, manager_id
having count(employee_id) >= 4;


--31

select department_id
from employees
where commission_pct is not null
group by department_id
having count(employee_id) > 10

--32

select employee_id, end_date
from job_history
where end_date is not null

--33

select * 
from employees
where commission_pct is null 
  and salary between 7000 and 12000
  and department_id = 50
