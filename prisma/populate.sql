INSERT INTO "Admin" ("id", "username") VALUES
('admin1', 'admin1'),
('admin2', 'admin2');

INSERT INTO "Grade" ("id", "level") VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7);

INSERT INTO "Subject" ("id", "name") VALUES
(1, 'Math'),
(2, 'English'),
(3, 'Physics'),
(4, 'Chemistry'),
(5, 'Biology'),
(6, 'History'),
(7, 'Geography'),
(8, 'Art'),
(9, 'Music'),
(10, 'Literature'),
(11, 'Science'),
(12, 'Social Studies');

INSERT INTO "Teacher" ("id", "username", "name", "surname", "email", "phone", "address", "img", "bloodType", "gender", "birthday") VALUES
('teacher1', 'teacher_arif_hossain_1', 'Arif', 'Hossain', 'arif.hossain@schoolbd.edu', '88017000001', 'House 12, Road 5, Dhanmondi, Dhaka, Bangladesh', NULL, 'A+', 'MALE', '1985-01-01 00:00:00'),
('teacher2', 'teacher_nusrat_jahan_2', 'Nusrat', 'Jahan', 'nusrat.jahan@schoolbd.edu', '88017000002', 'House 12, Road 5, Dhanmondi, Dhaka, Bangladesh', NULL, 'O+', 'FEMALE', '1986-02-02 00:00:00'),
('teacher3', 'teacher_tanvir_ahmed_3', 'Tanvir', 'Ahmed', 'tanvir.ahmed@schoolbd.edu', '88017000003', 'House 12, Road 5, Dhanmondi, Dhaka, Bangladesh', NULL, 'A+', 'MALE', '1987-03-03 00:00:00'),
('teacher4', 'teacher_rakib_hasan_4', 'Rakib', 'Hasan', 'rakib.hasan@schoolbd.edu', '88017000004', 'House 12, Road 5, Dhanmondi, Dhaka, Bangladesh', NULL, 'O+', 'FEMALE', '1988-04-04 00:00:00'),
('teacher5', 'teacher_mitu_akter_5', 'Mitu', 'Akter', 'mitu.akter@schoolbd.edu', '88017000005', 'House 12, Road 5, Dhanmondi, Dhaka, Bangladesh', NULL, 'A+', 'MALE', '1989-05-05 00:00:00'),
('teacher6', 'teacher_farhana_islam_6', 'Farhana', 'Islam', 'farhana.islam@schoolbd.edu', '88017000006', 'House 12, Road 5, Dhanmondi, Dhaka, Bangladesh', NULL, 'O+', 'FEMALE', '1990-06-06 00:00:00'),
('teacher7', 'teacher_shakil_ahmed_7', 'Shakil', 'Ahmed', 'shakil.ahmed@schoolbd.edu', '88017000007', 'House 12, Road 5, Dhanmondi, Dhaka, Bangladesh', NULL, 'A+', 'MALE', '1991-07-07 00:00:00'),
('teacher8', 'teacher_sadia_rahman_8', 'Sadia', 'Rahman', 'sadia.rahman@schoolbd.edu', '88017000008', 'House 12, Road 5, Dhanmondi, Dhaka, Bangladesh', NULL, 'O+', 'FEMALE', '1992-08-08 00:00:00'),
('teacher9', 'teacher_imran_kabir_9', 'Imran', 'Kabir', 'imran.kabir@schoolbd.edu', '88017000009', 'House 12, Road 5, Dhanmondi, Dhaka, Bangladesh', NULL, 'A+', 'MALE', '1993-09-09 00:00:00'),
('teacher10', 'teacher_mehedi_hasan_10', 'Mehedi', 'Hasan', 'mehedi.hasan@schoolbd.edu', '88017000010', 'House 12, Road 5, Dhanmondi, Dhaka, Bangladesh', NULL, 'O+', 'FEMALE', '1994-10-10 00:00:00');

