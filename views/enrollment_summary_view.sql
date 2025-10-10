CREATE VIEW enrollment_summary AS
SELECT c.course_code,
	c.course_title,
    s.semester_term,
    s.year,
    CONCAT(p.first_name, " ", p.last_name) AS instructor,
    COUNT(DISTINCT e.student_id) AS student_id,
    ROUND(AVG(lg.grade_points), 2) AS avg_grade,
    r.capacity
FROM course_offering co
	JOIN course c 	
		ON co.course_id = c.course_id
	JOIN semester s
		ON co.semester_id = s.semester_id
	JOIN room r
		ON r.room_id = co.room_id
	JOIN faculty f
		ON f.faculty_id = co.faculty_id
	JOIN people p
		ON p.people_id = f.people_id
	JOIN enrollment e
		ON e.course_offering_id = co.course_offering_id
	JOIN letter_grade lg
		ON lg.letter_grade_id = e.letter_grade_id
GROUP BY c.course_code;