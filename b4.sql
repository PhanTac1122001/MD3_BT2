create database md3b4;
use md3b4;

create table users(
	id int auto_increment primary key,
    fullName varchar(100) not null,
    email varchar(255),
    password varchar(255),
    phone varchar(11),
    permission bit,
    status bit
);

create table historys(
	id int auto_increment primary key,
    user_id int not null,
    point int,
    examDate datetime,
    foreign key (user_id) 	references users(id)
);
create table exams(
	id int auto_increment primary key,
    name varchar(100) not null,
    duration int,
    status bit
);
create table questions(
	id  int auto_increment primary key,
    content  varchar(255) not null,
    exam_id  int not null,
    status bit,
    foreign key (exam_id) references exams(id)
);
create table answer(
	id  int auto_increment primary key,
    content  varchar(255) not null,
    question_id  int not null,
    answerTrue bit,
    foreign key (question_id) references questions(id)
);
create table history_detail(
	id  int auto_increment primary key,
    history_id  int not null,
    question_id  int not null,
    resuslt bit,
    foreign key (question_id) references questions(id),
    foreign key (history_id) references historys(id)
);

