package assignment.demo.controller;

import assignment.demo.entitis.CartItem;
import assignment.demo.model.Nha;
import assignment.demo.repository.impl.INhaRepository;
import assignment.demo.util.CartItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.*;

@Controller
@RequestMapping("/assignment")
public class GioHangController {
    @Autowired
    private CartItemService shoppingCartService;

    @Autowired
    private INhaRepository productService;


    @GetMapping("/cart")
    public String viewCart(Model model) {
        model.addAttribute("danhSachNhaTrongGio", shoppingCartService.getAllItems());
        model.addAttribute("TOTAL", shoppingCartService.getAmount());
//        BigDecimal tongTien = shoppingCartService.layTongTien((ArrayList<CartItem>) shoppingCartService.getAllItems());
//        model.addAttribute("tongTien", tongTien);

        return "cart";
    }

    @PostMapping("/add-to-cart/{maNha}")
    public String addCart(@PathVariable("maNha") Integer id, Model model) {
        Optional<Nha> product = productService.findById(id);
        if (product != null) {
            CartItem cartitem = new CartItem();
            cartitem.setMaNha(product.get().getMaNha());
            cartitem.setAnhNha(product.get().getAnhNha());
            cartitem.setTenNha(product.get().getTenNha());
            cartitem.setGiaNha(product.get().getGiaNha());
            cartitem.setSoLuong(1);
            shoppingCartService.add(cartitem);
        }

        return "redirect:/assignment/cart";
    }

    @GetMapping("/clear-cart")
    public String clearCart() {
        shoppingCartService.clear();
        return "redirect:/assignment/cart";
    }

    @GetMapping("/removeCart/{id}")
    public String clearCart(@PathVariable("id") Integer id) {
        shoppingCartService.remove(id);
        return "redirect:/assignment/cart";
    }

    @PostMapping("/giamSL/{maNha}")
    public String giamSL(@PathVariable(name = "maNha") Integer id) {
        shoppingCartService.giamSL(id);
        return "redirect:/assignment/cart";
    }

    @PostMapping("/tangSL/{maNha}")
    public String tangSL(@PathVariable(name = "maNha") Integer id) {
        shoppingCartService.tangSL(id);
        return "redirect:/assignment/cart";
    }
}
