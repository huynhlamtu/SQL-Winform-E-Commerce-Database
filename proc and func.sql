
-- Stored procudures and functions:

---------------------------------------------------------------------------------------------------------
-- Ở GÓC ĐỘ KHÁCH HÀNG: theo từng cá nhân khách hàng

--1. Tìm kiếm mặt hàng theo tên:
create procedure TimKiemTenMH @TenMH nvarchar (50)
as
	select TenMH, TenLoai, NCC.TenNCC, DonGia, GiamGia, XuatXu, MauSac, Size, KichThuoc, KhoiLuong, NgaySX
	from MatHang MH, LoaiHang LH, NhaCungCap NCC
	where TenMH like '%' + @TenMH + '%' and LH.MaLoai = MH.Maloai and NCC.MaNCC = MH.MaNCC

-- Kiểm tra
exec TimKiemTenMH  ''

-----------------------------------------------------------------------------------------------------

--2. Tìm mặt hàng theo loại sản phẩm
create procedure MH_TimTheoLoai @TenLH nvarchar(30)
as
	select TenLoai, TenMH, NCC.TenNCC, DonGia, GiamGia, XuatXu, MauSac, Size, KichThuoc, KhoiLuong, NgaySX
	from MatHang MH, LoaiHang LH, NhaCungCap NCC
	where LH.TenLoai like '%' + @TenLH + '%' and LH.MaLoai = MH.Maloai and NCC.MaNCC = MH.MaNCC

-- Kiểm tra
exec MH_TimTheoLoai 'Ad'

-----------------------------------------------------------------------------------------------------

--3. Tìm mặt hàng theo tên nhà cung cấp
create procedure MH_TimtheoNCC @TenNCC nvarchar(50)
as
	select NCC.TenNCC, TenMH, TenLoai, DonGia, GiamGia, XuatXu, MauSac, Size, KichThuoc, KhoiLuong, NgaySX
	from MatHang MH, LoaiHang LH, NhaCungCap NCC
	where TenNCC like '%' + @TenNCC + '%' and NCC.MaNCC = MH.MaNCC and MH.Maloai = LH.MaLoai

-- Kiểm tra
exec MH_TimtheoNCC 'Ja'

-----------------------------------------------------------------------------------------------------

-- 4. Xuất ra danh sách 10 sản phẩm bán chạy nhất
create procedure TopMHBanchaynhat
as
	select TenMH, count(*) SLDaBan, TenLoai, NCC.TenNCC, DonGia, GiamGia, XuatXu, MauSac, Size, KichThuoc, KhoiLuong, NgaySX
	from MatHang MH, HoaDonChiTiet CT, LoaiHang LH, NhaCungCap NCC
	where MH.MaMH = CT.MaMH and NCC.MaNCC = MH.MaNCC and MH.Maloai = LH.MaLoai
	group by MH.MaMH, TenMH, TenLoai, NCC.TenNCC, DonGia, XuatXu, MauSac, Size, KichThuoc, KhoiLuong, NgaySX
	order by count(CT.SoLuong) desc

	--chạy kiểm tra
exec TopMHBanchaynhat

-----------------------------------------------------------------------------------------------------

--5. Xuất ra danh sách top 10 sản phẩm khuyến mãi nhiều nhất
create procedure TopMHKhuyenMai
as
	select top 10 NCC.TenNCC, TenMH, TenLoai, DonGia, GiamGia, XuatXu, MauSac, Size, KichThuoc, KhoiLuong, NgaySX
	from MatHang MH, LoaiHang LH, NhaCungCap NCC
	where NCC.MaNCC = MH.MaNCC and MH.Maloai = LH.MaLoai
	order by MH.GiamGia desc

-- kiểm tra:
exec TopMHKhuyenMai
-----------------------------------------------------------------------------------------------------

--6. Xuất danh sách các mặt hàng đang khuyến mãi
create procedure MHKhuyenmai
as
	select TenMH, LH.TenLoai, NCC.TenNCC, DonGia, GiamGia, XuatXu, MauSac, Size, KichThuoc, KhoiLuong, NgaySX
	from MatHang MH, NhaCungCap NCC, LoaiHang LH
	where GiamGia > 0 and NCC.MaNCC = MH.MaNCC and MH.Maloai = LH.MaLoai

-- Kiểm tra
exec MHKhuyenmai
-----------------------------------------------------------------------------------------------------

