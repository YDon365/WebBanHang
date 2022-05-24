create database QL_THUCPHAM
go
use QL_THUCPHAM
go
--Làm đồ án HQT CSDL
go
create table TENNHOMLOAI
(
	MaNhom char(10) ,
	tenNhom nvarchar(50),

	constraint PK_TENNHOMLOAI primary key(MaNhom)
)
go
create table LOAIHANG
(
	MaLoai char(10) ,
	tenLoai nvarchar(50),
	MaNhom char(10),--Khóa ngoại
	constraint PK_LOAIHANG primary key(MaLoai)
)
go
create table SANPHAM
(
	id int identity(1,1),
	MaSP char(10) ,
	tenSP nvarchar(50),
	donGia int,
	soLuong int,
	xuatSu char(50),
	trongLuong char(50),
	tinhTrang nvarchar(50),
	MaLoai CHAR(10),
	constraint PK_SANPHAM primary key(MaSP)
)
go
create table HINHSP
(
	MaSP char(10),--khóa ngoại
	hinhTP varchar(500),
	hinhSP varchar(500)
)
go
create table THONGTINSP
(
	MaSP char(10),--khóa ngoại
	tenCachDung nvarchar(50),
	cachDung ntext,
	khaiNiemSP ntext
)
go
create table KHACHHANG
(
	id int identity(1,1),
	MaKH char(10) ,
	matKhau char(20),
	tenKH nvarchar(50),
	dienThoai char(15),
	diaChi nvarchar(50),
	gioiTinh nvarchar(10),
	email char(50),
	ngaySinh date,

	constraint PK_KHACHHANG primary key(MaKH)
)
go
create table PHONGBAN
(
	MaPB char(10),
	tenPB nvarchar(50),
	dienThoai char(15),
	slNV int,
	constraint PK_PHONGBAN primary key(MaPB)
)
create table CHUCVU
(
	MaCV char(10),
	tenCV nvarchar(50),
	constraint PK_CHUCVU primary key(MaCV)
)
go
create table NHANVIEN
(
	MaNV char(10),
	tenNV nvarchar(50),
	gioiTinh nvarchar(15),
	dienThoai char(15),
	ngaySinh date,
	ngayVL date,
	luong int,
	diaChi ntext,
	MaPB char(10),
	MaCV char(10),
	constraint PK_NHANVIEN primary key(MaNV)
)
go
create table HOADON
(
	MaHD int identity(1,1) ,
	MaKH char(10),--Khóa ngoại
	MaNV char(10),
	tongTien int,
	ngayLap date,	
	constraint PK_HOADON primary key(MaHD)
)
go
create table CHITIETHD
(
	MaHD int,--Khóa ngoại
	MaSP char(10),--Khóa ngoại
	soLuong int,
	donGia int,
	MaGG char(10),
	constraint PK_CHITIETHD primary key(MaHD,MaSP)
)
go
create table VITAMIN
(
	MaSP char(10),
	hinh1 varchar(500),

	ten1 ntext,
	ndTen1 ntext,

	ten2 ntext,
	ndTen2 ntext,

	ten3 ntext,
	ndTen3 ntext,
)
go
create table QUYEN
(
	MaKH char(10),
	tenQuyen nvarchar(50) default N'Khách Hàng'
)
go
create table CTGIAOHANG
(
	MaHD int,
	ngayGiao date,
	diaChi ntext,
	ghiChu ntext,
	constraint PK_CTGIAOHANG primary key(MaHD)
)
go
create table PHIEUGIAMGIA
(
	MaGG char(10),
	ngayBD date,
	ngayKT date,
	tienGiam float,
	constraint PK_PHIEUGIAMGIA primary key(MaGG)
)
go
create table GIOHANG
(
	MaSP char(10),
	MaKH char(10),
	soLuongSP int,
	cheDo int default 1,
	constraint PK_GIOHANG primary key(MaSP,MaKH)
)
go
--=======================khóa ngoại============================
--GIOHANG
alter table GIOHANG
add constraint FK_GIOHANG_SANPHAM foreign key(MaSP) references SANPHAM(MaSP)
alter table GIOHANG
add constraint FK_GIOHANG_KHACHHANG foreign key(MaKH) references KHACHHANG(MaKH)
--LOAIHANG
alter table LOAIHANG
add constraint FK_LOAIHANG_TENNHOMLOAI foreign key(MaNhom) references TENNHOMLOAI(MaNhom)
--SANPHAM
Alter table SANPHAM
add constraint FK_SANPHAM_LOAIHANG foreign key(MaLoai) references LOAIHANG(MaLoai) 
--HINHS
alter table HINHSP
add constraint FK_HINHSP_SANPHAM foreign key(MaSP) references SANPHAM(MaSP)
--THONGTINSP
alter table THONGTINSP
add constraint FK_THONGTINSP_SANPHAM foreign key(MaSP) references SANPHAM(MaSP)

--NHANVIEN
alter table NHANVIEN
add constraint FK_NHANVIEN_PHONGBAN foreign key(MaPB) references PHONGBAN(MaPB)

alter table NHANVIEN
add constraint FK_NHANVIEN_CHUCVU foreign key(MaCV) references CHUCVU(MaCV)
--HOADON
alter table HOADON
add constraint FK_HOADON_KHACHHANG foreign key(MaKH) references KHACHHANG(MaKH)

alter table HOADON
add constraint FK_HOADON_NHANVIEN foreign key(MaNV) references NHANVIEN(MaNV)
--CHITIETHD
alter table CHITIETHD
add constraint FK_CHITIETHD_HOADON foreign key(MaHD) references HOADON(MaHD)

alter table CHITIETHD
add constraint FK_CHITIETHD_SANPHAM foreign key(MaSP) references SANPHAM(MaSP)

alter table CHITIETHD
add constraint FK_CHITIETHD_PHIEUGIAMGIA foreign key(MaGG) references PHIEUGIAMGIA(MaGG)
--CTGIAOHANG
alter table CTGIAOHANG
add constraint FK_CTGIAOHANG_HOADON foreign key(MaHD) references HOADON(MaHD)
--VITAMIN
alter table VITAMIN
add constraint FK_VITAMIN_SANPHAM foreign key(MaSP) references SANPHAM(MaSP)
--QUYEN
alter table QUYEN
add constraint FK_QUYEN_KHACHHANG foreign key(MaKH) references KHACHHANG(MaKH)
--=========================Xử lý Ràng Buộc toàn vẹn=================================
--========CHECK
--PHIEUGIAMGIA
alter table PHIEUGIAMGIA
add constraint CHEK_PGG_tienGiam check(tienGiam>=0)
--PHONGBAN
alter table PHONGBAN
add constraint CHEK_PHONGBAN_slNV check(slNV>=0)

--NHANVIEN
alter table NHANVIEN
add constraint CHEK_NV_luong check(luong>=0)

alter table NHANVIEN
add constraint CHEK_NHANVIEN_gioiTinh check(gioiTinh=N'Nam' or gioiTinh=N'Nữ')
--CHITIETHD
alter table CHITIETHD
add constraint CHEK_CHITIETHD_soLuong check(soLuong>=0)

alter table CHITIETHD
add constraint CHEK_CHITIETHD_donGia check(donGia>=0)

--HOADON
alter table HOADON
add constraint CHEK_HOADON_tongTien check(tongTien>=0)

--KHACHHANG
alter table KHACHHANG
add constraint CHEK_KHACHHANG_gioiTinh check(gioiTinh=N'Nam' or gioiTinh=N'Nữ')

--SANPHAM
alter table SANPHAM
add Constraint CHEK_SANPHAM_donGia check(donGia>=0)

alter table SANPHAM
add Constraint CHEK_SANPHAM_soLuong check(soLuong>=0)

alter table SANPHAM
add constraint CHEK_SANPHAM_tinhTrang check(tinhTrang=N'Đang kinh doanh' or tinhTrang=N'Ngừng kinh doanh' or tinhTrang=N'Chưa có bán')

--=========UNIQUE
--TENNHOMLOAI
alter table TENNHOMLOAI
add constraint UNI_TENNHOMLOAI_tenNhom unique(tenNhom)

--LOAIHANG
alter table LOAIHANG
add constraint UNI_LOAIHANG_tenLoai unique(tenLoai)

--PHONGBAN
alter table PHONGBAN
add constraint UNI_PHONGBAN_tenPB unique(tenPB)

--CHUCVU
alter table CHUCVU
add constraint UNI_CHUCVU_tenCV unique(tenCV)


--=========DEFAULT
--PHONGBAN
alter table PHONGBAN
add constraint DEFAU_PHONGBAN_slnv default 0 for slNV

--PHIEUGIAMGIA
alter table PHIEUGIAMGIA
add constraint DEFAU_PHIEUGIAMGIA_tienGiam default 0 for tienGiam
--HOADON
alter table HOADON
add constraint DEFAU_HOADON_tongTien default 0 for tongTien

--SANPHAM
alter table SANPHAM
add constraint DEFAU_SANPHAM_tinhTrang default N'Chưa có bán' for tinhTrang

alter table SANPHAM
add constraint DEFAU_SANPHAM_donGia default 0 for donGia

alter table SANPHAM
add constraint DEFAU_SANPHAM_soLuong default 0 for soLuong

--CHITIETHD
alter table CHITIETHD
add constraint DEFAU_CHITIETHD_donGia default 0 for donGia

alter table CHITIETHD
add constraint DEFAU_CHITIETHD_soLuong default 0 for soLuong
--HINHSP
alter table HINHSP
add constraint DEFAU_HINHSP default 'hinh/b_Labrada.jpg' for hinhTP
--THONGTINSP
alter table THONGTINSP
add constraint DEFAU_THONGTINSP default N'Hướng dẫn sử dụng' for tenCachDung

alter table THONGTINSP
add constraint DEFAU_THONGTINSP_cd default N'Nên nhớ không có giới hạn nào với cách sử dụng sản phẩm, với 9 muỗng của 1 serving muscle mass gainer 
										bạn có thể chia ra làm 3-4 lần uống dàn trải trong ngày: <br /><br />
										+ 2 muỗng vào buổi sáng cách giờ ăn 2h-2,5h <br />
										+ 2,5 muỗng trước tập 1h <br \>
										+ 2,5 muỗng sau tập 30ph <br \>
										+ 2 muỗng trước khi đi ngủ 1,5h <br \>' for cachDung

alter table THONGTINSP
add constraint DEFAU_THONGTINSP_kn default N'là dòng sữa tăng cân cho người gầy thiếu cân, khó hấp thụ,
										bởi chỉ với một lượng phù hợp được hấp thụ Mass Gainer làm cơ thể dễ thích nghi, tăng cân lành mạnh.' 
										for khaiNiemSP
alter table VITAMIN
add constraint DEFAU_VITAMIN_h1 default 'imp/khien.png' for hinh1

alter table VITAMIN
add constraint DEFAU_VITAMIN_ten1 default N'Tăng cân + Bổ sung vitamin' for ten1

alter table VITAMIN
add constraint DEFAU_VITAMIN_ndten1 default N'Ngoài việc bổ sung các chất dinh dưỡng cho cơ thể để tăng cân , tăng cơ thì các vitamin, khoáng chất cũng là thứ không thể thiếu để cho cơ thể khỏe mạnh ,miễn dịch tốt, nâng cao hệ tuần hoàn cho cơ thể phát triển.'
									 for ndTen1

alter table VITAMIN
add constraint DEFAU_VITAMIN_ten2 default N'Tăng cân + Tăng sức mạnh' for ten2

alter table VITAMIN
add constraint DEFAU_VITAMIN_ndten2 default N'Bổ sung dinh dưỡng cho cơ thể sau khi tập luyện, thời gian bị rơi vào trạng thái thiếu hụt protein, năng lượng. Kết hợp với vận động khiến khả năng vận chuyển protein và dinh dưỡng được cải thiện đáng kể.' 
									for ndTen2

alter table VITAMIN
add constraint DEFAU_VITAMIN_ten3 default N'Tăng cân + Phục hồi cơ' for ten3

alter table VITAMIN
add constraint DEFAU_VITAMIN_ndten3 default N'Nuôi dưỡng cơ thể phát triển hoàn hảo với Muscle mass Gainer và Anabolic State , bổ sung các dinh dưỡng cần thiết sau các bài tập giúp cơ bắp phát triển hiệu quả hơn'
									 for ndTen3
---=============================triger================
----CHITIETHD
--update donGia 
go
create trigger TRIG_donGia on CHITIETHD
for insert, update
as
begin
	update CHITIETHD
	set donGia=(select ct.donGia from SANPHAM ct,inserted i where ct.MaSP=i.MaSP)
	from inserted i
	where CHITIETHD.MaSP=i.MaSP and CHITIETHD.MaHD=i.MaHD
end
go
--HOADON
--TongTien
go
create trigger TRIG_TongTienHD on CHITIETHD
for insert, update
as
	if((select count(*) from inserted i,PHIEUGIAMGIA p where i.MaGG=p.MaGG)=1)
	begin
		if((select ngayLap from inserted i,HOADON hd where i.MaHD=hd.MaHD) >= (select ngayBD from PHIEUGIAMGIA p,inserted i where i.MaGG=p.MaGG) and
			(select ngayLap from inserted i,HOADON hd where i.MaHD=hd.MaHD) <= (select ngayKT from PHIEUGIAMGIA p,inserted i where i.MaGG=p.MaGG))   
		begin
		update HOADON
		set tongTien=tongTien+(select sum(i.donGia*i.soLuong) from HOADON hd,inserted i where hd.MaHD=i.MaHD )
						-((select sum(i.donGia*i.soLuong) from HOADON hd,inserted i where hd.MaHD=i.MaHD )
						*(select tienGiam from PHIEUGIAMGIA p,inserted i where i.MaGG=p.MaGG))
					from HOADON hd, inserted i
					where hd.MaHD=i.MaHD 
		end
		else
		begin
		update HOADON
			set tongTien=tongTien+(select sum(i.donGia*i.soLuong) from HOADON hd,inserted i
													where hd.MaHD=i.MaHD )
					from HOADON hd, inserted i
					where hd.MaHD=i.MaHD 
		end
	end
	else
		begin
		update HOADON
		set tongTien=tongTien+(select sum(i.donGia*i.soLuong) from HOADON hd,inserted i
													where hd.MaHD=i.MaHD )
					from HOADON hd, inserted i
					where hd.MaHD=i.MaHD 
		end
