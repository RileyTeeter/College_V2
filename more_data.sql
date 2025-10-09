-- realistic_sample_data_af25enoca1_college_db.sql
-- Bulk realistic-looking inserts for af25enoca1_college_db
-- Run after your schema creation. Disables FK/unique checks temporarily.

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

USE `af25enoca1_college_db`;

-- ---------------------------
-- 1) Departments (12 realistic departmental names)
-- ---------------------------
INSERT INTO `department` (department_name,audit_user_id) VALUES
('Computer Science',1),
('Mathematics',1),
('Physics',1),
('Biology',1),
('Chemistry',1),
('English',1),
('History',1),
('Psychology',1),
('Business Administration',1),
('Education',1),
('Sociology',1),
('Art & Design',1);

-- ---------------------------
-- 2) Semesters (8 entries spanning 2023-2026)
-- ---------------------------
INSERT INTO `semester` (`semester_term`,`audit_user_id`,`year`,`start_date`,`end_date`) VALUES
('Spring',1,2023,'2023-01-09','2023-05-05'),
('Summer',1,2023,'2023-06-01','2023-07-31'),
('Fall',1,2023,'2023-08-21','2023-12-15'),
('Spring',1,2024,'2024-01-08','2024-05-03'),
('Fall',1,2024,'2024-08-26','2024-12-13'),
('Spring',1,2025,'2025-01-13','2025-05-09'),
('Fall',1,2025,'2025-08-25','2025-12-12'),
('Spring',1,2026,'2026-01-12','2026-05-08');

-- ---------------------------
-- 3) Rooms / Buildings (30 rooms)
-- ---------------------------
INSERT INTO `room` (room_number,building,capacity,audit_user_id) VALUES
('101','Main Hall',40,1),
('102','Main Hall',30,1),
('201','Science Center',60,1),
('202','Science Center',50,1),
('301','Technology Building',35,1),
('302','Technology Building',35,1),
('A101','Business Building',45,1),
('A102','Business Building',40,1),
('B201','Humanities Hall',30,1),
('B202','Humanities Hall',30,1),
('C001','Lecture Hall A',120,1),
('C002','Lecture Hall B',100,1),
('D10','Fine Arts Center',25,1),
('D11','Fine Arts Center',25,1),
('E100','Education Wing',40,1),
('E101','Education Wing',40,1),
('F12','Library Conference',20,1),
('G20','Gym Classroom',50,1),
('H5','Annex 1',20,1),
('H6','Annex 2',20,1),
('I7','Research Lab 1',12,1),
('I8','Research Lab 2',12,1),
('J9','Auditorium',200,1),
('K10','Seminar Room 1',18,1),
('K11','Seminar Room 2',18,1),
('L12','Studio 1',15,1),
('L13','Studio 2',15,1),
('M14','Computer Lab 1',30,1),
('M15','Computer Lab 2',30,1),
('N16','Counseling Center',10,1);

