drop database if exists manage_student;
create database if not exists manage_student;

use manage_student;

create table address (
address_id int primary key,
address varchar(50)
);

create table classes (
class_id int primary key,
class_name varchar(50) ,
class_language varchar(50),
class_description varchar(255) 
);

create table student (
student_id int primary key,
student_fullname varchar(50),
address_id int,
student_age int,
student_phone varchar(10) unique,
class_id int,
foreign key (address_id) references address(address_id),
foreign key (class_id) references classes(class_id)
);

create table course (
course_id int primary key,
course_name varchar(50),
course_description varchar(255)
);

create table `point`(
point_id int primary key,
course_id int,
student_id int,
points float,
foreign key (course_id) references course(course_id),
foreign key (student_id) references student(student_id)
);

insert into address values 
(1,"HN"),
(2,"DN"),
(3,"HUE"),
(4,"SG"),
(5,"HT");

insert into classes values
(1,"c1","JV","no description"),
(2,"c2","JS","no description"),
(3,"c3","CSS","no description"),
(4,"c4","C","no description"),
(5,"c5","C++","no description");

insert into student values
(1,"Nguyễn Văn Hải Nhật",2,22,"0945962203",1),
(2,"Huỳnh Trần Thanh Dụng",2,28,"0356230012",2),
(3,"Nguyễn trúc vi",2,21,"0762589598",1),
(4,"Nguyễn Văn Ánh",3,25,"0965075904",4),
(5,"Nguyễn Quốc Phú",3,27,"0931966586",1),
(6,"Lương Văn Đạt",2,24,"0981900587",1),
(7,"Nguyễn Minh Phương",4,24,"0366553995",5),
(8,"Lê Đăng Pháp",2,22,"0842078955",3),
(9,"Nguyễn Đình Thống",1,31,"0353107446",3),
(10,"Phan Quyết Thắng",2,27,"0395211820",1);

insert into course values
(1,"fulltime","6 months"),
(2,"parttime","3 months");

insert into point values
(1,1,1,10),
(2,2,1,9),
(3,1,2,10),
(4,1,3,10),
(5,2,3,9),
(6,1,4,10),
(7,2,5,9),
(8,1,6,9),
(9,2,6,10),
(10,1,7,10),
(11,2,7,10),
(12,1,8,9),
(13,2,9,9),
(14,1,9,10),
(15,2,10,10);

-- Học sinh có họ nguyễn --
select * from student where student_fullname like "Nguyễn%";
-- Học sinh có tên Anh --
select * from student where student_fullname like "%Anh";
-- Học Sinh có độ tuổi từ 20-24--
select * from student where student_age between 20 and 24;
-- Học sinh có id là 2 hoặc 3--
select * from student where student_id = 2 or student_id = 3;
-- Thống kê số lượng học viên các lớp
select classes.class_name, count(student.student_id) as quantity
from student 
join classes
on student.class_id = classes.class_id
group by classes.class_name;
-- Thống kê số lượng học sinh tại các nơi
select address.address, count(student.student_id) as quantity
from student 
join address
on student.address_id = address.address_id
group by address.address;
-- Thống kê điểm trung bình mỗi khóa học
select course.course_name, avg(points) as avg_point
from point
join course
on point.course_id = course.course_id
group by course.course_name;



