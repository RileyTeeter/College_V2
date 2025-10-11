-- student_transcript — one row per enrollment with grade signal
CREATE OR REPLACE VIEW student_transcript AS
SELECT
    s.student_id,
    CONCAT(ps.first_name, ' ', ps.last_name) AS student_name,
    c.course_code,
    c.course_title,
    c.credits,
    se.semester_term,
    se.year,
    lg.grade_symbol,
    lg.grade_points,
    CASE
      WHEN lg.grade_symbol IN ('I','W') THEN NULL
      ELSE lg.grade_points * c.credits
    END AS quality_points,
    CONCAT(ip.first_name, ' ', ip.last_name) AS instructor
FROM enrollment e
JOIN student        s  ON s.student_id = e.student_id
JOIN people         ps ON ps.people_id = s.people_id
JOIN course_offering co ON co.course_offering_id = e.course_offering_id
JOIN course         c  ON c.course_id = co.course_id
JOIN semester       se ON se.semester_id = co.semester_id
JOIN faculty        f  ON f.faculty_id = co.faculty_id
JOIN people         ip ON ip.people_id = f.people_id
JOIN letter_grade   lg ON lg.letter_grade_id = e.letter_grade_id
ORDER BY student_name;