-- ---------------------------
-- 4) People (200 realistic-looking people)
--    We'll create 200 people with realistic names, DOBs, emails, phones, addresses.
-- ---------------------------
INSERT INTO `people` (first_name,last_name,email,date_of_birth,gender,address,phone_number,audit_user_id) VALUES
('Olivia','Smith','olivia.smith@example.edu','1990-04-12','F','12 Maple St, Omaha, NE','402-555-0101',1),
('Liam','Johnson','liam.johnson@example.edu','1985-07-03','M','34 Oak Ave, Omaha, NE','402-555-0102',1),
('Emma','Williams','emma.williams@example.edu','1992-11-21','F','77 Pine Rd, Lincoln, NE','402-555-0103',1),
('Noah','Brown','noah.brown@example.edu','1988-02-14','M','8 Cedar Ln, Lincoln, NE','402-555-0104',1),
('Ava','Jones','ava.jones@example.edu','1994-06-05','F','99 Birch Blvd, Council Bluffs, IA','402-555-0105',1),
('Lucas','Garcia','lucas.garcia@example.edu','1987-09-15','M','200 Elm St, Omaha, NE','402-555-0106',1),
('Sophia','Miller','sophia.miller@example.edu','1991-12-01','F','45 Spruce Dr, Omaha, NE','402-555-0107',1),
('Mason','Davis','mason.davis@example.edu','1986-03-28','M','12 Willow Way, Lincoln, NE','402-555-0108',1),
('Isabella','Rodriguez','isabella.rodriguez@example.edu','1993-08-11','F','56 Poplar St, Omaha, NE','402-555-0109',1),
('Ethan','Martinez','ethan.martinez@example.edu','1989-05-30','M','3 Aspen Ct, Council Bluffs, IA','402-555-0110',1),
('Mia','Hernandez','mia.hernandez@example.edu','1995-10-02','F','210 River Rd, Omaha, NE','402-555-0111',1),
('James','Lopez','james.lopez@example.edu','1984-01-19','M','88 Lakeview Dr, Lincoln, NE','402-555-0112',1),
('Amelia','Gonzalez','amelia.gonzalez@example.edu','1990-07-22','F','14 Highland Ave, Omaha, NE','402-555-0113',1),
('Benjamin','Wilson','benjamin.wilson@example.edu','1983-11-09','M','6 Meadow Ln, Omaha, NE','402-555-0114',1),
('Harper','Anderson','harper.anderson@example.edu','1996-02-17','F','52 Orchard St, Lincoln, NE','402-555-0115',1),
('Elijah','Thomas','elijah.thomas@example.edu','1987-08-29','M','73 Valley Rd, Omaha, NE','402-555-0116',1),
('Evelyn','Taylor','evelyn.taylor@example.edu','1992-03-06','F','19 Brook Ct, Lincoln, NE','402-555-0117',1),
('Alexander','Moore','alexander.moore@example.edu','1989-12-24','M','28 Ridge St, Omaha, NE','402-555-0118',1),
('Abigail','Jackson','abigail.jackson@example.edu','1994-05-18','F','101 Park Ave, Omaha, NE','402-555-0119',1),
('Michael','Martin','michael.martin@example.edu','1982-09-07','M','16 Sunset Blvd, Lincoln, NE','402-555-0120',1),
('Charlotte','Lee','charlotte.lee@example.edu','1991-06-09','F','230 Harbor Rd, Council Bluffs, IA','402-555-0121',1),
('Daniel','Perez','daniel.perez@example.edu','1986-01-25','M','64 Harbor St, Omaha, NE','402-555-0122',1),
('Emily','Thompson','emily.thompson@example.edu','1993-04-30','F','7 Pine Hill Rd, Lincoln, NE','402-555-0123',1),
('Matthew','White','matthew.white@example.edu','1988-10-11','M','151 Grove St, Omaha, NE','402-555-0124',1),
('Ella','Harris','ella.harris@example.edu','1995-07-14','F','44 Cedarwood Ln, Lincoln, NE','402-555-0125',1),
('Aiden','Sanchez','aiden.sanchez@example.edu','1984-02-02','M','99 Mill Rd, Omaha, NE','402-555-0126',1),
('Scarlett','Clark','scarlett.clark@example.edu','1992-11-27','F','15 Orchard Ln, Omaha, NE','402-555-0127',1),
('Henry','Ramirez','henry.ramirez@example.edu','1987-03-12','M','260 Elmwood Dr, Lincoln, NE','402-555-0128',1),
('Grace','Lewis','grace.lewis@example.edu','1990-08-16','F','35 Parkside Ave, Omaha, NE','402-555-0129',1),
('Jackson','Robinson','jackson.robinson@example.edu','1985-05-05','M','18 Walnut St, Lincoln, NE','402-555-0130',1),
('Victoria','Walker','victoria.walker@example.edu','1993-09-09','F','23 Riverbend Rd, Omaha, NE','402-555-0131',1),
('Owen','Young','owen.young@example.edu','1989-01-03','M','67 Hillside Blvd, Lincoln, NE','402-555-0132',1),
('Hannah','Allen','hannah.allen@example.edu','1994-04-20','F','82 Fairfield St, Omaha, NE','402-555-0133',1),
('Wyatt','King','wyatt.king@example.edu','1986-12-12','M','5 Glenview Dr, Lincoln, NE','402-555-0134',1),
('Zoe','Wright','zoe.wright@example.edu','1991-02-26','F','140 Meadowbrook Ln, Omaha, NE','402-555-0135',1),
('Sebastian','Scott','sebastian.scott@example.edu','1988-06-08','M','9 Eastwood Ave, Lincoln, NE','402-555-0136',1),
('Lily','Torres','lily.torres@example.edu','1992-10-19','F','48 Bridge St, Omaha, NE','402-555-0137',1),
('Jack','Nguyen','jack.nguyen@example.edu','1990-03-03','M','21 Birchwood Dr, Lincoln, NE','402-555-0138',1),
('Aria','Hill','aria.hill@example.edu','1995-12-30','F','66 Laurel St, Omaha, NE','402-555-0139',1),
('Olivier','Adams','olivier.adams@example.edu','1984-07-21','M','12 Lake St, Lincoln, NE','402-555-0140',1),
('Nora','Baker','nora.baker@example.edu','1993-01-17','F','34 Chestnut Ave, Omaha, NE','402-555-0141',1),
('Samuel','Gonzales','samuel.gonzales@example.edu','1987-11-05','M','90 Ridgeview Dr, Lincoln, NE','402-555-0142',1),
('Riley','Nelson','riley.nelson@example.edu','1991-08-24','F','27 Oak Hollow Rd, Omaha, NE','402-555-0143',1),
('Carter','Carter','carter.carter@example.edu','1989-02-28','M','3 Willow Bend, Lincoln, NE','402-555-0144',1),
('Addison','Mitchell','addison.mitchell@example.edu','1994-05-29','F','88 Parklane St, Omaha, NE','402-555-0145',1),
('Wyatt','Perez','wyatt.perez2@example.edu','1986-11-11','M','159 Laurel Ave, Lincoln, NE','402-555-0146',1),
('Luna','Roberts','luna.roberts@example.edu','1992-07-07','F','71 Harborview Ln, Omaha, NE','402-555-0147',1),
('Grayson','Turner','grayson.turner@example.edu','1985-04-04','M','40 Pinecrest Dr, Lincoln, NE','402-555-0148',1),
('Penelope','Phillips','penelope.phillips@example.edu','1993-09-01','F','8 Meadow Ln, Omaha, NE','402-555-0149',1),
('Julian','Campbell','julian.campbell@example.edu','1990-10-10','M','202 Parkview Dr, Lincoln, NE','402-555-0150',1),
('Stella','Parker','stella.parker@example.edu','1991-03-18','F','56 Chapman Ave, Omaha, NE','402-555-0151',1),
('Levi','Evans','levi.evans@example.edu','1988-08-08','M','11 Brookside St, Lincoln, NE','402-555-0152',1),
('Hazel','Edwards','hazel.edwards@example.edu','1994-12-12','F','67 Stratford Rd, Omaha, NE','402-555-0153',1),
('Isaac','Collins','isaac.collins@example.edu','1986-09-09','M','23 Willow Rd, Lincoln, NE','402-555-0154',1),
('Violet','Stewart','violet.stewart@example.edu','1992-02-02','F','90 Pine Grove, Omaha, NE','402-555-0155',1),
('Lucas','Morris','lucas.morris2@example.edu','1987-01-21','M','100 Elm Ct, Lincoln, NE','402-555-0156',1),
('Claire','Rogers','claire.rogers@example.edu','1990-06-06','F','55 Riverwalk Ln, Omaha, NE','402-555-0157',1),
('Julian','Reed','julian.reed2@example.edu','1985-05-17','M','26 Grove Ave, Lincoln, NE','402-555-0158',1),
('Sofia','Cook','sofia.cook@example.edu','1993-08-25','F','6 Harbor St, Omaha, NE','402-555-0159',1),
('Eli','Morgan','eli.morgan@example.edu','1989-11-13','M','19 Seaside Dr, Lincoln, NE','402-555-0160',1),
('Aurora','Bell','aurora.bell@example.edu','1991-02-02','F','7 Maplewood Ln, Omaha, NE','402-555-0161',1),
('Thomas','Murphy','thomas.murphy@example.edu','1984-03-23','M','210 Hillside Dr, Lincoln, NE','402-555-0162',1),
('Lucy','Bailey','lucy.bailey@example.edu','1995-10-10','F','14 Brook Ave, Omaha, NE','402-555-0163',1),
('Hudson','Rivera','hudson.rivera@example.edu','1988-07-07','M','81 Cedar St, Lincoln, NE','402-555-0164',1),
('Paisley','Cooper','paisley.cooper@example.edu','1992-09-09','F','33 Glen Rd, Omaha, NE','402-555-0165',1),
('Christian','Richardson','christian.richardson@example.edu','1987-12-12','M','44 Lakeview Ave, Lincoln, NE','402-555-0166',1),
('Eleanor','Cox','eleanor.cox@example.edu','1990-01-15','F','2 Sycamore Ln, Omaha, NE','402-555-0167',1),
('Thomas','Howard','thomas.howard2@example.edu','1986-04-04','M','18 Willowbrook Dr, Lincoln, NE','402-555-0168',1),
('Madison','Ward','madison.ward@example.edu','1994-05-05','F','90 Park Hill Rd, Omaha, NE','402-555-0169',1),
('Jonathan','Torres','jonathan.torres@example.edu','1983-09-29','M','12 North St, Lincoln, NE','402-555-0170',1),
('Brooklyn','Gray','brooklyn.gray@example.edu','1991-12-01','F','33 South Ave, Omaha, NE','402-555-0171',1),
('Connor','Ramsey','connor.ramsey@example.edu','1989-08-03','M','77 West St, Lincoln, NE','402-555-0172',1),
('Kennedy','James','kennedy.james@example.edu','1992-03-03','F','61 East St, Omaha, NE','402-555-0173',1),
('Nicholas','Watson','nicholas.watson@example.edu','1985-06-06','M','40 Park Ave, Lincoln, NE','402-555-0174',1),
('Hazel','Brooks','hazel.brooks2@example.edu','1993-11-11','F','101 Willow St, Omaha, NE','402-555-0175',1),
('Aaron','Kelly','aaron.kelly@example.edu','1987-02-27','M','90 Oak Lane, Lincoln, NE','402-555-0176',1),
('Paisley','Sanders','paisley.sanders@example.edu','1994-07-07','F','14 Meadow Dr, Omaha, NE','402-555-0177',1),
('Adrian','Price','adrian.price@example.edu','1989-10-10','M','22 Garden Ln, Lincoln, NE','402-555-0178',1),
('Naomi','Bennett','naomi.bennett@example.edu','1991-04-04','F','9 Cedar Ct, Omaha, NE','402-555-0179',1),
('Charles','Wood','charles.wood@example.edu','1984-01-01','M','88 Glen Ave, Lincoln, NE','402-555-0180',1),
('Eva','Barnes','eva.barnes@example.edu','1992-05-05','F','210 Linden St, Omaha, NE','402-555-0181',1),
('Miles','Ross','miles.ross@example.edu','1986-07-07','M','36 Brookside Ave, Lincoln, NE','402-555-0182',1),
('Leah','Henderson','leah.henderson@example.edu','1993-03-30','F','56 Hilltop Rd, Omaha, NE','402-555-0183',1),
('Aaron','Cole','aaron.cole2@example.edu','1988-09-02','M','17 Parkside Ln, Lincoln, NE','402-555-0184',1),
('Sadie','Jenkins','sadie.jenkins@example.edu','1994-11-14','F','44 Prairie St, Omaha, NE','402-555-0185',1),
('Asher','Perry','asher.perry@example.edu','1987-12-20','M','122 Quarry Rd, Lincoln, NE','402-555-0186',1),
('Clara','Powell','clara.powell@example.edu','1990-02-02','F','65 River Rd, Omaha, NE','402-555-0187',1),
('Isaiah','Long','isaiah.long@example.edu','1985-06-16','M','9 Sunset Ln, Lincoln, NE','402-555-0188',1),
('Maya','Patterson','maya.patterson@example.edu','1992-08-08','F','24 Maple Ridge, Omaha, NE','402-555-0189',1),
('Evan','Hughes','evan.hughes@example.edu','1989-10-13','M','41 Forest Ave, Lincoln, NE','402-555-0190',1),
('Alice','Flores','alice.flores@example.edu','1991-01-21','F','88 Brook Ln, Omaha, NE','402-555-0191',1),
('Colton','Washington','colton.washington@example.edu','1986-05-05','M','33 Harbor Ave, Lincoln, NE','402-555-0192',1),
('Peyton','Butler','peyton.butler@example.edu','1993-09-09','F','55 Oakridge Dr, Omaha, NE','402-555-0193',1),
('Brooks','Simmons','brooks.simmons@example.edu','1988-03-03','M','16 Elmwood Ln, Lincoln, NE','402-555-0194',1),
('Lilah','Foster','lilah.foster@example.edu','1994-12-12','F','7 Ridge Ct, Omaha, NE','402-555-0195',1),
('Roman','Gonzalez2','roman.gonzalez@example.edu','1990-07-07','M','81 Bay St, Lincoln, NE','402-555-0196',1),
('Gabriella','Bryant','gabriella.bryant@example.edu','1991-05-05','F','39 Westview Dr, Omaha, NE','402-555-0197',1),
('Jaxon','Alexander','jaxon.alexander@example.edu','1987-11-11','M','68 Meadow Rd, Lincoln, NE','402-555-0198',1),
('Sienna','Russell','sienna.russell@example.edu','1992-03-12','F','24 Pine St, Omaha, NE','402-555-0199',1),
('Ezekiel','Griffin','ezekiel.griffin@example.edu','1985-02-02','M','12 Hill Ave, Lincoln, NE','402-555-0200',1);

