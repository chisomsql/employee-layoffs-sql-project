SELECT * FROM hr_project.employees;

select* from table_name;

insert into layoffs (emp_id, layoff_date,reason)
values 
(3, '2023-08-01','cost cutting'),
(4,'2024-01-20', 'restructuring');



select * from employees;

select e.first_name, e.last_name, d.dept_name
from  employees e
join departments d on e.department_id = d.department_id;




select e.first_name, e.last_name,l.layoff_date, l.reason
from employees  e
join layoffs  as l  on e.emp_id = l.emp_id ;

select d.dept_name, count(e.emp_id) as
total_employees
from employees  e
join departments d on e.department_id =d.department_id
group by  d.dept_name;

select d.dept_name, avg (e.salary) as
avg_salary
from employees e  
join departments d on e.department_id
= d.department_id
group by d.dept_name
order by avg_salary desc;




select d.dept_name, count(l.layoff_id)
as total_layoffs
from layoffs l
join employees e on l.emp_id = e.emp_id
join departments d on e.department_id = d.department_id
group by d.dept_name;


select d.dept_name,avg(e.salary) as avg_salary 
from employees e
join departments d on e.department_id = d.department_id
group by d.dept_name
order by avg_salary desc;




