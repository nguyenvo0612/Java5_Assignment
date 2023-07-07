package assignment.demo.controller;

import assignment.demo.model.Nha;
import assignment.demo.model.TaiKhoan;
import assignment.demo.repository.impl.INhaRepository;
import assignment.demo.repository.impl.ITaiKhoanRepository;
import assignment.demo.util.Util;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.ArrayList;

@Controller
@RequestMapping("/assignment")
public class LoginController {
    @Autowired
    private JavaMailSender emailSender;

    @Autowired
    private ITaiKhoanRepository taiKhoanRepository;

    @Autowired
    private INhaRepository repository;

    @GetMapping("/login")
    public String login() {
        return "login-form";
    }

    private Util util = new Util();

    @GetMapping("/login-acount")
    public String loginTrangChu(Model model
            , @RequestParam(name = "taiKhoan") String taiKhoan
            , @RequestParam(name = "matKhau") String matKhau
            , HttpSession session
    ) {

        TaiKhoan tk = taiKhoanRepository.findTaiKhoanByTenTaiKhoanAndMatKhau(taiKhoan, matKhau);
        if (tk != null) {
            String role = tk.getVaiTro();
            session.setAttribute("role", role);
            session.setAttribute("taiKhoan", tk);
            return "redirect:/assignment/trang-chu";
        }
        String thongBao = "Tai khoan hoac mat khau khong dung. Vui long thu lai";
        model.addAttribute("thongBao", thongBao);
        return "login-form";
    }

    @GetMapping("/logout")
    public String logout(Model model
            , @RequestParam(defaultValue = "1") int page
            , @RequestParam(required = false) String tenNha
            , @RequestParam(required = false) String giaBatDau
            , @RequestParam(required = false) String giaKetThuc
            , HttpSession session
    ) {
        session.removeAttribute("taiKhoan");
        Page<Nha> pageNha;

        if (page < 1) page = 1;

        Pageable pageable = PageRequest.of(page - 1, 6);
        if (tenNha == null || tenNha.isBlank() && giaBatDau == null && giaKetThuc == null) {
            pageNha = repository.findAll(pageable);
        } else if (tenNha != null && giaBatDau == null || giaBatDau.isBlank() && giaKetThuc == null
                || giaKetThuc.isBlank()) {
            pageNha = repository.findByTenNhaContains(tenNha, pageable);
        } else if (tenNha == null || tenNha.isBlank() && giaBatDau != null && giaBatDau != null) {
            pageNha = repository.findByGiaNhaBetween(BigDecimal.valueOf(Float.valueOf(giaBatDau)),
                    BigDecimal.valueOf(Float.valueOf(giaKetThuc)), pageable);
        } else {
            pageNha = repository.findByTenNhaContainsAndGiaNhaBetween(tenNha,
                    BigDecimal.valueOf(Float.valueOf(giaBatDau)),
                    BigDecimal.valueOf(Float.valueOf(giaKetThuc)), pageable);
        }


        model.addAttribute("danhSachNha", pageNha);
        return "index";

    }

    @GetMapping("/view-update-account")
    public String viewUpdate(Model model
            , @RequestParam(name = "taiKhoan") String taiKhoan
            , @RequestParam(name = "matKhau") String matKhau
    ) {
        ArrayList<TaiKhoan> listTaiKhoan = (ArrayList<TaiKhoan>) taiKhoanRepository.findAll();
        for (int i = 0; i < listTaiKhoan.size(); i++) {
            if (listTaiKhoan.get(i).getTenTaiKhoan().equals(taiKhoan) &&
                    listTaiKhoan.get(i).getMatKhau().equals(matKhau)) {
                TaiKhoan tk = taiKhoanRepository.findTaiKhoanByTenTaiKhoan(taiKhoan);
                model.addAttribute("Detail", tk);
                return "update-infor";
            }

        }
        String thongBao = "Tai khoan hoac mat khau khong dung. Vui long thu lai";
        model.addAttribute("thongBao", thongBao);
        return "login-update";


    }

    @GetMapping("/account")
    public String account() {

        return "login-update";


    }

    @PostMapping("/update/acount/{maTaiKhoan}")
    public String updateAcc(Model model, @ModelAttribute TaiKhoan tkhoan,
                            @RequestParam(name = "tenTaiKhoan") String tenTaiKhoan
//            , @PathVariable(name = "maTaiKhoan") Integer ma
    ) {
        taiKhoanRepository.save(tkhoan);
        String thongBao = "Cap nhap thanh cong";
        model.addAttribute("thongBao", thongBao);
        TaiKhoan tk = taiKhoanRepository.findTaiKhoanByTenTaiKhoan(tenTaiKhoan);
        model.addAttribute("Detail", tk);
        return "update-infor2";
    }

    @GetMapping("/view-forgot-password")
    public String viewForgotPassword() {
        return "forgot-password";
    }

    @PostMapping("/forgot-password")
    public String changePassword(Model model, @RequestParam("gmail") String gmail, HttpSession session) {
        resetSession(session);
        ArrayList<TaiKhoan> listAccount;
        listAccount = (ArrayList<TaiKhoan>) taiKhoanRepository.findAll();
        for (TaiKhoan acc : listAccount) {
            if (acc.getGmail().equals(gmail)) {
                String newPassword = util.randomPassword(10);
                var message = Util.setMesageEmail(gmail, newPassword);

                acc.setMatKhau(newPassword);
                taiKhoanRepository.save(acc);
                emailSender.send(message);

//                util.sendEmail(email, newPassword);
//                session.setAttribute("forgotPassword", "Password changed successfully, please check your email");
                return "redirect:/assignment/login";
            }
        }
        model.addAttribute("err", "Email does not exist !");
        return "forgot-password";
    }

    private void resetSession(HttpSession session) {
        session.removeAttribute("err");
        session.removeAttribute("mess");
        session.removeAttribute("forgotPassword");
    }
}