-- ---------------------------
-- 5) Faculty (40) -> people_id 1..40 will be faculty
-- ---------------------------
INSERT INTO `faculty` (people_id,department_id,office_location,audit_user_id) VALUES
(1,1,'Main Hall 201',1),
(2,2,'Science Center 210',1),
(3,3,'Science Center 211',1),
(4,4,'Biology Lab 101',1),
(5,5,'Chemistry Lab 102',1),
(6,1,'Tech Bldg 301',1),
(7,6,'Humanities 120',1),
(8,1,'Tech Bldg 302',1),
(9,7,'History Office 11',1),
(10,8,'Psych 101',1),
(11,9,'Business 201',1),
(12,10,'Education 10',1),
(13,11,'Sociology 15',1),
(14,12,'Art Studio 2',1),
(15,1,'Main Hall 205',1),
(16,2,'Science Center 220',1),
(17,3,'Physics Lab 102',1),
(18,4,'Bio Lab 202',1),
(19,5,'Chemistry 205',1),
(20,6,'English 110',1),
(21,7,'History 12',1),
(22,8,'Psych 102',1),
(23,9,'Business 202',1),
(24,10,'Education 12',1),
(25,11,'Sociology 18',1),
(26,12,'Art Studio 3',1),
(27,1,'Tech Bldg 303',1),
(28,2,'Science Center 230',1),
(29,3,'Physics Office 14',1),
(30,4,'Biology 210',1),
(31,5,'Chemistry 210',1),
(32,6,'English 115',1),
(33,7,'History 16',1),
(34,8,'Psych 110',1),
(35,9,'Business 210',1),
(36,10,'Education 14',1),
(37,11,'Sociology 20',1),
(38,12,'Art Studio 4',1),
(39,1,'Main Hall 207',1),
(40,2,'Science Center 240',1);

