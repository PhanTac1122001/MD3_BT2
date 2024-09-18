create database md3th2;
use md3th2;

create table class(
	clasId int auto_increment primary key,
    className varchar(255) not null,
    startDate date not null,
    status bit 
);

create table student(
	studentId int auto_increment primary key,
    studentName varchar(255) not null,
    address  varchar(255),
    phone varchar(255),
	status bit default 0,
   class_id int not null,
    foreign key (class_id) references class(clasId)
);
create table subjects(
	subId int auto_increment primary key,
    subName varchar(255) not null,
    credit int default 1 check (credit>=1),
    status bit default 1
);
create table mark(
	markId  int auto_increment primary key,
    subjectId  int not null,
    studentId  int not null,
	mark double default 0 check(mark between 0 and 100),
    examtime  int default 1,
    foreign key (subjectId) references subjects(subId),
    foreign key (studentId) references student(studentId)
);

