SELECT * FROM employee CROSS JOIN department;

SELECT * FROM employee INNER JOIN department ON employee.DepartmentID = department.DepartmentID;

SELECT * FROM employee INNER JOIN department USING (DepartmentID);

SELECT * FROM employee NATURAL JOIN department;

SELECT * FROM employee LEFT OUTER JOIN department ON employee.DepartmentID = department.DepartmentID;
