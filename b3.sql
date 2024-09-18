create database md3b3;
use md3b3;

create table vat_tu(
	maVT int auto_increment primary key,
    tenVT varchar(255) not null
);
create table phieu_nhap(
	soPn int auto_increment primary key,
    ngayNhap datetime
);
create table phieu_nhap_ct(
	soPn int,
    maVT int,
    donGiaNhap double,
    soLuongNhap int,
    primary key(soPn,maVT),
    foreign key (maVT) references vat_tu(maVT),
    foreign key (soPn) references phieu_nhap(soPn)
);
create table phieu_xuat(
	soPx int auto_increment primary key,
    ngayXuat datetime
);
create table phieu_xuat_ct(
	soPx int,
    maVT int,
    donGiaXuat double,
    soLuongXuat int,
    primary key(soPx,maVT),
    foreign key (maVT) references vat_tu(maVT),
    foreign key (soPx) references phieu_xuat(soPx)
);

create table ct_don_dat_hang(
	maVT int,
    soDH int auto_increment primary key,
    foreign key (maVT) references vat_tu(maVT)
);
create table ngay_cung_cap(
	maNCC int auto_increment primary key,
    tenNCC varchar(255) not null,
    diaChi varchar(255),
    soDienThoai varchar(11)
   
);
create table don_dat_hang(
    soDH int ,
    maNCC int ,
    ngayDH datetime,
    primary key(soDH,maNCC),

    foreign key (soDH) references ct_don_dat_hang(soDH),
    foreign key (maNCC) references ngay_cung_cap(maNCC)
);


