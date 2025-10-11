-- room_schedule — per-room listing of all scheduled sections
CREATE OR REPLACE VIEW room_schedule AS
SELECT
    r.room_id,
    r.room_number,
    r.building,
    c.course_code,
    c.course_title,
    co.section_number,
    CONCAT(ip.first_name, ' ', ip.last_name) AS instructor,
    se.semester_term,
    se.year,
    se.start_date,
    se.end_date,
    r.capacity
FROM course_offering co
JOIN course   c  ON c.course_id = co.course_id
JOIN semester se ON se.semester_id = co.semester_id
JOIN room     r  ON r.room_id = co.room_id
JOIN faculty  f  ON f.faculty_id = co.faculty_id
JOIN people   ip ON ip.people_id = f.people_id
ORDER BY r.room_id;
