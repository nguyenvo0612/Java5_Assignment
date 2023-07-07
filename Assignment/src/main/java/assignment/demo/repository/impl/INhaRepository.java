package assignment.demo.repository.impl;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import assignment.demo.model.Nha;
import org.springframework.data.jpa.repository.Query;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public interface INhaRepository extends JpaRepository<Nha, Integer> {
    Page<Nha> findByTenNhaContains(String ten, Pageable pageable);

    Nha getNhaByMaNha(Integer ma);

    Page<Nha> findByGiaNhaBetween(BigDecimal min, BigDecimal max, Pageable pageable);

    Page<Nha> findByTenNhaContainsAndGiaNhaBetween(String ten, BigDecimal min, BigDecimal max, Pageable pageable);

    @Query("""
            select n from Nha n left join HoaDonChiTiet hdct on n.maNha=hdct.maSanPham where hdct.maSanPham is null
            """)
    Page<Nha> layNhaTonKho(Pageable pageable);
}
