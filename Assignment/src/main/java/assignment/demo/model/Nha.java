package assignment.demo.model;

import jakarta.persistence.*;
import lombok.Builder;

import java.math.BigDecimal;

@Entity
@Table
@Builder
public class Nha {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "manha")
    private Integer maNha;

    @Column(name = "tennha")
    private String tenNha;

    @Column(name = "soluong")
    private Integer soLuong;

    @Column(name = "gianha")
    private BigDecimal giaNha;

    @Column(name = "giacu")
    private BigDecimal giaCu;


    @Column(name = "anhnha")
    private String anhNha;

    @Column(name = "mota")
    private String moTa;

    @Column(name = "dientich")
    private Integer dienTich;

    @Column(name = "sotang")
    private Integer soTang;

    @Column(name = "mattien")
    private Integer matTien;

    @Column(name = "sophongngu")
    private Integer soPhongNgu;

    @Column(name = "sophongtam")
    private Integer soPhongTam;

    public Nha() {
    }

    public Nha(Integer maNha, String tenNha, Integer soLuong, BigDecimal giaNha, BigDecimal giaCu, String anhNha,
               String moTa, Integer dienTich, Integer soTang, Integer matTien, Integer soPhongNgu, Integer soPhongTam) {
        this.maNha = maNha;
        this.tenNha = tenNha;
        this.soLuong = soLuong;
        this.giaNha = giaNha;
        this.giaCu = giaCu;
        this.anhNha = anhNha;
        this.moTa = moTa;
        this.dienTich = dienTich;
        this.soTang = soTang;
        this.matTien = matTien;
        this.soPhongNgu = soPhongNgu;
        this.soPhongTam = soPhongTam;
    }

    public Nha(String tenNha, Integer soLuong, BigDecimal giaNha, String anhNha, String moTa, Integer dienTich,
               Integer soTang, Integer matTien, Integer soPhongNgu, Integer soPhongTam) {

        this.tenNha = tenNha;
        this.soLuong = soLuong;
        this.giaNha = giaNha;
        this.anhNha = anhNha;
        this.moTa = moTa;
        this.dienTich = dienTich;
        this.soTang = soTang;
        this.matTien = matTien;
        this.soPhongNgu = soPhongNgu;
        this.soPhongTam = soPhongTam;
    }

    public Nha(Integer maNha, String tenNha, Integer soLuong, BigDecimal giaNha, String anhNha, String moTa,
               Integer dienTich, Integer soTang, Integer matTien, Integer soPhongNgu, Integer soPhongTam) {
        this.maNha = maNha;
        this.tenNha = tenNha;
        this.soLuong = soLuong;
        this.giaNha = giaNha;
        this.anhNha = anhNha;
        this.moTa = moTa;
        this.dienTich = dienTich;
        this.soTang = soTang;
        this.matTien = matTien;
        this.soPhongNgu = soPhongNgu;
        this.soPhongTam = soPhongTam;
    }



    public Integer getMaNha() {
        return maNha;
    }

    public void setMaNha(Integer maNha) {
        this.maNha = maNha;
    }

    public String getTenNha() {
        return tenNha;
    }

    public void setTenNha(String tenNha) {
        this.tenNha = tenNha;
    }

    public Integer getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(Integer soLuong) {
        this.soLuong = soLuong;
    }

    public BigDecimal getGiaNha() {
        return giaNha;
    }

    public void setGiaNha(BigDecimal giaNha) {
        this.giaNha = giaNha;
    }

    public String getAnhNha() {
        return anhNha;
    }

    public void setAnhNha(String anhNha) {
        this.anhNha = anhNha;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    public Integer getDienTich() {
        return dienTich;
    }

    public void setDienTich(Integer dienTich) {
        this.dienTich = dienTich;
    }

    public Integer getSoTang() {
        return soTang;
    }

    public void setSoTang(Integer soTang) {
        this.soTang = soTang;
    }

    public Integer getMatTien() {
        return matTien;
    }

    public void setMatTien(Integer matTien) {
        this.matTien = matTien;
    }

    public Integer getSoPhongNgu() {
        return soPhongNgu;
    }

    public void setSoPhongNgu(Integer soPhongNgu) {
        this.soPhongNgu = soPhongNgu;
    }

    public Integer getSoPhongTam() {
        return soPhongTam;
    }

    public void setSoPhongTam(Integer soPhongTam) {
        this.soPhongTam = soPhongTam;
    }

    public BigDecimal getGiaCu() {
        return giaCu;
    }

    public void setGiaCu(BigDecimal giaCu) {
        this.giaCu = giaCu;
    }

    public Long doiSoLuong(Integer so){
        return Long.valueOf(so);
    }
}
