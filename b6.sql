create database md3b6;
use md3b6;

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

create table catalog(
	id int auto_increment primary key,
    name varchar(100) not null,
    status bit
);
create table product(
	id int auto_increment primary key,
    name varchar(100) not null,
    price double,
    stock int,
    catalog_id int,
    status bit,
    foreign key (catalog_id) references catalog(id)
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
    product_id  int not null,
    quantity int,
    unit_price double,
    foreign key (order_id) references orders(id),
    foreign key (product_id) references product(id)
);
create table wishlist(
    user_id  int not null,
    product_id  int not null,
    primary key(user_id,product_id),
    foreign key (user_id) references users(id),
    foreign key (product_id) references product(id)
);
create table shopping_cart(
	id int auto_increment primary key,
    user_id  int not null,
    product_id  int not null,
	quantity int,
    foreign key (user_id) references users(id),
    foreign key (product_id) references product(id)
);


