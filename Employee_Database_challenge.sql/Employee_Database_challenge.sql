
--deliverable 1

SELECT emp_no, first_name, last_name, birth_date
INTO deliverable_1
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')


DROP TABLE deliverable_1


SELECT deliverable_1.emp_no, deliverable_1.first_name, deliverable_1.last_name, titles.title, titles.from_date, titles.to_date
INTO deliverable_1_table
FROM deliverable_1
INNER JOIN titles
ON deliverable_1.emp_no = titles.emp_no
ORDER BY deliverable_1.emp_no;

SELECT * FROM deliverable_1_table

-- Use Dictinct with Orderby to remove duplicate rows
DROP TABLE deliverable_1_table_filtered

SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO deliverable_1_table_filtered
FROM deliverable_1_table
WHERE to_date = '9999-01-01'
ORDER BY emp_no, last_name DESC;

SELECT * FROM deliverable_1_table_filtered

DROP TABLE deliverable_1_table_filtered_final

SELECT COUNT(title), title
INTO deliverable_1_table_filtered_final
FROM deliverable_1_table_filtered
GROUP BY title
ORDER BY COUNT(title) DESC;

SELECT * FROM deliverable_1_table_filtered_final

--deliverable 2

DROP TABLE d2_employees 

SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, birth_date
INTO d2_employees
FROM employees

SELECT * FROM d2_employees

DROP TABLE d2_dept_emp

SELECT emp_no, from_date, to_date
INTO d2_dept_emp
FROM dept_emp

SELECT * FROM d2_dept_emp

DROP TABLE d2_title

SELECT emp_no, title
INTO d2_title
FROM titles

SELECT * FROM d2_title

DROP TABLE deliverable_2_employees_dept_emp 

SELECT d2_employees.emp_no, d2_employees.first_name, d2_employees.last_name, d2_employees.birth_date, 
d2_dept_emp.from_date, d2_dept_emp.to_date
INTO d2_employees_dept_emp 
FROM d2_employees
INNER JOIN d2_dept_emp
ON d2_employees.emp_no = d2_dept_emp.emp_no;

SELECT * FROM d2_employees_dept_emp

SELECT d2_employees_dept_emp.emp_no, d2_employees_dept_emp.first_name, d2_employees_dept_emp.last_name, d2_employees_dept_emp.birth_date,
d2_employees_dept_emp.from_date, d2_employees_dept_emp.to_date, d2_title.title
INTO d2_employees_dept_emp_title
FROM d2_employees_dept_emp
INNER JOIN d2_title
ON d2_employees_dept_emp.emp_no = d2_title.emp_no;

DROP TABLE update_d2_table

SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, birth_date, from_date, to_date, title
INTO update_d2_table
FROM d2_employees_dept_emp_title
WHERE (to_date = '9999-01-01') AND (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no;

SELECT * FROM update_d2_table