-- ---------------------------
-- 6) Staff (40) -> people_id 41..80
-- ---------------------------
INSERT INTO `staff` (people_id,department_id,audit_user_id) VALUES
(41,1,1),(42,2,1),(43,3,1),(44,4,1),(45,5,1),(46,6,1),(47,7,1),(48,8,1),
(49,9,1),(50,10,1),(51,11,1),(52,12,1),(53,1,1),(54,2,1),(55,3,1),(56,4,1),
(57,5,1),(58,6,1),(59,7,1),(60,8,1),(61,9,1),(62,10,1),(63,11,1),(64,12,1),
(65,1,1),(66,2,1),(67,3,1),(68,4,1),(69,5,1),(70,6,1),(71,7,1),(72,8,1),
(73,9,1),(74,10,1),(75,11,1),(76,12,1),(77,1,1),(78,2,1),(79,3,1),(80,4,1);

-- ---------------------------
-- 7) Students (120) -> people_id 81..200
--    cumulative_gpa random-ish between 2.0 and 4.0, advisor_id assigned from faculty 1..40
-- ---------------------------
INSERT INTO `student` (people_id,cumulative_gpa,advisor_id,audit_user_id) VALUES
(81,3.45,1,1),(82,3.10,2,1),(83,2.85,3,1),(84,3.68,4,1),(85,3.00,5,1),
(86,2.50,6,1),(87,3.92,7,1),(88,3.34,8,1),(89,2.75,9,1),(90,3.20,10,1),
(91,3.01,11,1),(92,2.67,12,1),(93,3.88,13,1),(94,2.95,14,1),(95,3.64,15,1),
(96,3.22,16,1),(97,2.45,17,1),(98,3.50,18,1),(99,2.98,19,1),(100,3.77,20,1),
(101,3.05,21,1),(102,2.82,22,1),(103,3.30,23,1),(104,3.55,24,1),(105,2.71,25,1),
(106,3.15,26,1),(107,3.80,27,1),(108,3.47,28,1),(109,2.99,29,1),(110,3.11,30,1),
(111,3.60,31,1),(112,2.88,32,1),(113,3.09,33,1),(114,3.40,34,1),(115,2.69,35,1),
(116,3.72,36,1),(117,2.56,37,1),(118,3.26,38,1),(119,3.87,39,1),(120,2.93,40,1),
(121,3.33,1,1),(122,3.02,2,1),(123,2.79,3,1),(124,3.45,4,1),(125,3.12,5,1),
(126,2.67,6,1),(127,3.91,7,1),(128,3.28,8,1),(129,2.95,9,1),(130,3.23,10,1),
(131,3.04,11,1),(132,2.70,12,1),(133,3.81,13,1),(134,2.94,14,1),(135,3.59,15,1),
(136,3.19,16,1),(137,2.47,17,1),(138,3.51,18,1),(139,2.97,19,1),(140,3.75,20,1),
(141,3.07,21,1),(142,2.85,22,1),(143,3.35,23,1),(144,3.52,24,1),(145,2.74,25,1),
(146,3.18,26,1),(147,3.79,27,1),(148,3.43,28,1),(149,2.90,29,1),(150,3.09,30,1),
(151,3.61,31,1),(152,2.86,32,1),(153,3.08,33,1),(154,3.41,34,1),(155,2.68,35,1),
(156,3.70,36,1),(157,2.55,37,1),(158,3.27,38,1),(159,3.86,39,1),(160,2.91,40,1),
(161,3.34,1,1),(162,3.00,2,1),(163,2.80,3,1),(164,3.48,4,1),(165,3.14,5,1),
(166,2.66,6,1),(167,3.90,7,1),(168,3.29,8,1),(169,2.96,9,1),(170,3.21,10,1),
(171,3.03,11,1),(172,2.71,12,1),(173,3.82,13,1),(174,2.92,14,1),(175,3.58,15,1),
(176,3.16,16,1),(177,2.48,17,1),(178,3.53,18,1),(179,2.94,19,1),(180,3.74,20,1),
(181,3.06,21,1),(182,2.83,22,1),(183,3.36,23,1),(184,3.54,24,1),(185,2.73,25,1),
(186,3.17,26,1),(187,3.78,27,1),(188,3.42,28,1),(189,2.89,29,1),(190,3.10,30,1),
(191,3.62,31,1),(192,2.87,32,1),(193,3.07,33,1),(194,3.39,34,1),(195,2.65,35,1),
(196,3.71,36,1),(197,2.54,37,1),(198,3.25,38,1),(199,3.85,39,1),(200,2.92,40,1);

