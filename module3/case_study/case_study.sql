drop database case_study;
create database if not exists case_study;
use case_study;

create table if not exists case_study.vi_tri(
ma_vi_tri INT,
ten_vi_tri VARCHAR(45),
`status` bit default 0,
PRIMARY KEY(ma_vi_tri)
);

create table if not exists case_study.trinh_do(
ma_trinh_do INT,
ten_trinh_do VARCHAR(45),
`status` bit default 0,
PRIMARY KEY(ma_trinh_do)
);

create table if not exists case_study.bo_phan(
ma_bo_phan INT,
ten_bo_phan VARCHAR(45),
`status` bit default 0,
PRIMARY KEY(ma_bo_phan)
);

create table if not exists case_study.nhan_vien(
ma_nhan_vien INT,
ho_ten VARCHAR(45),
ngay_sinh DATE,
so_cmnd VARCHAR(45),
luong DOUBLE,
so_dien_thoai VARCHAR(45),
email VARCHAR(45),
dia_chi VARCHAR(45),
ma_vi_tri INT ,
ma_trinh_do INT ,
ma_bo_phan INT,
`status` bit default 0,
PRIMARY KEY(ma_nhan_vien),
FOREIGN KEY (ma_vi_tri) REFERENCES vi_tri(ma_vi_tri),
FOREIGN KEY (ma_trinh_do) REFERENCES trinh_do(ma_trinh_do),
FOREIGN KEY (ma_bo_phan) REFERENCES bo_phan(ma_bo_phan)
);

create table if not exists case_study.loai_dich_vu(
ma_loai_dich_vu INT,
ten_loai_dich_vu VARCHAR(45),
`status` bit default 0,
PRIMARY KEY(ma_loai_dich_vu)
);

create table if not exists case_study.kieu_thue(
ma_kieu_thue INT,
ten_kieu_thue VARCHAR(45),
`status` bit default 0,
PRIMARY KEY(ma_kieu_thue)
);

create table if not exists case_study.dich_vu(
ma_dich_vu INT AUTO_INCREMENT,
ten_dich_vu VARCHAR(45),
dien_tich INT,
chi_phi_thue DOUBLE,
so_nguoi_toi_da INT,
ma_kieu_thue INT,
ma_loai_dich_vu INT,
tieu_chuan_phong VARCHAR(45),
mo_ta_tien_nghi_khac VARCHAR(45),
dien_tich_ho_boi DOUBLE,
so_tang INT,
`status` bit default 0,
PRIMARY KEY(ma_dich_vu),
FOREIGN KEY (ma_kieu_thue) REFERENCES kieu_thue(ma_kieu_thue),
FOREIGN KEY (ma_loai_dich_vu) REFERENCES loai_dich_vu(ma_loai_dich_vu)
);

create table if not exists case_study.loai_khach(
ma_loai_khach INT,
ten_loai_khach VARCHAR(45),
`status` bit default 0,
PRIMARY KEY(ma_loai_khach)
);

create table if not exists case_study.khach_hang(
ma_khach_hang INT,
ma_loai_khach INT,
ho_ten VARCHAR(45),
ngay_sinh DATE,
gioi_tinh BIT(1),
so_cmnd VARCHAR(45),
so_dien_thoai VARCHAR(45),
email VARCHAR(45),
dia_chi VARCHAR(45),
`status` bit default 0,
PRIMARY KEY(ma_khach_hang),
FOREIGN KEY (ma_loai_khach) REFERENCES loai_khach(ma_loai_khach)
);

create table if not exists case_study.hop_dong(
ma_hop_dong INT,
ngay_lam_hop_dong DATETIME,
ngay_ket_thuc DATETIME,
tien_dat_coc DOUBLE,
ma_nhan_vien INT,
ma_khach_hang INT,
ma_dich_vu INT,
`status` bit default 0,
PRIMARY KEY(ma_hop_dong),
FOREIGN KEY (ma_nhan_vien) REFERENCES nhan_vien(ma_nhan_vien),
FOREIGN KEY (ma_khach_hang) REFERENCES khach_hang(ma_khach_hang),
FOREIGN KEY (ma_dich_vu) REFERENCES dich_vu(ma_dich_vu)
);