--7. Tìm mặt hàng theo loại sản phẩm
create procedure MH_TimTheoLoai @TenLH nvarchar(30)
as
	select TenLoai, TenMH, DonGia, GiamGia, XuatXu, MauSac, Size, KichThuoc, KhoiLuong, NgaySX, MaNCC
	from MatHang MH, LoaiHang LH
	where LH.TenLoai like '%' + @TenLH + '%' and LH.MaLoai = MH.Maloai

-- Kiểm tra
	exec MH_TimTheoLoai 'Ad'
-----------------------------------------------------------------------------------------------------

--8. Tìm mặt hàng theo tên nhà cung cấp
create procedure MH_TimtheoNCC @TenNCC nvarchar(50)
as
	select TenNCC, TenMH, TenLoai, DonGia, GiamGia, XuatXu, MauSac, Size, KichThuoc, KhoiLuong, NgaySX
	from MatHang MH, NhaCungCap NCC, LoaiHang LH
	where TenNCC like '%' + @TenNCC + '%' and NCC.MaNCC = MH.MaNCC and MH.Maloai = LH.MaLoai

-- Kiểm tra
exec MH_TimtheoNCC 'Jo'
-----------------------------------------------------------------------------------------------------

--9. Mua sản phẩm, gồm:

-- 9.1. Tạo phiếu đặt hàng

create procedure TaoPhieuDat  @MAKH int, @NguoiNhan nvarchar(30), @SDT varchar(12), @DiaChi nvarchar(50)
as
	declare @MaPhieu int
	set @MaPhieu = (select MAX(MaDonDH) from PhieuDatHang) + 1

	insert PhieuDatHang
	values (@MaPhieu, @MAKH, @NguoiNhan, @SDT, @DiaChi, 0)

	print N'Đã tạo cho bạn một mã đơn đặt hàng'
-- Kiểm tra:
 exec TaoPhieuDat 500001, N'Chu Văn Nam', '09192818291', N'Thủ Đức'

 -------------------------------------------------------------------------------------
 create function Count_PhieuDatHang_MaxKey ()
 returns int
 as
 begin
	declare @max int
	set @max =	(select MAX(MaDonDH) from PhieuDatHang)
	
	return @max

end;

SELECT dbo.Count_PhieuDatHang_MaxKey()
 -------------------------------------------------------------------------------------
-- 9.2 Tạo chi tiết phiếu đặt hàng
create procedure MuaMH @MaDon int, @MaMH nvarchar(30), @MaNCC nvarchar(30), @SoLuong int
as
	-- tạo mã đơn chi tiết = max + 1
	declare @MaDonCT int
	if ((select MAX(MaDon_CT) from PhieuDatHang_CT where MaDon = @MaDon) is NULL)
		set @MaDonCT = 1
	else
		set @MaDonCT = (select MAX(MaDon_CT) from PhieuDatHang_CT where MaDon = @MaDon) + 1

	-- Xem mặt hàng hàng này còn lại bao nhiêu sản phẩm trong kho
	declare @SL int
	set @SL = (select SoLuong from MatHang where MaMH = @MaMH)
	
	-- Nếu lượng cầu vượt cung
	if (@SoLuong > @SL)
	begin
		print N'Số lượng hàng trong kho (còn ' + CAST(@SL as nvarchar(20)) + N') ít hơn số lượng hàng bạn cần mua'
		return 0
	end

	-- Nhập phiếu đặt chi tiết
	insert PhieuDatHang_CT
	values (@MaDonCT, @MaDon, GETDATE(), @MaMH, @SoLuong)

	-- Cập nhật tổng lượng hàng đặt trong hóa đơn hiện tại
	update PhieuDatHang
	set TongSl = TongSl + @SoLuong
	where MaDonDH = @MaDon

	-- Cập nhật lượng hàng còn lại trong kho
	update MatHang
	set SoLuong = SoLuong - @SoLuong
	where @MaMH = MaMH

	insert TrangThaiDonHang
	values (@MaDon, N'Đang chờ xử lí')

	print N'Đặt hàng thành công'

	return 1

-----------------------------------------------------------------------------------------------------

-- 10. Theo dõi đơn hàng của từng khách hàng
create procedure TheoDoiDon @MaKH int
as
	select KH.HoTen, TT.MaDonHang, TT.TrangThai, OrderDate, TongTienHD_CT, ThanhTien, CreaditCard, NgayThanhToan
	from TrangThaiDonHang TT, HoaDon HD, KhachHang KH
	where TT.MaDonHang = HD.MaHoaDon and KH.MaKH = HD.MaKH and @MaKH = KH.MaKH

