USE StudentSystem;

-- ============================================================================
-- SELECT QUERIES
-- ============================================================================

-- Display all students
SELECT * FROM Students;

-- Display Computer Science students only
SELECT * FROM Students WHERE Course = 'Computer Science';

-- Display students with grades above 85
SELECT s.Name, g.FinalGrade
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
JOIN Grades g ON e.EnrollmentID = g.EnrollmentID
WHERE g.FinalGrade > 85;

-- ============================================================================
-- INSERT QUERIES
-- ============================================================================

-- Add a new student
INSERT INTO Students (StudentNumber, Name, Email, Phone, Course, YearLevel, Status) 
VALUES ('2024-013', 'John Drex Cantor', 'johndrex.cantor@bicol-u.edu.ph', '09123456804', 'Computer Science', 1, 'Active');

-- Add a new course
INSERT INTO Courses (CourseCode, CourseName, Units, Instructor) 
VALUES ('CS104', 'Artificial Intelligence', 3, 'Prof. Maria Reyes');

-- Enroll a student in a course
INSERT INTO Enrollments (StudentID, CourseID, Semester, SchoolYear) 
VALUES (1, 13, '1st Semester', '2024-2025');

-- Add grades for a student
INSERT INTO Grades (EnrollmentID, MidtermGrade, FinalGrade, Remarks) 
VALUES (17, 85.00, 88.00, 'Passed');

-- ============================================================================
-- UPDATE QUERIES
-- ============================================================================

-- Update student year level
UPDATE Students SET YearLevel = 2 WHERE StudentID = 1;

-- Update student status to graduated
UPDATE Students SET Status = 'Graduated' WHERE StudentID = 10;

-- Update course instructor
UPDATE Courses SET Instructor = 'Prof. Cecilia Perez' WHERE CourseCode = 'CS202';

-- Update student grade
UPDATE Grades SET FinalGrade = 90.00 WHERE EnrollmentID = 1;

-- ============================================================================
-- DELETE QUERIES
-- ============================================================================

-- Delete a grade record
DELETE FROM Grades WHERE GradeID = 16;

-- Delete an enrollment (delete grades first, then enrollment)
DELETE FROM Grades WHERE EnrollmentID = 16;
DELETE FROM Enrollments WHERE EnrollmentID = 16;

-- Delete a student (delete related records first)
DELETE FROM Grades WHERE EnrollmentID IN (SELECT EnrollmentID FROM Enrollments WHERE StudentID = 11);
DELETE FROM Enrollments WHERE StudentID = 11;
DELETE FROM Students WHERE StudentID = 11;

-- Delete a course (delete related records first)
DELETE FROM Grades WHERE EnrollmentID IN (SELECT EnrollmentID FROM Enrollments WHERE CourseID = 12);
DELETE FROM Enrollments WHERE CourseID = 12;
DELETE FROM Courses WHERE CourseID = 12;

-- ============================================================================
-- JOIN QUERIES
-- ============================================================================

-- Show students with their enrolled courses
SELECT s.Name, c.CourseName, c.Instructor
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
JOIN Courses c ON e.CourseID = c.CourseID;

-- Show students with their grades
SELECT s.Name, c.CourseName, g.MidtermGrade, g.FinalGrade, g.Remarks
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
JOIN Courses c ON e.CourseID = c.CourseID
JOIN Grades g ON e.EnrollmentID = g.EnrollmentID;

-- Show total courses per student
SELECT s.Name, COUNT(e.CourseID) AS TotalCourses
FROM Students s
LEFT JOIN Enrollments e ON s.StudentID = e.StudentID
GROUP BY s.StudentID, s.Name;

-- ============================================================================
-- SUBQUERY QUERIES
-- ============================================================================

-- Find students enrolled in Database Management
SELECT Name, Email 
FROM Students 
WHERE StudentID IN (
    SELECT StudentID 
    FROM Enrollments 
    WHERE CourseID = (SELECT CourseID FROM Courses WHERE CourseName = 'Database Management')
);

-- Find students with grades above 90
SELECT Name, Email
FROM Students
WHERE StudentID IN (
    SELECT e.StudentID
    FROM Enrollments e
    JOIN Grades g ON e.EnrollmentID = g.EnrollmentID
    WHERE g.FinalGrade > 90
);

-- Find courses with no students enrolled
SELECT CourseName
FROM Courses
WHERE CourseID NOT IN (
    SELECT DISTINCT CourseID FROM Enrollments
);