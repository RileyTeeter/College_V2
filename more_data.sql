-- Use the schema
USE `af25enoca1_college_db_v2`;

-- Temporarily disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

-- 1. Insert departments
INSERT INTO department (department_name, audit_user_id)
VALUES
  ('Computer Science', 1),
  ('Mathematics', 1),
  ('Physics', 1),
  ('English', 1),
  ('History', 1),
  ('Biology', 1),
  ('Chemistry', 1),
  ('Philosophy', 1),
  ('Art', 1),
  ('Economics', 1),
  ('Psychology', 1);

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
  ('Jack','Jones','jack.jones@example.com','1994-08-24','M','707 Aspen Rd, Bigcity','555-1010',1),
  ('Liam','Lawson','liam.lawson@example.com','1998-02-14','M','111 Oak St, Townsville','555-1101',1),
  ('Mia','Miller','mia.miller@example.com','2001-05-20','F','222 Maple Dr, Cityville','555-1202',1),
  ('Noah','Nelson','noah.nelson@example.com','1997-11-03','M','333 Pine Ln, Hamlet','555-1303',1),
  ('Olivia','Owens','olivia.owens@example.com','1999-12-12','F','444 Cedar Pl, Villagetown','555-1404',1),
  ('Paul','Parker','paul.parker@example.com','1988-07-07','M','555 Birch Rd, Suburbia','555-1505',1),
  ('Quinn','Quincy','quinn.quincy@example.com','1996-03-30','F','666 Spruce St, Metrocity','555-1606',1),
  ('Rachel','Reed','rachel.reed@example.com','1995-08-18','F','777 Walnut Ave, Countryside','555-1707',1),
  ('Sam','Scott','sam.scott@example.com','1994-10-25','M','888 Chestnut Blvd, Township','555-1808',1),
  ('Tina','Turner','tina.turner@example.com','1993-09-05','F','999 Aspen Rd, Bigcity','555-1909',1),
  ('Uma','Underwood','uma.underwood@example.com','2000-04-30','F','1010 Elm Blvd, Smalltown','555-2000',1);

-- 3. Insert faculty
INSERT INTO faculty (people_id, department_id, office_location, audit_user_id)
VALUES
  (2, 1, 'CS Building 101', 1),
  (3, 2, 'Math Bldg 203', 1),
  (6, 3, 'Physics Hall 10', 1),
  (7, 4, 'Eng Dept 2A', 1),
  (11, 11, 'Psych Bldg 1', 1),
  (12, 9, 'Art Studio 3', 1),
  (13, 6, 'Biology Hall 2', 1),
  (14, 7, 'Chem Lab 101', 1),
  (15, 10, 'Econ Bldg 12', 1),
  (16, 8, 'Philosophy Wing 1', 1);

-- 4. Insert staff
INSERT INTO staff (people_id, department_id, audit_user_id)
VALUES
  (4, 5, 1),
  (5, 1, 1),
  (8, 2, 1),
  (9, 4, 1),
  (17, 11, 1),
  (18, 9, 1),
  (19, 6, 1),
  (20, 7, 1);

-- 5. Insert semesters
INSERT INTO semester (semester_term, year, start_date, end_date, audit_user_id)
VALUES
  ('Spring', 2024, '2024-01-15', '2024-05-10', 1),
  ('Summer', 2024, '2024-06-01', '2024-08-01', 1),
  ('Fall', 2024,   '2024-08-20', '2024-12-15', 1),
  ('Spring', 2025, '2025-01-10', '2025-05-05', 1),
  ('Fall', 2025,   '2025-08-25', '2025-12-10', 1);

