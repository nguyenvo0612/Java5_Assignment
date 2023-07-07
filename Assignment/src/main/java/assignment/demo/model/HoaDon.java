package assignment.demo.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;
import java.util.Date;

@Table(name = "hoadon")
@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class HoaDon {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "mahoadon")
    private Integer maHoaDon;

    @Column(name = "ngaythanhtoan")
    private Date ngayThanhToan;

    @Column(name = "nguoimmua")
    private Integer nguoiMua;

    @Column(name = "tongtien")
    private BigDecimal tongTien;

}
