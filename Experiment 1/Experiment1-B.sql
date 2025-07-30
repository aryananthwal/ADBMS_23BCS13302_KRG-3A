-- Create Department Table

CREATE TABLE Department (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(100)
);

-- Create Course Table

CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

-- Insert Departments
INSERT INTO Department VALUES
(1, 'Computer Science'),
(2, 'Physics'),
(3, 'Mathematics'),
(4, 'Chemistry'),
(5, 'Biology');


-- Insert Course
INSERT INTO Course VALUES
(101, 'Data Structures', 1),
(102, 'Operating Systems', 1),
(103, 'Quantum Mechanics', 3),
(104, 'Electromagnetism', 2),
(105, 'Linear Algebra', 3),
(106, 'Calculus', 3),
(107, 'Organic Chemistry', 4),
(108, 'Physical Chemistry', 4),
(109, 'Genetics', 5),
(110, 'Molecular Biology', 5);


SELECT DeptName
FROM Department
WHERE DeptID IN (

SELECT DeptID 
FROM COURSE
GROUP BY DeptID
HAVING COUNT(*) > 2
)


-- Step 1: Create Login at server level (run this in the master database)
CREATE LOGIN AMAN 
WITH PASSWORD = 'AMAN@04';

-- Step 2: Switch to your target database (replace with your actual database name)
USE DB_KRG_3A;

-- Step 3: Create a user for that login inside the current database
CREATE USER AMAN_04 FOR LOGIN AMAN;

-- Step 4: Grant SELECT-only access on the Course table
GRANT SELECT ON Course TO AMAN;