go
--PHONGBAN
create trigger TRIG_slNV on NHANVIEN
for insert,update
as
BEGIN
	if((select COUNT(*) from inserted ,PHONGBAN  where inserted.MaPB=PHONGBAN.MaPB )>0)
	begin
		update PHONGBAN
		set slNV= slNV+1
		from inserted
		where inserted.MaPB=PHONGBAN.MaPB
	end
END
go
--========================Nhập liệu==============================
go
--KHACHHANG
set dateformat dmy
insert into KHACHHANG(MaKH,matKhau,tenKH,dienThoai,diaChi,gioiTinh,email,ngaySinh)
values 
('KH01','123',N'Nguyễn Thị Thu Thảo','0123456789',N'TPHCM',N'Nữ','thuthao@gmail.com','20/10/2000'),
('KH02','123',N'Văn Lang','0123456789',N'TPHCM',N'Nam','vanlang@gmail.com','2/12/2002'),
('KH03','123',N'Lương Trọng Tấn','0123456789',N'Hà Nội',N'Nam','trongtan@gmail.com','19/5/1995'),
('KH04','123',N'Lê Khởi Nghĩa','0123456789',N'Nha Trang',N'Nam','khoinghia@gmail.com','2/1/1999'),
('KH05','123',N'Thành Công','0123456789',N'Bắc Ninh ',N'Nữ','thanhcong@gmail.com','6/9/2000'),
('KH06','123',N'Nguyễn Du','0123456789',N'Bắc Giang',N'Nam','nguyendu@gmail.com','1/10/1991'),
('KH07','123',N'Vũ Thị Thường','0123456789',N'Đăk Lăk',N'Nữ','thuong@gmail.com','15/4/2004'),
('KH08','123',N'Vũ Văn Vũ','0123456789',N'Hà Nội',N'Nam','vu@gmail.com','8/2/2000'),
('KH09','123',N'Lê Thường Phải','0123456789',N'TPHCM',N'Nam','phai@gmail.com','20/10/2000'),
('KH10','123',N'Trọng Tai','0123456789',N'TPHCM',N'Nam','tai@gmail.com','30/10/2000')

insert into KHACHHANG(MaKH,matKhau)
values 
('ADMIN','123456')
--TENNHOMLOAI
insert into TENNHOMLOAI
values
('TNL01',N'Mass'),
('TNL02',N'Whey Protein'),
('TNL03',N'Giảm cân đốt mỡ'),
('TNL04',N'Phụ kiện Gym')

--LOAIHANG
insert into LOAIHANG
values
('LH01',N'Tăng cân nhanh','TNL01'),
('LH02',N'Whey Protein Blend','TNL02'),
('LH03',N'Whey Protein Isolate','TNL02'),
('LH04',N'Hydrolyzed Whey','TNL02'),
('LH05',N'Meal Replacement','TNL02'),
('LH06',N'Sinh nhiệt đốt mỡ','TNL03'),
('LH07',N'Ít chất kích thích','TNL03'),
('LH08',N'Bình lắc','TNL04'),
('LH09',N'Phụ kiện khác','TNL04')

--SANPHAM

--LH001 tang can nhanh 1-9
insert into SANPHAM(MaSP,tenSP,donGia,soLuong,xuatSu,trongLuong,tinhTrang,MaLoai)
values
('SP001',N'Labrada Muscle Mass Gainer 12lbs 5.4Kg',1550000,50,N'USA',N'5.4Kg',N'Đang kinh doanh',null),
('SP002',N'Dymatize Super Mass 12lbs (5.4kg)',1290000,100,N'USA',N'5.4kg',N'Đang kinh doanh',null),
('SP003',N'Serious Mass 12lbs 5.44kg',1290000,56,N'USA',N'5.44kg',N'Đang kinh doanh',null),
('SP004',N'Serious Mass 6lbs 2.72kg',750000,86,N'USA',N'2.72kg',N'Đang kinh doanh',null),
('SP005',N'Mass Tech 2000 22lbs 10kg',2150000,86,N'USA',N'10kg',N'Đang kinh doanh',null),
('SP006',N'Premium Mass Gainer 5,44kg',1300000,90,N'USA',N'5,44kg',N'Đang kinh doanh',null),
('SP007',N'Mass Effect 13lbs 5.9kg',1590000,97,N'USA',N'5.9kg',N'Đang kinh doanh',null),
('SP008',N'Mutant Mass 15lbs 6.8kg',1900000,98,N'USA',N'6.8kg',N'Đang kinh doanh',null),
('SP009',N'Nutrex Mass Infusion 12lbs',1400000,0,N'USA',N'5.45kg',N'Chưa có bán',null)
--LH002 Whey Protein Blend  10-16
insert into SANPHAM
values
('SP010',N'Whey Gold Standard 5lbs 2.27kg',1450000,65,N'USA',N'2.27kg',N'Đang kinh doanh',null),
('SP011',N'Nitrotech 4lbs 1.8kg',1250000,55,N'USA',N'1.8kg',N'Đang kinh doanh',null),
('SP012',N'Whey Gold Standard 2lbs 900g',790000,65,N'USA',N'900g',N'Đang kinh doanh',null),
('SP013',N'Whey Gold Standard 10lbs 4.5kg',2450000,58,N'USA',N'4.5kg',N'Đang kinh doanh',null),
('SP014',N'Labrada Lean Pro 8 5lbs 2.27kg',1450000,70,N'USA',N'2.27kg',N'Đang kinh doanh',null),
('SP015',N'Nitrotech 4lbs 1.80kg',1250000,55,N'USA',N'1.8kg',N'Đang kinh doanh',null),
('SP016',N'NitroTech 10lbs 4.5kg',2450000,80,N'USA',N'4.5kg',N'Đang kinh doanh',null)
--LH003 Whey Protein Isolate   17-19
insert into SANPHAM
values
('SP017',N'ISO HD 5lbs 100% Isolate',1250000,68,N'USA',N'2,27kg',N'Đang kinh doanh',null),
('SP018',N'On Isolate 5lbs 2.27kg',1650000,65,N'USA',N'2.27kg',N'Đang kinh doanh',null),
('SP019',N'Xtend Pro Whey Isolate 5lbs',1450000,59,N'USA',N'2.27kg',N'Đang kinh doanh',null)
--LH004 Hydrolyzed Whey		20-26
insert into SANPHAM
values
('SP020',N'Nutrabolics HydroPure 4.5lbs',1690000,50,N'USA',N'2.04 kg',N'Đang kinh doanh',null),
('SP021',N'Rule1 Protein 5lbs',1290000,82,N'USA',N'2.2kg ',N'Đang kinh doanh',null),
('SP022',N'Mutant Iso Surge 5lbs 2.27kg',1850000,59,N'USA',N'2.27kg',N'Đang kinh doanh',null),
('SP023',N'VP2 Whey Protein Isolate 2lbs 900g',820000,34,N'USA',N'900g',N'Đang kinh doanh',null),
('SP024',N'Platinum HydroWhey 3.5lbs 1.59kg',1550000,0,N'USA',N'1.59kg',N'Ngừng kinh doanh',null),
('SP025',N'ISO 100 5lbs 2.27kg',1850000,0,N'USA',N'2.27kg',N'Ngừng kinh doanh',null),
('SP026',N'Rule 1 Protein 10lbs 4.5kg',2450000,0,N'USA',N'4.5kg',N'Ngừng kinh doanh',null)
--LH005 Meal Replacement	27-29
insert into SANPHAM
values
('SP027',N'Lean Body MRP 80 gói',3990000,100,N'USA',null,N'Đang kinh doanh',null),
('SP028',N'Protein Brownie Bar - Vị Chocolate',60000,0,N'USA',null,N'Ngừng kinh doanh',null),
('SP029',N'One Bar Protein',750000,200,N'USA',null,N'Đang kinh doanh',null)
--LH006 Sinh nhiệt đốt mỡ	30-33
insert into SANPHAM  
values
('SP030',N'Lipo6 Black 60 viên',590000,80,N'USA',null,N'Đang kinh doanh',null),
('SP031',N'Hydroxycut NextGen 100 viên.',550000,65,N'USA',null,N'Đang kinh doanh',null),
('SP032',N'Hydroxycut Nextgen 100 viên',550000,90,N'USA',null,N'Đang kinh doanh',null),
('SP033',N'Hydroxycut Nextgen 180 viên',750000,50,N'USA',null,N'Đang kinh doanh',null)
--LH007 Ít chất kích thích	34
insert into SANPHAM
values
('SP034',N'Carnibolic 30 servings',550000,60,N'USA',null,N'Đang kinh doanh',null)
--LH008 Bình lắc			35-37
insert into SANPHAM
values
('SP035',N'Smartshaker Jay Cutler 800ml',200000,20,N'USA',N'800ml',N'Đang kinh doanh',null),
('SP036',N'Bình Ronnie Coleman 800ml',200000,52,N'USA',N'800ml',N'Đang kinh doanh',null),
('SP037',N'Bình PhilHeath 800ml',200000,10,N'USA',N'800ml',N'Đang kinh doanh',null)
--LH009 Phụ kiện khác		38-41
insert into SANPHAM
values
('SP038',N'Gang tay Beast Max Strength',200000,68,N'USA',null,N'Đang kinh doanh',null),
('SP039',N'Đai lưng mềm Harbinger 5 inch',640000,15,N'USA',null,N'Đang kinh doanh',null),
('SP040',N'Đai lưng mềm Harbinger 4 inch',540000,35,N'USA',null,N'Đang kinh doanh',null),
('SP041',N'Dây kéo Harbinger 1 đôi',250000,35,N'USA',null,N'Đang kinh doanh',null)

--update
--MaLoai
UPDATE SANPHAM
 SET MaLoai='LH01' WHERE MaSP='SP001' or MaSP='SP002' or MaSP='SP003' or MaSP='SP004' or MaSP='SP005' or MaSP='SP006' or MaSP='SP007' or MaSP='SP008' or MaSP='SP009'
 UPDATE SANPHAM
 SET MaLoai='LH02' WHERE MaSP='SP010' or MaSP='SP011' or MaSP='SP012' or MaSP='SP013' or MaSP='SP014' or MaSP='SP015' or MaSP='SP016' 
 UPDATE SANPHAM
 SET MaLoai='LH03' WHERE MaSP='SP017' or MaSP='SP018' or MaSP='SP019' 
 UPDATE SANPHAM
 SET MaLoai='LH04' WHERE MaSP='SP020' or MaSP='SP021' or MaSP='SP022' or MaSP='SP023' or MaSP='SP024' or MaSP='SP025' or MaSP='SP026' 
  UPDATE SANPHAM
 SET MaLoai='LH05' WHERE MaSP='SP027' or MaSP='SP028' or MaSP='SP029' 
  UPDATE SANPHAM
 SET MaLoai='LH06' WHERE MaSP='SP030' or MaSP='SP031' or MaSP='SP032' or MaSP='SP033' 
  UPDATE SANPHAM
 SET MaLoai='LH07' WHERE MaSP='SP034'
   UPDATE SANPHAM
 SET MaLoai='LH08' WHERE MaSP='SP035' or MaSP='SP036' or MaSP='SP037' 
   UPDATE SANPHAM
 SET MaLoai='LH09' WHERE MaSP='SP038' or MaSP='SP039' or MaSP='SP040' or MaSP='SP041' 

 
 --QUYEN
 insert into QUYEN(MaKH)
 values
('KH01'),
('KH02'),
('KH03'),
('KH04'),
('KH05'),
('KH06'),
('KH07'),
('KH08'),
('KH09'),
('KH10'),
('ADMIN')

update QUYEN
set tenQuyen=N'Quản trị viên' where MaKH='ADMIN'
go
--PHONGBAN
insert into PHONGBAN(MaPB,tenPB,dienThoai)
values
('PB01',N'Quản lý nhân Sự','1900811'),
('PB02',N'Kế toán','1900812'),
('PB03',N'Bán hàng','1900813'),
('PB04',N'Quảng cáo','1900814'),
('PB05',N'Phát triển sản phẩm','1900815')

