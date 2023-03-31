-- Query 12. Retrieve all employees whose address is in Houston, Texas.

SELECT FNAME, MINIT, LNAME, ADDRESS
FROM C_EMPLOYEE
WHERE ADDRESS LIKE '%Houston, TX%';

-- Q12A Find all employees who were born during the 1950s

SELECT FNAME, LNAME
FROM C_EMPLOYEE
WHERE TO_CHAR(BDATE, 'YYYY-MM-DD') LIKE '197_______';

-- Q13 Show the resulting salaries if every employee working on the ‘ProductX’ project is given a 10% raise

SELECT FNAME, LNAME, SALARY * 1.10 AS INCREASED_SAL
FROM C_EMPLOYEE, WORKS_ON, PROJECT
WHERE ESSN = SSN
    AND PNO = PNUMBER
    AND PNAME = 'ProductX';

-- Q14. Retrieve all employees in department 5 whose salary is $30,000 and $40,000

SELECT *
FROM C_EMPLOYEE
WHERE (SALARY BETWEEN 30000
    AND 40000)
    AND DNO = 5;

-- Q15 Retrieve a list of employees and the projects they are working on, ordered by department and, within each department, ordered alphabetically by last name, then first name

SELECT D.DNAME, E.FNAME, E.LNAME, P.PNAME
FROM C_EMPLOYEE E, WORKS_ON W, PROJECT P, C_DEPARTMENT D
WHERE E.SSN = W.ESSN
    AND W.PNO = P.PNUMBER
    AND D.DNUMBER = E.DNO
ORDER BY D.DNAME, E.FNAME, E.LNAME;