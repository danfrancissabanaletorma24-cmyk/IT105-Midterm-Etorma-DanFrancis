# Database Normalization - UNF to 3NF (StudentSystem)

The StudentSystem database tracks students, courses, enrollments, and grades. Here is how it was normalized from **Unnormalized Form (UNF)** to **3NF** matching the project schema.

### UNF (Unnormalized Form)

Repeating groups for multiple courses/grades:

```
StudentRecord:
StudentID, StudentName, Course1Code (Units1, Instructor1, Grade1, Semester1), Course2Code (Units2, Instructor2, Grade2, Semester2)
Example:
1, Juan Dela Cruz, CS101 (3, Prof. Reyes, 88.0, 1st Sem), IT101 (3, Prof. Dimagiba, 85.5, 1st Sem)
```

Problems: Repeating course details, hard to add courses or update instructors.

### 1NF (First Normal Form)

- Remove repeating groups: One row per enrollment.
- Atomic values only.

```
Students (StudentID, StudentName)
Enrollments1 (StudentID, CourseCode, Units, Instructor, Grade, Semester)
Example:
Students: 1, Juan Dela Cruz
Enrollments1:
1, CS101, 3, Prof. Reyes, 88.0, 1st Sem
1, IT101, 3, Prof. Dimagiba, 85.5, 1st Sem
```

Primary key: Enrollments1(StudentID, CourseCode).

### 2NF (Second Normal Form)

- Must be in 1NF.
- Remove partial dependencies: Full key dependency.
- CourseCode → Units, Instructor (partial, depends only on CourseCode).

Split:

```
Students (StudentID PK, StudentName)
Courses (CourseCode PK, Units, Instructor)
Enrollments (StudentID FK, CourseCode FK, Grade, Semester)
Example:
Courses: CS101, 3, Prof. Reyes | IT101, 3, Prof. Dimagiba
Enrollments:
1, CS101, 88.0, 1st Sem
1, IT101, 85.5, 1st Sem
```

### 3NF (Third Normal Form)

- Must be in 2NF.
- Remove transitive dependencies: Non-key → non-key.
- In this case, tables are already in 3NF (no transitive deps, e.g., Grade depends directly on Enrollment).
- Matches final schema.sql: Students, Courses, Enrollments, Grades.

Final 3NF: No redundancy, supports queries/joins from queries.sql.

## Benefits

- UNF/1NF: Data duplication, insert/delete anomalies.
- 2NF/3NF: Clean dependencies, easier maintenance.
