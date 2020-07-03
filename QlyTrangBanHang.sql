create database QLY_TRANGBANHANG
go

use QLY_TRANGBANHANG
go

create table KhachHang
(
	MaKH int not null,
	HoTen nvarchar(50) not null,
	Email varchar(30) not null,
	Sdt varchar(11) not null,
	DiaChi nvarchar(100) not null,
	account varchar(30),
)

create table KhoHang
(
	MaKho int not null,
	TenKho nvarchar(50) not null unique,
	MaLoaiHang int not null,
	MaDiaDIem int not null,
	MaNV int not null,
)

create table DiaDiem
(
	MaDiaDiem int not null,
	DiaChi nvarchar(100) not null,
)

create table LoaiHang
(
	MaLoai int not null,
	TenLoai nvarchar(30) not null unique,
)

create table MatHang
(
	MaMH int not null,
	TenMH nvarchar(50) not null,
	Maloai int not null,
	SoLuong int not null,
	DonGia money not null,
	GiamGia int,
	XuatXu nvarchar(30) not null,
	MauSac nvarchar(10) not null,
	Size int,
	KichThuoc nvarchar(30),
	KhoiLuong varchar(10),
	Model varchar(30) not null,
	MaVach varchar(30) not null unique,
	NgaySX date not null,
	MaNCC int not null,
)

create table HoaDonChiTiet
(
	MaHD_CT int not null,
	MaMH int not null,
	SoLuong int not null,
	ThanhTien money not null,
	MaNCC int not null,
	MaHoaDon int not null,
)

create table HoaDon
(
	MaHoaDon int not null,
	MaKH int not null,
	MaDonDH int not null,
	TenKH nvarchar(30) not null,
	DiaChi nvarchar(100),
	SDT varchar(11) not null,
	OrderDate date not null,
	ShipDate date not null,
	Ship_to_address nvarchar(100) not null,
	TienShip money not null,
	TongTienHD_CT money not null,
	Thue int not null,
	ThanhTien money not null,
	CreaditCard varchar(20),
	NgayThanhToan date not null,
)

create table NhanVien
(
	MaNV int not null,
	HoTen nvarchar(30) not null,
	Phai nvarchar(3) not null,
	NgaySinh date not null,
	Diachi nvarchar(100) not null,
	Email varchar(30) not null,
	SDT varchar(11) not null,
	Luong money not null,
)

create table PhieuDatHang_CT
(
	MaDon_CT int not null,
	MaDon int not null,
	NgayDat date not null,
	MaMH int not null,
	Soluong int not null,
)

create table PhieuDatHang
(
	MaDonDH int not null,
	MaKH int not null,
	NguoiNhan nvarchar(30) not null,
	SDT varchar(11) not null,
	DiaChi nvarchar(100) not null,
	TongSl int not null,
)

create table PhieuXuat_CT
(
	MaPX_CT int not null,
	MaPX int not null,
	MaMH int not null,
	SoLuong int not null,
)

create table PhieuXuat
(
	MaPX int not null,
	NgayLap date not null,
	MaKho int not null,
	MaNV int not null,
	MaPhieuGiao int not null,
)

create table PhieuGiaoHang_CT
(
	MaPhieuGiao_CT int not null,
	MaPhieuGiao int not null,
	MaNCC int not null,
	MaMH int not null,
	SoLuong int not null,
	DonGia money not null,
)

create table PhieuGiaoHang
(
	MaPhieuGiao int not null,
	MaHoaDon int not null,
	MaKH int not null,
	DiaChi nvarchar(100) not null,
	SDT varchar(11) not null,
	NgayGiao date not null,
)

create table GiaoHang
(
	MaPhieuGiao int not null,
	NhanVienGiaoHang int not null,
)

create table PhieuNhan
(
	MaPhieuNhan int not null,
	MaPhieuGiao int not null,
	NgayNhan date not null,
	Comment nvarchar (100),
	NguoiNhan nvarchar(30) not null,
)

create table DanhGiaDichVu
(
	MaKH int not null,
	vote int not null,
	comment nvarchar(100),
)

create table DanhGiaSanPham
(
	MaKH int not null,
	MaSP int not null,
	Vote int not null,
	comment nvarchar(100)
)

create table Report
(
	MaReport int not null,
	MaNCC int not null,
	MaKH int not null,
	Comment nvarchar (100)
)

create table TrangThaiDonHang
(
	MaDonHang int not null,
	TrangThai nvarchar(10) not null,
)

create table DonHangHuy
(
	MaDonHang int not null,
	NgayHuy date not null,
)

create table NhaCungCap
(
	MaNCC int not null,
	TenNCC nvarchar(50) not null,
	DiaChi nvarchar(100) not null,
	Email varchar(30) not null,
	Sdt varchar(11) not null,
)

alter table NhaCungCap
add constraint PK_NhaCungCap
primary key (MaNCC)

alter table KhachHang
add constraint PK_KH
primary key (MaKH)

