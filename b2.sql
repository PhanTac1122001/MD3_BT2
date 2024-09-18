create database md3b2;
use md3b2;

create table products(
	pId int auto_increment primary key,
    pName varchar(255) not null,
    pPrice double

);
create table customers(
	cId int auto_increment primary key,
    cName varchar(255) not null,
    cAge int
);
create table orders(
	oId int auto_increment primary key,
    cId int not null,
    oDate datetime,
    oTotalPrice double,
   foreign key (cId) references customers(cId)
);

create table order_detail(

    oId  int not null,
    pId  int not null,
    odQuantity  int ,
    primary key(oId,pId),
    foreign key (oId) references orders(oId),
    foreign key (pId) references products(pId)
);

