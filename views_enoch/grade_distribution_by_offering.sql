-- grade_distribution_by_offering — counts of each letter grade per section
CREATE OR REPLACE VIEW grade_distribution_by_offering AS
SELECT
    co.course_offering_id,
    c.course_code,
    c.course_title,
    co.section_number,
    se.semester_term,
    se.year,
    CONCAT(ip.first_name, ' ', ip.last_name) AS instructor,
    lg.grade_symbol,
    lg.grade_points,
    COUNT(*) AS students_with_grade
FROM enrollment e
JOIN letter_grade   lg ON lg.letter_grade_id = e.letter_grade_id
JOIN course_offering co ON co.course_offering_id = e.course_offering_id
JOIN course         c  ON c.course_id = co.course_id
JOIN semester       se ON se.semester_id = co.semester_id
JOIN faculty        f  ON f.faculty_id = co.faculty_id
JOIN people         ip ON ip.people_id = f.people_id
GROUP BY
    co.course_offering_id,
    c.course_code, c.course_title,
    co.section_number,
    se.semester_term, se.year,
    instructor,
    lg.grade_symbol, lg.grade_points;