create table if not exists case_study.dich_vu_di_kem(
ma_dich_vu_di_kem INT, 
ten_dich_vu_di_kem VARCHAR(45),
gia DOUBLE,
don_vi VARCHAR(10),
trang_thai VARCHAR(45),
`status` bit default 0,
PRIMARY KEY(ma_dich_vu_di_kem)
);

create table if not exists case_study.hop_dong_chi_tiet(
ma_hop_dong_chi_tiet INT,
ma_hop_dong INT,
ma_dich_vu_di_kem INt,
so_luong INT,
`status` bit default 0,
PRIMARY KEY(ma_hop_dong_chi_tiet),
FOREIGN KEY (ma_hop_dong) REFERENCES hop_dong(ma_hop_dong),
FOREIGN KEY (ma_dich_vu_di_kem) REFERENCES dich_vu_di_kem(ma_dich_vu_di_kem)
);

-- Task 1.	Thêm mới thông tin cho tất cả các bảng có trong CSDL để có thể thoả mãn các yêu cầu bên dưới.

insert into case_study.vi_tri (ma_vi_tri,ten_vi_tri)
value (1,'Quản lý'),(2,'Nhân Viên');

insert into case_study.trinh_do (ma_trinh_do,ten_trinh_do)
value (1,'trung cấp'),(2,'Cao Đẳng'),(3,'Đại học'),(4,'Sau Đại Học');

insert into case_study.bo_phan (ma_bo_phan,ten_bo_phan)
value (1,'Sale-Marketing'),(2,'Hành Chính'),(3,'Phục Vụ'),(4,'Quản Lý');

insert into case_study.nhan_vien (ma_nhan_vien,ho_ten,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan)  value
 (1,'Nguyễn Văn An','1970-11-07',456231786,10000000,'09012343121','annguyen@gmail.com','295 nguyễn tất thành,Đà Nẵng',1,3,1),
 (2,'Lê Văn Bình','1997-04-09',654231234,7000000,'0934212314','binhlv@gmail.com','22 Yên Bái, Đà Nẵng',1,2,2),
 (3,'Hồ Thị Yến','1995-12-12',999231723,14000000,'0412352315','thiyen@gmail.com','K234/11 Điện Biên Phủ, Gia Lai',1,3,2),
 (4,'Võ Công Toản','1980-04-04',123231365,17000000,'0374443232','toan0404@gmail.com','77 Hoàng Diệu, Quảng Trị',1,4,4),
 (5,'Nguyễn Bỉnh Phát','1999-12-09',454363232,6000000,'0902341231','phatphat@gmail.com','43 Yên Bái, Đà Nẵng',2,1,1),
 (6,'Khúc Nguyễn An Nghi','2000-11-08',964542311,7000000,'0978653213','annghi20@gmail.com','294 Nguyễn Tất Thành, Đà Nẵng',2,2,3),
 (7,'Nguyễn Hữu Hà','1993-01-01',534323231,8000000,'0941234553','nhh0101@gmail.com','4 Nguyễn Chí Thanh, Huế',2,3,2),
 (8,'Nguyễn Hà Đông','1989-09-03',234414123,9000000,'0642123111','donghanguyen@gmail.com','111 Hùng Vương, Hà Nội',2,4,4),
 (9,'Tòng Hoang','1982-09-03',256781231,6000000,'0245144444','hoangtong@gmail.com','213 Hàm Nghi, Đà Nẵng',2,4,4),
 (10,'Nguyễn Công Đạo','1994-01-08',755434343,8000000,'0988767111','nguyencongdao12@gmail.com','6 Hoà Khánh, Đồng Nai',2,3,2);
 
insert into case_study.loai_khach(ma_loai_khach,ten_loai_khach) value
(1,'Diamond'),(2,'Platinium'),(3,'Gold'),(4,'Silver'),(5,'Member');

