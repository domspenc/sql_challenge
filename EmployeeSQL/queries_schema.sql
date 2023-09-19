-- 1. List the employee number, last name, first name, sex, and salary of each employee
SELECT e.emp_no, e.first_name, e.last_name, e.sex, s.salary 
FROM employees e
JOIN salaries s
ON (e.emp_no = s.emp_no)
ORDER BY emp_no
;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986
SELECT first_name, last_name, hire_date 
FROM employees
WHERE hire_date LIKE '%1986'
ORDER BY hire_date
;

-- 3. List the manager of each department along with their department number, department name, 
-- employee number, last name, and first name
SELECT e.emp_no, e.first_name, e.last_name, d.dept_no, d.dept_name 
FROM employees e
JOIN dept_manager dm
ON e.emp_no = dm.emp_no
JOIN departments d
ON dm.dept_no = d.dept_no
ORDER BY emp_no
;

-- 4. List the department number for each employee along with that employee’s employee number, 
-- last name, first name, and department name
SELECT e.emp_no, e.first_name, e.last_name, d.dept_no, d.dept_name 
FROM employees e
JOIN dept_employees de
ON e.emp_no = de.emp_no
JOIN departments d
ON de.dept_no = d.dept_no
ORDER BY emp_no
;

-- 5. List first name, last name, and sex of each employee whose first name is Hercules and 
-- whose last name begins with the letter B
SELECT first_name, last_name, sex 
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
ORDER BY last_name
;

-- 6. List each employee in the Sales department, including their employee number, last name, 
-- and first name
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name 
FROM employees e
JOIN dept_employees de
ON e.emp_no = de.emp_no
JOIN departments d
ON de.dept_no = d.dept_no
WHERE dept_name = 'Sales'
ORDER BY emp_no
;

-- 7. List each employee in the Sales and Development departments, including their employee
-- number, last name, first name, and department name
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name 
FROM employees e
JOIN dept_employees de
ON e.emp_no = de.emp_no
JOIN departments d
ON de.dept_no = d.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development'
ORDER BY emp_no
;

-- 8. List the frequency counts, in descending order, of all the employee last names 
-- (that is, how many employees share each last name)
SELECT last_name, COUNT(last_name) AS "# of people with the same last name"
FROM employees
GROUP BY last_name
ORDER BY "# of people with the same last name" DESC
;
