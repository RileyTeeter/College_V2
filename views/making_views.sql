CREATE VIEW enrolled_student_view AS
    SELECT 
        user_id,
        ss.status,
        admission_date,
        graduation_date,
        r.name AS dorm_room,
        b.title AS building
    FROM
        student s
            JOIN
        room r ON s.dorm_room_id = r.id
            JOIN
        building b ON r.building_id = b.id
            JOIN
        student_status ss ON s.student_status_id = ss.id
    WHERE
        s.student_status_id = 1;