insert into case_study.khach_hang (ma_khach_hang,ma_loai_khach,ho_ten,ngay_sinh,gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi)value 
(1,5,'Nguyễn Thị Hào','1970-11-07',0,643431213,0945423362,'thihao07@gmail.com','23 Nguyễn Hoàng, Đà Nẵng'),
(2,3,'Phạm Xuân Diệu','1992-08-08',1,865342123,0954333333,'xuandieu92@gmail.com','K77/22 Thái Phiên, Quảng Trị'),
(3,1,'Trương Đình Nghệ','1990-02-27',1,488645199,0373213122,'nghenhan2702@gmail.com','K323/12 Ông Ích Khiêm, Vinh'),
(4,1,'Dương Văn Quan','1981-07-08',1,543432111,0490039241,'duongquan@gmail.com','K453/12 Lê Lợi, Đà Nẵng'),
(5,4,'Hoàng Trần Nhi Nhi','1995-12-09',0,795453345,0312345678,'nhinhi123@gmail.com','224 Lý Thái Tổ, Gia Lai'),
(6,4,'Tôn Nữ Mộc Châu','2005-12-06',0,732434215,0988888844,'tonnuchau@gmail.com','37 Yên Thế, Đà Nẵng'),
(7,1,'Nguyễn Mỹ Kim','1984-04-08',0,856453123,0912345698,'kimcuong84@gmail.com','K123/45 Lê Lợi, Hồ Chí Minh'),
(8,3,'Nguyễn Thị Hào','1999-04-08',0,965656433,0763212345,'haohao99@gmail.com','55 Nguyễn Văn Linh, Kon Tum'),
(9,1,'Trần Đại Danh','1994-07-01',1,432341235,0643343433,'danhhai99@gmail.com','24 Lý Thường Kiệt, Quảng Ngãi'),
(10,2,'Nguyễn Tâm Đắc','1989-07-01',1,344343432,0987654321,'dactam@gmail.com','22 Ngô Quyền, Đà Nẵng');

insert into case_study.kieu_thue(ma_kieu_thue,ten_kieu_thue) value 
(1,'Year'),(2,'Month'),(3,'Day'),(4,'Hour');

insert into case_study.loai_dich_vu(ma_loai_dich_vu,ten_loai_dich_vu) value 
(1,'Villa'), (2,'House'), (3,'Room');

insert into case_study.dich_vu(ma_dich_vu,ten_dich_vu,dien_tich,chi_phi_thue,so_nguoi_toi_da,ma_kieu_thue,ma_loai_dich_vu,tieu_chuan_phong,mo_ta_tien_nghi_khac,dien_tich_ho_boi,so_tang) value 
(1,'Villa Beach Front',25000,10000000,10,1,1,'Vip','có hồ bơi',500,1),
(2,'House Princess 01',14000,5000000,7,3,2,'Vip','có thêm bếp nương',NUll,2),
(3,'Room Twin 01',5000,1000000,2,1,3,'Normal','có tivi',NULL,3),
(4,'Villa No Beach Front',22000,9000000,8,4,1,'Normal','có hồ bơi',300,1),
(5,'House Princess 02',10000,4000000,5,4,2,'Normal','có thêm bếp nướng',NUll,2),
(6,'Room Twin 02',3000,900000,2,2,3,'Normal','có tivi',Null,3);

insert into case_study.dich_vu_di_kem(ma_dich_vu_di_kem,ten_dich_vu_di_kem,gia,don_vi,trang_thai) value
(1,'Karaoke',10000,'giờ','tiện nghi, hiện tại'),
(2,'Thuê xe máy',10000,'chiếc','Hỏng 1 xe'),
(3,'Thuê xe đạp',20000,'chiếc','Hỏng 1 xe'),
(4,'Buffet buổi sáng',15000,'Xuất','đầy đủ đồ ăn, tráng miệng'),
(5,'Buffet buổi trưa',90000,'Xuất','đầy đủ đồ ăn, tráng miệng'),
(6,'Buffet buổi tối',16000,'Xuất','đầy đủ đồ ăn, tráng miệng');

insert into case_study.hop_dong(ma_hop_dong,ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,ma_nhan_vien,ma_khach_hang,ma_dich_vu) value
(1,'2020-12-08','2020-12-08',0,3,1,3),
(2,'2020-07-14','2020-07-21',200000,7,3,1),
(3,'2021-03-15','2021-03-17',50000,3,4,2),
(4,'2021-01-14','2021-01-18',100000,7,5,5),
(5,'2021-07-14','2021-07-15',0,7,2,6),
(6,'2021-06-01','2021-06-03',0,7,7,6),
(7,'2021-09-02','2021-09-05',100000,7,4,4),
(8,'2021-06-17','2021-06-18',150000,3,4,1),
(9,'2020-11-19','2021-11-19',0,3,4,3),
(10,'2021-04-12','2021-04-14',0,10,3,5),
(11,'2021-04-25','2021-04-25',0,2,2,1),
(12,'2021-05-25','2021-05-27',0,7,10,1);
insert into case_study.hop_dong_chi_tiet(ma_hop_dong_chi_tiet,ma_hop_dong,ma_dich_vu_di_kem,so_luong) value
(1,2,4,5),
(2,2,5,8),
(3,2,6,15),
(4,3,1,1),
(5,3,2,11),
(6,1,3,1),
(7,1,2,2),
(8,12,2,2);

