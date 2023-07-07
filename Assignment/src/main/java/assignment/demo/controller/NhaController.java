package assignment.demo.controller;

import assignment.demo.model.Nha;
import assignment.demo.model.TaiKhoan;
import assignment.demo.repository.impl.INhaRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.ArrayList;

@Controller
@RequestMapping("/assignment")
public class NhaController {
    @Autowired
    private INhaRepository repository;


    @GetMapping("/detail-nha/{maNha}")
    public String viewDetail(Model model
            , @PathVariable(name = "maNha") Integer ma
    ) {

        Nha nha = repository.getNhaByMaNha(ma);
//        nha.getGiaNha().
        model.addAttribute("nhaDetail", nha);
        return "detail";
    }

    @GetMapping("/quan-ly-nha")
    public String viewQuanLyNha(Model model
            , @RequestParam(defaultValue = "1") int page
            , @RequestParam(required = false) String tenNha) {

        Page<Nha> pageNha;

        if (page < 1) page = 1;

        Pageable pageable = PageRequest.of(page - 1, 6);
        if (tenNha == null || tenNha.isBlank()) {
            pageNha = repository.findAll(pageable);
        } else {
            pageNha = repository.findByTenNhaContains(tenNha, pageable);
        }

        model.addAttribute("danhSachNha", pageNha);
        return "management";
    }

    @GetMapping("/sale")
    public String viewsale(Model model
            , @RequestParam(defaultValue = "1") int page
            , @RequestParam(required = false) String tenNha
            , HttpSession session) {
        TaiKhoan tk = (TaiKhoan) session.getAttribute("taiKhoan");
        if (session.isNew()) {
            return "redirect:/assignment/login";

        }
        if (tk.getVaiTro().contains("quan")) {
            Page<Nha> pageNha;

            if (page < 1) page = 1;

            Pageable pageable = PageRequest.of(page - 1, 6);
            if (tenNha == null || tenNha.isBlank()) {
                pageNha = repository.layNhaTonKho(pageable);
            } else {
                pageNha = repository.findByTenNhaContains(tenNha, pageable);
            }

            model.addAttribute("danhSachNha", pageNha);
            return "sale";
        }else{
            return "redirect:/assignment/login";

        }
    }


        @GetMapping("/sale/detail/{maNha}")
        public String viewDetailSale (Model model
            ,@RequestParam(defaultValue = "1") int page
            ,@RequestParam(required = false) String tenNha
            ,@PathVariable(name = "maNha") Integer maNha
            ,HttpSession session){

            TaiKhoan tk = (TaiKhoan) session.getAttribute("taiKhoan");

            if (tk.getVaiTro().contains("quan")) {
                Page<Nha> pageNha;

                if (page < 1) page = 1;

                Pageable pageable = PageRequest.of(page - 1, 6);
                if (tenNha == null || tenNha.isBlank()) {
                    pageNha = repository.layNhaTonKho(pageable);
                } else {
                    pageNha = repository.findByTenNhaContains(tenNha, pageable);
                }
                Nha nha = repository.getNhaByMaNha(maNha);
                model.addAttribute("nhaDetail", nha);
                model.addAttribute("danhSachNha", pageNha);
                return "sale2";
            } else {
                return "redirect:/assignment/login";


            }
        }

        @PostMapping("/sale/update-gia/{maNha}")
        public String updateGialSale (
                @PathVariable(name = "maNha") Integer maNha
                , @RequestParam(name = "giaNha") BigDecimal giaNha
                , @RequestParam(name = "giaMoi") BigDecimal giaMoi
                , HttpSession session){

            TaiKhoan tk = (TaiKhoan) session.getAttribute("taiKhoan");
            if (session.isNew()) {
                return "redirect:/assignment/login";


            }
            if (tk.getVaiTro().contains("quan")) {

                Nha nha = repository.getNhaByMaNha(maNha);
                nha.setGiaNha(giaMoi);
                nha.setGiaCu(giaNha);
                repository.save(nha);

                return "redirect:/assignment/sale";
            } else {
                return "redirect:/assignment/login";

            }
        }