go
--CHUCVU
insert into CHUCVU
values
('CV01',N'Nhân viên'),
('CV02',N'Quản lý'),
('CV03',N'Thư ký'),
('CV04',N'Giám đốc'),
('CV05',N'Trưởng phòng')
go
--NHANVIEN
set dateformat dmy
insert into NHANVIEN values ('NV001',N'Huỳnh Lê Công Thành',N'Nam','0333444167','03/04/2001','12/08/2019',200000000,N'Q1, TP.HCM',null,'CV04')
insert into NHANVIEN values ('NV002',N'Y Don Rbăm',N'Nam','012354356721','03/05/2000','20/07/2020',13000000,N'Q2, TP.HCM','PB01','CV01')
insert into NHANVIEN values ('NV003',N'Lâm Chí Khang',N'Nam','09872373777','03/06/2001','12/08/2020',13500000,N'Q13, TP.HCM','PB01','CV01')
insert into NHANVIEN values ('NV004',N'Lê Thị Lệ',N'Nữ','09872373778','03/07/1999','12/09/2020',13500000,N'Q1, TP.HCM',null,'CV03')
insert into NHANVIEN values ('NV005',N'Huỳnh Văn Châu',N'Nam','09872373770','03/08/2001','12/10/2020',15000000,N'Q6, TP.HCM','PB01','CV02')
insert into NHANVIEN values ('NV006',N'Nguyễn Hữu Vinh',N'Nam','09872373776','03/09/2000','12/12/2019',15000000,N'Q9, TP.HCM','PB01','CV05')
insert into NHANVIEN values ('NV007',N'Huỳnh Châu Kim Yến',N'Nữ','09872373775','03/10/2001','12/11/2018',10000000,N'Q4, TP.HCM','PB02','CV01')
insert into NHANVIEN values ('NV008',N'Huỳnh Thị Hồng Diễm',N'Nữ','09872373774','11/04/2001','12/08/2018',10000000,N'Q5, TP.HCM','PB02','CV01')
insert into NHANVIEN values ('NV009',N'Lê Văn Tròn',N'Nam','09872373773','15/04/2000','12/07/2020',10000000,N'Q2, TP.HCM','PB02','CV02')
insert into NHANVIEN values ('NV010',N'Nguyễn Minh Tâm',N'Nam','09872373772','06/05/2001','12/06/2020',10000000,N'Q8, TP.HCM','PB03','CV05')
insert into NHANVIEN values ('NV011',N'Huỳnh Thị Kim Hương',N'Nữ','09872373771','03/02/2001','12/05/2018',10000000,N'Q3, TP.HCM','PB03','CV01')
insert into NHANVIEN values ('NV012',N'Lê Văn Phẩm',N'Nam','0333444161','03/02/2000','12/09/2017',10000000,N'Tân Phú, TP.HCM','PB03','CV01')
insert into NHANVIEN values ('NV013',N'Châu Thị Kim Ngân',N'Nữ','0333444162','03/04/1999','12/07/2019',10000000,N'Q9, TP.HCM','PB03','CV02')
insert into NHANVIEN values ('NV014',N'Huỳnh Thị Ngọc Minh',N'Nữ','0333444163','06/09/1998','12/03/2020',11000000,N'Thủ Đức, TP.HCM','PB03','CV05')
insert into NHANVIEN values ('NV015',N'Nguyễn Văn Sỹ',N'Nam','0333444164','05/04/2000','12/04/2019',12000000,N'Tân Phú, TP.HCM','PB03','CV01')
insert into NHANVIEN values ('NV016',N'Lê Văn Ơn',N'Nam','0333444165','12/05/2001','12/09/2017',13000000,N'Phú Nhuận, TP.HCM','PB03','CV01')
insert into NHANVIEN values ('NV017',N'Huỳnh Thanh Nam',N'Nam','0333444166','07/09/1998','12/06/2020',14000000,N'Q12, TP.HCM','PB04','CV01')
insert into NHANVIEN values ('NV018',N'Nguyễn Thị Huệ',N'Nữ','0333444168','03/07/2000','12/02/2019',19000000,N'Q11, TP.HCM','PB04','CV02')
insert into NHANVIEN values ('NV019',N'Huỳnh Thị Ngọc MỸ',N'Nữ','0333444178','06/09/1999','12/03/2018',11000000,N'Thủ Đức, TP.HCM','PB04','CV05')
insert into NHANVIEN values ('NV020',N'Nguyễn Văn Sinh',N'Nam','0333444198','05/04/2001','12/04/2020',12000000,N'Tân Phú, TP.HCM','PB04','CV01')
insert into NHANVIEN values ('NV021',N'Trần Thị Thanh Ngọc',N'Nữ','0333444123','13/07/2001','12/09/2019',13000000,N'Phú Nhuận, TP.HCM','PB05','CV01')
insert into NHANVIEN values ('NV022',N'Huỳnh Thanh Tâm',N'Nữ','0333444156','07/10/1998','12/06/2020',14000000,N'Q12, TP.HCM','PB05','CV02')
insert into NHANVIEN values ('NV023',N'Nguyễn Thị Thúy An',N'Nữ','0333444157','05/12/2000','12/02/2018',19000000,N'Q11, TP.HCM','PB05','CV05')
go
--PHIEUGIAMGIA
set dateformat dmy
insert into PHIEUGIAMGIA
values
('MG01','01/02/2021','01/03/2021',0.1),
('MG02','01/03/2021','20/03/2021',0.2),
('MG03','05/10/2020','20/10/2020',0.3),
('MG04','01/04/2020','01/07/2020',0.05),
('MG05','01/12/2020','01/01/2021',0.09),
('MG06','09/08/2020','07/09/2020',0.15),
('MG07','20/08/2020','28/08/2020',0.1)
go
--HOADON
set dateformat dmy
insert into HOADON(MaKH,ngayLap,MaNV)values('KH01','12/2/2021','NV011')
set dateformat dmy
insert into HOADON(MaKH,ngayLap,MaNV)values('KH02','05/3/2021','NV012')
set dateformat dmy
insert into HOADON(MaKH,ngayLap,MaNV)values('KH03','19/10/2020','NV015')
set dateformat dmy
insert into HOADON(MaKH,ngayLap,MaNV)values('KH04','20/05/2020','NV016')
set dateformat dmy
insert into HOADON(MaKH,ngayLap,MaNV)values('KH05','01/12/2020','NV011')
set dateformat dmy
insert into HOADON(MaKH,ngayLap,MaNV)values('KH06','05/09/2020','NV012')
set dateformat dmy
insert into HOADON(MaKH,ngayLap,MaNV)values('KH07','25/08/2020','NV012')
set dateformat dmy
insert into HOADON(MaKH,ngayLap,MaNV)values('KH08','29/07/2021','NV015')
set dateformat dmy
insert into HOADON(MaKH,ngayLap,MaNV)values('KH01','30/04/2021','NV015')
go
--chitietHD
insert into CHITIETHD(MaHD,MaSP,soLuong,MaGG)values(1,'SP001',2,'MG01')
insert into CHITIETHD(MaHD,MaSP,soLuong,MaGG)values(1,'SP031',3,'MG01')
insert into CHITIETHD(MaHD,MaSP,soLuong,MaGG)values(2,'SP002',1,'MG02')
insert into CHITIETHD(MaHD,MaSP,soLuong,MaGG)values(3,'SP003',4,'MG03')
insert into CHITIETHD(MaHD,MaSP,soLuong,MaGG)values(3,'SP015',4,null)
insert into CHITIETHD(MaHD,MaSP,soLuong,MaGG)values(3,'SP020',1,'MG03')
insert into CHITIETHD(MaHD,MaSP,soLuong,MaGG)values(4,'SP020',2,'MG04')
insert into CHITIETHD(MaHD,MaSP,soLuong,MaGG)values(4,'SP005',5,'MG04')
insert into CHITIETHD(MaHD,MaSP,soLuong,MaGG)values(5,'SP001',6,null)
insert into CHITIETHD(MaHD,MaSP,soLuong,MaGG)values(5,'SP010',7,'MG05')
insert into CHITIETHD(MaHD,MaSP,soLuong,MaGG)values(5,'SP020',2,'MG05')
insert into CHITIETHD(MaHD,MaSP,soLuong,MaGG)values(5,'SP040',1,null)
insert into CHITIETHD(MaHD,MaSP,soLuong,MaGG)values(6,'SP007',2,null)
insert into CHITIETHD(MaHD,MaSP,soLuong,MaGG)values(7,'SP008',5,'MG07')
insert into CHITIETHD(MaHD,MaSP,soLuong,MaGG)values(8,'SP029',4,null)
insert into CHITIETHD(MaHD,MaSP,soLuong,MaGG)values(9,'SP014',2,null)
go
--giohang
insert into GIOHANG
values
('SP001','KH01',3,1),
('SP031','KH01',1,1),
('SP002','KH02',2,1),
('SP020','KH02',1,1)
go
--CTGIAOHANG
set dateformat dmy
insert into CTGIAOHANG
values
(1,'28/2/2021',N'55A Nguyễn Đỗ cung,Tây Thạnh, Tân phú',N'Giao trong giờ hành chính'),
(2,'15/4/2021',N'148 Lê Trọng Tấn,Tây Thạnh, Tân Phú',null),
(3,'12/11/2020',N'326 Nguyễn Huệ, Vũ Liềm, Hà Nội',null),
(4,'01/06/2020',N'1B Nguyễn Du, Trường Chinh, Nhà Trang',N'Giao sớm tý'),
(5,'12/2/2021',N'Buôn Tung Xê, Ea Ral, Ea Hleo, Đăk Lăk',N'Giao Lâu cùng được'),
(6,'29/12/2020',N'65C Long Phụng, Vượng Trọng, Vũng Tàu',null)


go
--======================danh cho WEB=======================================
--===========================================================================
--===========================================================================
 --HINHSP
  --LH01 tang can nhanh
 insert into HINHSP
 values
('SP001','hinh/b_Labrada.jpg','hinh/labrada_Muscle.jpg'),
('SP002','hinh/b_Dymatize.jpg','hinh/dymatize_Super.jpg'),
('SP003','hinh/b_Serious.jpg','hinh/serious.jpg'),
('SP004','hinh/b_Serious_Chai.jpg','hinh/serious_Chai.jpg'),
('SP005','hinh/b_Mass_Tech.jpg','hinh/tech.jpg'),
('SP006','hinh/b_Premium.jpg','hinh/premium.jpg'),
('SP007','hinh/b_Mass_Effect.jpg','hinh/effect.jpg'),
('SP008','hinh/b_Mutant.jpg','hinh/mutant.jpg'),
('SP009','hinh/b_Nutrex.jpg','hinh/nutrex.jpg')
--LH02 Whey Protein Blend
insert into HINHSP
 values
('SP010','Whey_Protein/b_GoldStanndard.jpg','Whey_Protein/gold_Standard.jpg'),
('SP011','Whey_Protein/b_NitroTech.jpg','Whey_Protein/nitrotech.jpg'),
('SP012','Whey_Protein/b_GoldStanndard.jpg','Whey_Protein/goil_Standard_Chai.jpg'),
('SP013','Whey_Protein/b_GoldStanndard_Bich.jpg','Whey_Protein/gold_Standard_Bich.jpg'),
('SP014','Whey_Protein/b_NitroTech.jpg','Whey_Protein/nitrotech.jpg'),
('SP015','Whey_Protein/b_Lean_Lon.jpg','Whey_Protein/ladrada_Lean.jpg'),
('SP016','Whey_Protein/b_Nitrotech_Bich.jpg','Whey_Protein/nitrotech_Bich.jpg')
--LH03 Whey Protein Isolate
insert into HINHSP
 values
('SP017','Whey_Protein/b_ISO_HD.jpg','Whey_Protein/ISO_HD.jpg'),
('SP018','Whey_Protein/b_On.jpg','Whey_Protein/on_Isolate.jpg'),
('SP019','Whey_Protein/b_Xtend.jpg','Whey_Protein/xtend_pro.jpg')
--LH04 Hydrolyzed Whey
insert into HINHSP
 values
('SP020','Whey_Protein/b_Nutrabolics.jpg','Whey_Protein/nutrabolics.jpg'),
('SP021','Whey_Protein/b_Rule1.jpg','Whey_Protein/rule1_Protein.jpg'),
('SP022','Whey_Protein/b_Mutant.jpg','Whey_Protein/mutant_Iso.jpg'),
('SP023','Whey_Protein/b_VP2.jpg','Whey_Protein/VP2.jpg'),
('SP024','Whey_Protein/b_Platinum.jpg','Whey_Protein/platinum_HydroWhey.jpg'),
('SP025','Whey_Protein/b_ISO.jpg','Whey_Protein/ISO.jpg'),
('SP026','Whey_Protein/b_Rule1_Bich.jpg','Whey_Protein/rule1_Protein_B.jpg')
--LH05 Meal Replacement
insert into HINHSP
 values
('SP027','Whey_Protein/b_Lean.jpg','Whey_Protein/lean_Body.jpg'),
('SP028','Whey_Protein/b_Brownie.jpg','Whey_Protein/protein_Brownie.jpg'),
('SP029','Whey_Protein/b_OneBar.jpg','Whey_Protein/One_Bar.jpg')
--LH006 Sinh nhiệt đốt mỡ
insert into HINHSP
 values
('SP030','sinh_Nhiet_Giam_Mo/b_Lipo.jpg','sinh_Nhiet_Giam_Mo/Lipo.jpg'),
('SP031','sinh_Nhiet_Giam_Mo/b_hydroxycut_e.jpg','sinh_Nhiet_Giam_Mo/hydroxycut_e.jpg'),
('SP032','sinh_Nhiet_Giam_Mo/b_Hydroxycut.jpg','sinh_Nhiet_Giam_Mo/Hydroxycut.jpg'),
('SP033','sinh_Nhiet_Giam_Mo/b_Hydroxycut.jpg','sinh_Nhiet_Giam_Mo/Hydroxycut.jpg')  
--LH007 Ít chất kích thích	34
insert into HINHSP
 values
('SP034','sinh_Nhiet_Giam_Mo/b_carnibolic.jpg','sinh_Nhiet_Giam_Mo/carnibolic.jpg')
--LH008 Bình lắc			35-37
insert into HINHSP
values
('SP035',null,'Phu_Kien/smartshaker.jpg'),
('SP036',null,'Phu_Kien/ronnie.jpg'),
('SP037',null,'Phu_Kien/philheath.jpg')
--LH009 Phụ kiện khác		38-41
insert into HINHSP
values
('SP038',null,'Phu_Kien/gang_Tay.jpg'),
('SP039',null,'Phu_Kien/dai_Lung.jpg'),
('SP040',null,'Phu_Kien/dai_Lung_4.jpg'),
('SP041',null,'Phu_Kien/day_Keo.jpg')
--delete HINHSP