-- Task 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các 
-- ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.

select * from case_study.nhan_vien where ho_ten like 'T%' 
or ho_ten like 'H%'
or ho_ten like 'K%'
and length(ho_ten) <= 15 
and `status` = 0;

-- Task 3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi 
-- và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.

 SELECT * FROM case_study.khach_hang 
where ROUND(DATEDIFF(CURDATE(), ngay_sinh) / 365, 0) >18 and
ROUND(DATEDIFF(CURDATE(), ngay_sinh) / 365, 0) < 50 
and dia_chi like '%Đà Nẵng'
or dia_chi like '%Quảng Trị'
and `status` = 0;

-- Task 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần.
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng.
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.

select khach_hang.ma_khach_hang,khach_hang.ho_ten, count(hop_dong.ma_khach_hang) as so_lan_dat_phong
from khach_hang
join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
where ten_loai_khach = 'Diamond' and khach_hang.`status` = 0 
group by hop_dong.ma_khach_hang
order by count(ma_khach_hang);


-- Task 5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong,
-- ngay_ket_thuc, tong_tien  (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá,
-- với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng.
-- (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).

select khach_hang.ma_khach_hang,khach_hang.ho_ten,loai_khach.ten_loai_khach, hop_dong.ma_hop_dong,dich_vu.ten_dich_vu,
hop_dong.ngay_lam_hop_dong,hop_dong.ngay_ket_thuc,dich_vu.chi_phi_thue + ifnull((hop_dong_chi_tiet.so_luong * dich_vu_di_kem.gia),0)  as tong_tien
from khach_hang
join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
left join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
left join dich_vu on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
left join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
left join dich_vu_di_kem on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
where khach_hang. `status` = 0 
group by ma_hop_dong,ten_loai_khach,ten_dich_vu,ma_khach_hang
order by ma_khach_hang;

-- Task 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu 
-- của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).

select dich_vu.ma_dich_vu,dich_vu.ten_dich_vu,dich_vu.dien_tich,dich_vu.chi_phi_thue,loai_dich_vu.ten_loai_dich_vu
from dich_vu
join loai_dich_vu on dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
join hop_dong on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu 
where dich_vu.ma_dich_vu 
not in(
select dich_vu.ma_dich_vu
from dich_vu
join loai_dich_vu on dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
join hop_dong on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu 
where hop_dong.ngay_lam_hop_dong 
between '2021-01-01' and '2021-03-31'
)
 and dich_vu.`status` = 0 
group by ma_dich_vu;

-- Task 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu
-- của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng
-- đặt phòng trong năm 2021.

select dich_vu.ma_dich_vu,dich_vu.ten_dich_vu,dich_vu.dien_tich,dich_vu.so_nguoi_toi_da,dich_vu.chi_phi_thue,
loai_dich_vu.ten_loai_dich_vu
from dich_vu
join loai_dich_vu on dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
join hop_dong on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
where year(hop_dong.ngay_lam_hop_dong) = '2020' and hop_dong.ma_khach_hang
not in(select hop_dong.ma_khach_hang from hop_dong
where year(hop_dong.ngay_lam_hop_dong) = '2021'  and dich_vu.`status` = 0 
);

-- Task 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.

-- c1
select distinct ho_ten from khach_hang;
-- c2
select ho_ten from khach_hang
group by ho_ten;
-- c3
select ho_ten from khach_hang
union
select ho_ten from khach_hang;

-- Task 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021
-- thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.

select month(hop_dong.ngay_lam_hop_dong) as thang, count(hop_dong.ma_khach_hang) as so_luong_khach_hang
from hop_dong
where year(hop_dong.ngay_lam_hop_dong) = 2021  and hop_dong.`status` = 0 
group by thang
order by thang;

