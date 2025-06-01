CREATE DATABASE temp1;
drop database temp1;

create database temp2;
DROP DATABASE temp2;

CREATE DATABASE college;

CREATE DATABASE IF NOT EXISTS college;

DROP DATABASE IF EXISTS cafe;


USE college;

create table student (
	id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT NOT NULL
);

show tables;

insert into student values(1, "Saptarshi", 18);
INSERT INTO student VALUES(2, "Sam", 20);

select * from student;

SHOW DATABASES;

drop table student;

create table student (
	rollno int primary key,
    name varchar(50)
);

SELECT * FROM STUDENT;

insert into student
(rollno, name)
values
(17, "Saptarshi"),
(20, "Hemanth"),
(25, "Surya");

SELECT * FROM STUDENT;

# Task 1:
/*
Qs. : Create a database for your company named XYZ
Step 1: Create a table inside this DB to store employee info (id, name and salary).
Step 2: Add following information in the DB:
	1, "adam", 25000
    2, "bob", 30000
    3, "casey", 40000
Step 3: Select & view all your table data
*/

create database if not exists XYZ;
USE XYZ;
create table employee(
	id int primary key,
    name varchar(50),
    salary double not null
);
insert into employee values (1,"adam",25000),(2,"bob",30000),(3,"casey",40000);
select * from employee;

create database if not exists work1;
USE work1;
create table temp1(
	id int unique
);
insert into temp1 values(101);
# Duplicate entry error if written again: insert into temp1 values(101);
select * from temp1;

create table temp2(
	id int primary key,
    name varchar(50),
    age int
);

create table temp3(
	id int,
    name varchar(50),
    age int,
    city varchar(50),
    primary key (id, name)
);

create table emp(
	id int,
    salary int default 25000
);
insert into emp (id) values (101);
select * from emp;

create database if not exists college2;
use college2;
create table student(
	rollno int primary key,
    name varchar(50),
    marks int not null,
    grade varchar(1),
    city varchar(20)
);
insert into student
(rollno, name, marks, grade, city)
values
(101, "anil", 78, "C", "Patna"),
(102, "bhumika", 93, "A", "Mumbai"),
(103, "chetan", 85, "B", "Mumbai"),
(104, "dhruv", 96, "A", "Delhi"),
(105, "emanuel", 12, "F", "Delhi"),
(106, "farah", 82, "B", "Delhi");

SELECT name, marks FROM student;
select * from student;

select city from student;
select distinct city from student;

select * from student where marks > 80;
select * from student where city = "Mumbai";
select * from student where marks > 80 and city = "Mumbai";
select * from student where marks > 90 or city = "Mumbai";

select * from student where marks+10 > 100;
select * from student where marks = 93;

select * from student where marks between 80 and 90;
select * from student where city in ("Delhi", "Mumbai");
select * from student where city not in ("Delhi", "Mumbai");

select * from student limit 3;
select * from student where marks > 75 limit 3;

select * from student order by city asc;
select * from student order by city desc;
select * from student order by marks asc;
select * from student order by marks desc limit 3;

select max(marks) from student;
select min(marks) from student;
select avg(marks) from student;
select count(rollno) from student;

select city, count(name) from student group by city;

select city, avg(marks) from student group by city;

select city, avg(marks) from student group by city order by avg(marks) asc;

select count(name), city from student group by city having max(marks) > 90;

SET SQL_SAFE_UPDATES = 0;

update student
set grade = "O"
where grade = "A";
select * from student;

SET SQL_SAFE_UPDATES = 1;

select * from student;

SET SQL_SAFE_UPDATES = 0;

update student set marks = 83, grade = "B" where rollno = 105;
select * from student;

SET SQL_SAFE_UPDATES = 1;

SET SQL_SAFE_UPDATES = 0;
update student set grade = "B" where marks between 80 and 90;
select * from student;
SET SQL_SAFE_UPDATES = 1;

SET SQL_SAFE_UPDATES = 0;
update student set marks = marks + 1;
select * from student;
SET SQL_SAFE_UPDATES = 1;

SET SQL_SAFE_UPDATES = 0;
update student set marks = 12, grade = "F" where rollno = 105; 
select * from student;
SET SQL_SAFE_UPDATES = 1;

SET SQL_SAFE_UPDATES = 0;
delete from student where marks < 33;
select * from student;
SET SQL_SAFE_UPDATES = 1;


create table dept (
	id int primary key,
    name varchar(50)
);

insert into dept
values
(101, "English"),
(102,"IT");
select * from dept;

# * here

create table teacher(
	id int primary key,
    name varchar(50),
    dept_id int,
    foreign key (dept_id) references dept(id)
    on update cascade
    on delete cascade
);

# drop table teacher;

insert into teacher
values
(101, "Adam", 101),
(102, "Eve", 102);

select * from teacher;

# * here

update dept
set id = 103
where id = 102;

select * from teacher;

update dept set id = 111 where id = 101;
select * from teacher;


select * from student;
alter table student
add column age int;
select * from student;
alter table student drop column age;
select * from student;

alter table student
add column age int not null default 19;
select * from student;
alter table student modify column age varchar(2);
# Will throw error: insert into student (rollno, name, marks, age) values (107,"sumit",68,100);
alter table student
change age stu_age int;
select * from student;
insert into student (rollno, name, marks, stu_age) values (107,"sumit",68,100); # wont throw any error now
select * from student;
alter table student drop column stu_age;
select * from student;

alter table student
rename to stu;
select * from stu;

alter table stu rename to student;
select * from student;


truncate table student;
select * from student;