--THONGTINSP
--LH01
insert into THONGTINSP
values
('SP001',N'Hướng dẫn sử dụng Mass Gainer',N'Nên nhớ không có giới hạn nào với cách sử dụng sản phẩm, với 9 muỗng của 1 serving muscle mass gainer 
										bạn có thể chia ra làm 3-4 lần uống dàn trải trong ngày: <br /><br />
										+ 2 muỗng vào buổi sáng cách giờ ăn 2h-2,5h <br />
										+ 2,5 muỗng trước tập 1h <br \>
										+ 2,5 muỗng sau tập 30ph <br \>
										+ 2 muỗng trước khi đi ngủ 1,5h <br \>',
										N'Muscle Mass Gainer 12Lbs là dòng sữa tăng cân cho người gầy thiếu cân, khó hấp thụ,
										bởi chỉ với một lượng phù hợp được hấp thụ Mass Gainer làm cơ thể dễ thích nghi, tăng cân lành mạnh.'),

('SP002',N'Hướng dẫn sử dụng super mass',N'<b>Đối tượng : Dành cho người gầy, kém ăn, vận động viên, người chơi thể thao.</b> <br \> <br \>
											Sử dụng bình lắc hoặc máy xay sinh tốt pha đủ 2 muỗng sữa <b style="color:red"> super mass </b> đầy (muỗng kèm theo hộp) trong 1 ngày.<br\><br\>
											Chia 2 muỗng làm 3 - 4 lần : pha 200-300ml nước sôi để nguội ( nước bạn uống hàng ngày ) hoặc sữa tươi 
											không đường. Bạn có thể cho thêm đá khi bột đã tan hết hoắc các thực phẩm khác ( như kem, chuối, mật ong, hạt lạc
											,...) <br \> <br \>
											<b style="color:red">- Tuần 1: dành cho người lần đầu sử dụng sữa tăng cân Super Mass  </b> <br \> <br \>
											+ Lần 1 : Uống 1/2 muỗng sau bữa ăn sáng 2 - 2,5 tiếng. <br \>
											+ Lần 2 : Uống 1/2 muỗng sau khi tập (uống luôn) nên dùng sau tập từ 10 đến 20 phút. <br \>
											+ Lần 3 : Uống 1/2 muỗng trước khi đi ngủ 1,5 tiếng. <br \> <br \>
											<b style="color:red">- Các tuần tiếp theo: Tăng lượng bột sữa  </b> <br \> <br \>
											+ Lần 1 : Uống 1/2 muỗng sau bữa ăn sáng 2 - 2,5 tiếng <br \>
											+ Lần 2 : Uống 1 muỗng sau khi tập, nên dùng sau tập từ 10 đến 20 phút. <br \>
											+ Lần 3 : Uống 1/2 muỗng trước khi đi ngủ 1,5 tiếng. <br \>
											',
											N'Sữa tăng cân Super Mass với thành phần nguyên liệu chất lượng cao và nguồn dưỡng chất tiêu chuẩn 
											giúp gia tăng tối đa sức mạnh và kích thước cơ bắp - bảo vệ cơ bắp khỏi quá trình dị hóa.'),


('SP003',N'Cách sử dụng Serious Mass',N'<b>Đối tượng : Dành cho người gầy, kém ăn, vận động viên, người chơi thể thao. </b> <br \> <br \>
											Sử dụng bình lắc hoặc máy xay sinh tốt pha đủ 2 muỗng sữa <b style="color:red"> super mass </b> đầy (muỗng kèm theo hộp) trong 1 ngày.<br\><br\>
											Chia 2 muỗng làm 3 - 4 lần : pha 200-300ml nước sôi để nguội ( nước bạn uống hàng ngày ) hoặc sữa tươi 
											không đường. Bạn có thể cho thêm đá khi bột đã tan hết hoắc các thực phẩm khác ( như kem, chuối, mật ong, hạt lạc
											,...) <br \> <br \>
											<b style="color:red">- Tuần 1: dành cho người lần đầu sử dụng sữa tăng cân Serious Mass </b> <br \> <br \>
											+ Lần 1 : Uống 1/2 muỗng sau bữa ăn sáng 2 - 2,5 tiếng. <br \>
											+ Lần 2 : Uống 1/2 muỗng sau khi tập (uống luôn) nên dùng sau tập từ 10 đến 20 phút. <br \>
											+ Lần 3 : Uống 1/2 muỗng trước khi đi ngủ 1,5 tiếng. <br \> <br \>
											<b style="color:red">- Các tuần tiếp theo: Tăng lượng bột sữa  </b> <br \> <br \>
											+ Lần 1 : Uống 1/2 muỗng sau bữa ăn sáng 2 - 2,5 tiếng <br \>
											+ Lần 2 : Uống 1 muỗng sau khi tập, nên dùng sau tập từ 10 đến 20 phút. <br \>
											+ Lần 3 : Uống 1/2 muỗng trước khi đi ngủ 1,5 tiếng. <br \>',
										N'Serious Mass là sản phẩm hỗ trợ tăng cân dành cho người gầy kém ăn, vận động viên, người chơi thể thao.
										 Với vitamin và khoáng chất dễ dàng hấp thụ sẽ giúp cơ thể cải thiện cân nặng.'),

('SP004',N'Cách sử dụng Serious Mass 6lbs',N'<b>Đối tượng : Dành cho người gầy, kém ăn, vận động viên, người chơi thể thao. </b> <br \> <br \>
											Sử dụng bình lắc hoặc máy xay sinh tốt pha đủ 2 muỗng sữa <b style="color:red"> super mass </b> đầy (muỗng kèm theo hộp) trong 1 ngày.<br\><br\>
											Chia 2 muỗng làm 3 - 4 lần : pha 200-300ml nước sôi để nguội ( nước bạn uống hàng ngày ) hoặc sữa tươi 
											không đường. Bạn có thể cho thêm đá khi bột đã tan hết hoắc các thực phẩm khác ( như kem, chuối, mật ong, hạt lạc
											,...) <br \> <br \>
											<b style="color:red">- Tuần 1: dành cho người lần đầu sử dụng sữa tăng cân Serious Mass </b> <br \> <br \>
											+ Lần 1 : Uống 1/2 muỗng sau bữa ăn sáng 2 - 2,5 tiếng. <br \>
											+ Lần 2 : Uống 1/2 muỗng sau khi tập (uống luôn) nên dùng sau tập từ 10 đến 20 phút. <br \>
											+ Lần 3 : Uống 1/2 muỗng trước khi đi ngủ 1,5 tiếng. <br \> <br \>
											<b style="color:red">- Các tuần tiếp theo: Tăng lượng bột sữa  </b> <br \> <br \>
											+ Lần 1 : Uống 1/2 muỗng sau bữa ăn sáng 2 - 2,5 tiếng <br \>
											+ Lần 2 : Uống 1 muỗng sau khi tập, nên dùng sau tập từ 10 đến 20 phút. <br \>
											+ Lần 3 : Uống 1/2 muỗng trước khi đi ngủ 1,5 tiếng. <br \>
											',
											 N'Serious Mass 6lbs giàu glutamine cung cấp cho bạn 1 hàm lượng amino cao giúp phục hồi nhanh chóng và tăng
											  trưởng tối đa. Hàng chính hãng, có tem chống giả, giá tốt kèm quà tặng.'),

('SP005',N'Cách dùng MassTech Extreme',N'Pha ½ khẩu phần = 3 muỗng  với 16 oz – 20 oz (450ml – 600ml) nước lạnh hoặc sữa tươi trong ly hoặc lắc trong shaker. 
										Hoặc theo kinh nghiệm cá nhân thì uống đậm hay nhạt thì người sử dụng có thể tùy ý thêm nhiều nước hơn.<br \> <br \>
										+ 1 Ngày sử dụng 1 serving = 6 muỗng. <br \>
										+ Nên làm quen dần bằng cách dùng 1 muỗng sau đó tăng lên dần đến mức tiêu chuẩn. <br \>
										+ Có thể lựa chọn 2 trong các buổi dùng sau: <br \>
										- Giữa các bữa ăn chính trong ngày. <br \>
										- Trước hoặc Sau khi tập luyện. <br \>
										+ Trước khi đi ngủ. <br \>
										+ Không sử dụng quá 1 serving trong 24 tiếng. <br \>',
										N'Mass Tech Extreme 2000 loại 22lbs 10kg hoàn toàn có thể được gọi là sản phẩm cao cấp nhất, 
										vì quá đầy đủ dưỡng chất và các đơn chất giúp phát triển cơ bắp và chống dị hóa cơ bắp.'),

('SP006',N'Hướng dẫn sử dụng từ WheyStore',N'+ Với mỗi serving gồm 6 muỗng bạn có thể chia ra dàn trải uống từ 3-4 lần trong ngày. <br \>
											 + Vào những thời điểm cách xa các bữa ăn chính từ 1,5-2h (để tránh hiện tượng đầy bụng chán ăn khi đến bữa chính). <br \>
											 + Pha cùng với nước hoặc sữa tươi k đường hoặc bất kỳ một loại nước trái cây nào mà bạn yêu thích, ngon hơn khi
											 uống lạnh,  không pha cùng nước nóng. <br \>
											 + Không uống quá 2 serving trong vòng 24h. <br \>',
											 N'Muscletech Premium Mass Gainer cung cấp 1260 Calories, 53g Protein chất lượng cao và rất nhiều vitamin &
											  khoáng chất giúp cơ thể bạn tăng cân nhanh, xây dựng sức mạnh và cơ bắp.'),

('SP007',N'Cách sử dụng Mass Effect',N' + Với sản phẩm <b style="color:red"> Mass Effect </b>, IRON SPORT đưa ra cho bạn gợi ý về cách sử dụng như sau: <br \> <br \>
										Với 8 muỗng (1 serving) của Mass Effect, các bạn có thể chia ra uống làm nhiều lần trong ngày (3-4 lần) <br \> <br \>
										+ Sáng - 2 muỗng (cách bữa ăn 2-2,5h). <br \>
										+ Trước khi đi tập 1h - 2 muỗng. <br \>
										+ Sau tập (10-20ph) - 2 muỗng. <br \>
										+ Tối (trước khi đi ngủ 1-1,5h) - 2 muỗng <br \>',
										N'Mass Effect Revolution 13 lbs giúp làm post workout phục hồi cơ bắp và thể lực ngay sau buổi tập hiệu quả, 
										sửa chữa những tế bào bị hư hại đây là đồng hóa qua đó giúp cơ bắp chống lại dị hóa.'),

('SP008',N'Hướng dẫn sử dụng',N'+ Với mỗi serving gồm 4 muỗng bạn có thể chia ra dàn trải uống từ 3-4 lần trong ngày <br \>
								+ Dùng vào những thời điểm cách xa các bữa ăn chính từ 1,5-2h, tránh đầy bụng hoặc chán ăn bữa chính. <br \>
								+ Pha cùng với nước hoặc sữa tươi không đường hoặc bất kỳ một loại nước trái cây nào mà bạn thích,
								 ngon hơn khi uống lạnh,  không pha cùng nước nóng. <br \> ',
								 N'Mutant Mass 15lbs (6.8Kg) là cuộc cách mạng về tăng cơ bắp và cân nặng. Cung cấp cho cơ thể bạn một 
								 loạt các chất dinh dưỡng, phù hợp cho những người muốn thay đổi cân nặng.'),

('SP009',N'Hướng dẫn sử dụng ',N'+ Với mỗi serving gồm: 4 muỗng bạn có thể chia ra để uống từ 3-4 lần trong ngày <br \>
								+ Dùng vào những thời điểm cách xa các bữa ăn chính từ 1,5-2h. <br \>
								+ Pha cùng với nước hoặc sữa tươi không đường hoặc bất kỳ một loại nước trái cây nào mà bạn thích, không pha cùng nước nóng. <br \> ',
								 N'Mass Infusion 12lbs giúp tăng cân và hỗ trợ tăng cơ hiệu quả cho người gầy, với công thức hoàn hảo giúp cơ bắp 
								 phát triển toàn diện.')
--LH02
insert into THONGTINSP
values
('SP010',N'Cách dùng Whey Gold',N'+ Để đạt hiệu quả tối đa khi sử dụng Whey Gold, các bạn nên uống <br \> <br \>
                                  + Sáng 1 lần khi ngủ dậy. <br \>
								  + Uống sau tập 1 lần. <br \>',
								N'Whey Gold Standard 5Lbs (2.27KG) là sản phẩm sữa thể hình đem lại nguồn dinh dưỡng cao giúp tăng cường cơ bắp cho người tập thể hình, vận động viên và người tập luyện thể thao.'),

('SP011',N'Hướng dẫn sử dụng',N' Với Nitrotech các bạn nên sử dụng 1 ngày ít nhất là 2 muỗng, sáng sớm khi vừa ngủ dậy và sau khi tập. <br \>',
							  N' Nitro-Tech® cung cấp hàm lượng protein thiết yếu tinh chiết từ whey protein isolate kết hợp với thành phần creation chất lượng nhất nhằm đảm bảo sự phát triển tối ưu của các múi cơ và sức khỏe người sử dụng. '),

('SP012',N'Cách dùng Whey Gold',N' Sáng ngủ dậy 1 lần, sau tập 1 lần, mỗi lần 1 muỗng pha với 300ml nước lạnh, uống luôn ngay sau khi pha, không được pha xong để tủ lạnh sẽ mất đi độ chất của Whey Gold, bạn có thể uống cùng nước hoặc sữa tươi không đường để tăng hương vị.',
								N' Whey Gold Standard 2Lbs (900G) đem lại cho bạn lượng Whey protein thuần túy, không pha trộn, đem đến cho bạn việc phát triển cơ bắp một cách hiệu quả nhất cho quá trình tập luyện!'),

('SP013',N'Cách dùng Whey Gold',N' Sáng ngủ dậy 1 lần, sau tập 1 lần, mỗi lần 1 muỗng pha với 300ml nước lạnh, uống luôn ngay sau khi pha, không được pha xong để tủ lạnh sẽ mất đi độ chất của Whey Gold, bạn có thể uống cùng nước hoặc sữa tươi không đường để tăng hương vị.',
                                N' Whey Gold Standard 100% đem lại cho bạn lượng Whey protein thuần túy, không pha trộn, đem đến cho bạn việc phát triển cơ bắp một cách hiệu quả nhất cho người tập Gym.'),

('SP014',N'HƯỚNG DẪN SỬ DỤNG',N' + Hoà tan 1 muỗng với 200 - 300ml nước sôi để nguội hoặc sữa tươi không đường.<br \> <br \>
                                + Không pha nước nước ấm hoặc nóng. Để có hiệu quả tốt nhất. Uống ít nhất 2 lần mỗi ngày. Uống cách bữa ăn 1 - 2 giờ đồng hồ. Và ngay sau khi tập trong vòng khoảng 45 phút. <br \>',
							  N' MuscleTech NitroTech Ripped 4lbs cung cấp thành phần thiết yếu trong công cuộc giảm mỡ, tiêu mỡ, đẩy nhanh khả năng cũng như tốc độ phục hồi cơ bắp ngay cả với lịch tập luyện nặng.'),


('SP015',N'Hướng dẫn cách sử dụng',N' + Đối với nam: hòa tan từ 1-2 muỗng với 250-300ml nước lọc hoặc sữa tươi không đường it chất béo, sử dụng vào trước hoặc sau khi tập luyện và có thể sử dụng nó để thay thế cho casein. Các bạn uống từ 3-4 muỗng mỗi ngày và uống đều đặn 8-9 cốc nước/ngày. <br \> <br \>
                                      + Đối với nữ: hòa tan 1 muỗng với 250ml nước lọc hoặc sữa tươi không đường, sử dụng trước hoặc sau khi tập luyện và không được uống quá 2 muỗng trên 1 ngày.',
								   N'Bữa ăn nhanh, thông minh với Labrada Lean Pro 8 5lbs (2,27kg) sẽ giúp cho cơ bắp của bạn lớn hơn, mạnh mẽ hơn và gọn gàng nhanh chóng hơn bao giờ hết giúp bạn chống dị hóa cơ.'),

('SP016',N'Hướng dẫn sử dụng Nitro Tech',N'Cho 1-2 muỗng Nitro Tech vào 4-8oz (110-220ml) nước lạnh hoặc sữa ít béo và khuấy đều. Để có kết quả tối đa, dùng 2 muỗng Nitro-Tech /lần, 3 lần/hàng ngày, trong tối thiểu 6 tuần.',
										 N'MuscleTech NitroTech 10Lbs là sản phẩm giúp phát triển cơ bắp cung cấp nhiều protein nhất,và không pha trộn nhiều chất béo, đường carbs cũng như tạp chất giống các loại protein khác.')
--LH03
insert into THONGTINSP
values
('SP017',N'Hướng dẫn sử dụng',N'Sáng ngủ dậy 1 lần, sau tập 1 lần, mỗi lần 1 muỗng pha với 300ml nước lạnh, uống luôn ngay sau khi pha, không được pha xong để tủ lạnh sẽ mất đi độ chất của Whey ISO, không nên pha với sữa tươi không đường, nếu bạn có sữa tươi không đường hãy uống vào lúc khác để cơ thể luôn được nạp dinh dưỡng.',
							  N'ISO HD là protein calo thấp, tinh khiết nhất cung cấp 25 gram Protein siêu cao cấp 100% Whey Protein Isolate mỗi khẩu phần. Với công nghệ tiên tiến hương vị sữa của bạn đã trở nên ngon hơn rất nhiều.'),

('SP018',N'Hướng dẫn sử dụng',N'Sáng ngủ dậy 1 lần, sau tập 1 lần, mỗi lần 1 muỗng pha với 300ml nước lạnh, uống luôn ngay sau khi pha, không nên pha với sữa tươi không đường, nếu bạn có sữa tươi không đường hãy uống vào lúc khác để cơ thể luôn được nạp dinh dưỡng.',
							  N'Nếu như Whey Protein đứng đầu về nguồn cung cấp protein thì Whey Protein Isolate là số 1 trong các loại whey protein. On Isolate 5lbs là sản phẩm tinh khiết hỗ trợ tăng cơ cho người tập Gym.'),

('SP019',N'Hướng dẫn sử dụng',N'Sáng ngủ dậy 1 lần, sau tập 1 lần, mỗi lần 1 muỗng pha với 300ml nước lạnh, uống luôn ngay sau khi pha, không nên pha với sữa tươi không đường, nếu bạn có sữa tươi không đường hãy uống vào lúc khác để cơ thể luôn được nạp dinh dưỡng.',
							  N'Nếu như Whey Protein đứng đầu về nguồn cung cấp protein thì Whey Protein Xtend Pro là số 1 trong các loại whey protein. XTend Pro là sản phẩm tinh khiết hỗ trợ tăng cơ cho người tập Gym.')
--LH04
insert into THONGTINSP
values
('SP020',N'Hướng dẫn sử dụng',N'Sử dụng tốt nhất như sau : <br \>

                              + Uống ngay sau khi tỉnh dậy vào buổi sáng, pha 1-2 muỗng với 150-200ml nước. Sau đó 30-40p bạn hãy ăn sáng.<br \>

                              + Lần thứ hai trong ngày là ngay sau khi tập luyện, cũng pha 1-2 muỗng với 150-200ml nước rồi uống ngay. <br \>',
                              N'Nutrabolics HydroPure 4,5lbs 4,5lbs loại bỏ các chất béo, lactose và protein predigest để hình thành các chuỗi polypeptide nhỏ của axit amin hỗ trợ hình thành và cải tạo cơ bắp!'),
('SP021',N'Hướng dẫn sử dụng',N'Sáng ngủ dậy 1 lần, sau tập 1 lần, mỗi lần 1 muỗng pha với 300ml nước lạnh, uống luôn ngay sau khi pha, không được pha xong để tủ lạnh sẽ mất đi độ chất của Rule 1, bạn có thể uống cùng nước hoặc sữa tươi không đường để tăng hương vị.',
                              N'Rule 1 Protein không có chất béo, tinh bột, hoặc cholesterol - và không bột kem thêm hoặc gums được thêm vào giống các sản phẩm protein khác, duy trì khối lượng tế bào và hỗ trợ phục hồi cơ.'),

('SP022',N'Hướng dẫn sử dụng',N' + Pha 1 muỗng vào 150ml nước lạnh hoặc sữa.<br \>

                                 + Dùng mỗi ngày ít nhất 2 lần: 1 sáng sớm khi vừa ngủ dậy và 1 lần sau khi tập, có thể dùng thêm 1 muỗng trước tập <br \>

                                 + Những ngày không tập luyện, duy trì 1 muỗng vào sáng sớm <br \>',
                                 N'Mutant Iso Surge cung cấp thành phần whey gồm: protein isolate và hydrolysate. Iso Surge ít chất béo, không pha trộn và đem lại nguồn Protein dồi dào với hương vị hấp dẫn, đơn giản.'),
('SP023',N'Hướng dẫn sử dụng',N'Sáng ngủ dậy 1 lần, sau tập 1 lần, mỗi lần 1 muỗng pha với 300ml nước lạnh, uống luôn ngay sau khi pha, không được pha xong để tủ lạnh sẽ mất đi độ chất của Vp2, các bạn có thể uống vp2 cùng sữa tươi không đường để tạo cảm giác ngon miệng hơn.',
                              N'Whey Protein Isolate VP2 2Lbs 900G VP2 thúc đẩy quá trình thích nghi với những bài tập luyện nặng và mạnh giá tốt nhất dành cho người tập Gym.'),
('SP024',N'Hướng dẫn sử dụng',N'Mỗi sáng : sử dụng Platinum HydroWhey shake kết hợp với Opti-men. Vì sao ? bởi cơ thể bạn cần được cung cấp đầy đủ lượng vitamins và chất khoáng thiết yếu để có thể nâng cao khả năng hấp thụ protein, carbonhydrate và fat. ',
                              N'Platinum Hydrowhey là 1 sản phẩm tinh khiết nhất, dễ dàng hấp thụ giúp xây dựng cơ bắp hiệu quả trong thời gian ngắn nhất. Hydrowwhey dễ tan, không có chất béo, cholesterol.'),
('SP025',N'Hướng dẫn sử dụng',N'Sáng ngủ dậy 1 lần, sau tập 1 lần, mỗi lần 1 muỗng pha với 300ml nước lạnh, uống luôn ngay sau khi pha, không được pha xong để tủ lạnh sẽ mất đi độ chất của Iso 100, bạn có thể uống cùng nước hoặc sữa tươi không đường để tăng hương vị cho iso 100.',
                              N'Sử dụng ISO 100 Isolate 100% 5 Lbs (2,27kg) trước mỗi buổi luyện tập, sau luyện tập hoặc bất kì khi nào bạn cần nhằm bổ sung lượng protein chất lượng, hấp thụ nhanh cho cơ thể.'),
('SP026',N'Hướng dẫn sử dụng',N'Sáng ngủ dậy 1 lần, sau tập 1 lần, mỗi lần 1 muỗng pha với 300ml nước lạnh, uống luôn ngay sau khi pha, không được pha xong để tủ lạnh sẽ mất đi độ chất của Rule 1, bạn có thể uống cùng nước hoặc sữa tươi không đường để tăng hương vị.',
                              N'Rule 1 Protein 10lbs (4.5kg) protein hoàn toàn chất lượng không có chất béo, tinh bột, hoặc cholesterol - và không bột kem thêm hoặc gums được thêm vào giống các sản phẩm protein khác.')
--LH05
insert into THONGTINSP
values
('SP027',N'Hướng dẫn sử dụng',N'Với lọ thủy tinh -Chuẩn bị 10OZ đồ uống yêu thích trong một cốc ( chai thủy tinh), Thêm vào 1 gói 79g LEAN BODY sau đó khuấy bằng thìa đến khi hòa tan.',
                              N'Lean Body MRP 80 gói là một bữa ăn thông minh giúp tăng cơ giảm mỡ cung cấp chất xơ cùng với nguồn protein dồi dào cho người tập Gym Hàng. Tại WheyStore giá tốt nhất - giao hàng tận nhà.'),
('SP028',N'Hướng dẫn sử dụng',N'Là bữa ăn thay thế nên ONE BARS thích hợp để sử dụng cho bữa phụ. Với hương vị thơm ngon, đây chắc chắn là bữa phụ đạt yêu cầu nhất về dinh dưỡng và khẩu vị.',
                              N'Nhu cầu bổ sung protein của gymer ngày càng mở rộng, đòi hỏi thị trường phải liên tục đổi mới và cải tiến để đáp ứng nhu cầu sử dụng. Whey Protein tuy tiện dụng nhưng chưa phải là loại tiện nhất đâu bạn nhé! Wheystore muốn giới thiệu đến bạn ONE BARS - Thanh bánh bổ sung protein thơm ngon, giàu dưỡng chất nhất hiện nay.'),
('SP029',N'Hướng dẫn sử dụng',N'Bạn có thể dùng Protein Brownie Bar vào bữa phụ hoặc bất cứ khi nào bạn đói. Chiếc bánh sẽ là nguồn dinh dưỡng toàn diện, tiện lợi và thơm ngon dành cho mọi lứa tuổi. Protein Brownie Bar phù hợp với cả người ăn chay.',
                              N'Protein Brownie Bar với hàm lượng protein cực cao cùng mùi vị chocolate thơm ngon là bữa ăn phụ đạt chuẩn chất lượng trong thực đơn của các gymer.')
--LH006 Sinh nhiệt đốt mỡ
insert into THONGTINSP
 values
('SP030',N'Hướng dẫn sử dụng Lipo 6 Black Concentrate',N'Uống 1 viên vào buổi sáng và 1 viên vào buổi chiều. Bởi sản phẩm sử dụng công thức siêu tập trung, có tác dụng trực tiếp lên cơ thể nên chúng tôi khuyến cáo khách hàng không được sử dụng quá 1 viên mỗi khẩu phần. Không bao giờ sử dụng quá 2 khẩu phần liên tục trong vòng 24h. Để đạt kết quả tối ưu, sử dụng Lipo-6 Black Concentrate ít nhất 30 phút trước bữa ăn. Không sử dụng trong vòng 6 tiếng ngủ.',
														N'Lipo 6 Black Container 60v - Viên uống tập trung, cung cấp năng lượng với công thức đặc biệt đốt cháy chất béo dư thừa. Công thức đặc biệt tập trung đốt cháy mỡ thừa đem lại hiệu quả kinh ngạc.'),

('SP031',N'Cách dùng Hydroxycut Hardcore Elite',N'- Tuần đầu: 1 ngày 1 viên trước ăn sáng 45p <br />
												  - Tuần thứ 2 trở đi: 1 ngày 2 viên trước khi ăn sáng 45p và trước khi tập 1 tiếng <br />',
												N'Với sản phẩm Hydroxycut Elite là công thức giảm cân mới cực mạnh được sản xuất bởi MuscleTech giúp cho bạn có được 1 vóc dáng hoàn hảo như bạn hằng mong muốn.'),

('SP032',N'Cách sử dụng Hydroxycut Next Gen',N'Để đảm bảo cho việc sử dụng Hydroxycut được hiệu quả thì bạn nên tuân thủ theo những quy tắc sau: <br /> <br />
																	+ Bạn nên uống trước bữa ăn sáng và bữa ăn trưa từ 30 phút đến 1 tiếng. <br />
																	+ Không uống quá 4 viên trong 1 ngày. <br />
																	+ Tránh sử dụng trong vòng 5 giờ trước khi bạn đi ngủ. <br />
																	+ Tránh việc ăn vặt và uống đầy đủ 10 ly nước mỗi ngày <br /> 
																	+ Nên đọc kỹ và làm đúng theo hướng dẫn của nhà sản xuất. <br />',
																	N'Hydroxycut Next Gen gia tăng mạnh mẽ sự sinh nhiệt trong cơ thể giúp gia tăng tỷ lệ trao đổi chất của bạn. Tại WheyStore, Hydroxycut Next Gen là hàng chính hãng, có giá tốt nhất.'),

('SP033',N'Cách dùng:',N'- Tuần đầu: 1 ngày 1 viên trước khi tập. <br />
						- Tuần thứ 2 trở đi: 1 ngày 1-2 viên trước khi ăn sáng 30p và trước khi tập, ngày không tập uống trước khi ăn sáng và trước khi ăn trưa. <br />',
						N'Hydroxycut Next Gen là sản phẩm cải tiến của Hydroxycut giúp tăng cường khả năng và hiệu quả của việc trao đổi chất, cung cấp năng lượng, sức mạnh cho người tập thể hình.')
--LH007 Ít chất kích thích	34
insert into THONGTINSP
 values
('SP034',N'Hướng dẫn sử dụng',N'Với Carnibolic chúng tôi khuyên bạn nên sử dụng 1 serving trước tập 15-20ph để có một buổi tập thực sự chất lượng, và cảm nhận được lượng mỡ giảm đi nhanh chóng như thế nào',
								N'Bạn đang có suy nghĩ rằng mình phải giảm mỡ? Carnibolic giúp bạn chuyển hóa mỡ thừa nhanh hơn, giảm cảm giác thèm ăn, công thức kiểm soát cân nặng tốt nhất từng được nghiên cứu. Với Carnibolic cân nặng hay mỡ thừa sẽ không phải là điều gì đó quá khó mà bạn đã từng phải trăn trở mỗi đêm.')
--LH008 Bình lắc			35-37
insert into THONGTINSP
values
('SP035',N'Chi tiết về thiết kế SmartShake',N'+ Nhiều ngăn chứa <br />
												+ Công nghệ Anti-leak (chống rò rỉ) <br />
												+ Nhựa chất lượng cao không BPA & DEHP, không độc hại. <br />
												+ An toàn với lò vi sóng, tủ lạnh, máy rửa <br />
												+ An toàn khi dùng với nước nóng lên đến 120 độ C / 248 độ F <br />
												+ Bộ lọc gắn trên nắp <br />
												+ Móc treo giữ bình hoặc móc chìa khóa <br />
												+ Dung tích lên tới 800ml <br />', 
											N'SmartShake an toàn với lò vi sóng, tủ lạnh, được thiết kế nhỏ gọn, sáng tạo được làm từ nhựa cao cấp và 100% không bị rò rỉ. Bình lắc SmartShake thể hiện phong cách, cá tính của bạn.'),

('SP036',N'Thiết kế của bình lắc Ronnie Coleman nổi bật',N'+ Miệng rộng, dung tích lớn 800ml <br />
														+ Nắp bật mở dễ dàng <br />
														+ Trọng lượng nhẹ, có thể mang theo bên người <br />
														+ Dễ sử dụng và dễ vệ sinh <br />',
														N'Bình lắc Ronnie Coleman được in chữ kí của nhà vô địch Olympia Ronnie Coleman với thiết kế sang trọng, đẹp mắt với chất nhựa bền chịu nhiệt cao và đẹp, dung tích lên tới 800 ml.'),

('SP037',N'Ưu điểm vượt trội của bình lắc PhilHeadth',N'+ Chất liệu nhựa cao cấp, sản phẩm được sản xuất trên dây truyền hiện đại của Mỹ <br />
														+ Dung tích lớn lên đến 800ml <br />
														+ Không chứa chất độc hại BPA, bảo vệ sức khỏe của bạn <br />
														+ Thiết kế ấn tượng, nhỏ gọn, độc đáo với sự kết hợp 3 trong 1 <br />
														+ An toàn khi cho bình lắc vào tủ lạnh, lò vi sóng hay máy rửa bát để vệ sinh. <br />',
													N'Thiết kế sang trọng, đẹp mắt với chất liệu nhựa bền và đẹp, dung tích lên tới 800 ml, Smart Shaker Phil Heath còn được in chữ kí của nhà vô địch Olympia Phil Health. Một trang bị tuyệt vời trong bộ sưu tập dụng cụ gym của bạn!')
--LH009 Phụ kiện khác		38-41
insert into THONGTINSP
values
('SP038',N'Găng Tay Beast Max - Phụ kiện Gym tối tân',N'+ Với thiết kế đơn giản, tiện dụng, mẫu mã đẹp <br />
														+ Cho ngón tay thoáng mát <br />
														+ Độ bền cao <br />
														+ Dễ vệ Sinh <br />',
														N'Găng Tay Beast Max là một trong những phụ kiện Gym - hàng nhập khẩu chất lượng cao giá thành hợp lý, thấm hút, thoát mồ hôi tốt, bền và đẹp, sử dụng liên tục nửa năm vẫn không bị hỏng.'),


('SP039',N'Đai lưng mềm Harbinger 5 inch',N'Là một dụng cụ hỗ chợ những người tập thể hình thể thao. Nó được quấn quanh người để bảo vệ cột sống trong các bài tập thể hình nặng với tạ: xách tạ 2 bên, nâng tạ, squat … <br /> <br />
											<b style="color:red"> Tại sao nên dùng đai lưng mềm khi tập luyện? </b> <br /> <br />
											+ Đai lưng giúp giữ thăng bằng và an toàn cho lưng <br />
											+ Đai lưng có tác dụng cố định phần thân dưới, giúp cho cơ thể giữ được trạng thái cân bằng và bảo vệ lưng an toàn tránh những trấn thương trong lúc tập luyện. <br />
											+ Đai lưng giúp việc tập luyện được hiệu quả hơn <br />
											+ Những người sử dụng đai lưng thường xuyên sẽ giúp họ thực hiện được các động tác chuẩn xác hơn. <br />
											+ Các nghiên cứu đã chỉ ra rằng người đeo đai lưng mềm sẽ nâng được tạ năng hơn với sức mạnh lớn hơn người không đeo đai lưng. <br />',
											N'Đai lưng mềm Harbinger 5 inch được cấu tạo bằng da tổng hợp với đường viền vành đai rất phù hợp với những đường cong tự nhiên của cột sống và hỗ trợ cho những bài tập khi tập bụng.'),


('SP040',N'Đai lưng mềm Harbinger 4 inch',N'được thiết kế bằng nguyên liệu da tổng hợp có nhiều mẫu mã đẹp, thời trang. Do vậy mà ngoài vai trò chính là hỗ trợ đắc lực cho việc tập luyện thì nó còn làm cho hình ảnh của bạn trở nên đẹp hơn khi quấn quanh bụng. <br /><br />
											<b style="color:red"> Tác dụng của đai lưng mềm Harbinger 4 inch </b> <br /> <br />
											+ Hỗ trợ luyện tập thể thao tăng cường sức khỏe <br />
											+ Bảo vệ xương khớp, cột sống khỏi những tác động khi tập những bài tập tạ nặng. <br /> <br />
											Đai mềm Harbinger có tác dụng nhằm cố định phần thân bên dưới khi bạn thực hiện các bài tập mông, đùi, lưng.',
											N'Đai lưng mềm Harbinger 4 inch mang lại cảm giác thoải mái dễ chịu khi sử dụng, hỗ trợ đắc lực cho bài tập liên quan đến lưng và cột sống, giúp bảo vệ lưng, cột sống khi nâng tạ.'),


('SP041',N'Dây kéo Harbinger',N'Là một dụng cụ không thể thiếu trong những buổi tập luyện có những bài tập luyện phải tập luyện sức kéo cực lớn và nặng. <br /> <br />
								<b style="color:red"> Đặc điểm của dây kéo Harbinger 1 đôi </b> <br /> <br />
								+ Chất liệu cao cấp, kiểu dáng sang trọng giúp bạn tự tin hơn <br />
								+ Độ bền cơ học cao <br />
								+ Gồm 2 dây đeo tay với độ dài mỗi dây là 52cm <br />
								+ Thiết kế dễ dàng điều chỉnh kích cỡ tùy ý sao cho vừa với cổ tay của bạn <br />
								+ Có độ bám cao nhất so với các loại dây kéo của hãng khác giúp người dùng tự tin hơn trong những bài tập nặng có liên quan tới sức nắm của bàn tay. <br />',
								N'Dây kéo Harbinger 1 đôi với chất liệu tốt, bền, sử dụng hiệu quả, giúp bạn nâng tạ tốt hơn, nâng được nặng hơn, bảo vệ cổ tay của bạn, tránh chấn thương đáng tiếc.')

--VITAMIN
--LH01
insert into VITAMIN
values
('SP001','imp/khien.png',N'Tăng cân + Bổ sung vitamin',N'Ngoài việc bổ sung các chất dinh dưỡng cho cơ thể để tăng cân , tăng cơ thì các vitamin, khoáng chất cũng là thứ không thể thiếu để cho cơ thể khỏe mạnh ,miễn dịch tốt, nâng cao hệ tuần hoàn cho cơ thể phát triển.',
						N'Tăng cân + Tăng sức mạnh',N'Bổ sung dinh dưỡng cho cơ thể sau khi tập luyện, thời gian bị rơi vào trạng thái thiếu hụt protein, năng lượng. Kết hợp với vận động khiến khả năng vận chuyển protein và dinh dưỡng được cải thiện đáng kể.',
						N'Tăng cân + Phục hồi cơ',N'Nuôi dưỡng cơ thể phát triển hoàn hảo với Muscle mass Gainer và Anabolic State , bổ sung các dinh dưỡng cần thiết sau các bài tập giúp cơ bắp phát triển hiệu quả hơn'),

('SP002','imp/khien.png',N'Tăng cân + bổ sung Vitamin',N'Tăng cân là 1 chuyện, tăng sức đề kháng và cải thiện hệ tiêu hóa lại là chuyện khác, khi kết hợp giữa Super Mass với Vitabolic bạn hoàn toàn có thể tăng cân nhanh và bền vững.',
						N'Tăng cân + tăng sức mạnh',N'Nếu bạn dùng kết hợp giữa Super Mass và The Curse, bạn hoàn toàn có thể tăng cân nhanh và tăng sức mạnh đồng thời, chất lượng buổi tập tốt thì cơ bắp của bạn sẽ phát triển tốt hơn',
						N'Tăng cân + phục hồi cơ',N'Tăng cân và tăng cơ luôn là đích hướng tới của bất cứ người gầy và có chơi thể thao, để hỗ trợ tăng cơ thì Best BCAA là lựa chọn kết hợp hoàn hảo nhất dành cho bạn.'),

('SP003','imp/khien.png',N'Tăng cân + Bổ sung vitamin',N'Cùng với Serious Mass cung cấp các chất dinh dưỡng chất lượng để phát triển cơ thể . Platinum Fish Oil cũng cung cấp thêm cho cơ thể các EPA/DHA để tăng khả năng miễn dịch , trao đổi chất giúp cơ thể khỏe mạnh.',
						N'Tăng cân + Tăng sức mạnh',N'Bạn muốn tăng cân ,tăng cơ nhưng những buổi tập mệt mỏi đang làm yếu ý trí của bạn . Sự kết hợp giữa Serious Mass, tăng khả năng hấp thụ và The Curse sẽ giúp bạn đánh tan điều đó.',
						N'Tăng cân + Phục hồi cơ',N'Nếu sử dụng Serious Mass với Xtend BCAA bạn sẽ gia tăng lượng cân nạc, Xtend BCAA giúp bạn hỗ trợ sự phát triển cơ bắp và sức mạnh. Mùi vị cực ngon và bán chạy nhất thế giới'),

('SP004','imp/khien.png',N'Tăng cân + Bổ sung vitamin',N'Ngoài việc bổ sung các chất dinh dưỡng cho cơ thể để tăng cân , tăng cơ thì các vitamin, khoáng chất cũng là thứ không thể thiếu để cho cơ thể khỏe mạnh ,miễn dịch tốt, nâng cao hệ tuần hoàn cho cơ thể phát triển.',
						N'Tăng cân + Bổ sung vitamin',N'Cùng với Serious Mass cung cấp các chất dinh dưỡng chất lượng để phát triển cơ thể . Platinum Fish Oil cũng cung cấp thêm cho cơ thể các EPA/DHA để tăng khả năng miễn dịch , trao đổi chất giúp cơ thể khỏe mạnh.',
						N'Tăng cân + Tăng sức mạnh',N'Bạn muốn tăng cân ,tăng cơ nhưng những buổi tập mệt mỏi đang làm yếu ý trí của bạn . Sự kết hợp giữa Serious Mass, tăng khả năng hấp thụ và The Curse sẽ giúp bạn đánh tan điều đó.'),

('SP005','imp/khien.png',N'Tăng cân + bổ sung Vitamin',N'Mass Tech kết hợp với Multivitamin giúp bạn có được 1 cân nặng lý tưởng nhất bởi ngoài việc bổ sung năng lượng cao nó còn giúp bạn bổ sung thêm vitamin khoáng chất',
						N'Tăng cân + Tăng sức mạnh',N'Mass Tech kết hợp với The Curse giúp bạn tăng cân nhanh và tăng cả sức mạnh tập luyện, The Curse chính là lời nguyền của chúa, bạn chỉ muốn lao ngay vào phòng để tập luôn và ngay',
						N'Tăng cân + phục hồi cơ',N'Mass Tech kết hợp với Anabolic State giúp bạn tăng cân nhanh và tổng hợp protein để xây dựng cơ bắp tốt hơn, chống viêm cơ, sửa chữa các mô cơ bị tổn thương.'),

('SP006','imp/khien.png',N'Tăng cân bền vững',N'Tại sao lại là tăng cân bền vững? Tại khi kết hợp với Vitabolic, bạn sẽ tăng cân hoàn chỉnh hơn, Vitabolic sẽ tăng khả năng hấp thụ dinh dưỡng, cải thiện hệ tiêu hóa, tăng sức đề kháng',
						N'Tăng cân tăng cơ nhanh',N'Premium Mass kết hợp với Creatine bạn hoàn toàn có thể tăng cân và tăng cơ cùng 1 lúc, cơ bạn sẽ phồng lên nhờ tác dụng của Creatine. Kết hợp với ăn nhiều, tập khỏe',
						N'Tăng cân + phục hồi cơ',N'Khi dùng Premium Mass kèm Anabolic State, ngoài việc tăng cân, nó còn giúp bạn tăng khả năng phát triển cơ bắp, chống dị hóa cơ, Anabolic State uống cực ngon'),

('SP007','imp/khien.png',N'Tăng cân + ngừa bệnh tim',N'Mass Effect kết hợp với Platinum Fish Oil giúp bạn vừa tăng cân vừa có 1 trái tim khỏe mạnh, cân bằng lượng cholesterol trong máu, giảm tối đa nguy cơ đột quỵ',
						N'Tăng cân + Tăng sức mạnh',N'Mass Effect kết hợp với The Curse: Không những tăng cân mà nó còn giúp bạn tăng cả sức mạnh trong lúc tập, bạn sẽ vượt qua mọi giới hạn của buổi tập, tăng cơ tối ưu hơn',
						N'Tăng cân + phục hồi cơ',N'Mass Effect kết hợp với Best BCAA giúp tăng cân và phục hồi cơ trong lúc tập, chống dị hóa cơ bắp và giảm triệu chứng đau cơ. Best BCAA có giá thành khá rẻ'),

('SP008','imp/khien.png',N'Tăng cân + Tăng hấp thu',N'Mutant Mass kết hợp với Vitabolic sẽ giúp bạn vừa tăng cân vừa tăng khả năng hấp thụ dinh dưỡng, tăng sức đề kháng và chống viêm cực tốt. Bạn sẽ có cơ thể khỏe mạnh hơn.',
						N'Tăng cân + Tăng sức mạnh',N'Mutant Mass kết hợp với C4 giúp bạn tăng cân và tăng cả sức mạnh trong lúc tập, khi bạn tập khỏe thì cơ bắp của bạn sẽ phát triển mạnh hơn. Bộ đôi này rất được ưa chuộng',
						N'Tăng cân + xây dựng cơ',N'Mutant Mass kết hợp với Best BCAA giúp bạn tăng cân và tăng cơ tối ưu, Best BCAA giúp phục hồi cơ bắp, tăng khả năng phát triển cơ bắp và cân nặng, bạn sẽ to lớn mỗi ngày'),

('SP009','imp/khien.png',N'Tăng cân + bổ sung Vitamin',N'Nutrex Mass kết hợp với Multivitamin giúp bạn có được 1 cân nặng lý tưởng nhất bởi ngoài việc bổ sung năng lượng cao nó còn giúp bạn bổ sung thêm vitamin khoáng chất',
						N'Tăng cân + Tăng sức mạnh',N'Nutrex Mass kết hợp với The Curse giúp bạn tăng cân nhanh và tăng cả sức mạnh tập luyện, The Curse chính là lời nguyền của chúa, bạn chỉ muốn lao ngay vào phòng để tập luôn và ngay',
						N'Tăng cân + phục hồi cơ',N'Nutrex Mass kết hợp với Anabolic State giúp bạn tăng cân nhanh và tổng hợp protein để xây dựng cơ bắp tốt hơn, chống viêm cơ, sửa chữa các mô cơ bị tổn thương.')
--LH02
insert into VITAMIN
values
('SP010','imp/khien.png',N'Tăng cơ + giảm mỡ',N'Whey Gold giúp đẩy nhanh khả năng hấp thụ protein cũng như là cắt giảm lượng mỡ kết hợp cùng với Semtex -"khối thuốc nổ" phá tan mọi nhà kho chất béo. Đặc biệt Semtex dùng tốt cho cả nam và nữ',
                        N'Tăng cơ + Tăng sức mạnh',N'Sự kết hợp mạnh mẽ trong việc tăng cơ,giảm mỡ, tăng sức mạnh khi mà hai dòng sản phẩm này đều hỗ trợ giảm lượng mỡ thừa và đốt mỡ. Bạn sẽ không còn lo lắng về khối lượng mỡ thừa trong cơ thể nữa, tăng cơ nạc hiệu quả hơn',
						N'Tăng cơ + Phục hồi cơ',N'Whey Gold cung cấp nguồn protein chất lượng và Xtend BCAA, tươi mát, không đường hỗ trợ chăm sóc cơ bắp giúp bạn vượt qua những buổi tập cường độ cao trong thời gian dài mà không thấy mệt mỏi.'),

('SP011','imp/khien.png',N'Bộ đôi nuôi cơ hoàn hảo',N'Sự kết hợp của bộ đôi này mang đến cho cơ thể bạn lượng protein dồi dào , tinh chất mọi lúc , mọi nơi . Các múi cơ của bạn sẽ được xây dựng nhanh chóng , hiệu quả.Thể hình mong ước không còn xa vời nữa',
                         N'Tăng cơ + Tăng sức mạnh',N'Sự kết hợp hoàn hảo của hai sản phẩm chất lượng . Cung cấp cho cơ thể năng lượng dồi dào , cơ bắp của bạn sẽ hoạt động như một cỗ máy, mạnh mẽ , bền bỉ. Thay đổi không khí những buổi tập nhàn chán.',
						 N'Bộ đôi nuôi cơ hoàn hảo',N'Với bộ đôi sản phẩm này, các múi cơ của bạn sẽ được xây dựng nhanh chóng, mạnh mẽ với Lean Pro 8 kết hợp với NitroTech cung cấp hàm lượng protein thiết yếu đảm bảo sự phát triển tối ưu của cơ bắp người sử dụng'),

('SP012','imp/khien.png',N'Tăng cơ + giảm mỡ',N'Whey Gold giúp đẩy nhanh khả năng hấp thụ protein cũng như là cắt giảm lượng mỡ và Carnibolic giúp cơ thể bạn chuyển hóa mỡ nhanh hơn . Bạn sẽ không phải lo lắng về vấn đề mỡ dư thừa nữa .',
                         N'Tăng cơ + giảm mỡ',N'Một lựa chọn khác trong việc tăng cơ giảm cân dành cho bạn. Với Semtex -"khối thuốc nổ" phá tan mọi nhà kho chất béo. Đặc biệt Semtex dùng tốt cho cả nam và nữ',
						 N'Tăng cơ + Tăng sức mạnh',N'Với bộ đôi Whey Gold kết hợp với OUTLIFT, Cơ thể của bạn sẽ được cung cấp protein thuần túy, không pha trộn. Cơ bắp của bạn sẽ bền bỉ hơn, phục hồi nhanh hơn, nâng cao hiệu quả tập luyện.'),

('SP013','imp/khien.png',N'Tăng cơ + Bổ sung vitamin',N'Kết hợp giữa protein tăng cơ và bổ sung thêm cho cơ thể của bạn các nguồn EPA/DHA tinh khiết là rất cần thiết, giúp cơ thể bạn khỏe mạnh hơn, tăng cao hiệu quả tập luyện,',
                         N'Tăng cơ + Tăng sức mạnh',N'Whey Gold cùng với Super Nova . Cung cấp cho bạn nguồn protein nguyên chất dễ dàng hấp thụ và sức mạnh để đột phá mọi giới hạn của bản thân. Tăng cao hiệu quả xây dụng cơ bắp',
						 N'Tăng cơ + Phục hồi cơ',N'Whey Gold cung cấp nguồn protein chất lượng và Xtend BCAA, tươi mát, không đường hỗ trợ chăm sóc cơ bắp giúp bạn vượt qua những buổi tập cường độ cao trong thời gian dài mà không thấy mệt mỏi.'),

('SP014','imp/khien.png',N'Tăng cơ + giảm mỡ',N'Với sự kết hợp hoàn hảo của NitroTech Ripped - tăng cơ giảm cân và Carnibolic - chuyển hóa mỡ thừa nhanh chóng .Cơ thể của bạn sẽ thay đổi rõ rệt sau các buổi tập.',
                         N'Tăng cơ + giảm mỡ',N'Một lựa chọn khác trong việc tăng cơ giảm cân dành cho bạn. Với Semtex -"khối thuốc nổ" phá tan mọi nhà kho chất béo. Đặc biệt Semtex dùng tốt cho cả nam và nữ',
						 N'Tăng cơ + Phục hồi cơ',N'Với sự kết hợp của NitroTech Ripped- cung cấp nguồn protein tinh chất và Best Bcaa -hỗ trợ tổng hợp protein giúp nuôi dưỡng, phục hồi cơ .Hãy bỏ lại sau lưng mệt mỏi của những buổi tập.'),

('SP015','imp/khien.png',N'Tăng cơ + Tăng sức mạnh',N'Lean Pro8 làm cho cơ bắp lớn hơn, mạnh mẽ hơn và SuperNova khiến bạn trải qua những buổi tập điên dồ nhất. Còn chần chờ gì nữa nếu bạn là fan của những con quái vật Mỹ',
                         N'Bộ đôi tăng cơ mạnh mẽ',N'Lean Pro8 là whey nuôi cơ trải dài và Gold Standard cung cấp protein tinh khiết được nhiều người tin dùng . Đây sẽ là lựa chọn phù hợp dành cho ai muốn tăng cơ nhanh.',
						 N'Tăng cơ + Phục hồi cơ',N'Với sự kết hợp của Lean Pro8- cung cấp nguồn protein tinh chất và Best Bcaa -hỗ trợ tổng hợp protein giúp nuôi dưỡng, phục hồi cơ .Hãy bỏ lại sau lưng mệt mỏi của những buổi tập.'),

('SP016','imp/khien.png',N'Tăng cơ + Bổ sung vitamin',N'Với cường độ tập luyện mỗi ngày, bổ sung protein và bcaa là chưa đủ . Cơ thể bạn cũng cần thêm các vitamin và khoáng chất để khỏe mạnh hơn, tăng cao hiệu quả tập luyện',
                         N'Tăng cơ + Phục hồi cơ',N'NitroTech là whey cung cấp nhiều protein nhất, trong khi Anabolic là một trong số các bcaa tốt nhất . Với sự kết hợp hoàn hảo này một buổi tập chất lượng là điều hiển nhiên.',
						 N'Bộ đôi nuôi cơ hoàn hảo',N'Với bộ đôi whey này , cơ bắp của bạn sẽ được nuôi dưỡng cả ngày lẫn đêm , ngay cả trong lúc bạn ngủ . Nâng cao hiệu quả trong quá trình tăng cân tăng cơ của bạn')
--LH03
insert into VITAMIN
values
('SP017','imp/khien.png',N'Tăng cơ + Bổ sung vitamin',N'Với cường độ tập luyện mỗi ngày, bổ sung protein và bcaa là chưa đủ . Cơ thể bạn cũng cần thêm các vitamin và khoáng chất để khỏe mạnh hơn, tăng cao hiệu quả tập luyện',
                    N'Tăng cơ + Phục hồi cơ',N'ISO HD là whey cung cấp nhiều protein nhất, trong khi Anabolic là một trong số các bcaa tốt nhất . Với sự kết hợp hoàn hảo này một buổi tập chất lượng là điều hiển nhiên.',
					N'Bộ đôi nuôi cơ hoàn hảo',N'Với bộ đôi whey này , cơ bắp của bạn sẽ được nuôi dưỡng cả ngày lẫn đêm , ngay cả trong lúc bạn ngủ . Nâng cao hiệu quả trong quá trình tăng cân tăng cơ của bạn'),

('SP018','imp/khien.png',N'Tăng cơ + Bổ sung vitamin',N'Với cường độ tập luyện mỗi ngày, bổ sung protein và bcaa là chưa đủ . Cơ thể bạn cũng cần thêm các vitamin và khoáng chất để khỏe mạnh hơn, tăng cao hiệu quả tập luyện',
                    N'Tăng cơ + Phục hồi cơ',N'Whey cung cấp nhiều protein nhất, trong khi Anabolic là một trong số các bcaa tốt nhất . Với sự kết hợp hoàn hảo này một buổi tập chất lượng là điều hiển nhiên.',
					N'Bộ đôi nuôi cơ hoàn hảo',N'Với bộ đôi whey này , cơ bắp của bạn sẽ được nuôi dưỡng cả ngày lẫn đêm , ngay cả trong lúc bạn ngủ . Nâng cao hiệu quả trong quá trình tăng cân tăng cơ của bạn'),

('SP019','imp/khien.png',N'Tăng cơ + Bổ sung vitamin',N'Với cường độ tập luyện mỗi ngày, bổ sung protein và bcaa là chưa đủ . Cơ thể bạn cũng cần thêm các vitamin và khoáng chất để khỏe mạnh hơn, tăng cao hiệu quả tập luyện',
                    N'Tăng cơ + Phục hồi cơ',N'Whey cung cấp nhiều protein nhất, trong khi Anabolic là một trong số các bcaa tốt nhất . Với sự kết hợp hoàn hảo này một buổi tập chất lượng là điều hiển nhiên.',
					N'Bộ đôi nuôi cơ hoàn hảo',N'Với bộ đôi whey này , cơ bắp của bạn sẽ được nuôi dưỡng cả ngày lẫn đêm , ngay cả trong lúc bạn ngủ . Nâng cao hiệu quả trong quá trình tăng cân tăng cơ của bạn')
--LH04
insert into VITAMIN
values
('SP020','imp/khien.png',N'Tăng cơ + Bổ sung vitamin',N'Với cường độ tập luyện mỗi ngày, bổ sung protein và bcaa là chưa đủ . Cơ thể bạn cũng cần thêm các vitamin và khoáng chất để khỏe mạnh hơn, tăng cao hiệu quả tập luyện',
                    N'Tăng cơ + Phục hồi cơ',N'Whey cung cấp nhiều protein nhất, trong khi Anabolic là một trong số các bcaa tốt nhất . Với sự kết hợp hoàn hảo này một buổi tập chất lượng là điều hiển nhiên.',
					N'Bộ đôi nuôi cơ hoàn hảo',N'Với bộ đôi whey này , cơ bắp của bạn sẽ được nuôi dưỡng cả ngày lẫn đêm , ngay cả trong lúc bạn ngủ . Nâng cao hiệu quả trong quá trình tăng cân tăng cơ của bạn'),
('SP021','imp/khien.png',N'Tăng cơ + Bổ sung vitamin',N'Với cường độ tập luyện mỗi ngày, bổ sung protein và bcaa là chưa đủ . Cơ thể bạn cũng cần thêm các vitamin và khoáng chất để khỏe mạnh hơn, tăng cao hiệu quả tập luyện',
                    N'Tăng cơ + Phục hồi cơ',N'Whey cung cấp nhiều protein nhất, trong khi Anabolic là một trong số các bcaa tốt nhất . Với sự kết hợp hoàn hảo này một buổi tập chất lượng là điều hiển nhiên.',
					N'Bộ đôi nuôi cơ hoàn hảo',N'Với bộ đôi whey này , cơ bắp của bạn sẽ được nuôi dưỡng cả ngày lẫn đêm , ngay cả trong lúc bạn ngủ . Nâng cao hiệu quả trong quá trình tăng cân tăng cơ của bạn'),
('SP022','imp/khien.png',N'Tăng cơ + Bổ sung vitamin',N'Với cường độ tập luyện mỗi ngày, bổ sung protein và bcaa là chưa đủ . Cơ thể bạn cũng cần thêm các vitamin và khoáng chất để khỏe mạnh hơn, tăng cao hiệu quả tập luyện',
                    N'Tăng cơ + Phục hồi cơ',N'Whey cung cấp nhiều protein nhất, trong khi Anabolic là một trong số các bcaa tốt nhất . Với sự kết hợp hoàn hảo này một buổi tập chất lượng là điều hiển nhiên.',
					N'Bộ đôi nuôi cơ hoàn hảo',N'Với bộ đôi whey này , cơ bắp của bạn sẽ được nuôi dưỡng cả ngày lẫn đêm , ngay cả trong lúc bạn ngủ . Nâng cao hiệu quả trong quá trình tăng cân tăng cơ của bạn'),
('SP023','imp/khien.png',N'Tăng cơ + Bổ sung vitamin',N'Với cường độ tập luyện mỗi ngày, bổ sung protein và bcaa là chưa đủ . Cơ thể bạn cũng cần thêm các vitamin và khoáng chất để khỏe mạnh hơn, tăng cao hiệu quả tập luyện',
                    N'Tăng cơ + Phục hồi cơ',N'Whey cung cấp nhiều protein nhất, trong khi Anabolic là một trong số các bcaa tốt nhất . Với sự kết hợp hoàn hảo này một buổi tập chất lượng là điều hiển nhiên.',
					N'Bộ đôi nuôi cơ hoàn hảo',N'Với bộ đôi whey này , cơ bắp của bạn sẽ được nuôi dưỡng cả ngày lẫn đêm , ngay cả trong lúc bạn ngủ . Nâng cao hiệu quả trong quá trình tăng cân tăng cơ của bạn'),
('SP024','imp/khien.png',N'Tăng cơ + Bổ sung vitamin',N'Với cường độ tập luyện mỗi ngày, bổ sung protein và bcaa là chưa đủ . Cơ thể bạn cũng cần thêm các vitamin và khoáng chất để khỏe mạnh hơn, tăng cao hiệu quả tập luyện',
                    N'Tăng cơ + Phục hồi cơ',N'Whey cung cấp nhiều protein nhất, trong khi Anabolic là một trong số các bcaa tốt nhất . Với sự kết hợp hoàn hảo này một buổi tập chất lượng là điều hiển nhiên.',
					N'Bộ đôi nuôi cơ hoàn hảo',N'Với bộ đôi whey này , cơ bắp của bạn sẽ được nuôi dưỡng cả ngày lẫn đêm , ngay cả trong lúc bạn ngủ . Nâng cao hiệu quả trong quá trình tăng cân tăng cơ của bạn'),
('SP025','imp/khien.png',N'Tăng cơ + Bổ sung vitamin',N'Với cường độ tập luyện mỗi ngày, bổ sung protein và bcaa là chưa đủ . Cơ thể bạn cũng cần thêm các vitamin và khoáng chất để khỏe mạnh hơn, tăng cao hiệu quả tập luyện',
                    N'Tăng cơ + Phục hồi cơ',N'Whey cung cấp nhiều protein nhất, trong khi Anabolic là một trong số các bcaa tốt nhất . Với sự kết hợp hoàn hảo này một buổi tập chất lượng là điều hiển nhiên.',
					N'Bộ đôi nuôi cơ hoàn hảo',N'Với bộ đôi whey này , cơ bắp của bạn sẽ được nuôi dưỡng cả ngày lẫn đêm , ngay cả trong lúc bạn ngủ . Nâng cao hiệu quả trong quá trình tăng cân tăng cơ của bạn'),
('SP026','imp/khien.png',N'Tăng cơ + Bổ sung vitamin',N'Với cường độ tập luyện mỗi ngày, bổ sung protein và bcaa là chưa đủ . Cơ thể bạn cũng cần thêm các vitamin và khoáng chất để khỏe mạnh hơn, tăng cao hiệu quả tập luyện',
                    N'Tăng cơ + Phục hồi cơ',N'Whey cung cấp nhiều protein nhất, trong khi Anabolic là một trong số các bcaa tốt nhất . Với sự kết hợp hoàn hảo này một buổi tập chất lượng là điều hiển nhiên.',
					N'Bộ đôi nuôi cơ hoàn hảo',N'Với bộ đôi whey này , cơ bắp của bạn sẽ được nuôi dưỡng cả ngày lẫn đêm , ngay cả trong lúc bạn ngủ . Nâng cao hiệu quả trong quá trình tăng cân tăng cơ của bạn')
--LH05
insert into VITAMIN
values
('SP027','imp/khien.png',N'Tăng cơ + Bổ sung vitamin',N'Với cường độ tập luyện mỗi ngày, bổ sung protein và bcaa là chưa đủ . Cơ thể bạn cũng cần thêm các vitamin và khoáng chất để khỏe mạnh hơn, tăng cao hiệu quả tập luyện',
                    N'Tăng cơ + Phục hồi cơ',N'Whey cung cấp nhiều protein nhất, trong khi Anabolic là một trong số các bcaa tốt nhất . Với sự kết hợp hoàn hảo này một buổi tập chất lượng là điều hiển nhiên.',
					N'Bộ đôi nuôi cơ hoàn hảo',N'Với bộ đôi whey này , cơ bắp của bạn sẽ được nuôi dưỡng cả ngày lẫn đêm , ngay cả trong lúc bạn ngủ . Nâng cao hiệu quả trong quá trình tăng cân tăng cơ của bạn'),
('SP028','imp/khien.png',N'Tăng cơ + Bổ sung vitamin',N'Với cường độ tập luyện mỗi ngày, bổ sung protein và bcaa là chưa đủ . Cơ thể bạn cũng cần thêm các vitamin và khoáng chất để khỏe mạnh hơn, tăng cao hiệu quả tập luyện',
                    N'Tăng cơ + Phục hồi cơ',N'Whey cung cấp nhiều protein nhất, trong khi Anabolic là một trong số các bcaa tốt nhất . Với sự kết hợp hoàn hảo này một buổi tập chất lượng là điều hiển nhiên.',
					N'Bộ đôi nuôi cơ hoàn hảo',N'Với bộ đôi whey này , cơ bắp của bạn sẽ được nuôi dưỡng cả ngày lẫn đêm , ngay cả trong lúc bạn ngủ . Nâng cao hiệu quả trong quá trình tăng cân tăng cơ của bạn'),
('SP029','imp/khien.png',N'Tăng cơ + Bổ sung vitamin',N'Với cường độ tập luyện mỗi ngày, bổ sung protein và bcaa là chưa đủ . Cơ thể bạn cũng cần thêm các vitamin và khoáng chất để khỏe mạnh hơn, tăng cao hiệu quả tập luyện',
                    N'Tăng cơ + Phục hồi cơ',N'Whey cung cấp nhiều protein nhất, trong khi Anabolic là một trong số các bcaa tốt nhất . Với sự kết hợp hoàn hảo này một buổi tập chất lượng là điều hiển nhiên.',
					N'Bộ đôi nuôi cơ hoàn hảo',N'Với bộ đôi whey này , cơ bắp của bạn sẽ được nuôi dưỡng cả ngày lẫn đêm , ngay cả trong lúc bạn ngủ . Nâng cao hiệu quả trong quá trình tăng cân tăng cơ của bạn')
--LH006 Sinh nhiệt đốt mỡ
insert into VITAMIN
values
('SP030','imp/khien.png',N'Tăng cơ + Giảm mỡ',N'Kích thích tối đa quá trình trao đổi chất và bẻ gãy các mô mỡ mà cơ thể không thể tiêu thụ. Đồng thời, bổ sung protein cho các tế bào nuôi cơ hiệu quả.',
						N'Tăng cơ + Giảm mỡ',N'Lipo6 được mệnh danh là kẻ hủy diệt mỡ mạnh nhất mà mọi người thường nhắc đến. Hãy kết hợp sản phẩm này với Iso Surge để có những hương vị mới lạ và tăng cơ săn chắc hơn.',
						N'Tăng cơ + Giảm mỡ',N'Bộ đôi sản phẩm tăng cường bổ sung protein và loại bỏ lượng mỡ dư thừa khiến bạn phá bỏ mọi giới hạn của bản thân.'),

('SP031','imp/khien.png',N'Tăng cơ + Giảm mỡ',N'Nếu bạn muốn tối ưu lượng mỡ thừa trong cơ thể và thúc đẩy sự phát triển của cơ bắp như kỳ vọng thì đây chính là sự lựa chọn sáng suốt nhất.',
						N'Tăng cơ + Giảm mỡ',N'Bộ sản phẩm giúp đốt cháy lượng mỡ thừa trong cơ thể và nuôi cơ hiệu quả. Đồng thời, thanh lọc chất béo dư thừa không cần thiết ra khỏi cơ thể.',
						N'Tăng cơ + Giảm mỡ',N'Một sự lựa chọn khác cho việc tăng cơ giảm mỡ của bạn. Sản phẩm này giúp bạn có một cơ thể hoàn hảo không mỡ thừa và săn chắc vượt trội.'),

('SP032','imp/khien.png',N'Giảm mỡ',N'Carnibolic giúp bạn chuyển hóa mỡ thừa nhanh hơn, giảm cảm giác thèm ăn. Kết hợp cùng với Hydroxycut NextGen để gia tăng tốc độ đốt cháy mỡ thừa trong cơ thể hiệu quả.',
						N'Tăng cơ + Giảm mỡ',N'ISO 100 cung cấp protein dồi dào cho mỗi khẩu phần kết hợp loại bỏ lượng mỡ thừa từ Hydroycut NextGen. Bạn sẽ có một cơ thể săn chắc với những đường cơ sắc nét',
						N'Tăng cơ + Giảm mỡ',N'Với đặc tính hấp thu siêu nhanh, Hydropure chống lại sự phá hủy cơ bắp, tăng tổng hợp protein để phát triển cơ bắp. Đồng thời, kết hợp cùng Hydroxycut để hạn chế tối đa lượng mỡ dư thừa.'),

('SP033','imp/khien.png',N'Giảm mỡ',N'Carnibolic giúp bạn chuyển hóa mỡ thừa nhanh hơn, giảm cảm giác thèm ăn. Kết hợp cùng với Hydroxycut NextGen để gia tăng tốc độ đốt cháy mỡ thừa trong cơ thể hiệu quả.',
						N'Tăng cơ + Giảm mỡ',N'ISO 100 cung cấp protein dồi dào cho mỗi khẩu phần kết hợp loại bỏ lượng mỡ thừa từ Hydroycut NextGen. Bạn sẽ có một cơ thể săn chắc với những đường cơ sắc nét',
						N'Tăng cơ + Giảm mỡ',N'Với đặc tính hấp thu siêu nhanh, Hydropure chống lại sự phá hủy cơ bắp, tăng tổng hợp protein để phát triển cơ bắp. Đồng thời, kết hợp cùng Hydroxycut để hạn chế tối đa lượng mỡ dư thừa.')
--LH007 Ít chất kích thích	34
insert into VITAMIN
values
('SP034','imp/khien.png',N'Giảm mỡ nhanh',N'Sự kết hợp hoàn hảo của Carnibolic và Semtex khiến người dùng không khỏi ngạc nhiên vì tính đặc hiệu của chúng. Đấy được coi là bộ đôi song sát giúp đẩy lùi mỡ thừa hiệu quả.',
						N'Nuôi cơ + Giảm mỡ',N'Đây là là một trong những bộ sản phẩm nuôi cơ , giảm mỡ hoàn hảo nhất trên thị trường. Sử dụng sản phẩm giúp bạn đánh tan lượng mỡ thừa và chống dị hóa hiệu quả.',
						N'Tăng cơ + Giảm mỡ',N'Một lựa chọn khá thông minh cho việc tăng cơ , giảm mỡ hiệu quả. Bộ 2 sản phẩm đến từ hãng Nutrabolics sẽ giúp bạn đánh tan mọi loại mỡ và căng cơ tuyệt đối.')
go