        @PostMapping("/quan-ly-nha/add")
        public String addNha (Model model,
                @RequestParam(name = "tenNha") String ten,
                @RequestParam(name = "soLuong") Integer soLuong,
                @RequestParam(name = "giaNha") BigDecimal giaNha,
                @RequestParam(name = "anhNha") String anhNha,
                @RequestParam(name = "dienTich") Integer dienTich,
                @RequestParam(name = "matTien") Integer matTien,
                @RequestParam(name = "soTang") Integer soTang,
                @RequestParam(name = "soPhongNgu") Integer soPhongNgu,
                @RequestParam(name = "soPhongTam") Integer soPhongTam,
                @RequestParam(name = "moTa") String moTa
    ){
            Nha nha = new Nha(ten, soLuong, giaNha, anhNha, moTa, dienTich, soTang, matTien, soPhongNgu, soPhongTam);
            repository.save(nha);

            return "redirect:/assignment/quan-ly-nha";
        }

        @GetMapping("/quan-ly-nha/detail/{maNha}")
        public String viewDetailQuanLy (Model model,
        @RequestParam(defaultValue = "1") int page,
        @RequestParam(required = false) String tenNha,
        @PathVariable(name = "maNha") Integer ma){

            Page<Nha> pageNha;

            if (page < 1) page = 1;

            Pageable pageable = PageRequest.of(page - 1, 6);
            if (tenNha == null || tenNha.isBlank()) {
                pageNha = repository.findAll(pageable);
            } else {
                pageNha = repository.findByTenNhaContains(tenNha, pageable);
            }
            Nha nha = repository.getNhaByMaNha(ma);
            model.addAttribute("nhaDetail", nha);
            model.addAttribute("danhSachNha", pageNha);
            return "update-nha";
        }

        @GetMapping("/quan-ly-nha/delete/{maNha}")
        public String deleteNha (Model model,
                @PathVariable(name = "maNha") Integer ma
    ){

            Nha nha = repository.getNhaByMaNha(ma);
            repository.delete(nha);

            return "redirect:/assignment/quan-ly-nha";
        }

        @PostMapping("/quan-ly-nha/update/{maNha}")
        public String updateNha (Model model,
                @PathVariable(name = "maNha") Integer ma,
                @RequestParam(name = "tenNha") String ten,
                @RequestParam(name = "soLuong") Integer soLuong,
                @RequestParam(name = "giaNha") BigDecimal giaNha,
                @RequestParam(name = "anhNha") String anhNha,
                @RequestParam(name = "dienTich") Integer dienTich,
                @RequestParam(name = "matTien") Integer matTien,
                @RequestParam(name = "soTang") Integer soTang,
                @RequestParam(name = "soPhongNgu") Integer soPhongNgu,
                @RequestParam(name = "soPhongTam") Integer soPhongTam,
                @RequestParam(name = "moTa") String moTa
    ){
            Nha nha = new Nha(ma, ten, soLuong, giaNha, anhNha, moTa, dienTich, soTang, matTien, soPhongNgu, soPhongTam);
            repository.saveAndFlush(nha);

            return "redirect:/assignment/quan-ly-nha";
        }


        @GetMapping("/nha")
        public String view (Model model
            ,@RequestParam(defaultValue = "1") int page
            ,@RequestParam(required = false) String tenNha
            ,@RequestParam(required = false) String giaBatDau
            ,@RequestParam(required = false) String giaKetThuc
    ){

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
            return "buy";
        }

        @GetMapping("/trang-chu")
        public String viewHome (Model model
            ,@RequestParam(defaultValue = "1") int page
            ,@RequestParam(required = false) String tenNha
            ,@RequestParam(required = false) String giaBatDau
            ,@RequestParam(required = false) String giaKetThuc
    ){

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
            return "buy";
        }
    }
