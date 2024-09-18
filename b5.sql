create database md3b5;
use md3b5;

create table users(
	id int auto_increment primary key,
    fullName varchar(100) not null,
    email varchar(255),
    password varchar(255),
    phone varchar(11),
    permission bit,
    status bit
);
create table address(
	id int auto_increment primary key,
    user_id int not null,
    receiveAddress varchar(100),
    receiveName varchar(100),
    receivePhone varchar(11),
    isDefault bit,
    foreign key (user_id) references users(id)
);
create table book(
	id int auto_increment primary key,
    name varchar(100) not null,
    price double,
    stock int,
    status bit
);
create table catalog(
	id int auto_increment primary key,
    name varchar(100) not null,
    status bit
);
create table book_catalog(
	catalog_id  int ,
    book_id  int ,
    primary key(catalog_id,book_id),
    foreign key (catalog_id) references catalog(id),
    foreign key (book_id) references book(id)
);
create table orders(
	id  int auto_increment primary key,
    orderAt  datetime,
    totals  double not null,
    user_id int,
    status bit,
    foreign key (user_id) references users(id)
);
create table order_detail(
	id  int auto_increment primary key,
    order_id  int not null,
    book_id  int not null,
    quantity int,
    unit_price double,
    foreign key (order_id) references orders(id),
    foreign key (book_id) references book(id)
);

