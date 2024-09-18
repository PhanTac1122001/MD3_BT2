create database bttrenlop;
use bttrenlop;

create table category(
	id int auto_increment primary key,
    name varchar(100) unique not null,
    status tinyint(1) 
);

create table product(
	id int auto_increment primary key,
    name varchar(100) unique not null,
    price float check(price>0),
    sale_price float ,
    image varchar(255),
    category_id int not null,
    foreign key (category_id) references category(id)
);

create table accounts(
	id int auto_increment primary key,
    email varchar(100) not null unique,
    password varchar(100) not null,
    fullname varchar(100)
);

create table orders(
	id int auto_increment primary key,
    id_account int not null,
    ship_address varchar(255) not null,
    phone varchar(11) not null,
    status tinyint(0),
    created_at datetime,
    foreign key (id_account) references accounts(id)
);

create table order_detail(
	id_order int ,
    id_product int,
    quantity int check(quantity>0),
    price float not null check(price>0),
    primary key (id_order,id_product),
     foreign key (id_order) references orders(id),
      foreign key (id_product) references product(id)
);

insert into category(name,status) values('áo',1),('quần',1),('giày',1),('mũ',1),('găng tay',1);

insert into product(name,price,sale_price,image,category_id) values('áo jean',200000,100000,'asdasdasssd',1),
('áo dài',100000,90000,'asdasdad',1),
('áo khoác',200000,10000,'asdasdasssd',1),

('quần dài',150000,140000,'adasdasdasd',2),
('giày jodan',400000,200000,'asdasdad',3),
('mũ cối',100000,90000,'asdasdad',4);

insert into accounts(email,password,fullname) values('tac@gmail.com','123456','tac'),
('tiep@gmail.com','123456','tiep'),
('linh@gmail.com','123456','linh'),
('quang@gmail.com','123456','quang'),
('duc@gmail.com','123456','duc');

insert into orders(id_account,ship_address,phone,status,created_at) values(1,'hanoi','0123456789',0,now()),
(2,'thaibinh','0123456789',0,now()),
(3,'hungyen','0123456789',0,now()),
(4,'hcm','0123456789',0,now()),
(5,'danang','0123456789',0,now());

insert into order_detail(id_order,id_product,quantity,price) values(1,2,3,300000),
(1,3,3,100000),
(2,4,4,500000),
(3,4,5,200000),
(5,3,6,300000);

select * from category;

select * from product;

select * from accounts;

select * from orders;

select * from order_detail;


update product set name= 'sản phẩm hot trend 2024' where id =1;


update product set price=price-(price*0.1) where id=1;


delete from product where id=1;

select id,name,price,sale_price,image from product;

select * from product where price>100;

select p.id,p.name,p.price , c.name as category_name  from product  p join category c on p.category_id=c.id;

select c.id,c.name,count(p.id) AS product_count from category c join product p on p.category_id=c.id GROUP BY c.id, c.name;

select o.id,a.fullname,o.ship_address,o.status from orders o join accounts a on o.id_account=a.id;