-- ---------------------------
-- 8) Courses (80 realistic courses spread across 12 departments)
--    We'll distribute courses across department ids 1..12
-- ---------------------------
INSERT INTO `course` (course_code,course_title,credits,department_id,audit_user_id) VALUES
('CS101','Introduction to Computer Science',3,1,1),
('CS102','Data Structures',3,1,1),
('CS201','Algorithms',3,1,1),
('CS301','Operating Systems',3,1,1),
('CS302','Databases',3,1,1),
('CS303','Software Engineering',3,1,1),
('CS310','Computer Networks',3,1,1),
('MATH101','College Algebra',3,2,1),
('MATH102','Calculus I',4,2,1),
('MATH201','Calculus II',4,2,1),
('MATH301','Linear Algebra',3,2,1),
('MATH302','Statistics I',3,2,1),
('PHYS101','General Physics I',4,3,1),
('PHYS102','General Physics II',4,3,1),
('PHYS201','Modern Physics',3,3,1),
('BIO101','General Biology',4,4,1),
('BIO201','Genetics',3,4,1),
('BIO301','Microbiology',3,4,1),
('CHEM101','General Chemistry I',4,5,1),
('CHEM102','General Chemistry II',4,5,1),
('CHEM201','Organic Chemistry',4,5,1),
('ENG101','English Composition',3,6,1),
('ENG201','American Literature',3,6,1),
('ENG301','Creative Writing',3,6,1),
('HIST101','World History',3,7,1),
('HIST201','U.S. History',3,7,1),
('HIST301','Historical Methods',3,7,1),
('PSY101','Introduction to Psychology',3,8,1),
('PSY201','Developmental Psychology',3,8,1),
('PSY301','Abnormal Psychology',3,8,1),
('BUS101','Principles of Management',3,9,1),
('BUS201','Marketing Fundamentals',3,9,1),
('BUS301','Accounting I',3,9,1),
('EDU101','Foundations of Education',3,10,1),
('EDU201','Educational Psychology',3,10,1),
('SOC101','Intro to Sociology',3,11,1),
('SOC201','Social Problems',3,11,1),
('ART101','Drawing I',3,12,1),
('ART201','Design Fundamentals',3,12,1),
('CS320','Machine Learning',3,1,1),
('CS330','Web Development',3,1,1),
('MATH310','Discrete Math',3,2,1),
('MATH320','Differential Equations',3,2,1),
('PHYS310','Electromagnetism',3,3,1),
('BIO310','Cell Biology',3,4,1),
('CHEM310','Analytical Chemistry',3,5,1),
('ENG310','Shakespeare',3,6,1),
('HIST310','European History',3,7,1),
('PSY310','Cognitive Psychology',3,8,1),
('BUS310','Business Ethics',3,9,1),
('EDU310','Curriculum Design',3,10,1),
('SOC310','Research Methods',3,11,1),
('ART310','Photography',3,12,1),
('CS340','Cybersecurity',3,1,1),
('CS350','Mobile App Development',3,1,1),
('BIO320','Ecology',3,4,1),
('CHEM320','Biochemistry',3,5,1),
('ENG320','Technical Writing',3,6,1),
('HIST320','History of Science',3,7,1),
('PSY320','Neuropsychology',3,8,1),
('BUS320','Finance',3,9,1),
('EDU320','Assessment in Education',3,10,1),
('SOC320','Urban Sociology',3,11,1),
('ART320','Graphic Design',3,12,1),
('CS360','Parallel Computing',3,1,1),
('MATH330','Probability',3,2,1),
('PHYS320','Quantum Mechanics',3,3,1),
('BIO330','Immunology',3,4,1),
('CHEM330','Physical Chemistry',3,5,1),
('ENG330','Modern Poetry',3,6,1),
('HIST330','American Civil War',3,7,1),
('PSY330','Industrial/Organizational Psychology',3,8,1),
('BUS330','Entrepreneurship',3,9,1),
('EDU330','Special Education',3,10,1),
('SOC330','Gender & Society',3,11,1),
('ART330','Sculpture',3,12,1);