-- chạy thử:
exec TheoDoiDon 500001
-----------------------------------------------------------------------------------------------------

-- 11. Xem danh sách đã mua thành công

create procedure ShowDaMua @MaKH int
as
	select KH.HoTen as N'Người đặt mua', PN.NgayNhan, PN.NguoiNhan, HD.ThanhTien, HD.NgayThanhToan
	from HoaDon HD, PhieuGiaoHang PG, PhieuNhan PN, KhachHang KH
	where @MaKH = KH.MaKH and KH.MaKH = HD.MaKH and HD.MaKH = PG.MaKH and PG.MaPhieuGiao = PN.MaPhieuGiao

-- Chạy thử:
exec ShowDaMua 500508
-----------------------------------------------------------------------------------------------------

-- 12. Xem danh sách đã đặt
create procedure ShowDaDat @MaKH int
as
	select KH.HoTen as N'Người đặt mua', NgayDat, MH.TenMH, PCT.Soluong
	from PhieuDatHang PD, PhieuDatHang_CT PCT, KhachHang KH, MatHang MH
	where KH.MaKH = @MaKH and KH.MaKH = PD.MaKH and PCT.MaDon = PD.MaDonDH and PCT.MaMH = MH.MaMH

-- Chạy thử:
exec ShowDaDat 500001
-----------------------------------------------------------------------------------------------------

-- 13. Đánh giá dịch vụ
create procedure DanhGiaDVu @MaKH int, @vote int, @comment nvarchar(200)
as
	-- nếu khách hàng đã đánh giá dịch vụ trước đó, với điểm vote không đổi, thì ghi đè comment của đánh giá mới
	if (exists(select MaKH from DanhGiaDichVu where MaKH = 500001))
	begin
		update DanhGiaDichVu
		set comment = @comment
		where @MaKH = MaKH
		return 0
	end

	-- nếu khách hàng đã đánh giá dịch vụ trước đó, với điểm vote thay đổi, thì ghi đè đánh giá mới
	if (exists(select MaKH from DanhGiaDichVu where MaKH = 500001 and vote = @vote))
	begin
		update DanhGiaDichVu
		set vote = @vote, comment = @comment
		where @MaKH = MaKH
		return 0
	end

	-- nếu chưa, ghi nhận đánh giá của khách hàng
	insert DanhGiaDichVu
	values (@MaKH, @vote, @comment)

	return 1
-- Kiểm tra:
exec DanhGiaDVu 500001, 4, 'Good'

select *
from DanhGiaDichVu
where MaKH = 500001
-----------------------------------------------------------------------------------------------------

-- 14. Report
create procedure ReportNCC @MaKH int, @MaNCC int, @comment nvarchar(200)
as
	declare @MaReport int

	if ((select MAX(MaReport) from Report) is null)
		set @MaReport = 1
	else
		set @MaReport = (select MAX(MaReport) from Report) + 1

	insert Report
	values (@MaReport, @MaKH, @MaNCC, @comment)
-----------------------------------------------------------------------------------------------------

-- 15. Đánh giá sản phẩm
create procedure DanhGiaMatHang @MaKH int, @TenMH nvarchar(30), @TenNCC nvarchar(30), @vote int, @comment nvarchar(200)
as
	declare @MaMH int
	set @MaMH = (select MaMH from MatHang where @TenMH = TenMH and MaNCC = (select MaNCC from NhaCungCap where @TenNCC = TenNCC))

	-- Nếu khách hàng đã đánh giá sản phẩm này với điểm vote không đổi, thì cập nhật comment
	if (exists(select * from DanhGiaSanPham where MaSP = @MaMH and MaKH = @MaKH and @vote = Vote))
	begin
		update DanhGiaSanPham
		set comment = @comment
		where MaKH = @MaKH and MaSP = @MaMH
		return 1
	end

	-- Nếu khách hàng đã đánh giá sản phẩm này với điểm vote thay đổi, thì cập nhật điểm vote và comment
	if (exists(select * from DanhGiaSanPham where MaSP = @MaMH and MaKH = @MaKH and @vote = Vote))
	begin
		update DanhGiaSanPham
		set vote = @vote, comment = @comment
		where MaKH = @MaKH and MaSP = @MaMH
		return 1
	end

	insert DanhGiaSanPham
	values (@MaKH, @MaMH, @vote, @comment)
	return 1

