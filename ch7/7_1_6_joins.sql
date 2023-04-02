--Q1A which retrieves the name and address of every employee who works for the ‘Research’ department

SELECT FNAME, LNAME, ADDRESS
FROM C_EMPLOYEE
    JOIN C_DEPARTMENT
    ON (DNUMBER = DNO)
WHERE DNAME = 'Research';

-- Q1B Natural join not works
-- SELECT FNAME, LNAME, ADDRESS
-- FROM C_EMPLOYEE
--     NATURAL JOIN C_DEPARTMENT DEPT(NAME,DNO,MGR_SNN,MGR_SD)
-- WHERE DNAME = 'Research';

--Q8B with OUTER JOIN on
--inner
SELECT A.FNAME AS EMP_NAME, B.FNAME AS SUPER_NAME
FROM C_EMPLOYEE A
    JOIN C_EMPLOYEE B
    ON (A.SUPER_SSN = B.SSN);

--left outer / gets people with supervisors and w/o also
SELECT A.FNAME AS EMP_NAME, B.FNAME AS SUPER_NAME
FROM C_EMPLOYEE A
    LEFT OUTER JOIN C_EMPLOYEE B
    ON (A.SUPER_SSN = B.SSN);

--right outer -- ppl w/ supervisor and ppl who are not supervisors
SELECT A.FNAME AS EMP_NAME, B.FNAME AS SUPER_NAME
FROM C_EMPLOYEE A
    RIGHT OUTER JOIN C_EMPLOYEE B
    ON (A.SUPER_SSN = B.SSN);

--full outer
SELECT A.FNAME AS EMP_NAME, B.FNAME AS SUPER_NAME
FROM C_EMPLOYEE A
    FULL OUTER JOIN C_EMPLOYEE B
    ON (A.SUPER_SSN = B.SSN);

-- cross join
SELECT *
FROM C_EMPLOYEE A
    CROSS JOIN C_EMPLOYEE B;

-- Q8C ACLMV$Alternate syntax for left outer join (+=) in cartesian prod

SELECT A.FNAME AS EMP_NAME, B.FNAME AS SUPER_NAME
FROM C_EMPLOYEE A, C_EMPLOYEE B
WHERE A.SUPER_SSN + = B.SSN;

--Q2A Using joins For every project located in ‘Stafford’, list the project number, the controlling department number, and the department manager’s last name, address, and birth date.

SELECT PNUMBER, DNUM, LNAME, ADDRESS, BDATE
FROM C_EMPLOYEE
    JOIN (PROJECT JOIN C_DEPARTMENT ON DNUM = DNUMBER)
    ON SSN = MGR_SSN
WHERE PLOCATION = 'Stafford';