insert into student
(rollno, name, marks, grade, city)
values
(101, "anil", 78, "C", "Patna"),
(102, "bhumika", 93, "A", "Mumbai"),
(103, "chetan", 85, "B", "Mumbai"),
(104, "dhruv", 96, "A", "Delhi"),
(105, "emanuel", 12, "F", "Delhi"),
(106, "farah", 82, "B", "Delhi");
select * from student;



/*
 Practice Qs:
Qs: In the student table:
a. Change the name of the column "name" to "full_name".
b. Delete all the students who scored marks less than 80.
c. Delete the column for grades.
*/

select * from student;
ALTER TABLE student
CHANGE name full_name VARCHAR(50);

SET SQL_SAFE_UPDATES = 0;
delete from student where marks < 80;
SET SQL_SAFE_UPDATES = 1;

alter table student drop column grade;
select * from student;



use work1;
create table payment(
	customer_id int primary key,
    customer varchar(75),
    mode varchar(15),
    city varchar(25)
);
insert into payment
(customer_id, customer, mode, city)
values
(101,"Olivia Barrett","Netbanking","Portland"),
(102,"Ethan Sinclair","Credit Card","Miami"),
(103,"Maya Hermandez","Credit Card","Seattle"),
(104,"Liam Donovan","Netbanking","Denver"),
(105,"Sophia Nguyen","Credit Card","New Orieans"),
(106,"Caleb Foster","Debit Card","Minneapolis"),
(107,"Ava Patel","Debit Card","Phoenix"),
(108,"Lucas Carter","Netbanking","Boston"),
(109,"Isabella Martinez","Netbanking","Nashville"),
(110,"Jackson Brooks","Credit Card","Boston");
select * from payment;
select mode, count(customer) from payment group by mode;



CREATE DATABASE college3;
use college3;

create table student(
	id int primary key,
    name varchar(50)
);
insert into student(id,name)
values
(101,"adam"),
(102,"bob"),
(103,"casey");

create table course(
	id int primary key,
    course varchar(50)
);
insert into course(id,course)
values
(102,"english"),
(105, "math"),
(103,"science"),
(107,"computer science");

select * from student;
select * from course;

SELECT *
FROM student
INNER JOIN course
ON student.id = course.id;

SELECT *
FROM student as s 
INNER JOIN course as c
ON s.id = c.id;

SELECT *
FROM student as s 
LEFT JOIN course as c
ON s.id = c.id;

SELECT *
FROM student as s 
RIGHT JOIN course as c
ON s.id = c.id;


SELECT *
FROM student as s 
LEFT JOIN course as c
ON s.id = c.id
UNION
SELECT *
FROM student as s 
RIGHT JOIN course as c
ON s.id = c.id;

# Left exclusive join:
SELECT *
FROM student as s 
LEFT JOIN course as c
ON s.id = c.id
WHERE c.id IS NULL;

# Right exclusive join:
SELECT *
FROM student as s 
RIGHT JOIN course as c
ON s.id = c.id
WHERE s.id IS NULL;

# Exclusive join:
SELECT *
FROM student as s 
LEFT JOIN course as c
ON s.id = c.id
WHERE c.id IS NULL
UNION
SELECT *
FROM student as s 
RIGHT JOIN course as c
ON s.id = c.id
WHERE s.id IS NULL;



CREATE TABLE employee(
	id int primary key,
    name varchar(50),
    manager_id int
);
insert into employee(id,name,manager_id)
values
(101,"adam",103),
(102,"bob", 104),
(103,"casey",NULL),
(104,"donald",103);
select * from employee;

SELECT *
FROM employee as a
JOIN employee as b
ON a.id = b.manager_id;

SELECT a.name, b.name
FROM employee as a
JOIN employee as b
ON a.id = b.manager_id;

SELECT a.name as manager_name, b.name
FROM employee as a
JOIN employee as b
ON a.id = b.manager_id;

SELECT name FROM employee
UNION
SELECT name FROM employee;

# If u want to repeat the duplicates aswell: 
SELECT name FROM employee
UNION ALL
SELECT name FROM employee;

CREATE DATABASE IF NOT EXISTS college4;
use college4;

create table student(
	rollno int primary key,
    name varchar(50),
    marks int not null,
    grade varchar(1),
    city varchar(20)
);

insert into student
(rollno, name, marks, grade, city)
values
(101,"anil",78,"C","Pune"),
(102, "bhumika", 93, "A", "Mumbai"),
(103, "chetan", 85, "B", "Mumbai"),
(104, "dhruv", 96, "A", "Delhi"),
(105, "emanuel", 92, "A", "Delhi"),
(106, "farah", 82, "B", "Delhi");

select * from student;

SELECT AVG(marks)
FROM student;

SELECT name, marks 
FROM student
WHERE marks > 87.6667;

SELECT name, marks 
FROM student
WHERE marks > (
	SELECT AVG(marks)
	FROM student
);

# Find the name of all students with even roll numbers.
SELECT rollno
FROM student
WHERE rollno % 2 = 0;

SELECT name
FROM student
WHERE rollno IN (102,104,106);

SELECT name
FROM student
WHERE rollno IN (
	SELECT rollno
	FROM student
	WHERE rollno % 2 = 0
);


# Find the max marks from the students of Delhi.
SELECT *
FROM student
WHERE city = "Delhi";

SELECT MAX(marks)
FROM (
	SELECT *
	FROM student
	WHERE city = "Delhi"
) AS temp;

SELECT MAX(marks)
FROM student
WHERE city = "Delhi";



SELECT(
	SELECT MAX(marks)
	FROM student
), name
FROM student;



# Views: 
CREATE VIEW view1 AS
SELECT rollno, name, marks FROM student;

SELECT * FROM view1;

SELECT * FROM view1 where marks > 90;

CREATE VIEW view2 AS
SELECT name, marks FROM student;
SELECT * FROM view2;

DROP VIEW view2;