CREATE VIEW course_catalog AS
SELECT c.course_code, 
	c.course_title, 
    c.credits, 
    d.department_name, 
    CONCAT(p.first_name, " ", p.last_name) AS instructor, 
    s.semester_term, 
    s.start_date,
    s.end_date,
    s.year,
    r.room_number,
    r.building
FROM course c
	JOIN department d
		ON c.department_id = d.department_id
	JOIN course_offering co 
		ON c.course_id = co.course_id
	JOIN faculty f
		ON co.faculty_id = f.faculty_id
	JOIN people p
		ON f.people_id = p.people_id
	JOIN semester s
		ON co.semester_id = s.semester_id
	JOIN room r
		ON co.room_id = r.room_id
ORDER BY d.department_name, c.course_code;