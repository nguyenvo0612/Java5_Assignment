package assignment.demo.repository.impl;

import assignment.demo.model.TaiKhoan;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ITaiKhoanRepository extends JpaRepository<TaiKhoan, Integer> {
    TaiKhoan findTaiKhoanByTenTaiKhoan(String ten);
    TaiKhoan findTaiKhoanByTenTaiKhoanAndMatKhau(String ten,String matKhau);


}
