package assignment.demo.model;

public class HoaDonThongKeViewModel {
    private String tenMatHang;
    private Long soLuong;

    public HoaDonThongKeViewModel() {
    }

    public HoaDonThongKeViewModel(String tenMatHang, Long soLuong) {
        this.tenMatHang = tenMatHang;
        this.soLuong = soLuong;
    }

    public String getTenMatHang() {
        return tenMatHang;
    }


    public void setTenMatHang(String tenMatHang) {
        this.tenMatHang = tenMatHang;
    }

    public Long getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(Long soLuong) {
        this.soLuong = soLuong;
    }
}