INSERT INTO "Class" ("id", "name", "capacity", "supervisorId", "gradeId") VALUES
(1, '1A', 20, NULL, 1),
(2, '2B', 22, NULL, 2),
(3, '3C', 20, 'teacher10', 3),
(4, '4B', 18, 'teacher10', 4),
(5, '5A', 16, 'teacher10', 5),
(6, '5B', 20, NULL, 5),
(7, '7A', 18, NULL, 7),
(8, '6B', 22, NULL, 6),
(9, '6C', 18, NULL, 6),
(10, '6D', 20, NULL, 6);

INSERT INTO "_SubjectToTeacher" ("A", "B") VALUES
(1, 'teacher1'),
(3, 'teacher2'),
(4, 'teacher2'),
(5, 'teacher3'),
(6, 'teacher4'),
(9, 'teacher5'),
(6, 'teacher5'),
(3, 'teacher6'),
(2, 'teacher7'),
(1, 'teacher8'),
(10, 'teacher9'),
(2, 'teacher9'),
(5, 'teacher10');

INSERT INTO "Parent" ("id", "username", "name", "surname", "email", "phone", "address") VALUES
('parent1', 'parent_arif_hossain_1', 'Arif', 'Hossain', 'arif.hossain@familybd.com', '88018000001', 'House 12, Road 5, Dhanmondi, Dhaka, Bangladesh'),
('parent2', 'parent_nusrat_jahan_2', 'Nusrat', 'Jahan', 'nusrat.jahan@familybd.com', '88018000002', 'House 12, Road 5, Dhanmondi, Dhaka, Bangladesh'),
('parent3', 'parent_tanvir_ahmed_3', 'Tanvir', 'Ahmed', 'tanvir.ahmed@familybd.com', '88018000003', 'House 12, Road 5, Dhanmondi, Dhaka, Bangladesh'),
('parent4', 'parent_rakib_hasan_4', 'Rakib', 'Hasan', 'rakib.hasan@familybd.com', '88018000004', 'House 12, Road 5, Dhanmondi, Dhaka, Bangladesh'),
('parent5', 'parent_mitu_akter_5', 'Mitu', 'Akter', 'mitu.akter@familybd.com', '88018000005', 'House 12, Road 5, Dhanmondi, Dhaka, Bangladesh'),
('parent6', 'parent_farhana_islam_6', 'Farhana', 'Islam', 'farhana.islam@familybd.com', '88018000006', 'House 12, Road 5, Dhanmondi, Dhaka, Bangladesh'),
('parent7', 'parent_shakil_ahmed_7', 'Shakil', 'Ahmed', 'shakil.ahmed@familybd.com', '88018000007', 'House 12, Road 5, Dhanmondi, Dhaka, Bangladesh'),
('parent8', 'parent_sadia_rahman_8', 'Sadia', 'Rahman', 'sadia.rahman@familybd.com', '88018000008', 'House 12, Road 5, Dhanmondi, Dhaka, Bangladesh'),
('parent9', 'parent_imran_kabir_9', 'Imran', 'Kabir', 'imran.kabir@familybd.com', '88018000009', 'House 12, Road 5, Dhanmondi, Dhaka, Bangladesh'),
('parent10', 'parent_mehedi_hasan_10', 'Mehedi', 'Hasan', 'mehedi.hasan@familybd.com', '88018000010', 'House 12, Road 5, Dhanmondi, Dhaka, Bangladesh');

