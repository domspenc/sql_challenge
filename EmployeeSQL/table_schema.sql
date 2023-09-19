-- Create titles table
CREATE TABLE titles (
	title_id VARCHAR NOT NULL,
	title VARCHAR,
	PRIMARY KEY (title_id)
);

-- Create employees table
-- Must be done after titles table because of the associated foreign key
-- I only added varchar limits to values that would be reliably consistent
CREATE TABLE employees (
	emp_no INT NOT NULL,
	title_id VARCHAR NOT NULL,
	birth_date VARCHAR(10),
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR(1),
	hire_date VARCHAR(10),
	PRIMARY KEY (emp_no),
	FOREIGN KEY (title_id) REFERENCES titles(title_id)
);

-- Create salaries table
-- Must be done after employees table because of the associated foreign key
CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Create departments table
CREATE TABLE departments (
	dept_no VARCHAR NOT NULL,
	dept_name VARCHAR,
	PRIMARY KEY (dept_no)
);

-- Create dept_employees table
-- Must be done after departments table because of the associated foreign key
CREATE TABLE dept_employees (
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

-- Create dept_manager table
-- Must be done after departments table because of the associated foreign key
CREATE TABLE dept_manager (
	dept_no VARCHAR NOT NULL,
	emp_no INT NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY (emp_no, dept_no)
);