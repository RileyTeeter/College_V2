-- -----------------------------------------
-- 1. Get All Students with Their Advisor Names
-- -----------------------------------------
-- This query fetches each student along with their assigned advisor.
-- It joins the `student`, `faculty`, and `people` tables to retrieve
-- the full names of both the student and their advisor.

SELECT 
    s.student_id, 
    sp.first_name AS student_first_name, 
    sp.last_name AS student_last_name,
    f.faculty_id, 
    fp.first_name AS advisor_first_name, 
    fp.last_name AS advisor_last_name
FROM student s
JOIN people sp ON s.people_id = sp.people_id
JOIN faculty f ON s.advisor_id = f.faculty_id
JOIN people fp ON f.people_id = fp.people_id;

-- -----------------------------------------
-- 2. List All Courses Offered in Fall 2025
-- -----------------------------------------
-- This query retrieves all course offerings scheduled for the Fall 2025 semester.
-- It joins `course_offering`, `course`, and `semester` to show course details
-- alongside the semester in which they're offered.

SELECT 
    co.course_offering_id, 
    c.course_code, 
    c.course_title, 
    s.semester_term, 
    s.year
FROM course_offering co
JOIN course c ON co.course_id = c.course_id
JOIN semester s ON co.semester_id = s.semester_id
WHERE s.semester_term = 'Fall' AND s.year = 2024;

-- -----------------------------------------
-- 3. View Enrollments with Student, Course, and Grade
-- -----------------------------------------
-- This query returns detailed enrollment records, showing the student enrolled,
-- the course they took, and the grade they received.
-- It joins `enrollment`, `student`, `people`, `course_offering`, `course`, and `letter_grade`.

SELECT 
    e.enrollment_id, 
    sp.first_name AS student_first_name, 
    sp.last_name AS student_last_name,
    c.course_code, 
    c.course_title, 
    lg.grade_symbol
FROM enrollment e
JOIN student s ON e.student_id = s.student_id
JOIN people sp ON s.people_id = sp.people_id
JOIN course_offering co ON e.course_offering_id = co.course_offering_id
JOIN course c ON co.course_id = c.course_id
JOIN letter_grade lg ON e.letter_grade_id = lg.letter_grade_id;

-- -----------------------------------------
-- 4. Get Faculty Members and Their Departments
-- -----------------------------------------
-- This query lists all faculty members along with the departments they belong to.
-- It joins `faculty`, `people`, and `department` to fetch names and department info.

SELECT 
    f.faculty_id, 
    p.first_name, 
    p.last_name, 
    d.department_name
FROM faculty f
JOIN people p ON f.people_id = p.people_id
JOIN department d ON f.department_id = d.department_id;

-- -----------------------------------------
-- 5. List All Students Enrolled in a Specific Course Offering
-- -----------------------------------------
-- This query retrieves students enrolled in a particular course offering (e.g., CS101 section 001),
-- showing their names and the semester in which the course is taken.

SELECT 
    co.course_offering_id,
    c.course_code,
    c.course_title,
    s.semester_term,
    s.year,
    p.first_name AS student_first_name,
    p.last_name AS student_last_name
FROM enrollment e
JOIN student st ON e.student_id = st.student_id
JOIN people p ON st.people_id = p.people_id
JOIN course_offering co ON e.course_offering_id = co.course_offering_id
JOIN course c ON co.course_id = c.course_id
JOIN semester s ON co.semester_id = s.semester_id
WHERE c.course_code = 'CS101' AND co.section_number = '001';


-- -----------------------------------------
-- 6. Count the Number of Students per Course Offering
-- -----------------------------------------
-- This query shows how many students are enrolled in each course offering.
-- Useful for analyzing class sizes or detecting over/under-enrolled sections.

SELECT 
    c.course_code,
    co.section_number,
    s.semester_term,
    s.year,
    COUNT(e.enrollment_id) AS student_count
FROM course_offering co
JOIN course c ON co.course_id = c.course_id
JOIN semester s ON co.semester_id = s.semester_id
LEFT JOIN enrollment e ON co.course_offering_id = e.course_offering_id
GROUP BY co.course_offering_id;



-- -----------------------------------------
-- 7. Show GPA for All Students Based on Enrollments (Calculated)
-- -----------------------------------------
-- This query calculates the GPA for each student based on the grades in their enrollments.
-- It joins `enrollment` and `letter_grade` to compute weighted GPA dynamically.

SELECT 
    s.student_id,
    p.first_name,
    p.last_name,
    ROUND(SUM(lg.grade_points * c.credits) / SUM(c.credits), 2) AS calculated_gpa
FROM student s
JOIN people p ON s.people_id = p.people_id
JOIN enrollment e ON s.student_id = e.student_id
JOIN letter_grade lg ON e.letter_grade_id = lg.letter_grade_id
JOIN course_offering co ON e.course_offering_id = co.course_offering_id
JOIN course c ON co.course_id = c.course_id
GROUP BY s.student_id;


-- -----------------------------------------
-- 8. List All Courses Taught by a Specific Faculty Member
-- -----------------------------------------
-- This query fetches all courses taught by a given faculty member,
-- along with when and where they were taught.

SELECT 
    p.first_name AS faculty_first_name,
    p.last_name AS faculty_last_name,
    c.course_code,
    c.course_title,
    s.semester_term,
    s.year,
    r.room_number,
    r.building
FROM faculty f
JOIN people p ON f.people_id = p.people_id
JOIN course_offering co ON f.faculty_id = co.faculty_id
JOIN course c ON co.course_id = c.course_id
JOIN semester s ON co.semester_id = s.semester_id
JOIN room r ON co.room_id = r.room_id
WHERE f.faculty_id = 3;  -- Change this ID to test other faculty


-- -----------------------------------------
-- 9. Find All Students Who Have Received an 'A' Grade
-- -----------------------------------------
-- This query lists all students who earned an 'A' in any course offering.

SELECT 
    p.first_name,
    p.last_name,
    c.course_code,
    c.course_title,
    s.semester_term,
    s.year
FROM enrollment e
JOIN student st ON e.student_id = st.student_id
JOIN people p ON st.people_id = p.people_id
JOIN letter_grade lg ON e.letter_grade_id = lg.letter_grade_id
JOIN course_offering co ON e.course_offering_id = co.course_offering_id
JOIN course c ON co.course_id = c.course_id
JOIN semester s ON co.semester_id = s.semester_id
WHERE lg.grade_symbol = 'A';



-- -----------------------------------------
-- 10. List Staff and Their Departments
-- -----------------------------------------
-- This query retrieves staff members and the departments they work in.

SELECT 
    st.staff_id,
    p.first_name,
    p.last_name,
    d.department_name
FROM staff st
JOIN people p ON st.people_id = p.people_id
JOIN department d ON st.department_id = d.department_id;
