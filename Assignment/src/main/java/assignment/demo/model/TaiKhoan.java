package assignment.demo.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Table(name = "taikhoan")
@Entity
@Getter
@Setter

public class TaiKhoan {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "mataikhoan")
    private Integer maTaiKhoan;

    @Column(name = "tentaikhoan")
    private String tenTaiKhoan;

    @Column(name = "vaitro")
    private String vaiTro;

    @Column(name = "hoten")
    private String hoTen;

    @Column(name = "gmail")
    private String gmail;

    @Column(name = "matkhau")
    private String matKhau;

    @Column(name = "noio")
    private String noiO;

    public TaiKhoan() {
    }

    public TaiKhoan(Integer maTaiKhoan, String tenTaiKhoan, String vaiTro, String hoTen, String gmail, String matKhau, String noiO) {
        this.maTaiKhoan = maTaiKhoan;
        this.tenTaiKhoan = tenTaiKhoan;
        this.vaiTro = vaiTro;
        this.hoTen = hoTen;
        this.gmail = gmail;
        this.matKhau = matKhau;
        this.noiO = noiO;
    }

    public Integer getMaTaiKhoan() {
        return maTaiKhoan;
    }

    public void setMaTaiKhoan(Integer maTaiKhoan) {
        this.maTaiKhoan = maTaiKhoan;
    }

    public String getTenTaiKhoan() {
        return tenTaiKhoan;
    }

    public void setTenTaiKhoan(String tenTaiKhoan) {
        this.tenTaiKhoan = tenTaiKhoan;
    }

    public String getHoTen() {
        return hoTen;
    }

    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }

    public String getGmail() {
        return gmail;
    }

    public void setGmail(String gmail) {
        this.gmail = gmail;
    }

    public String getMatKhau() {
        return matKhau;
    }

    public void setMatKhau(String matKhau) {
        this.matKhau = matKhau;
    }

    public String getNoiO() {
        return noiO;
    }

    public void setNoiO(String noiO) {
        this.noiO = noiO;
    }

    public String getVaiTro() {
        return vaiTro;
    }

    public void setVaiTro(String vaiTro) {
        this.vaiTro = vaiTro;
    }
}
