-- Part 1

-- Calculate the count of all grades in the system

SELECT COUNT(grade) AS grade_count
FROM grade;

-- Calculate the count of all grades per Teacher in the system

SELECT t.Id AS teacher_id, t.FirstName, t.LastName, COUNT(g.Id) AS grade_count
FROM teacher t
LEFT JOIN grade g ON t.Id = g.TeacherID
GROUP BY t.Id, t.FirstName, t.LastName;

-- Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)

SELECT t.Id AS teacher_id, t.FirstName, t.LastName, COUNT(g.Id) AS grade_count
FROM teacher t
LEFT JOIN grade g ON t.Id = g.TeacherID
INNER JOIN student s ON g.StudentID = s.Id
WHERE s.Id < 100
GROUP BY t.Id, t.FirstName, t.LastName;


-- Find the Maximal Grade, and the Average Grade per Student on all grades in the system

SELECT
  StudentID,
  MAX(Grade) AS MaxGrade,
  AVG(Grade) AS AverageGrade
FROM
  grade
GROUP BY
  StudentID;


-- Part 2

-- Calculate the count of all grades per Teacher in the system and filter only grade count greater then 200

SELECT t.TeacherID, t.FirstName, t.LastName, COUNT(g.Grade) AS grade_count
FROM teacher t
LEFT JOIN grade g ON t.teacherID = g.teacherID
GROUP BY t.TeacherID, t.FirstName, t.LastName
HAVING COUNT(g.Grade) > 200;

-- Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100) and filter teachers with more than 50 Grade count

SELECT t.teacherID, t.firstname, t.lastname, COUNT(g.grade) AS grade_count
FROM teacher t
LEFT JOIN grade g ON t.teacherID = g.teacherID
WHERE g.StudentID < 100
GROUP BY t.teacherID, t.firstname, t.lastname
HAVING COUNT(g.grade) > 50;

-- Find the Grade Count, Maximal Grade, and the Average Grade per Student on all grades in the system. Filter only records where Maximal Grade is equal to Average Grade

SELECT
    g.StudentID,
    s.FirstName,
    s.LastName,
    COUNT(g.Grade) AS grade_count,
    MAX(g.Grade) AS max_grade,
    AVG(g.Grade) AS avg_grade
FROM
    grade g
JOIN
    student s ON g.studentID = s.studentID
GROUP BY
    g.studentID, s.firstname, s.lastname
HAVING
    MAX(g.grade) = (SELECT AVG(grade) FROM grade);

-- Part 3

-- Create new view (vw_StudentGrades) that will List all StudentIds and count of Grades per student

CREATE VIEW student_grades_view
SELECT
    studentID,
    COUNT(*) AS grade_count
FROM
    grade
GROUP BY
    studentID;
	
	SELECT * FROM student_grades_view;

-- Change the view to show Student First and Last Names instead of StudentID

CREATE VIEW student_grades_view AS
SELECT
    s.firstName,
    s.lastName,
    COUNT(g.grade) AS grade_count
FROM
    grade g
JOIN
    student s ON g.studentID = s.studentID
GROUP BY
     s.firstName, s.lastName;

SELECT * FROM student_grades_view;

-- List all rows from view ordered by biggest Grade Count

SELECT *
FROM student_grades_view
ORDER BY grade_count DESC;

-- Create new view (vw_StudentGradeDetails) that will List all Students (FirstName and LastName) and Count the courses he passed through the exam

CREATE VIEW student_grade_details_view AS
SELECT
    s.firstname,
    s.lastname,
    COUNT(g.courseID) AS passed_course_count
FROM
    student s
JOIN
    grade g ON s.studentID = g.studentID
WHERE
    g.grade >= 60
GROUP BY
    s.firstname,
    s.lastname;

SELECT * FROM student_grade_details_view;

-- Selects

SELECT * FROM student
SELECT * FROM teacher
SELECT * FROM grade
SELECT * FROM gradedetails
SELECT * FROM course
SELECT * FROM achievementtype

-- Tables

