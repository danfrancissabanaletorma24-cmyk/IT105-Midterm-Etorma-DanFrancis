USE StudentSystem;

-- Insert 12 Students
INSERT INTO Students (StudentNumber, Name, Email, Phone, Course, YearLevel, Status) VALUES
('2024-001', 'Juan Dela Cruz', 'juan.delacruz@bicol-u.edu.ph', '09123456789', 'Computer Science', 1, 'Active'),
('2024-002', 'Maria Santos', 'maria.santos@bicol-u.edu.ph', '09123456790', 'Computer Science', 1, 'Active'),
('2024-003', 'Jose Reyes', 'jose.reyes@bicol-u.edu.ph', '09123456791', 'Information Technology', 1, 'Active'),
('2024-004', 'Ana Gonzales', 'ana.gonzales@bicol-u.edu.ph', '09123456792', 'Computer Science', 1, 'Active'),
('2023-001', 'Carlos Lopez', 'carlos.lopez@bicol-u.edu.ph', '09123456793', 'Information Technology', 2, 'Active'),
('2023-002', 'Elena Martinez', 'elena.martinez@bicol-u.edu.ph', '09123456794', 'Computer Science', 2, 'Active'),
('2023-003', 'Ramon Fernandez', 'ramon.fernandez@bicol-u.edu.ph', '09123456795', 'Information Technology', 2, 'Active'),
('2022-001', 'Isabella Cruz', 'isabella.cruz@bicol-u.edu.ph', '09123456796', 'Computer Science', 3, 'Active'),
('2022-002', 'Miguel Torres', 'miguel.torres@bicol-u.edu.ph', '09123456797', 'Information Technology', 3, 'Active'),
('2021-001', 'Sofia Alvarez', 'sofia.alvarez@bicol-u.edu.ph', '09123456798', 'Computer Science', 4, 'Active'),
('2024-005', 'Diego Ramirez', 'diego.ramirez@bicol-u.edu.ph', '09123456799', 'Information Technology', 1, 'Active'),
('2023-004', 'Camille Flores', 'camille.flores@bicol-u.edu.ph', '09123456800', 'Computer Science', 2, 'Active');

-- Insert 12 Courses
INSERT INTO Courses (CourseCode, CourseName, Units, Instructor) VALUES
('CS101', 'Introduction to Programming', 3, 'Prof. Maria Reyes'),
('CS102', 'Data Structures', 3, 'Prof. Antonio Garcia'),
('CS103', 'Database Management', 3, 'Prof. Luz Santos'),
('IT101', 'Web Development', 3, 'Prof. Ricardo Dimagiba'),
('IT102', 'Networking Basics', 3, 'Prof. Emmanuel Luna'),
('CS201', 'Object-Oriented Programming', 3, 'Prof. Cecilia Perez'),
('CS202', 'Software Engineering', 3, 'Prof. Maria Reyes'),
('IT201', 'System Analysis', 3, 'Prof. Ricardo Dimagiba'),
('CS301', 'Mobile Application Development', 3, 'Prof. Antonio Garcia'),
('IT301', 'Information Security', 3, 'Prof. Emmanuel Luna'),
('CS401', 'Capstone Project', 3, 'Prof. Maria Reyes'),
('IT401', 'Internship', 3, 'Prof. Ricardo Dimagiba');

-- Insert 16 Enrollments
INSERT INTO Enrollments (StudentID, CourseID, Semester, SchoolYear) VALUES
(1, 1, '1st Semester', '2024-2025'),
(1, 2, '1st Semester', '2024-2025'),
(2, 1, '1st Semester', '2024-2025'),
(2, 3, '1st Semester', '2024-2025'),
(3, 4, '1st Semester', '2024-2025'),
(3, 5, '1st Semester', '2024-2025'),
(4, 1, '1st Semester', '2024-2025'),
(4, 2, '1st Semester', '2024-2025'),
(5, 4, '1st Semester', '2024-2025'),
(5, 6, '1st Semester', '2024-2025'),
(6, 3, '1st Semester', '2024-2025'),
(6, 7, '1st Semester', '2024-2025'),
(7, 5, '1st Semester', '2024-2025'),
(7, 8, '1st Semester', '2024-2025'),
(8, 2, '1st Semester', '2024-2025'),
(8, 9, '1st Semester', '2024-2025');

-- Insert 16 Grades
INSERT INTO Grades (EnrollmentID, MidtermGrade, FinalGrade, Remarks) VALUES
(1, 85.50, 88.00, 'Passed'),
(2, 78.00, 82.50, 'Passed'),
(3, 92.00, 94.00, 'Passed'),
(4, 75.50, 78.00, 'Passed'),
(5, 88.00, 90.00, 'Passed'),
(6, 82.00, 85.00, 'Passed'),
(7, 95.00, 96.00, 'Passed'),
(8, 70.00, 72.00, 'Passed'),
(9, 86.00, 89.00, 'Passed'),
(10, 79.00, 81.00, 'Passed'),
(11, 91.00, 93.00, 'Passed'),
(12, 84.00, 87.00, 'Passed'),
(13, 77.00, 80.00, 'Passed'),
(14, 89.00, 91.00, 'Passed'),
(15, 94.00, 95.00, 'Passed'),
(16, 73.00, 76.00, 'Passed');