-- Task 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm.
-- Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem
-- (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).

select hop_dong.ma_hop_dong,hop_dong.ngay_lam_hop_dong,hop_dong.ngay_ket_thuc,hop_dong.tien_dat_coc,sum(ifnull(hop_dong_chi_tiet.so_luong,0)) 
as so_luong_dich_vu_di_kem
from hop_dong
left join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
where hop_dong.`status` = 0 
group by hop_dong.ma_hop_dong;

-- Task 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond”
-- và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.

select dich_vu_di_kem.ma_dich_vu_di_kem,dich_vu_di_kem.ten_dich_vu_di_kem
from dich_vu_di_kem
join hop_dong_chi_tiet on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
join hop_dong on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
join khach_hang on hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
where loai_khach.ten_loai_khach = 'Diamond' and dich_vu_di_kem.`status` = 0 
and khach_hang.dia_chi like '%Vinh' or '%Quãng Ngãi';

-- Task 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng),
-- ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem),tien_dat_coc
-- của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được
-- khách hàng đặt vào 6 tháng đầu năm 2021.

select hop_dong.ma_hop_dong,nhan_vien.ho_ten as ho_ten_nhan_vien,khach_hang.ho_ten as ho_ten_khach_hang,
khach_hang.so_dien_thoai,dich_vu.ma_dich_vu,dich_vu.ten_dich_vu,sum(hop_dong_chi_tiet.so_luong) as so_luong_dich_vu_di_kem,hop_dong.tien_dat_coc
from hop_dong
join nhan_vien on hop_dong.ma_nhan_vien = nhan_vien.ma_nhan_vien
left join khach_hang on hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
left join dich_vu on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
left join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
left join dich_vu_di_kem on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
where ( hop_dong.ngay_lam_hop_dong
between '2020-10-01' and '2020-12-31' )
and hop_dong.ma_khach_hang
not in
(select ma_khach_hang from hop_dong
where hop_dong.ngay_lam_hop_dong
between '2021-01-01' and '2021-06-30'
)
and hop_dong.`status` = 0 
group by hop_dong.ma_hop_dong;

-- Task 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng.
-- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).

select dich_vu_di_kem.ma_dich_vu_di_kem,dich_vu_di_kem.ten_dich_vu_di_kem,sum(hop_dong_chi_tiet.so_luong)
as so_luong_dich_vu_di_kem from dich_vu_di_kem
join hop_dong_chi_tiet on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
group by dich_vu_di_kem.ma_dich_vu_di_kem
having sum(hop_dong_chi_tiet.so_luong) = (
select sum(hop_dong_chi_tiet.so_luong) as so_luong_dich_vu_di_kem from dich_vu_di_kem
join hop_dong_chi_tiet on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
and dich_vu_di_kem.`status` = 0 
group by dich_vu_di_kem.ma_dich_vu_di_kem
order by so_luong_dich_vu_di_kem desc
limit 0,1
);

-- Task 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất.
-- Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung
-- (được tính dựa trên việc count các ma_dich_vu_di_kem).

select hop_dong.ma_hop_dong,loai_dich_vu.ten_loai_dich_vu,dich_vu_di_kem.ten_dich_vu_di_kem,
count(dich_vu_di_kem.ma_dich_vu_di_kem) as so_lan_su_dung
from hop_dong
join dich_vu on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
join loai_dich_vu on dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
join dich_vu_di_kem on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
where hop_dong.`status` = 0 
group by dich_vu_di_kem.ma_dich_vu_di_kem
having so_lan_su_dung = 1
order by hop_dong.ma_hop_dong;

-- Task 15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan,
-- so_dien_thoai, dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.

select nhan_vien.ma_nhan_vien,nhan_vien.ho_ten,trinh_do.ten_trinh_do,bo_phan.ten_bo_phan,nhan_vien.so_dien_thoai,nhan_vien.dia_chi
from nhan_vien
join trinh_do  on nhan_vien.ma_trinh_do = trinh_do.ma_trinh_do
join bo_phan on nhan_vien.ma_bo_phan = bo_phan.ma_bo_phan
join hop_dong on nhan_vien.ma_nhan_vien = hop_dong.ma_nhan_vien
where hop_dong.ngay_lam_hop_dong
between '2020-01-01' and '2021-12-31'
and nhan_vien.`status` = 0 
group by nhan_vien.ma_nhan_vien
having count(nhan_vien.ma_nhan_vien) <=3;

