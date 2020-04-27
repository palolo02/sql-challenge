-- 1. List the following details of each employee: 
-- employee number, last name, first name, gender, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employee e
JOIN salaries s
	ON e.emp_no = s.emp_no
ORDER BY e.last_name,e.first_name;

-- 2. List employees who were hired in 1986.
SELECT e.emp_no, e.last_name, e.first_name, e.gender, e.hire_date
FROM employee e
WHERE e.hire_date >= '1986-01-01' and e.hire_date <= '1986-12-31'
ORDER BY e.hire_date, e.last_name,e.first_name;

-- 3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, 
-- first name, and start and end employment dates.
SELECT d.dept_no, d.dept_name, m.emp_no,m.last_name,
m.first_name, dm.from_date, dm.to_date
FROM employee m
JOIN dept_manager dm
	ON dm.emp_no = m.emp_no
JOIN departments d
	ON d.dept_no = dm.dept_no
ORDER BY d.dept_no, dm.from_date, dm.to_date

-- 4.List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employee e
JOIN dept_emp de
	ON de.emp_no = e.emp_no
JOIN departments d
	ON d.dept_no = de.dept_no
ORDER BY d.dept_no, e.last_name, e.first_name

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT e.first_name, e.last_name
FROM employee e
WHERE e.first_name = 'Hercules' AND e.last_name LIKE 'B%'

-- 6. List all employees in the Sales department, including their 
-- employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employee e
JOIN dept_emp de
	ON de.emp_no = e.emp_no
JOIN departments d
	ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales'
ORDER BY d.dept_no, e.last_name, e.first_name

-- 7. List all employees in the Sales and Development departments, including their 
-- employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employee e
JOIN dept_emp de
	ON de.emp_no = e.emp_no
JOIN departments d
	ON d.dept_no = de.dept_no
WHERE d.dept_name IN ('Sales','Development')
ORDER BY d.dept_no, e.last_name, e.first_name


-- 8. In descending order, list the frequency count of employee last names, i.e., 
-- how many employees share each last name.
SELECT e.last_name, COUNT(*) Freq
FROM employee e
GROUP BY e.last_name
ORDER BY Freq DESC