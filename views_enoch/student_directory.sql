-- student_directory — core student + advisor contact/standing
CREATE OR REPLACE VIEW student_directory AS
SELECT
    s.student_id,
    CONCAT(ps.first_name, ' ', ps.last_name) AS student_name,
    ps.email AS student_email,
    ps.phone_number,
    ss.status AS student_status,
    s.cumulative_gpa,
    s.admission_date,
    s.graduation_date,
    f.faculty_id AS advisor_id,
    CONCAT(pf.first_name, ' ', pf.last_name) AS advisor_name,
    pf.email AS advisor_email,
    d.department_name AS advisor_department
FROM student s
JOIN people        ps ON ps.people_id = s.people_id
JOIN student_status ss ON ss.status_id = s.student_status_id
JOIN faculty       f  ON f.faculty_id = s.advisor_id
JOIN people        pf ON pf.people_id = f.people_id
JOIN department    d  ON d.department_id = f.department_id;