CREATE TABLE IF NOT EXISTS student
(
	Id INTEGER PRIMARY KEY,
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
	Id INTEGER PRIMARY KEY,
	FirstName varchar(20) NOT NULL,
	LastName varchar(30) NOT NULL,
	DateOfBirth date NOT NULL,
	AcademicRank varchar(20) NOT NULL,
	HireDate date NOT NULL
);

CREATE TABLE IF NOT EXISTS grade
(
	Id INTEGER PRIMARY KEY,
	StudentID INTEGER NOT NULL,
	CourseID INTEGER NOT NULL,
	TeacherID INTEGER NOT NULL,
	Grade smallint NOT NULL,
	Comment varchar(100) NOT NULL,
	CreatedDate date NOT NULL
);

CREATE TABLE IF NOT EXISTS gradedetails
(
	Id INTEGER PRIMARY KEY,
	CourseID INTEGER NOT NULL,
	AchievementTypeID INTEGER NOT NULL,
	AchievementPoints INTEGER NOT NULL,
	AchievementMaxPoints INTEGER NOT NULL,
	AchievementDate date NOT NULL
);

CREATE TABLE IF NOT EXISTS course
(
	Id INTEGER PRIMARY KEY,
	Name varchar(50) NOT NULL,
	Credit INTEGER NOT NULL,
	AcademicYear date NOT NULL,
	Semester smallint NOT NULL
);

CREATE TABLE IF NOT EXISTS achievementtype
(
	Id INTEGER PRIMARY KEY,
	Name varchar(50) NOT NULL,
	Description varchar(100) NOT NULL,
	ParticipationRate decimal(3,2)
);