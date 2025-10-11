CREATE VIEW faculty_directory AS
SELECT f.faculty_id, 
	CONCAT(p.first_name, " ", p.last_name) AS full_name, 
	p.email, 
	d.department_name,
	f.office_location,
	c.course_title, 
    r.room_number, 
    r.building
FROM faculty f 
	JOIN people p 
		ON f.people_id = p.people_id
	JOIN department d 
		ON f.department_id = d.department_id
	JOIN course c
		ON d.department_id = c.department_id
	JOIN course_offering co 
		ON c.course_id = co.course_id
	JOIN room r
		ON r.room_id = co.room_id
ORDER BY d.department_name;
    
