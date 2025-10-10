CREATE VIEW student_transcript_view AS
    SELECT 
        p.first_name
    FROM
        enrollment e
            JOIN
        student s ON e.student_id = s.student_id
            JOIN
        people p ON p.people_id = s.people_id;
    
    

SELECT 
    s.student_id, CONCAT(p.first_name, " ", p.last_name) AS full_name, c.course_title, c.credits, lg.grade_symbol, s.cumulative_gpa, CONCAT(se.semester_term, " ", se.year) AS semester
FROM
    people p
        JOIN
    student s ON s.people_id = p.people_id
        JOIN
	enrollment e ON e.student_id = s.student_id
		JOIN
	letter_grade lg ON lg.letter_grade_id = e.letter_grade_id
		JOIN
	course_offering co ON co.course_offering_id = e.course_offering_id
		JOIN
	semester se ON se.semester_id = co.semester_id
		JOIN
	course c ON c.course_id = co.course_id
	
     ;
     
    