package assignment.demo.controller;

import assignment.demo.model.HoaDonThongKeTonViewModel;
import assignment.demo.model.HoaDonThongKeViewModel;
import assignment.demo.model.TaiKhoan;
import assignment.demo.repository.impl.IHoaDonChiTietRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/assignment")
public class ThongKeController {
    @Autowired
    private IHoaDonChiTietRepository hoaDonChiTietRepository;

    @GetMapping("/thong-ke")
    public String viewThongKe(Model model
            , @RequestParam(required = false) String locNgay
            , HttpSession session
    ) {

        TaiKhoan tk = (TaiKhoan) session.getAttribute("taiKhoan");
        if (session.isNew()){
            return "redirect:/assignment/login";

        }
        if (tk.getVaiTro().equals("quan ly")) {
            if (locNgay != null) {
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                Date ngay;
                try {
                    ngay = dateFormat.parse(locNgay);
                } catch (ParseException e) {
                    throw new RuntimeException();
                }

                ArrayList<HoaDonThongKeViewModel> list = (ArrayList<HoaDonThongKeViewModel>) hoaDonChiTietRepository.layThongKeTop10BanChayTheo(ngay);
                ArrayList<HoaDonThongKeTonViewModel> listTon = (ArrayList<HoaDonThongKeTonViewModel>) hoaDonChiTietRepository.viewTop10TonKho();
                model.addAttribute("thongKe", list);
                model.addAttribute("thongKeTonKho", listTon);
            } else {
                ArrayList<HoaDonThongKeViewModel> list = (ArrayList<HoaDonThongKeViewModel>) hoaDonChiTietRepository.layThongKeTop10BanChay();
                ArrayList<HoaDonThongKeTonViewModel> listTon = (ArrayList<HoaDonThongKeTonViewModel>) hoaDonChiTietRepository.viewTop10TonKho();
                model.addAttribute("thongKe", list);
                model.addAttribute("thongKeTonKho", listTon);

            }

            return "test/thongke";
        } else {
            return "redirect:/assignment/login";
        }

    }

    @GetMapping("/thong-ke/test")
    public String viewThongKeTest(Model model
//            ,
//                                  @RequestParam(name = "ngay") String locNgay
    ) {
        String ngayLoc = "2023-01-01";
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date ngay;
        try {
            ngay = dateFormat.parse(ngayLoc);
        } catch (ParseException e) {
            throw new RuntimeException();
        }
        ArrayList<HoaDonThongKeViewModel> list = (ArrayList<HoaDonThongKeViewModel>) hoaDonChiTietRepository.layThongKeTop10BanChayTheo(ngay);
        model.addAttribute("thongKe", list);
        return "test/testtk";
    }


}
