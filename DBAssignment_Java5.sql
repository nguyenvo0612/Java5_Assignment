create database Assignment_Java5
go
use Assignment_Java5
go
create table Nha(
MaNha int identity(1,1),
TenNha nvarchar(100),
soLuong int,
GiaNha money,
AnhNha varchar(100),
MoTa nvarchar(max),
DienTich float,
MatTien int,
SoTang int,
soPhongNgu int,
soPhongTam int
);
ALTER TABLE Nha
ADD CONSTRAINT nha_pk PRIMARY KEY (MaNha);
INSERT INTO [dbo].[Nha]
           ([TenNha]
           ,[soLuong]
           ,[GiaNha]
           ,[AnhNha]
           ,[MoTa]
           ,[DienTich]
           ,[MatTien]
           ,[SoTang]
           ,[soPhongNgu]
           ,[soPhongTam])
     VALUES
           (N'Nha mat dat khu Cau Giay',
           10,
           100000
           ,'anhnha1'
           ,N'Call me when you want help: 0988762923 *** Mr Vo.'
           ,302
           ,1
           ,2
           ,4
           ,2)
GO
create table TaiKhoan(
MaTaiKhoan int identity(1,1),
TenTaiKhoan varchar(100),
HoTen nvarchar(max),
Gmail varchar(100),
MatKhau varchar(100),
NoiO nvarchar(max),

);
alter table TaiKhoan add  VaiTro varchar(20),
ALTER TABLE TaiKhoan
ADD CONSTRAINT taikhoan_pk PRIMARY KEY (MaTaiKhoan);
CREATE TABLE [dbo].[GioHang](
MaGioHang int identity(1,1),
MaNha int,
TenNha nvarchar(500),
AnhNha varchar(100),
SoLuong int,
);

CREATE TABLE HoaDon(
	MaHoaDon		INT	
		IDENTITY(1,1) PRIMARY KEY,
	NgayThanhToan			DATE,
	TongTien money,
	NguoiMua		int REFERENCES TaiKhoan(MaTaiKhoan)
)
GO

CREATE TABLE HoaDonChiTiet(
	MaHoaDonChiTiet	INT
		REFERENCES HoaDon(MaHoaDon),
	MaSanPham	INT
		REFERENCES Nha(MaNha),
	SoLuong		INT,
	DonGia		MONEY,
	)
select * from  HoaDonChiTiet order by MaSanPham
select n.MaNha, n.TenNha from  Nha n  join   HoaDonChiTiet hdct    on hdct.MaSanPham=n.MaNha
select top 10 n.MaNha, hdct.MaSanPham,n.TenNha,n.soLuong  from Nha n left join   HoaDonChiTiet hdct    on hdct.MaSanPham=n.MaNha
where hdct.MaSanPham is null
group by n.MaNha, n.TenNha ,hdct.MaSanPham ,n.soLuong
order by n.soLuong desc

select * from HoaDon
select n.MaNha, n.TenNha from  Nha n  join   HoaDonChiTiet hdct    on hdct.MaSanPham=n.MaNha join HoaDon hd on hd.MaHoaDon=hdct.MaHoaDon
where hd.NgayThanhToan ='2023-08-01'