-- 6. Insert rooms
INSERT INTO room (room_number, building, capacity, audit_user_id)
VALUES
  ('101','Science Hall', 30,1),
  ('102','Science Hall', 25,1),
  ('201','Math Bldg', 40,1),
  ('202','Math Bldg', 35,1),
  ('301','Humanities Bldg', 50,1),
  ('302','Humanities Bldg', 45,1),
  ('303','Science Hall', 50,1),
  ('304','Science Hall', 45,1),
  ('401','Art Bldg', 30,1),
  ('402','Art Bldg', 25,1),
  ('501','Bio Lab', 35,1),
  ('502','Bio Lab', 40,1),
  ('601','Chem Lab', 45,1),
  ('602','Chem Lab', 30,1),
  ('701','Psych Bldg', 40,1),
  ('702','Psych Bldg', 35,1);

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
  ('HIST101','World History',3,5,1),
  ('BIO101','General Biology I',4,6,1),
  ('BIO201','Genetics',3,6,1),
  ('CHEM101','Intro to Chemistry',4,7,1),
  ('CHEM201','Organic Chemistry',4,7,1),
  ('PHIL101','Introduction to Philosophy',3,8,1),
  ('ART101','Art Appreciation',3,9,1),
  ('ART201','Drawing I',3,9,1),
  ('ECON101','Principles of Economics',3,10,1),
  ('PSYCH101','Intro to Psychology',3,11,1),
  ('PSYCH201','Developmental Psychology',3,11,1);

-- 8. Insert students
INSERT INTO student (people_id, cumulative_gpa, advisor_id, audit_user_id)
VALUES
  (1, 3.50, 2,1),
  (4, 3.80, 3,1),
  (5, 3.20, 2,1),
  (7, 3.90, 6,1),
  (8, 3.00, 2,1),
  (10,3.45, 3,1),
  (11, 3.65, 12,1),
  (12, 3.85, 13,1),
  (13, 3.10, 11,1),
  (14, 3.90, 13,1),
  (15, 3.50, 15,1),
  (16, 3.75, 14,1),
  (17, 2.90, 12,1),
  (18, 3.20, 13,1),
  (19, 3.40, 15,1),
  (20, 3.95, 14,1);

-- 9. Insert letter grades
INSERT INTO letter_grade (grade_symbol, grade_points, audit_user_id)
VALUES
  ('A', 4.00, 1),
  ('A‑', 3.70, 1),
  ('B+', 3.30, 1),
  ('B', 3.00, 1),
  ('B‑', 2.70, 1),
  ('C+', 2.30, 1),
  ('C', 2.00, 1),
  ('C‑', 1.70, 1),
  ('D', 1.00, 1),
  ('F', 0.00, 1),
  ('I', 0.00, 1),
  ('W', 0.00, 1);


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
  ('001', 8, 1, 6, 7, 1),
  ('001', 17, 4, 13, 11, 1),
  ('002', 17, 5, 14, 11, 1),
  ('001', 18, 4, 15, 11, 1),
  ('001', 16, 4, 16, 15, 1),
  ('001', 15, 5, 4, 12, 1),
  ('002', 15, 5, 3, 12, 1),
  ('001', 9, 4, 1, 13, 1),
  ('002', 9, 5, 2, 13, 1),
  ('001', 10, 4, 5, 13, 1),
  ('001', 11, 5, 6, 14, 1),
  ('002', 11, 4, 6, 14, 1),
  ('001', 12, 5, 7, 14, 1),
  ('001', 13, 4, 8, 16, 1),
  ('001', 14, 5, 9, 16, 1);

-- 11. Insert enrollments
INSERT INTO enrollment (letter_grade_id, student_id, course_offering_id, audit_user_id)
VALUES
  (1, 1, 1, 1),
  (4, 1, 2, 1),
  (3, 2, 3, 1),
  (2, 2, 4, 1),
  (4, 3, 1, 1),
  (5, 3, 5, 1),
  (1, 4, 8, 1),
  (2, 4, 9, 1),
  (4, 5, 7, 1),
  (3, 6, 6, 1),
  (1, 11, 11, 1),
  (4, 12, 12, 1),
  (2, 13, 13, 1),
  (3, 14, 14, 1),
  (5, 15, 15, 1),
  (1, 16, 16, 1),
  (3, 17, 11, 1),
  (2, 18, 12, 1),
  (4, 19, 13, 1),
  (1, 20, 14, 1);

-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;
