create database md3th1;
use md3th1;

create table categories(
	id int auto_increment primary key,
    name varchar(255) not null,
    status bit default 0
);

create table products(
	id int auto_increment primary key,
    name varchar(255) not null,
    price  double check(price<0),
    stock int check(stock<0),
	status bit default 0,
    category_id int not null,
    foreign key (category_id) references categories(id)
);