-----------------------------------------------------------------------------------------------------

-- 16. Hủy đơn hàng
create procedure HuyDonHang @MaKH int, @MaDonHang int
as
	-- Nếu khách hàng không đặt đơn hàng này
	if (not exists(select * from PhieuDatHang where @MaKH = MaKH))
	begin
		print N'Bạn không đặt đơn hàng này'
		return 0;
	end

	-- Nếu đã hết thời hạn 1 ngày sau khi đặt hàng
	declare @OrderDate datetime
	set @OrderDate = (select OrderDate from HoaDon where @MaKH = MaKH and MaDonDH = @MaDonHang)

	if (DATEDIFF(DAY,GETDATE(),@OrderDate) > 1)
	begin
		print N'Đã hết thời hạn tối đa (1 ngày) để hủy đơn hàng từ lúc đặt hàng'
		return 0
	end

	-- Hủy đơn hàng
	declare @MaHoaDon int
	set @MaHoaDon = (select OrderDate from HoaDon where @MaKH = MaKH and MaDonDH = @MaDonHang)

	delete HoaDonChiTiet
	where MaHoaDon = @MaDonHang

	delete HoaDon
	where MaHoaDon = @MaDonHang

	insert DonHangHuy
	values (@MaDonHang, GETDATE())

	insert TrangThaiDonHang
	values (@MaDonHang, N'Đã hủy')

	delete PhieuDatHang
	where MaDonDH = @MaDonHang
	
----------------------------------------------------------------------------------------------------------------------------------

-- Ở GÓC ĐỘ NHÀ QUẢN LÝ: 

-- 1. Thống kê số lượng đơn hàng trong một khoảng thời gian từ tất cả cửa hàng

create procedure TK_SLDonHang @dateBegin datetime, @dateEnd datetime
as
	select TenNCC, count(*) as N'Số đơn hàng'
	from HoaDonChiTiet CT, NhaCungCap NCC, HoaDon HD
	where CT.MaNCC = NCC.MaNCC and HD.MaHoaDon = CT.MaHoaDon and datediff(day, HD.OrderDate, @dateBegin) <= 0 and datediff(day, HD.OrderDate, @dateEnd) >= 0
	group by CT.MaNCC, TenNCC
-----------------------------------------------------------------------------------------------------

-- 2 Thống kê doanh thu trong một khoảng thời gian từ tất cả cửa hàng

create procedure TK_DoanhThu @dateBegin datetime, @dateEnd datetime
as
	select TenNCC, sum(CT.ThanhTien) as N'Doanh thu'
	from HoaDonChiTiet CT, NhaCungCap NCC, HoaDon HD
	where CT.MaNCC = NCC.MaNCC and HD.MaHoaDon = CT.MaHoaDon and datediff(day, HD.OrderDate, @dateBegin) <= 0 and datediff(day, HD.OrderDate, @dateEnd) >= 0
	group by CT.MaNCC, TenNCC
-----------------------------------------------------------------------------------------------------

-- 3. Liệt kê số lượng đơn hàng trong một ngày từ tất cả cửa hàng

create procedure TK_SLDonHang_1Ngay @date datetime
as
	select TenNCC, count(*) as N'Số đơn hàng'
	from HoaDonChiTiet CT, NhaCungCap NCC, HoaDon HD
	where CT.MaNCC = NCC.MaNCC and HD.MaHoaDon = CT.MaHoaDon and HD.OrderDate = @date
	group by CT.MaNCC, TenNCC
-----------------------------------------------------------------------------------------------------

-- 4. Liệt kê doanh thu trong một ngày từ tất cả cửa hàng

create procedure TK_DoanhThu @date datetime
as
	select TenNCC, sum(CT.ThanhTien) as N'Doanh thu'
	from HoaDonChiTiet CT, NhaCungCap NCC, HoaDon HD
	where CT.MaNCC = NCC.MaNCC and HD.MaHoaDon = CT.MaHoaDon and DATEDIFF(day,OrderDate, @date) = 0
	group by CT.MaNCC, TenNCC

-- Kiểm tra:
exec TK_DoanhThu '2019-10-31'
-----------------------------------------------------------------------------------------------------

-- 5. Thống kê số lượt report của tất cả cửa hàng