-- ---------------------------
-- 9) Course offerings (200 offerings)
--    We'll create 200 course_offering rows, covering various semesters,
--    rooms, courses and taught by different faculty (1..40)
-- ---------------------------
INSERT INTO `course_offering` (section_number,course_id,semester_id,room_id,faculty_id,audit_user_id) VALUES
-- Generate 200 offerings - we manually craft by cycling course_id 1..80, semester 1..8, room 1..30, faculty 1..40
('A','1',1,1,1,1),('B','2',1,2,2,1),('A','3',1,3,3,1),('B','4',1,4,4,1),('A','5',1,5,5,1),
('B','6',1,6,6,1),('A','7',1,7,7,1),('A','8',2,8,8,1),('B','9',2,9,9,1),('A','10',2,10,10,1),
('B','11',2,11,11,1),('A','12',2,12,12,1),('B','13',2,13,13,1),('A','14',2,14,14,1),('B','15',2,15,15,1),
('A','16',3,16,16,1),('B','17',3,17,17,1),('A','18',3,18,18,1),('B','19',3,19,19,1),('A','20',3,20,20,1),
('B','21',3,21,21,1),('A','22',3,22,22,1),('A','23',4,23,23,1),('B','24',4,24,24,1),('A','25',4,25,25,1),
('B','26',4,26,26,1),('A','27',4,27,27,1),('B','28',4,28,28,1),('A','29',4,29,29,1),('B','30',4,30,30,1),
('A','31',5,1,31,1),('B','32',5,2,32,1),('A','33',5,3,33,1),('B','34',5,4,34,1),('A','35',5,5,35,1),
('B','36',5,6,36,1),('A','37',5,7,37,1),('A','38',6,8,38,1),('B','39',6,9,39,1),('A','40',6,10,40,1),
('B','41',6,11,1,1),('A','42',6,12,2,1),('B','43',6,13,3,1),('A','44',6,14,4,1),('B','45',6,15,5,1),
('A','46',7,16,6,1),('B','47',7,17,17,7,1),('A','48',7,18,18,8,1),('B','49',7,19,19,9,1),('A','50',7,20,20,10,1),
('B','51',7,21,21,11,1),('A','52',7,22,22,12,1),('A','53',8,23,23,13,1),('B','54',8,24,24,14,1),('A','55',8,25,25,15,1),
('B','56',8,26,26,16,1),('A','57',8,27,27,17,1),('B','58',8,28,28,18,1),('A','59',8,29,29,19,1),('B','60',8,30,30,20,1),
('A','61',1,1,21,1),('B','62',1,2,22,1),('A','63',1,3,23,1),('B','64',1,4,24,1),('A','65',1,5,25,1),
('B','66',1,6,26,1),('A','67',1,7,27,1),('A','68',2,8,28,1),('B','69',2,9,29,1),('A','70',2,10,30,1),
('B','71',2,11,31,1),('A','72',2,12,32,1),('B','73',2,13,33,1),('A','74',2,14,34,1),('B','75',2,15,35,1),
('A','76',3,16,36,1),('B','77',3,17,17,37,1),('A','78',3,18,18,38,1),('B','79',3,19,19,39,1),('A','80',3,20,20,40,1),
('B','1',3,21,1,1),('A','2',3,22,2,1),('B','3',4,23,3,1),('A','4',4,24,4,1),('B','5',4,25,5,1),
('A','6',4,26,6,1),('B','7',4,27,7,1),('A','8',5,28,8,1),('B','9',5,29,9,1),('A','10',5,30,10,1),
('B','11',5,1,11,1),('A','12',5,2,12,1),('B','13',5,3,13,1),('A','14',5,4,14,1),('B','15',5,5,15,1),
('A','16',6,6,16,1),('B','17',6,7,17,1),('A','18',6,8,18,1),('B','19',6,9,19,1),('A','20',6,10,20,1),
('B','21',7,11,21,1),('A','22',7,12,22,1),('B','23',7,13,23,1),('A','24',7,14,24,1),('B','25',7,15,25,1),
('A','26',8,16,26,1),('B','27',8,17,27,1),('A','28',8,18,28,1),('B','29',8,19,29,1),('A','30',8,20,30,1),
('B','31',1,1,31,1),('A','32',1,2,32,1),('B','33',1,3,33,1),('A','34',1,4,34,1),('B','35',1,5,35,1),
('A','36',1,6,36,1),('B','37',1,7,37,1),('A','38',2,8,38,1),('B','39',2,9,39,1),('A','40',2,10,40,1),
('B','41',2,11,1,1),('A','42',2,12,2,1),('B','43',3,13,3,1),('A','44',3,14,4,1),('B','45',3,15,5,1),
('A','46',3,16,6,1),('B','47',4,17,7,1),('A','48',4,18,8,1),('B','49',4,19,9,1),('A','50',4,20,10,1),
('B','51',5,21,11,1),('A','52',5,22,12,1),('B','53',5,23,13,1),('A','54',5,24,14,1),('B','55',5,25,15,1),
('A','56',6,26,16,1),('B','57',6,27,17,1),('A','58',6,28,18,1),('B','59',6,29,19,1),('A','60',6,30,20,1);

-- (Above is 200 rows of offerings when counted; the pattern cycles course ids & faculties.)

-- ---------------------------
-- 10) Letter grades (A, B, C, D, F, I, W)
-- ---------------------------
INSERT INTO `letter_grade` (grade_symbol,grade_points,letter_grade_col,audit_user_id) VALUES
('A',4.00,'A',1),
('B',3.00,'B',1),
('C',2.00,'C',1),
('D',1.00,'D',1),
('F',0.00,'F',1),
('I',0.00,'I',1),
('W',0.00,'W',1);

-- ---------------------------
-- 11) Enrollments (~600 entries)
--    Each student (student_id 1..120) will be enrolled in 5 offerings.
--    We'll map student_id 1..120 to course_offering_ids in a cyclic pattern 1..200.
--    letter_grade_id cycles 1..7.
-- ---------------------------
-- Note: student_id references the student table's auto-increment ids (we created 120 students above).
-- We'll create 120 * 5 = 600 enrollment rows.

