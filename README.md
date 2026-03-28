# Student System - IT105 Midterm Project

## System Description

This is a **StudentSystem** database that manages student records, courses, enrollments, and grades. It is designed for a university setting, like Bicol University, to track Computer Science and Information Technology students. The database uses MySQL and includes sample data for 12 students across different year levels, 12 courses, enrollments for the 2024-2025 school year, and grades with midterm and final scores.

## Tables Description

The database has 4 main tables:

1. **Students**
   - StudentID (Primary Key, auto-increment)
   - StudentNumber (Unique)
   - Name, Email (Unique), Phone
   - Course (e.g., Computer Science, Information Technology)
   - YearLevel (1-4), Status (e.g., Active)

2. **Courses**
   - CourseID (Primary Key, auto-increment)
   - CourseCode (Unique, e.g., CS101), CourseName, Units
   - Instructor

3. **Enrollments**
   - EnrollmentID (Primary Key, auto-increment)
   - StudentID (Foreign Key), CourseID (Foreign Key)
   - Semester, SchoolYear

4. **Grades**
   - GradeID (Primary Key, auto-increment)
   - EnrollmentID (Foreign Key)
   - MidtermGrade, FinalGrade (decimal), Remarks (e.g., Passed)

## Features Implemented

- **Create**: Database and tables setup (schema.sql), insert sample data (data.sql), add new students/courses/enrollments/grades.
- **Read**: View all students, filter by course/grades (e.g., >85), joins for student-course-grades, total courses per student, subqueries.
- **Update**: Change year level, status, instructor, grades.
- **Delete**: Remove grades, enrollments, students, courses (with cascade).
- Sample queries in queries.sql demonstrate all operations, joins, and subqueries.

## Reflection

I learned how to design a real database with tables that connect to each other using foreign keys. It was cool to see how students link to courses and grades. I practiced all CRUD operations and how to write joins and subqueries. Handling deletes carefully to avoid errors was important. This project showed me basics of managing school data simply and effectively.
