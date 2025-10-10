CREATE VIEW advisor_snapshot AS
SELECT f.faculty_id, 
	CONCAT(pf.first_name, " ", pf.last_name) AS advisor_name, 
    s.student_id, 
    CONCAT(ps.first_name, " ", ps.last_name) AS student_name, 
    ss.status, 
    se.semester_term, 
    se.year,
	COALESCE(COUNT(e.enrollment_id), 0) AS courses_enrolled,
    COALESCE(SUM(c.credits), 0) AS total_credits_this_term,
    s.cumulative_gpa, 
    ps.email
FROM student s
	JOIN people ps
		ON ps.people_id = s.people_id
	JOIN student_status ss
		ON ss.status_id = s.student_status_id
	JOIN faculty f
		ON f.faculty_id = s.advisor_id
	JOIN people pf
		ON pf.people_id = s.people_id
	JOIN enrollment e 
		ON e.student_id = s.student_id
	JOIN course_offering co 
		ON co.course_offering_id = e.course_offering_id
	JOIN semester se	
		ON se.semester_id = co.semester_id
	JOIN course c
		ON c.course_id = co.course_id
;