-- Task 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021

SET SQL_SAFE_UPDATES = 0;
update nhan_vien
set nhan_vien.`status` = 1
where nhan_vien.ma_nhan_vien 
not in ( select * from (
	select nhan_vien.ma_nhan_vien from nhan_vien
	join hop_dong on nhan_vien.ma_nhan_vien = hop_dong.ma_nhan_vien
	where hop_dong.ngay_lam_hop_dong 
	between '2019-01-01' and '2021-12-31'
	group by nhan_vien.ma_nhan_vien) table_tam
);
set SQL_SAFE_UPDATES = 1;

select * from nhan_vien
where `status` = 1;


-- Task 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond,
--  chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 
-- là lớn hơn 10.000.000 VNĐ.

SET SQL_SAFE_UPDATES = 0;
update khach_hang
set khach_hang.ma_loai_khach = 1
where khach_hang.ma_khach_hang
in( select * from (
select khach_hang.ma_khach_hang  from khach_hang
join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
join dich_vu on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
join dich_vu_di_kem on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
where  year(hop_dong.ngay_lam_hop_dong) = 2021 and loai_khach.ma_loai_khach = 2 
and dich_vu.chi_phi_thue + ifnull((hop_dong_chi_tiet.so_luong * dich_vu_di_kem.gia),0) > 10000000) table_tam
);
SET SQL_SAFE_UPDATES = 1;


select khach_hang.ma_khach_hang,khach_hang.ho_ten,loai_khach.ma_loai_khach 
from khach_hang
join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
where loai_khach.ma_loai_khach = 1;

-- Task 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).

SET SQL_SAFE_UPDATES = 0;
update khach_hang
set khach_hang.`status` = 1
where  khach_hang.ma_khach_hang
in( select * from (
	select khach_hang.ma_khach_hang from khach_hang
	join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
	where year(hop_dong.ngay_lam_hop_dong) < 2021 ) table_tam      -- sql ko cho update trực tiếp nên ta phải khai báo 1 table tạm để update
);
SET SQL_SAFE_UPDATES = 1;

select * from khach_hang
where `status` = 1;


-- Task 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.

SET SQL_SAFE_UPDATES = 0;
update dich_vu_di_kem
set dich_vu_di_kem.gia = gia*2
where dich_vu_di_kem.ma_dich_vu_di_kem
in( select * from (
select dich_vu_di_kem.ma_dich_vu_di_kem from dich_vu_di_kem
join hop_dong_chi_tiet on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
join hop_dong on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
where hop_dong_chi_tiet.so_luong > 10 and year(hop_dong.ngay_lam_hop_dong) = 2020) table_tam)
;
SET SQL_SAFE_UPDATES = 1;

select * from dich_vu_di_kem;


-- Task 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống,
-- thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.

select nhan_vien.ma_nhan_vien as `id`,nhan_vien.ho_ten,nhan_vien.email,nhan_vien.so_dien_thoai,nhan_vien.ngay_sinh,nhan_vien.dia_chi,'nhan_vien' as 'role' from nhan_vien
union all 
select khach_hang.ma_khach_hang as `id`,khach_hang.ho_ten,khach_hang.email,khach_hang.so_dien_thoai,khach_hang.ngay_sinh,khach_hang.dia_chi,'khach_hang' as 'role' from khach_hang;

-- Task 21.	Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là
-- “Hải Châu” và đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “12/12/2019”.

create view v_nhan_vien as select nhan_vien.*
from nhan_vien
join hop_dong on nhan_vien.ma_nhan_vien = hop_dong.ma_nhan_vien
where nhan_vien.dia_chi like '%Huế%' and hop_dong.ngay_lam_hop_dong = '2021-07-14';

-- Task 22.	Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu”
-- đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này

SET SQL_SAFE_UPDATES = 0;
update v_nhan_vien
set v_nhan_vien.dia_chi = 'Liên Chiểu';
SET SQL_SAFE_UPDATES = 1;

select v_nhan_vien.* from v_nhan_vien

-- 23.	Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó với
-- ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang.












