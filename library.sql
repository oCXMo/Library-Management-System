--Library Management System

--Description:
--We need to store a lot of information in the library database: return dates, members' names, books available, and much more. For this purpose, we should create tables and match their columns with the correct data types.

--Objectives:
--The table book contains information about all the books in the library: title, author's name, genre, number of pages and year of publication, rating, and how many books are available.
--The student and staff tables include information about the employees who issue books and readers.
--The operation table includes information about transactions that have occurred: who issued the book and to whom, and the date of issue (iss_date), as well as the planned return date (return_date) and the return indicator (return_indicator, issued — 0, returned — 1).





----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- DataGrip
-- version 2021.2.4
-- Host: localhost
-- Generation Time: Nov 1, 2022 at 10:47 PM
--Database: Library Management System

--
CREATE DATABASE library_management;
USE 'library_management';
--
------------------------------------------------------------------------

 PRAGMA foreign_keys = ON;
 
--
-- Table structure for table `book`
--

CREATE TABLE book (
    id INTEGER PRIMARY KEY NOT NULL,
    isbn TEXT NOT NULL,
    book_name TEXT NOT NULL,
    genre TEXT NOT NULL,
    author TEXT NOT NULL,
    book_year INTEGER NOT NULL,
    book_count INTEGER NOT NULL,
    book_page INTEGER NOT NULL,
    rank REAL NOT NULL
);


--
-- Insert data into 'Book Table'
--

INSERT INTO book VALUES 
    (1, '0393347095', 'The Metamorphosis', 'Novella', 'Franz Kafka', 2014, 2, 128, 4.4),
    (2, '0439358078', 'Harry Potter And The Order Of The Phoenix', 'Fantasy', 'J.K. Rowling', 2004, 3, 896, 4.2),
    (3, '0198800533', 'Anna Karenina', 'Realist Novel', 'Leo Tolstoy', 2017, 1, 896, 4.6);




-- --------------------------------------------------------

--
-- Table structure for table `Operation`
--


CREATE TABLE operation (
    id INTEGER PRIMARY KEY NOT NULL,
    student_id INTEGER NOT NULL,
    staff_id INTEGER NOT NULL,
    book_id INTEGER NOT NULL,
    iss_date TEXT NOT NULL,
    return_date TEXT NOT NULL,
    return_indicator NUMERIC NOT NULL,
    CONSTRAINT FK_book_id
    FOREIGN KEY (book_id) REFERENCES book (id),
    CONSTRAINT FK_student_id
    FOREIGN KEY (student_id) REFERENCES student (id),
    CONSTRAINT FK_staff_id
    FOREIGN KEY (staff_id) REFERENCES staff (id)
);


--
-- Insert data into 'Operation Table'
--

INSERT INTO operation VALUES
    (1, 3, 1, 1, DATE('now', '-4 day'), DATE('now', '+10 day'), 0),
    (2, 1, 1, 3, DATE('now', '-1 day'), DATE('now', '+13 day'), 0),
    (3, 2, 2, 2, DATE('now', '-1 day'), DATE('now', '+6 day'), 0),
    (4, 4, 2, 2, DATE('now'), DATE('now', '+14 day'), 0)
;


-- --------------------------------------------------------

--
-- Table structure for table `Student`
--

CREATE TABLE student (
    id INTEGER PRIMARY KEY NOT NULL,
    full_name TEXT NOT NULL,
    gender TEXT NOT NULL,
    date_of_birth TEXT NOT NULL
);


--
-- Insert data into 'Stuedent Table'
--

INSERT INTO student VALUES 
    (1, 'Mia Yang', 'Female', '1996-09-15'),
    (2, 'Bob Lee', 'Male', '1997-12-13'),
    (3, 'Eric Rampy', 'Male', '1995-08-21'),
    (4, 'Stefany Ferenz', 'Female', '1996-04-01')
;


-- --------------------------------------------------------

--
-- Table structure for table `Staff`
--

CREATE TABLE staff (
    id INTEGER PRIMARY KEY NOT NULL,
    full_name TEXT NOT NULL,
    gender TEXT NOT NULL,
    date_of_birth TEXT NOT NULL
);


--
-- Insert data into 'Staff Table'
--

INSERT INTO staff VALUES 
    (1, 'Steve Smith', 'Male', '1992-04-23'),
    (2, 'Ashley Miller', 'Female', '1995-01-16')
;

update_staff_inf = "UPDATE staff SET 
full_name = 'Ashley Bailey' 
WHERE full_name = 'Ashley Miller'
;"

update_operation_inf = "UPDATE operation SET 
return_date = DATE('now'), 
return_indicator = 1 
WHERE student_id = 3
;"

update_book_inf = "UPDATE book SET
book_count = book_count + 1 
WHERE book_name = 'The Metamorphosis';"

student_inf = "SELECT full_name FROM student JOIN operation on student.id=operation.student_id where operation.book_id=2 order by student.full_name asc;"
