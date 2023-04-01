-- Q4A

SELECT PNUMBER
FROM PROJECT
WHERE PNUMBER IN(
        SELECT PNO
        FROM C_EMPLOYEE, WORKS_ON
        WHERE SSN = ESSN
            AND LNAME = 'Smith'
    )
    OR PNUMBER IN (
        SELECT PNUMBER
        FROM C_EMPLOYEE, C_DEPARTMENT, PROJECT
        WHERE SSN = MGR_SSN
            AND DNUM = DNUMBER
            AND LNAME = 'Smith'
    );

--  select the Essns of all employees who work the same (project, hours) combination on some project that employee ‘John Smith’ (whose Ssn = ‘123456789’)
SELECT DISTINCT A.ESSN
FROM WORKS_ON A
WHERE (PNO, HOURS) IN (
        SELECT PNO, HOURS
        FROM WORKS_ON W
        WHERE W.ESSN = '123456789'
    );

-- If john Smith
SELECT DISTINCT A.ESSN
FROM WORKS_ON A
WHERE (PNO, HOURS) IN (
        SELECT PNO, HOURS
        FROM C_EMPLOYEE E, WORKS_ON W
        WHERE W.ESSN = E.SSN
            AND FNAME = 'John'
            AND LNAME = 'Smith'
    );

-- The names of employees whose salary is greater than the salary of all the employees in department 5
SELECT FNAME, LNAME
FROM C_EMPLOYEE
WHERE SALARY > ALL (
        SELECT SALARY
        FROM C_EMPLOYEE
        WHERE DNO = 5
    );

--or
SELECT FNAME, LNAME
FROM C_EMPLOYEE
WHERE SALARY > (
        SELECT MAX(SALARY)
        FROM C_EMPLOYEE
        WHERE DNO = 5
    );

-- Q16A Retrieve the name of each employee who has a dependent with the same first name and is the same sex as the employee.

SELECT FNAME, LNAME
FROM C_EMPLOYEE E, DEPENDENT D
WHERE ESSN = SSN
    AND E.SEX = D.SEX
    AND E.FNAME = D.DEPENDENT_NAME;

--or
SELECT FNAME, LNAME
FROM C_EMPLOYEE E
WHERE (FNAME, SEX) IN (
        SELECT DEPENDENT_NAME, SEX
        FROM DEPENDENT D
        WHERE E.SSN = D.ESSN
    );

--or
SELECT FNAME, LNAME
FROM C_EMPLOYEE E
WHERE SSN IN (
        SELECT D.ESSN
        FROM DEPENDENT D
        WHERE E.SEX = D.SEX
            AND E.FNAME = D.DEPENDENT_NAME
    );