INSERT INTO "Student" ("id", "username", "name", "surname", "email", "phone", "address", "img", "bloodType", "gender", "parentId", "classId", "gradeId", "birthday") VALUES
('student1', 'student_arif_hossain_1', 'Arif', 'Hossain', 'arif.hossain@schoolbd.edu', '88019000001', 'House 12, Road 5, Dhanmondi, Dhaka, Bangladesh', NULL, 'B+', 'MALE', 'parent1', 1, 5, '2012-01-01 00:00:00'),
('student2', 'student_nusrat_jahan_2', 'Nusrat', 'Jahan', 'nusrat.jahan@schoolbd.edu', '88019000002', 'House 12, Road 5, Dhanmondi, Dhaka, Bangladesh', NULL, 'O-', 'FEMALE', 'parent2', 5, 5, '2013-02-02 00:00:00'),
('student3', 'student_tanvir_ahmed_3', 'Tanvir', 'Ahmed', 'tanvir.ahmed@schoolbd.edu', '88019000003', 'House 12, Road 5, Dhanmondi, Dhaka, Bangladesh', NULL, 'B+', 'MALE', 'parent3', 5, 5, '2014-03-03 00:00:00'),
('student4', 'student_rakib_hasan_4', 'Rakib', 'Hasan', 'rakib.hasan@schoolbd.edu', '88019000004', 'House 12, Road 5, Dhanmondi, Dhaka, Bangladesh', NULL, 'O-', 'FEMALE', 'parent4', 5, 5, '2015-04-04 00:00:00'),
('student5', 'student_mitu_akter_5', 'Mitu', 'Akter', 'mitu.akter@schoolbd.edu', '88019000005', 'House 12, Road 5, Dhanmondi, Dhaka, Bangladesh', NULL, 'B+', 'MALE', 'parent5', 5, 5, '2016-05-05 00:00:00'),
('student6', 'student_farhana_islam_6', 'Farhana', 'Islam', 'farhana.islam@schoolbd.edu', '88019000006', 'House 12, Road 5, Dhanmondi, Dhaka, Bangladesh', NULL, 'O-', 'FEMALE', 'parent6', 5, 5, '2012-06-06 00:00:00'),
('student7', 'student_shakil_ahmed_7', 'Shakil', 'Ahmed', 'shakil.ahmed@schoolbd.edu', '88019000007', 'House 12, Road 5, Dhanmondi, Dhaka, Bangladesh', NULL, 'B+', 'MALE', 'parent7', 5, 5, '2013-07-07 00:00:00'),
('student8', 'student_sadia_rahman_8', 'Sadia', 'Rahman', 'sadia.rahman@schoolbd.edu', '88019000008', 'House 12, Road 5, Dhanmondi, Dhaka, Bangladesh', NULL, 'O-', 'FEMALE', 'parent8', 5, 5, '2014-08-08 00:00:00'),
('student9', 'student_imran_kabir_9', 'Imran', 'Kabir', 'imran.kabir@schoolbd.edu', '88019000009', 'House 12, Road 5, Dhanmondi, Dhaka, Bangladesh', NULL, 'B+', 'MALE', 'parent9', 5, 5, '2015-09-09 00:00:00'),
('student10', 'student_mehedi_hasan_10', 'Mehedi', 'Hasan', 'mehedi.hasan@schoolbd.edu', '88019000010', 'House 12, Road 5, Dhanmondi, Dhaka, Bangladesh', NULL, 'O-', 'FEMALE', 'parent10', 5, 5, '2016-10-10 00:00:00');

INSERT INTO "Lesson" ("id", "name", "day", "startTime", "endTime", "subjectId", "classId", "teacherId") VALUES
(1, 'Math 1A', 'MONDAY', '2025-01-06 08:00:00', '2025-01-06 09:00:00', 1, 1, 'teacher1'),
(2, 'Music 5A', 'MONDAY', '2025-01-06 13:00:00', '2025-01-06 14:00:00', 9, 5, 'teacher2'),
(3, 'Geography 6B', 'WEDNESDAY', '2025-01-06 15:00:00', '2025-01-06 16:00:00', 7, 8, 'teacher8'),
(4, 'Physics 6C', 'THURSDAY', '2025-01-06 16:00:00', '2025-01-06 17:00:00', 3, 9, 'teacher9'),
(5, 'Chemistry 4B', 'FRIDAY', '2025-01-06 17:00:00', '2025-01-06 18:00:00', 4, 4, 'teacher2');

