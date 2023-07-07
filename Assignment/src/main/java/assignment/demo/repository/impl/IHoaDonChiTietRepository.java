package assignment.demo.repository.impl;

import assignment.demo.model.HoaDonChiTiet;
import assignment.demo.model.HoaDonThongKeTonViewModel;
import assignment.demo.model.HoaDonThongKeViewModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


import java.util.Date;
import java.util.List;

public interface IHoaDonChiTietRepository extends JpaRepository<HoaDonChiTiet, Integer> {
    @Query
            ("""
                    select  new assignment.demo.model.HoaDonThongKeViewModel(n.tenNha, sum(hdct.soLuong)) from HoaDonChiTiet hdct  join Nha n on hdct.maSanPham = n.maNha
                    group by n.tenNha order by sum(hdct.soLuong) desc  limit 10
                    """)
    List<HoaDonThongKeViewModel> layThongKeTop10BanChay();


    @Query("""
            select   new assignment.demo.model.HoaDonThongKeTonViewModel(n.tenNha, n.giaNha,n.soLuong,n.anhNha)  from  Nha n left join  HoaDonChiTiet hd  on hd.maSanPham =n.maNha
            where hd.maSanPham is null
            group by  n.tenNha, n.giaNha,n.soLuong,n.anhNha
            order by n.soLuong desc
            """)
    List<HoaDonThongKeTonViewModel> viewTop10TonKho();

    @Query
            ("""
                    select  new assignment.demo.model.HoaDonThongKeViewModel(n.tenNha, sum(hdct.soLuong)) from HoaDonChiTiet hdct  join Nha n on hdct.maSanPham = n.maNha join HoaDon hd on hdct.maHoaDonChiTiet=hd.maHoaDon
                    where hd.ngayThanhToan =:ngayThanhToan
                    group by n.tenNha order by sum(hdct.soLuong) desc  limit 10 
                    """)
    List<HoaDonThongKeViewModel> layThongKeTop10BanChayTheo(Date ngayThanhToan);





}
