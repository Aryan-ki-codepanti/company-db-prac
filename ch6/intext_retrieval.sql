--Q0 Retrieve the birth date and address of the employee(s) whose name is ‘John B. Smith’.

SELECT BDATE, ADDRESS
FROM C_EMPLOYEE
WHERE FNAME = 'John'
    AND MINIT = 'B'
    AND LNAME = 'Smith';

--Q1 Retrieve the name and address of all employees who work for the ‘Research’ department

SELECT FNAME || ' ' || MINIT || '. ' || LNAME AS ENAME, ADDRESS
FROM C_EMPLOYEE, C_DEPARTMENT
WHERE DNUMBER = DNO
    AND DNAME = 'Research';

--OR w/ nested queries

SELECT FNAME, MINIT, LNAME, ADDRESS
FROM C_EMPLOYEE
WHERE DNO = (
        SELECT DNUMBER
        FROM C_DEPARTMENT
        WHERE DNAME = 'Research'
    );

--Q2 For every project located in ‘Stafford’, list the project number, the controlling department number, and the department manager’s last name, address, and birth date.

SELECT PNUMBER, DNUM, LNAME, ADDRESS, BDATE
FROM PROJECT, C_DEPARTMENT, C_EMPLOYEE
WHERE DNUMBER = DNUM -- controlling dept
    AND MGR_SSN = SSN -- dept manager's things in emp
    AND PLOCATION = 'Stafford';

--Q3 For each employee, retrieve the employee’s first and last name and the first and last name of his or her immediate supervisor.
--Self join

SELECT A.FNAME, A.LNAME, B.FNAME, B.LNAME
FROM C_EMPLOYEE A, C_EMPLOYEE B
WHERE A.SUPER_SSN = B.SSN;