create procedure TK_Report
as
	select TenNCC, count(*) as N'Lượt report'
	from Report R, NhaCungCap NCC
	where R.MaNCC = NCC.MaNCC
	group by R.MaNCC, TenNCC
-----------------------------------------------------------------------------------------------------

-- 6. Thống kê số lượng mặt hàng bị đánh giá kém chất lượng tại mỗi cửa hàng
create procedure TK_SLMH_KemCL
as
	select TenNCC, MaSP, count(*)
	from DanhGiaSanPham DG, MatHang MH, NhaCungCap NCC
	where Vote < 3 and DG.MaSP = MH.MaMH and MH.MaNCC = NCC.MaNCC
	group by MaSP, TenNCC
	order by count(*) desc

-----------------------------------------------------------------------------------------------------


-- 7. Thông tin các đơn hàng đã giao trong một khoảng thời gian
create procedure TTDH_DaGiao @datebegin datetime, @dateend datetime
as
	select HD.MaHoaDon, PN.NguoiNhan, GH.NhanVienGiaoHang, HD.MaKH, HD.TenKH, HD.DiaChi, HD.SDT, HD.OrderDate, HD.ShipDate, HD.TienShip,HD.ThanhTien, HD.CreaditCard, HD.NgayThanhToan
	from PhieuNhan PN, PhieuGiaoHang PG, HoaDon HD, GiaoHang GH
	where PN.MaPhieuGiao = PG.MaPhieuGiao and PG.MaHoaDon = HD.MaHoaDon and GH.MaPhieuGiao = PG.MaPhieuGiao and datediff(day, HD.OrderDate, @dateBegin) <= 0 and datediff(day, HD.OrderDate, @dateEnd) >= 0
-----------------------------------------------------------------------------------------------------

-- 8. Thông tin các đơn hàng đã giao trong một ngày cụ thể
create procedure TTDH_DaGiao_1Ngay @date datetime
as
	select HD.MaHoaDon, PN.NguoiNhan, GH.NhanVienGiaoHang, HD.MaKH, HD.TenKH, HD.DiaChi, HD.SDT, HD.OrderDate, HD.ShipDate, HD.TienShip,HD.ThanhTien, HD.CreaditCard, HD.NgayThanhToan
	from PhieuNhan PN, PhieuGiaoHang PG, HoaDon HD, GiaoHang GH
	where PN.MaPhieuGiao = PG.MaPhieuGiao and PG.MaHoaDon = HD.MaHoaDon and GH.MaPhieuGiao = PG.MaPhieuGiao and datediff(day, HD.OrderDate, @date) = 0 
-----------------------------------------------------------------------------------------------------

-- 9. Thông tin các đơn hàng chờ giao
create procedure TTDH_ChoGiao
as
	select *
	from HoaDon
	where ShipDate = null

-----------------------------------------------------------------------------------------------------

-- 10. Thông tin các đơn hàng đang giao
create procedure TTDH_DangGiao
as
	select HD.MaHoaDon, GH.NhanVienGiaoHang, HD.MaKH, HD.TenKH, HD.DiaChi, HD.SDT, HD.OrderDate, HD.ShipDate, HD.TienShip,HD.ThanhTien, HD.CreaditCard, HD.NgayThanhToan
	from PhieuGiaoHang PG, HoaDon HD, GiaoHang GH
	where HD.MaHoaDon = PG.MaHoaDon and GH.MaPhieuGiao = PG.MaPhieuGiao and not exists (select *
																					    from PhieuNhan PN
																						where PN.MaPhieuGiao = PG.MaPhieuGiao)

-----------------------------------------------------------------------------------------------------

-- 11. Thông tin các đơn hàng giao trễ
create procedure TTDH_GiaoTre
as
	select HD.MaHoaDon, GH.NhanVienGiaoHang, HD.MaKH, HD.TenKH, HD.DiaChi, HD.SDT, HD.OrderDate, HD.ShipDate, HD.TienShip,HD.ThanhTien, HD.CreaditCard, HD.NgayThanhToan
	from PhieuGiaoHang PG, HoaDon HD, GiaoHang GH, PhieuNhan PN
	where HD.MaHoaDon = PG.MaHoaDon and GH.MaPhieuGiao = PG.MaPhieuGiao and PN.MaPhieuGiao = PG.MaPhieuGiao and DATEDIFF(day,HD.ShipDate,PN.NgayNhan) > 0