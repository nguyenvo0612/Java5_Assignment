package assignment.demo.model;

import java.math.BigDecimal;

public class HoaDonThongKeTonViewModel {
    private String tenMatHang;
    private BigDecimal gia;
    private Integer soLuong;
    private String anh;

    public HoaDonThongKeTonViewModel() {
    }

    public HoaDonThongKeTonViewModel(String tenMatHang, BigDecimal gia, Integer soLuong, String anh) {
        this.tenMatHang = tenMatHang;
        this.gia = gia;
        this.soLuong = soLuong;
        this.anh = anh;
    }

    public String getTenMatHang() {
        return tenMatHang;
    }

    public void setTenMatHang(String tenMatHang) {
        this.tenMatHang = tenMatHang;
    }

    public BigDecimal getGia() {
        return gia;
    }

    public void setGia(BigDecimal gia) {
        this.gia = gia;
    }

    public Integer getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(Integer soLuong) {
        this.soLuong = soLuong;
    }

    public String getAnh() {
        return anh;
    }

    public void setAnh(String anh) {
        this.anh = anh;
    }
}
