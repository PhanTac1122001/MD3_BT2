create database md3b1;
use md3b1;

create table product(
	id int auto_increment primary key,
    name varchar(100) not null,
    created date

);

create table color(
	id int auto_increment primary key,
    name varchar(100) not null,
    status bit
);
create table size(
	id int auto_increment primary key,
    name varchar(100) not null,
    status bit
);
create table product_detail(
	id  int auto_increment primary key,
    product_id  int not null,
    color_id  int not null,
    size_id  int not null,
	price double,
    stock  int ,
    status bit,
    foreign key (product_id) references product(id),
    foreign key (size_id) references size(id),
    foreign key (color_id) references color(id)
);