CREATE TABLE IF NOT EXISTS student
(
	StudentID serial PRIMARY KEY,
	FirstName varchar(20) NOT NULL,
	LastName varchar(30) NOT NULL,
	DateOfBirth date NOT NULL,
	EnrolledDate date NOT NULL,
	Gender nchar(1) NOT NULL,
	NationalIDNumber INTEGER NOT NULL,
	StudentCardNumber INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS teacher
(
	TeacherID serial PRIMARY KEY,
	FirstName varchar(20) NOT NULL,
	LastName varchar(30) NOT NULL,
	DateOfBirth date NOT NULL,
	AcademicRank varchar(20) NOT NULL,
	HireDate date NOT NULL
);

CREATE TABLE IF NOT EXISTS course
(
	CourseID serial PRIMARY KEY,
	Name varchar(50) NOT NULL,
	Credit INTEGER NOT NULL,
	AcademicYear varchar(9) NOT NULL,
	Semester smallint NOT NULL
);

CREATE TABLE IF NOT EXISTS grade
(
	Id serial PRIMARY KEY,
	StudentID INTEGER NOT NULL,
	CourseID INTEGER NOT NULL,
	TeacherID INTEGER NOT NULL,
	Grade smallint NOT NULL,
	Comment varchar(100) NOT NULL,
	CreatedDate date NOT NULL,
	foreign key (StudentID) references student (StudentID),
	foreign key (CourseID) references course (CourseID),
	foreign key (TeacherID) references teacher (TeacherID)
);

CREATE TABLE IF NOT EXISTS achievementtype
(
	AchievementTypeID serial PRIMARY KEY,
	Name varchar(50) NOT NULL,
	Description varchar(100) NOT NULL,
	ParticipationRate decimal(3,2)
);

CREATE TABLE IF NOT EXISTS gradedetails
(
	Id serial PRIMARY KEY,
	CourseID INTEGER NOT NULL,
	AchievementTypeID INTEGER NOT NULL,
	AchievementPoints INTEGER NOT NULL,
	AchievementMaxPoints INTEGER NOT NULL,
	AchievementDate date NOT NULL,
	foreign key (CourseID) references course (CourseID),
	foreign key (AchievementTypeID) references achievementtype (AchievementTypeID)
);


-- Dummy Data

INSERT INTO student (FirstName, LastName, DateOfBirth, EnrolledDate, Gender, NationalIDNumber, StudentCardNumber)
VALUES
    ('John', 'Doe', '2000-01-01', '2021-09-01', 'M', 123456789, 987654321),
    ('Jane', 'Smith', '1999-05-10', '2022-02-15', 'F', 987654321, 123456789),
    ('Michael', 'Johnson', '2002-03-20', '2021-08-10', 'M', 555555555, 111111111),
    ('Emily', 'Williams', '2001-07-05', '2022-01-20', 'F', 444444444, 222222222),
    ('David', 'Brown', '2003-12-15', '2021-07-05', 'M', 333333333, 333333333),
    ('Olivia', 'Jones', '2000-11-25', '2022-03-05', 'F', 222222222, 444444444),
    ('Daniel', 'Garcia', '2002-06-30', '2021-06-15', 'M', 111111111, 555555555),
    ('Sophia', 'Martinez', '2001-09-12', '2022-04-10', 'F', 999999999, 666666666),
    ('William', 'Anderson', '2003-02-08', '2021-05-20', 'M', 888888888, 777777777),
    ('Ava', 'Thomas', '2000-08-18', '2022-05-25', 'F', 777777777, 888888888);

INSERT INTO teacher (FirstName, LastName, DateOfBirth, AcademicRank, HireDate)
VALUES
    ('Robert', 'Wilson', '1975-03-12', 'Professor', '2010-09-01'),
    ('Jennifer', 'Taylor', '1980-07-22', 'Associate Professor', '2012-02-15'),
    ('Christopher', 'Clark', '1982-11-05', 'Assistant Professor', '2011-08-10'),
    ('Jessica', 'Walker', '1978-09-30', 'Professor', '2013-01-20'),
    ('Matthew', 'Lewis', '1985-06-18', 'Associate Professor', '2010-07-05'),
    ('Samantha', 'Young', '1983-04-08', 'Assistant Professor', '2012-03-05'),
    ('Andrew', 'Harris', '1976-10-25', 'Professor', '2011-06-15'),
    ('Lauren', 'Allen', '1981-12-15', 'Associate Professor', '2013-04-10'),
    ('Joshua', 'Wright', '1979-02-03', 'Assistant Professor', '2010-05-20'),
    ('Emily', 'King', '1984-08-28', 'Professor', '2012-05-25');

INSERT INTO course (Name, Credit, AcademicYear, Semester)
VALUES
    ('Mathematics', 3, '2022-2023', 1),
    ('English Literature', 4, '2022-2023', 1),
    ('Computer Science', 3, '2022-2023', 2),
    ('Physics', 3, '2022-2023', 2);

INSERT INTO grade (StudentID, CourseID, TeacherID, Grade, Comment, CreatedDate)
VALUES
    (1, 1, 1, 85, 'Good job!', '2023-05-01'),
    (2, 1, 1, 92, 'Excellent work!', '2023-05-02'),
    (3, 1, 2, 78, 'Keep up the effort.', '2023-05-03'),
    (4, 1, 2, 90, 'Well done!', '2023-05-04'),
    (5, 2, 3, 88, 'Impressive!', '2023-05-05'),
    (6, 2, 3, 95, 'Fantastic performance!', '2023-05-06'),
    (7, 2, 4, 72, 'Work on improving.', '2023-05-07'),
    (8, 2, 4, 81, 'Good effort.', '2023-05-08'),
    (9, 3, 5, 93, 'Great work!', '2023-05-09'),
    (10, 3, 5, 87, 'Well done!', '2023-05-10');

INSERT INTO achievementtype (Name, Description, ParticipationRate)
VALUES
    ('Quiz', 'Regular quiz assessment', 0.8),
    ('Project', 'Individual or group project', 1.0),
    ('Presentation', 'Oral presentation', 0.9),
    ('Exam', 'Final examination', 1.0);

INSERT INTO gradedetails (CourseID, AchievementTypeID, AchievementPoints, AchievementMaxPoints, AchievementDate)
VALUES
    (1, 1, 17, 20, '2023-05-15'),
    (1, 2, 35, 40, '2023-05-16'),
    (1, 3, 27, 30, '2023-05-17'),
    (2, 1, 19, 20, '2023-05-18'),
    (2, 2, 37, 40, '2023-05-19'),
    (2, 3, 30, 30, '2023-05-20'),
    (3, 1, 16, 20, '2023-05-21'),
    (3, 2, 34, 40, '2023-05-22'),
    (3, 3, 29, 30, '2023-05-23'),
    (4, 1, 18, 20, '2023-05-24'),
    (4, 2, 38, 40, '2023-05-25'),
    (4, 3, 28, 30, '2023-05-26');




