INSERT INTO "Exam" ("id", "title", "startTime", "endTime", "lessonId") VALUES
(1, 'Math Exam', '2025-01-01 10:00:00', '2025-01-01 12:00:00', 1),
(2, 'English Exam', '2025-01-01 10:00:00', '2025-01-01 12:00:00', 1),
(3, 'Science Exam', '2025-01-01 10:00:00', '2025-01-01 12:00:00', 1),
(4, 'Social Studies Exam', '2025-01-01 10:00:00', '2025-01-01 12:00:00', 1),
(5, 'Art Exam', '2025-01-01 10:00:00', '2025-01-01 12:00:00', 1),
(6, 'Music Exam', '2025-01-01 10:00:00', '2025-01-01 12:00:00', 2),
(7, 'History Exam', '2025-01-01 10:00:00', '2025-01-01 12:00:00', 1),
(8, 'Geography Exam', '2025-01-01 10:00:00', '2025-01-01 12:00:00', 3),
(9, 'Physics Exam', '2025-01-01 10:00:00', '2025-01-01 12:00:00', 1),
(10, 'Chemistry Exam', '2025-01-01 10:00:00', '2025-01-01 12:00:00', 1);

INSERT INTO "Assignment" ("id", "title", "startDate", "dueDate", "lessonId") VALUES
(1, 'Math Assignment', '2024-12-30 23:59:00', '2025-01-01 23:59:00', 1),
(2, 'English Assignment', '2024-12-30 23:59:00', '2025-01-01 23:59:00', 1),
(3, 'Science Assignment', '2024-12-30 23:59:00', '2025-01-01 23:59:00', 1),
(4, 'Social Studies Assignment', '2024-12-30 23:59:00', '2025-01-01 23:59:00', 1),
(5, 'Art Assignment', '2024-12-30 23:59:00', '2025-01-01 23:59:00', 1),
(6, 'Music Assignment', '2024-12-30 23:59:00', '2025-01-01 23:59:00', 2),
(7, 'History Assignment', '2024-12-30 23:59:00', '2025-01-01 23:59:00', 1),
(8, 'Geography Assignment', '2024-12-30 23:59:00', '2025-01-01 23:59:00', 3),
(9, 'Physics Assignment', '2024-12-30 23:59:00', '2025-01-01 23:59:00', 1),
(10, 'Chemistry Assignment', '2024-12-30 23:59:00', '2025-01-01 23:59:00', 1);

INSERT INTO "Result" ("id", "score", "examId", "assignmentId", "studentId") VALUES
(1, 90, 1, NULL, 'student1'),
(2, 90, 2, NULL, 'student1'),
(3, 90, 3, NULL, 'student1'),
(4, 90, 4, NULL, 'student1'),
(5, 90, 5, NULL, 'student1'),
(6, 90, 6, NULL, 'student1'),
(7, 90, 7, NULL, 'student1'),
(8, 90, 8, NULL, 'student1'),
(9, 90, 9, NULL, 'student1'),
(10, 90, 10, NULL, 'student1');

INSERT INTO "Attendance" ("id", "date", "present", "studentId", "lessonId") VALUES
(1, '2025-01-02 09:00:00', FALSE, 'student1', 1),
(2, '2025-01-02 09:00:00', TRUE, 'student2', 2),
(3, '2025-01-02 09:00:00', TRUE, 'student3', 3),
(4, '2025-01-02 09:00:00', TRUE, 'student4', 4),
(5, '2025-01-02 09:00:00', TRUE, 'student5', 5);