alter table KhoHang
add constraint PK_KhoHang
primary key (MaKho) 

alter table DiaDiem
add constraint PK_DiaDiem
primary key (MaDiaDiem)

alter table LoaiHang
add constraint PK_LoaiHang
primary key (MaLoai)

alter table MatHang
add constraint PK_MatHang
primary key (MaMH)

alter table HoaDonChiTiet
add constraint PK_HoaDonChiTiet
primary key (MaHD_CT, MaHoaDon)

alter table HoaDon
add constraint PK_HoaDon
primary key (MaHoaDon)

alter table NhanVien
add constraint PK_NhanVien
primary key (MaNV)

alter table PhieuDatHang_CT
add constraint PK_PhieuDatHang_CT
primary key (MaDon_CT,MaDon)

alter table PhieuDatHang
add constraint PK_PhieuDatHang
primary key (MaDonDH)

alter table PhieuXuat_CT
add constraint PK_PhieuXuat_CT
primary key (MaPX_CT, MaPX)

alter table PhieuXuat
add constraint PK_PhieuXuat
primary key (MaPX)

alter table PhieuGiaoHang_CT
add constraint PK_PhieuGiaoHang_CT
primary key (MaPhieuGiao_CT,MaPhieuGiao)

alter table PhieuGiaoHang
add constraint PK_PhieuGiaoHang
primary key (MaPhieuGiao)

alter table GiaoHang
add constraint PK_GiaoHang
primary key (MaPhieuGiao,NhanVienGiaoHang)

alter table PhieuNhan
add constraint PK_PhieuNhan
primary key (MaPhieuNhan)

alter table DanhGiaDichVu
add constraint PK_DanhGiaDichVu
primary key (MaKH,vote)

alter table DanhGiaSanPham
add constraint PK_DanhGiaSanPham
primary key (MaKH,MaSP,vote)

alter table Report
add constraint PK_Report
primary key (MaReport,MaKH,MaNCC)

alter table TrangThaiDonHang
add constraint PK_TrangThaiDonHang
primary key (MaDonHang,TrangThai)

alter table DonHangHuy
add constraint PK_DonHangHuy
primary key (MaDonHang,NgayHuy)

--------------------------------------
alter table KhoHang
add constraint FK_KhoHang_DiaDiem
foreign key (MaDiaDiem)
references DiaDiem(MaDiaDiem)

alter table KhoHang
add constraint FK_KhoHang_LoaiHang
foreign key (MaLoaiHang)
references LoaiHang(MaLoai)

alter table HoaDon
add constraint FK_HoaDon_PhieuDatHang
foreign key (MaDonDH)
references PhieuDatHang(MaDonDH)

alter table MatHang
add constraint FK_MatHang_LoaiHang
foreign key (MaLoai)
references LoaiHang(MaLoai)

alter table HoaDon
add constraint FK_HoaDon_KhachHang
foreign key (MaKH)
references KhachHang(MaKH)

alter table HoaDonChiTiet
add constraint FK_HoaDonChiTiet_HoaDon
foreign key (MaHoaDon)
references HoaDon(MaHoaDon)

alter table HoaDonChiTiet
add constraint FK_HoaDonChiTiet_MatHang
foreign key (MaMH)
references MatHang(MaMH)

alter table HoaDonChiTiet
add constraint FK_HoaDonChiTiet_NhaCungCap
foreign key (MaNCC)
references NhaCungCap(MaNCC)

alter table MatHang
add constraint FK_MatHang_NhaCungCap
foreign key (MaNCC)
references NhaCungCap(MaNCC)

alter table KhoHang
add constraint FK_KhoHang_NhanVien
foreign key (MaNV)
references NhanVien(MaNV)

alter table GiaoHang
add constraint FK_GiaoHang_NhanVien
foreign key (NhanVienGiaoHang)
references NhanVien(MaNV)

alter table PhieuDatHang_CT
add constraint FK_PhieuDatHang_CT_PhieuDatHang
foreign key (MaDon)
references PhieuDatHang(MaDonDH)

alter table PhieuDatHang_CT
add constraint FK_PhieuDatHang_CT_MatHang
foreign key (MaMH)
references MatHang(MaMH)

alter table PhieuDatHang
add constraint FK_PhieuDatHang_KhachHang
foreign key (MaKH)
references KhachHang(MaKH)

alter table PhieuXuat_CT
add constraint FK_PhieuXuat_CT_PhieuXuat
foreign key (MaPX)
references PhieuXuat(MaPX)

alter table PhieuXuat_CT
add constraint FK_PhieuXuat_CT_MatHang
foreign key (MaMH)
references MatHang(MaMH)

alter table PhieuXuat
add constraint FK_PhieuXuat_Kho
foreign key (MaKho)
references KhoHang(MaKho)

alter table PhieuXuat
add constraint FK_PhieuXuat_NhanVien
foreign key (MaNV)
references NhanVien(MaNV)

