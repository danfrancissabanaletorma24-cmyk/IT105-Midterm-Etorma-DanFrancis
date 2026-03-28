-- Create Database
CREATE DATABASE StudentSystem;
USE StudentSystem;

-- Table 1: Students
CREATE TABLE Students (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    StudentNumber VARCHAR(20) UNIQUE NOT NULL,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15),
    Course VARCHAR(50) NOT NULL,
    YearLevel INT DEFAULT 1,
    Status VARCHAR(20) DEFAULT 'Active'
);

-- Table 2: Courses
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY AUTO_INCREMENT,
    CourseCode VARCHAR(10) UNIQUE NOT NULL,
    CourseName VARCHAR(100) NOT NULL,
    Units INT NOT NULL,
    Instructor VARCHAR(100) NOT NULL
);

-- Table 3: Enrollments
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT NOT NULL,
    CourseID INT NOT NULL,
    Semester VARCHAR(20) NOT NULL,
    SchoolYear VARCHAR(20) NOT NULL,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Table 4: Grades
CREATE TABLE Grades (
    GradeID INT PRIMARY KEY AUTO_INCREMENT,
    EnrollmentID INT NOT NULL,
    MidtermGrade DECIMAL(5,2),
    FinalGrade DECIMAL(5,2),
    Remarks VARCHAR(50),
    FOREIGN KEY (EnrollmentID) REFERENCES Enrollments(EnrollmentID)
);