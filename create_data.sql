-- Use your schema
USE `af25enoca1_college_db_v2`;

-- Disable foreign key checks temporarily
SET FOREIGN_KEY_CHECKS = 0;

-- 1. Insert some departments
INSERT INTO department (department_name, audit_user_id)
VALUES
  ('Computer Science', 1),
  ('Mathematics', 1),
  ('Physics', 1),
  ('English', 1),
  ('History', 1);

-- 2. Insert people
INSERT INTO people (first_name, last_name, email, date_of_birth, gender, address, phone_number, audit_user_id)
VALUES
  ('Alice','Anderson','alice.anderson@example.com','1998-04-12','F','123 Maple St, Townsville','555-0101',1),
  ('Bob','Brown','bob.brown@example.com','1975-10-30','M','456 Oak Rd, Cityville','555-0202',1),
  ('Carol','Clark','carol.clark@example.com','1980-07-22','F','789 Pine Ave, Hamlet','555-0303',1),
  ('David','Dawson','david.dawson@example.com','1999-01-15','M','101 Elm Blvd, Villagetown','555-0404',1),
  ('Eva','Evans','eva.evans@example.com','2000-06-05','F','202 Birch Dr, Suburbia','555-0505',1),
  ('Frank','Foster','frank.foster@example.com','1985-12-02','M','303 Cedar Ln, Metrocity','555-0606',1),
  ('Grace','Green','grace.green@example.com','1997-11-11','F','404 Spruce Ct, Countryside','555-0707',1),
  ('Henry','Hill','henry.hill@example.com','1996-09-29','M','505 Walnut St, Township','555-0808',1),
  ('Irene','Ivory','irene.ivory@example.com','1995-03-18','F','606 Chestnut Blvd, Smalltown','555-0909',1),
  ('Jack','Jones','jack.jones@example.com','1994-08-24','M','707 Aspen Rd, Bigcity','555-1010',1);

-- 3. Insert faculty
-- Map some of the people to faculty in departments
INSERT INTO faculty (people_id, department_id, office_location, audit_user_id)
VALUES
  (2, 1, 'CS Building 101', 1),
  (3, 2, 'Math Bldg 203', 1),
  (6, 3, 'Physics Hall 10', 1),
  (7, 4, 'Eng Dept 2A', 1);

-- 4. Insert staff (non‑teaching)
INSERT INTO staff (people_id, department_id, audit_user_id)
VALUES
  (4, 5, 1),
  (5, 1, 1),
  (8, 2, 1),
  (9, 4, 1);

-- 5. Insert semesters
INSERT INTO semester (semester_term, year, start_date, end_date, audit_user_id)
VALUES
  ('Spring',2024, '2024-01-15', '2024-05-10',1),
  ('Summer',2024, '2024-06-01', '2024-08-01',1),
  ('Fall',2024,   '2024-08-20', '2024-12-15',1);

-- 6. Insert rooms
INSERT INTO room (room_number, building, capacity, audit_user_id)
VALUES
  ('101','Science Hall', 30,1),
  ('102','Science Hall', 25,1),
  ('201','Math Bldg', 40,1),
  ('202','Math Bldg', 35,1),
  ('301','Humanities Bldg', 50,1),
  ('302','Humanities Bldg', 45,1);

-- 7. Insert courses
INSERT INTO course (course_code, course_title, credits, department_id, audit_user_id)
VALUES
  ('CS101','Intro to Computer Science',3,1,1),
  ('CS201','Data Structures',4,1,1),
  ('CS301','Algorithms',4,1,1),
  ('MATH101','Calculus I',4,2,1),
  ('MATH201','Linear Algebra',3,2,1),
  ('PHYS101','General Physics I',4,3,1),
  ('ENG101','English Composition',3,4,1),
  ('HIST101','World History',3,5,1);

-- 8. Insert students (map people to student)
INSERT INTO student (people_id, cumulative_gpa, advisor_id, audit_user_id)
VALUES
  (1, 3.50, 2,1),
  (4, 3.80, 3,1),
  (5, 3.20, 2,1),
  (7, 3.90, 6,1),
  (8, 3.00, 2,1),
  (10,3.45, 3,1);

-- 9. Insert letter grades
INSERT INTO letter_grade (grade_symbol, grade_points, letter_grade_col, audit_user_id)
VALUES
  ('A',4.00,'A',1),
  ('A‑',3.70,'A-',1),
  ('B+',3.30,'B+',1),
  ('B',3.00,'B',1),
  ('B‑',2.70,'B-',1),
  ('C+',2.30,'C+',1),
  ('C',2.00,'C',1),
  ('C‑',1.70,'C-',1),
  ('D',1.00,'D',1),
  ('F',0.00,'F',1),
  ('I',0.00,'I',1),
  ('W',0.00,'W',1);

-- 10. Insert course offerings (sections)
INSERT INTO course_offering (section_number, course_id, semester_id, room_id, faculty_id, audit_user_id)
VALUES
  ('001', 1, 1, 1, 2, 1),
  ('002', 1, 3, 2, 2, 1),
  ('001', 2, 3, 3, 2, 1),
  ('001', 4, 1, 4, 3, 1),
  ('001', 5, 1, 4, 3, 1),
  ('001', 6, 3, 5, 6, 1),
  ('002', 6, 1, 5, 6, 1),
  ('001', 7, 2, 6, 7, 1),
  ('002', 7, 3, 6, 7, 1),
  ('001', 8, 1, 6, 7, 1);

-- 11. Insert enrollments (students in course offerings, with grades)
INSERT INTO enrollment (letter_grade_id, student_id, course_offering_id, audit_user_id)
VALUES
  (1, 1, 1, 1),  -- student 1 in CS101 Spring, gets A
  (4, 1, 2, 1),  -- student 1 in CS101 Fall, gets B
  (3, 2, 3, 1),
  (2, 2, 4, 1),
  (4, 3, 1, 1),
  (5, 3, 5, 1),
  (1, 4, 8, 1),
  (2, 4, 9, 1),
  (4, 5, 7, 1),
  (3, 6, 6, 1);

-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;
