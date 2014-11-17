CREATE TABLE department (
 DepartmentID INT,
 DepartmentName VARCHAR(20),
 PRIMARY KEY( DepartmentID )
);

CREATE TABLE employee (
 LastName VARCHAR(20),
 DepartmentID INT,
 FOREIGN KEY ( DepartmentID ) REFERENCES department( DepartmentID )
);