INSERT INTO "Event" ("id", "title", "description", "startTime", "endTime", "classId") VALUES
(1, 'Lake Trip', 'Lake Trip for class 1A', '2025-01-01 10:00:00', '2025-01-01 11:00:00', 1),
(2, 'Picnic', 'Picnic for class 2A', '2025-01-01 10:00:00', '2025-01-01 11:00:00', NULL),
(3, 'Beach Trip', 'Beach Trip for class 3A', '2025-01-01 10:00:00', '2025-01-01 11:00:00', NULL),
(4, 'Museum Trip', 'Museum Trip for class 4A', '2025-01-01 10:00:00', '2025-01-01 11:00:00', NULL),
(5, 'Music Concert', 'Music Concert for class 5A', '2025-01-01 10:00:00', '2025-01-01 11:00:00', 5),
(6, 'Magician Show', 'Magician Show for class 1B', '2025-01-01 10:00:00', '2025-01-01 11:00:00', NULL),
(7, 'Lake Trip', 'Lake Trip for class 2B', '2025-01-01 10:00:00', '2025-01-01 11:00:00', 2),
(8, 'Cycling Race', 'Cycling Race for class 3B', '2025-01-01 10:00:00', '2025-01-01 11:00:00', NULL),
(9, 'Art Exhibition', 'Art Exhibition for class 4B', '2025-01-01 10:00:00', '2025-01-01 11:00:00', 4),
(10, 'Sports Tournament', 'Sports Tournament for class 5B', '2025-01-01 10:00:00', '2025-01-01 11:00:00', 6);

INSERT INTO "Announcement" ("id", "title", "description", "date", "classId") VALUES
(1, 'About 4A Math Test', 'About 4A Math Test announcement', '2025-01-01 09:00:00', NULL),
(2, 'About 3A Math Test', 'About 3A Math Test announcement', '2025-01-01 09:00:00', NULL),
(3, 'About 3B Math Test', 'About 3B Math Test announcement', '2025-01-01 09:00:00', NULL),
(4, 'About 6A Math Test', 'About 6A Math Test announcement', '2025-01-01 09:00:00', NULL),
(5, 'About 8C Math Test', 'About 8C Math Test announcement', '2025-01-01 09:00:00', NULL),
(6, 'About 2A Math Test', 'About 2A Math Test announcement', '2025-01-01 09:00:00', NULL),
(7, 'About 4C Math Test', 'About 4C Math Test announcement', '2025-01-01 09:00:00', NULL),
(8, 'About 4B Math Test', 'About 4B Math Test announcement', '2025-01-01 09:00:00', 4),
(9, 'About 3C Math Test', 'About 3C Math Test announcement', '2025-01-01 09:00:00', 3),
(10, 'About 1C Math Test', 'About 1C Math Test announcement', '2025-01-01 09:00:00', NULL);

SELECT setval(pg_get_serial_sequence('"Grade"', 'id'), COALESCE(MAX("id"), 1), TRUE) FROM "Grade";
SELECT setval(pg_get_serial_sequence('"Subject"', 'id'), COALESCE(MAX("id"), 1), TRUE) FROM "Subject";
SELECT setval(pg_get_serial_sequence('"Class"', 'id'), COALESCE(MAX("id"), 1), TRUE) FROM "Class";
SELECT setval(pg_get_serial_sequence('"Lesson"', 'id'), COALESCE(MAX("id"), 1), TRUE) FROM "Lesson";
SELECT setval(pg_get_serial_sequence('"Exam"', 'id'), COALESCE(MAX("id"), 1), TRUE) FROM "Exam";
SELECT setval(pg_get_serial_sequence('"Assignment"', 'id'), COALESCE(MAX("id"), 1), TRUE) FROM "Assignment";
SELECT setval(pg_get_serial_sequence('"Result"', 'id'), COALESCE(MAX("id"), 1), TRUE) FROM "Result";
SELECT setval(pg_get_serial_sequence('"Attendance"', 'id'), COALESCE(MAX("id"), 1), TRUE) FROM "Attendance";
SELECT setval(pg_get_serial_sequence('"Event"', 'id'), COALESCE(MAX("id"), 1), TRUE) FROM "Event";
SELECT setval(pg_get_serial_sequence('"Announcement"', 'id'), COALESCE(MAX("id"), 1), TRUE) FROM "Announcement";
