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

-- Queries 9 and 10. Select all EMPLOYEE Ssns (Q9) and all combinations of EMPLOYEE Ssn and DEPARTMENT Dname (Q10) in the database

SELECT SSN
FROM C_EMPLOYEE;

SELECT SSN, DNAME
FROM C_EMPLOYEE, C_DEPARTMENT;

-- All attrs of C_department
SELECT SSN, C_DEPARTMENT. *
FROM C_EMPLOYEE, C_DEPARTMENT;

-- Query Q1C retrieves all the attribute values of any EMPLOYEE who works in  DEPARTMENT number 5

SELECT *
FROM C_EMPLOYEE
WHERE DNO = 5;

-- Query Q1D retrieves all the attributes of an EMPLOYEE and the attributes of the DEPARTMENT in which he or she works for every employee of the ‘Research’ department


SELECT *
FROM C_EMPLOYEE, C_DEPARTMENT
WHERE DNAME = 'Research'
    AND DNO = DNUMBER;

-- Q10A specifies the CROSS PRODUCT of the EMPLOYEE and DEPARTMENT relations.

SELECT *
FROM C_EMPLOYEE, C_DEPARTMENT;

-- Q11 Retrieve the salary of every employee all or nothin
SELECT ALL SALARY
FROM C_EMPLOYEE;

-- Q11A  all distinct salary  values
SELECT DISTINCT SALARY
FROM C_EMPLOYEE;

-- Query4
SELECT DISTINCT PNO
FROM C_EMPLOYEE, WORKS_ON
WHERE SSN = ESSN
    AND LNAME = 'Smith'

UNION

SELECT DISTINCT PNUMBER
FROM C_EMPLOYEE, C_DEPARTMENT, PROJECT
WHERE DNUM = DNUMBER
    AND MGR_SSN = SSN
    AND LNAME = 'Smith';