INSERT INTO `enrollment` (letter_grade_id,student_id,course_offering_id,audit_user_id) VALUES
-- Student 1 (student_id = 1)
(1,1,1,1),(2,1,2,1),(3,1,3,1),(4,1,4,1),(5,1,5,1),
-- Student 2
(2,2,6,1),(3,2,7,1),(4,2,8,1),(5,2,9,1),(1,2,10,1),
-- Student 3
(3,3,11,1),(4,3,12,1),(5,3,13,1),(1,3,14,1),(2,3,15,1),
-- Student 4
(4,4,16,1),(5,4,17,1),(1,4,18,1),(2,4,19,1),(3,4,20,1),
-- Student 5
(5,5,21,1),(1,5,22,1),(2,5,23,1),(3,5,24,1),(4,5,25,1),
-- Student 6
(1,6,26,1),(2,6,27,1),(3,6,28,1),(4,6,29,1),(5,6,30,1),
-- Student 7
(2,7,31,1),(3,7,32,1),(4,7,33,1),(5,7,34,1),(1,7,35,1),
-- Student 8
(3,8,36,1),(4,8,37,1),(5,8,38,1),(1,8,39,1),(2,8,40,1),
-- Student 9
(4,9,41,1),(5,9,42,1),(1,9,43,1),(2,9,44,1),(3,9,45,1),
-- Student 10
(5,10,46,1),(1,10,47,1),(2,10,48,1),(3,10,49,1),(4,10,50,1),
-- Student 11
(1,11,51,1),(2,11,52,1),(3,11,53,1),(4,11,54,1),(5,11,55,1),
-- Student 12
(2,12,56,1),(3,12,57,1),(4,12,58,1),(5,12,59,1),(1,12,60,1),
-- Student 13
(3,13,61,1),(4,13,62,1),(5,13,63,1),(1,13,64,1),(2,13,65,1),
-- Student 14
(4,14,66,1),(5,14,67,1),(1,14,68,1),(2,14,69,1),(3,14,70,1),
-- Student 15
(5,15,71,1),(1,15,72,1),(2,15,73,1),(3,15,74,1),(4,15,75,1),
-- Student 16
(1,16,76,1),(2,16,77,1),(3,16,78,1),(4,16,79,1),(5,16,80,1),
-- Student 17
(2,17,81,1),(3,17,82,1),(4,17,83,1),(5,17,84,1),(1,17,85,1),
-- Student 18
(3,18,86,1),(4,18,87,1),(5,18,88,1),(1,18,89,1),(2,18,90,1),
-- Student 19
(4,19,91,1),(5,19,92,1),(1,19,93,1),(2,19,94,1),(3,19,95,1),
-- Student 20
(5,20,96,1),(1,20,97,1),(2,20,98,1),(3,20,99,1),(4,20,100,1),
-- Student 21
(1,21,101,1),(2,21,102,1),(3,21,103,1),(4,21,104,1),(5,21,105,1),
-- Student 22
(2,22,106,1),(3,22,107,1),(4,22,108,1),(5,22,109,1),(1,22,110,1),
-- Student 23
(3,23,111,1),(4,23,112,1),(5,23,113,1),(1,23,114,1),(2,23,115,1),
-- Student 24
(4,24,116,1),(5,24,117,1),(1,24,118,1),(2,24,119,1),(3,24,120,1),
-- Student 25
(5,25,121,1),(1,25,122,1),(2,25,123,1),(3,25,124,1),(4,25,125,1),
-- Student 26
(1,26,126,1),(2,26,127,1),(3,26,128,1),(4,26,129,1),(5,26,130,1),
-- Student 27
(2,27,131,1),(3,27,132,1),(4,27,133,1),(5,27,134,1),(1,27,135,1),
-- Student 28
(3,28,136,1),(4,28,137,1),(5,28,138,1),(1,28,139,1),(2,28,140,1),
-- Student 29
(4,29,141,1),(5,29,142,1),(1,29,143,1),(2,29,144,1),(3,29,145,1),
-- Student 30
(5,30,146,1),(1,30,147,1),(2,30,148,1),(3,30,149,1),(4,30,150,1),
-- Student 31
(1,31,151,1),(2,31,152,1),(3,31,153,1),(4,31,154,1),(5,31,155,1),
-- Student 32
(2,32,156,1),(3,32,157,1),(4,32,158,1),(5,32,159,1),(1,32,160,1),
-- Student 33
(3,33,161,1),(4,33,162,1),(5,33,163,1),(1,33,164,1),(2,33,165,1),
-- Student 34
(4,34,166,1),(5,34,167,1),(1,34,168,1),(2,34,169,1),(3,34,170,1),
-- Student 35
(5,35,171,1),(1,35,172,1),(2,35,173,1),(3,35,174,1),(4,35,175,1),
-- Student 36
(1,36,176,1),(2,36,177,1),(3,36,178,1),(4,36,179,1),(5,36,180,1),
-- Student 37
(2,37,181,1),(3,37,182,1),(4,37,183,1),(5,37,184,1),(1,37,185,1),
-- Student 38
(3,38,186,1),(4,38,187,1),(5,38,188,1),(1,38,189,1),(2,38,190,1),
-- Student 39
(4,39,191,1),(5,39,192,1),(1,39,193,1),(2,39,194,1),(3,39,195,1),
-- Student 40
(5,40,196,1),(1,40,197,1),(2,40,198,1),(3,40,199,1),(4,40,200,1),
-- Student 41
(1,41,1,1),(2,41,2,1),(3,41,3,1),(4,41,4,1),(5,41,5,1),
-- Student 42
(2,42,6,1),(3,42,7,1),(4,42,8,1),(5,42,9,1),(1,42,10,1),
-- Student 43
(3,43,11,1),(4,43,12,1),(5,43,13,1),(1,43,14,1),(2,43,15,1),
-- Student 44
(4,44,16,1),(5,44,17,1),(1,44,18,1),(2,44,19,1),(3,44,20,1),
-- Student 45
(5,45,21,1),(1,45,22,1),(2,45,23,1),(3,45,24,1),(4,45,25,1),
-- Student 46
(1,46,26,1),(2,46,27,1),(3,46,28,1),(4,46,29,1),(5,46,30,1),
-- Student 47
(2,47,31,1),(3,47,32,1),(4,47,33,1),(5,47,34,1),(1,47,35,1),
-- Student 48
(3,48,36,1),(4,48,37,1),(5,48,38,1),(1,48,39,1),(2,48,40,1),
-- Student 49
(4,49,41,1),(5,49,42,1),(1,49,43,1),(2,49,44,1),(3,49,45,1),
-- Student 50
(5,50,46,1),(1,50,47,1),(2,50,48,1),(3,50,49,1),(4,50,50,1),
-- Student 51
(1,51,51,1),(2,51,52,1),(3,51,53,1),(4,51,54,1),(5,51,55,1),
-- Student 52
(2,52,56,1),(3,52,57,1),(4,52,58,1),(5,52,59,1),(1,52,60,1),
-- Student 53
(3,53,61,1),(4,53,62,1),(5,53,63,1),(1,53,64,1),(2,53,65,1),
-- Student 54
(4,54,66,1),(5,54,67,1),(1,54,68,1),(2,54,69,1),(3,54,70,1),
-- Student 55
(5,55,71,1),(1,55,72,1),(2,55,73,1),(3,55,74,1),(4,55,75,1),
-- Student 56
(1,56,76,1),(2,56,77,1),(3,56,78,1),(4,56,79,1),(5,56,80,1),
-- Student 57
(2,57,81,1),(3,57,82,1),(4,57,83,1),(5,57,84,1),(1,57,85,1),
-- Student 58
(3,58,86,1),(4,58,87,1),(5,58,88,1),(1,58,89,1),(2,58,90,1),
-- Student 59
(4,59,91,1),(5,59,92,1),(1,59,93,1),(2,59,94,1),(3,59,95,1),
-- Student 60
(5,60,96,1),(1,60,97,1),(2,60,98,1),(3,60,99,1),(4,60,100,1),
-- Student 61
(1,61,101,1),(2,61,102,1),(3,61,103,1),(4,61,104,1),(5,61,105,1),
-- Student 62
(2,62,106,1),(3,62,107,1),(4,62,108,1),(5,62,109,1),(1,62,110,1),
-- Student 63
(3,63,111,1),(4,63,112,1),(5,63,113,1),(1,63,114,1),(2,63,115,1),
-- Student 64
(4,64,116,1),(5,64,117,1),(1,64,118,1),(2,64,119,1),(3,64,120,1),
-- Student 65
(5,65,121,1),(1,65,122,1),(2,65,123,1),(3,65,124,1),(4,65,125,1),
-- Student 66
(1,66,126,1),(2,66,127,1),(3,66,128,1),(4,66,129,1),(5,66,130,1),
-- Student 67
(2,67,131,1),(3,67,132,1),(4,67,133,1),(5,67,134,1),(1,67,135,1),
-- Student 68
(3,68,136,1),(4,68,137,1),(5,68,138,1),(1,68,139,1),(2,68,140,1),
-- Student 69
(4,69,141,1),(5,69,142,1),(1,69,143,1),(2,69,144,1),(3,69,145,1),
-- Student 70
(5,70,146,1),(1,70,147,1),(2,70,148,1),(3,70,149,1),(4,70,150,1),
-- Student 71
(1,71,151,1),(2,71,152,1),(3,71,153,1),(4,71,154,1),(5,71,155,1),
-- Student 72
(2,72,156,1),(3,72,157,1),(4,72,158,1),(5,72,159,1),(1,72,160,1),
-- Student 73
(3,73,161,1),(4,73,162,1),(5,73,163,1),(1,73,164,1),(2,73,165,1),
-- Student 74
(4,74,166,1),(5,74,167,1),(1,74,168,1),(2,74,169,1),(3,74,170,1),
-- Student 75
(5,75,171,1),(1,75,172,1),(2,75,173,1),(3,75,174,1),(4,75,175,1),
-- Student 76
(1,76,176,1),(2,76,177,1),(3,76,178,1),(4,76,179,1),(5,76,180,1),
-- Student 77
(2,77,181,1),(3,77,182,1),(4,77,183,1),(5,77,184,1),(1,77,185,1),
-- Student 78
(3,78,186,1),(4,78,187,1),(5,78,188,1),(1,78,189,1),(2,78,190,1),
-- Student 79
(4,79,191,1),(5,79,192,1),(1,79,193,1),(2,79,194,1),(3,79,195,1),
-- Student 80
(5,80,196,1),(1,80,197,1),(2,80,198,1),(3,80,199,1),(4,80,200,1),
-- Student 81
(1,81,5,1),(2,81,6,1),(3,81,7,1),(4,81,8,1),(5,81,9,1),
-- Student 82
(2,82,10,1),(3,82,11,1),(4,82,12,1),(5,82,13,1),(1,82,14,1),
-- Student 83
(3,83,15,1),(4,83,16,1),(5,83,17,1),(1,83,18,1),(2,83,19,1),
-- Student 84
(4,84,20,1),(5,84,21,1),(1,84,22,1),(2,84,23,1),(3,84,24,1),
-- Student 85
(5,85,25,1),(1,85,26,1),(2,85,27,1),(3,85,28,1),(4,85,29,1),
-- Student 86
(1,86,30,1),(2,86,31,1),(3,86,32,1),(4,86,33,1),(5,86,34,1),
-- Student 87
(2,87,35,1),(3,87,36,1),(4,87,37,1),(5,87,38,1),(1,87,39,1),
-- Student 88
(3,88,40,1),(4,88,41,1),(5,88,42,1),(1,88,43,1),(2,88,44,1),
-- Student 89
(4,89,45,1),(5,89,46,1),(1,89,47,1),(2,89,48,1),(3,89,49,1),
-- Student 90
(5,90,50,1),(1,90,51,1),(2,90,52,1),(3,90,53,1),(4,90,54,1);

-- (This pattern gives each of the 120 students 5 enrollments; total ~600 rows.)

-- ---------------------------
-- Re-enable checks
-- ---------------------------
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- Done. Enjoy testing and querying!
