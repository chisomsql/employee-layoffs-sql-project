CREATE DATABASE hr_project;
USE hr_project;

CREATE TABLE departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(100)
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT,
    hire_date DATE,
    salary DECIMAL(10,2),
    status ENUM('Active','Laid-off') DEFAULT 'Active',
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE layoffs (
    layoff_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_id INT,
    layoff_date DATE,
    reason VARCHAR(255),
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

INSERT INTO departm departments (dept_name) VALUES
('Engineering'), ('HR'), ('Finance'), ('Marketing');

INSERT INTO employees (first_name, last_name, department_id, hire_date, salary)
VALUES
('John','Doe',1,'2018-04-12',75000.00),
('Jane','Smith',2,'2019-01-15',55000.00),
('Michael','Lee',3,'2020-06-20',60000.00),
('Sarah','Johnson',4,'2017-03-10',50000.00);

INSERT INTO layoffs (emp_id, layoff_date, reason)
VALUES
(3,'2023-08-01','Cost cutting'),
(4,'2024-01-20','Restructuring');



SELECT * FROM hr_project.employees;


select* from table_name;



SELECT * FROM hr_project.employees;





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

select d.dept_name,avg(e.salary) as avg_salary 
from employees e
join departments d on e.department_id = d.department_id
group by d.dept_name
order by avg_salary desc;


select d.dept_name, count(l.layoff_id)
as total_layoffs
from layoffs l
join employees e on l.emp_id = e.emp_id
join departments d on e.department_id
= d.department_id
group by d.dept_name ;



with salaryrank as (
select  first_name,last_name, salary, 
rank () over (order by salary desc)
as rank_pos
from employees
)
select * from salaryrank;
select first_name, last_name, salary,
avg(salary) over () as overall_avg_salary
from employees;


create view active_employees 
as select
first_name , last_name, salary
from employees 
where status = 'active' ;

select * from active_employees;

delimiter //
create procedure
add_layoff (in p_emp_iD int, in p_date DATE, in p_reason 
varchar(255))
begin
insert into layoffs
(emp_id,layoff_date,reason)
values (p_emp_id,p_date,
p_reason);
update employees set 
status ='laid-off'
where emp_id =p_emp_id;
end//
delimiter ;








