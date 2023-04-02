SELECT SALARY
FROM C_EMPLOYEE;

-- notice the diff
SELECT SUM(SALARY)
FROM C_EMPLOYEE;

SELECT SUM(DISTINCT SALARY)
FROM C_EMPLOYEE;

-- Q19 . Find the sum of the salaries of all employees, the maximum salary, the minimum salary, and the average salary

SELECT SUM(SALARY), MAX(SALARY), MIN(SALARY), AVG(SALARY)
FROM C_EMPLOYEE;

--Q19A
SELECT SUM(SALARY) TOTAL_SAL, MAX(SALARY) HIGHEST_SAL, MIN(SALARY) LOWEST_SAL, AVG(SALARY) AVG_SAL
FROM C_EMPLOYEE;

--Q20 Find the sum of the salaries of all employees of the ‘Research’ department, as well as the maximum salary, the minimum salary, and the average salary in this department.

SELECT SUM(SALARY) TOTAL_SAL, MAX(SALARY) HIGHEST_SAL, MIN(SALARY) LOWEST_SAL, AVG(SALARY) AVG_SAL
FROM C_EMPLOYEE, C_DEPARTMENT
WHERE DNO = DNUMBER
    AND DNAME = 'Research';

-- Queries 21 and 22. Retrieve the total number of employees in the company (Q21) and the number of employees in the ‘Research’ department (Q22).
SELECT COUNT( * )
FROM C_EMPLOYEE;

SELECT COUNT( * )
FROM C_EMPLOYEE
WHERE DNO = (
        SELECT DNUMBER
        FROM C_DEPARTMENT
        WHERE DNAME = 'Research'
    );

-- Q23 Count the number of distinct salary values in the database.
SELECT COUNT(DISTINCT(SALARY))
FROM C_EMPLOYEE;

-- Q5 to retrieve the names of all employees who have two or more dependents (Query 5), we can write the following:
SELECT FNAME, LNAME
FROM C_EMPLOYEE
WHERE (
        SELECT COUNT( * )
        FROM DEPENDENT
        WHERE ESSN = SSN
    ) >= 2;

