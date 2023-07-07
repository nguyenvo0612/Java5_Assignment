package assignment.demo.entitis;

import jakarta.persistence.Column;

import java.math.BigDecimal;

public class CartItem {
    private Integer maNha;

    private String tenNha;

    private Integer soLuong;

    private BigDecimal giaNha;

    private String anhNha;

    public CartItem() {
    }

    public CartItem(Integer maNha, String tenNha, Integer soLuong, BigDecimal giaNha, String anhNha) {
        this.maNha = maNha;
        this.tenNha = tenNha;
        this.soLuong = soLuong;
        this.giaNha = giaNha;
        this.anhNha = anhNha;
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
}