alter table PhieuXuat
add constraint FK_PhieuXuat_PhieuGiaoHang
foreign key (MaPhieuGiao)
references PhieuGiaoHang(MaPhieuGiao)

alter table PhieuGiaoHang_CT
add constraint FK_PhieuGiaoHang_CT_PhieuGiaoHang
foreign key (MaPhieuGiao)
references PhieuGiaoHang(MaPhieuGiao)

alter table PhieuGiaoHang_CT
add constraint FK_PhieuGiaoHang_CT_MatHang
foreign key (MaMH)
references MatHang(MaMH)

alter table PhieuGiaoHang_CT
add constraint FK_PhieuGiaoHang_CT_NhaCungCap
foreign key (MaNCC)
references NhaCungCap(MaNCC)

alter table PhieuGiaoHang
add constraint FK_PhieuGiaoHang_HoaDon
foreign key (MaHoaDon)
references HoaDon(MaHoaDon)

alter table GiaoHang
add constraint FK_GiaoHang_PhieuGiaoHang
foreign key (MaPhieuGiao)
references PhieuGiaoHang(MaPhieuGiao)

alter table PhieuNhan
add constraint FK_PhieuNhan_PhieuGiaoHang
foreign key (MaPhieuGiao)
references PhieuGiaoHang(MaPhieuGiao)

alter table DanhGiaDichVu
add constraint FK_DanhGiaDichVu_KhachHang
foreign key (MaKH)
references KhachHang(MaKH)

alter table DanhGiaSanPham
add constraint FK_DanhGiaSanPham_MatHang
foreign key (MaSP)
references MatHang(MaMH)

alter table DanhGiaSanPham
add constraint FK_DanhGiaSanPham_KhachHang
foreign key (MaKH)
references KhachHang(MaKH)

alter table Report
add constraint FK_Report_NhaCungCap
foreign key (MANCC)
references NhaCungCap(MaNCC)

alter table Report
add constraint FK_Report_KhachHang
foreign key (MaKH)
references KhachHang(MaKH)

alter table DonHangHuy
add constraint FK_DonHangHuy_PhieuDatHang
foreign key (MaDonHang)
references PhieuDatHang(MaDonDH)

alter table TrangThaiDonHang
add constraint FK_TrangThaiDonHang_PhieuDatHang
foreign key (MaDonHang)
references PhieuDatHang(MaDonDH)

------ NONCLUSTER INDEX
---MAT HANG
CREATE NONCLUSTERED INDEX [TenMH_idx] ON MatHang
(
	TenMH ASC
)
INCLUDE (MaMH)
GO

CREATE NONCLUSTERED INDEX [MaPDH_idx] ON PhieuDatHang
(
	MaDonDH ASC
)
GO

CREATE NONCLUSTERED INDEX [MaNCC_idx] ON Report
(
	MaNCC ASC
)
GO

CREATE NONCLUSTERED INDEX [TenNCC_idx] ON NhaCungCap
(
	TenNCC ASC
)
INCLUDE (MaNCC)
GO

CREATE NONCLUSTERED INDEX [NgayDat_idx] ON PhieuDatHang_CT
(
	NgayDat ASC
)
GO

CREATE NONCLUSTERED INDEX [HoaDon_Orderdate_include_idx] ON HoaDon
(
	[OrderDate] ASC
)
INCLUDE ([MaHoaDon])
GO

CREATE NONCLUSTERED INDEX [MaKH_idx] ON KhachHang
(
	[MaKH] ASC
)
GO

CREATE NONCLUSTERED INDEX [KhachHang_TenKH_include_idx] ON KhachHang
(
	[HoTen] ASC
)
INCLUDE (MaKH)
GO

CREATE NONCLUSTERED INDEX [PhieuGiaoHang_MaKH_include_idx] ON PhieuGiaoHang
(
	[MaKH] ASC
)
INCLUDE (MaPhieuGiao)
GO

CREATE NONCLUSTERED INDEX [NhanVien_TenNV_include_idx] ON NhanVien
(
	[HoTen] ASC
)
INCLUDE (MaNV)
GO

CREATE NONCLUSTERED INDEX [KhoHang_MaLoaiHang_include_idx] ON KhoHang
(
	[MaLoaiHang] ASC
)
INCLUDE (MaKho)
GO

CREATE NONCLUSTERED INDEX [MatHang_MaLoaiHang_include_idx] ON MatHang
(
	[MaLoai] ASC
)
INCLUDE (MaMH)
GO

CREATE NONCLUSTERED INDEX [HoaDonChiTiet_MaNCC_include_idx] ON HoaDonChiTiet
(
	[MaNCC] ASC
)
INCLUDE (MaHD_CT)
GO

CREATE NONCLUSTERED INDEX [HoaDonChiTiet_MaMH_include_idx] ON HoaDonChiTiet
(
	[MaMH] ASC
)
INCLUDE (MaHD_CT)
GO