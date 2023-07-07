package assignment.demo.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "hoadonchitiet")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class HoaDonChiTiet {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "mahoadonchitiet")
    private Integer maHoaDonChiTiet;

    @Column(name = "masanpham")
    private Integer maSanPham;

    @Column(name = "soluong")
    private Integer soLuong;

    @Column(name = "dongia")
    private Integer donGia;


}
