package assignment.demo.util;

import assignment.demo.entitis.CartItem;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.*;

@Service
public class CartItemService implements CarrtItemService {
    Map<Integer, CartItem> maps = new HashMap<>();

    @Override
    public void add(CartItem item) {
        CartItem cartitem = maps.get(item.getMaNha());
        if (cartitem == null) {
            maps.put(item.getMaNha(), item);
        } else {
            cartitem.setSoLuong(cartitem.getSoLuong() + 1);
        }
    }

    @Override
    public void remove(int id) {
        maps.remove(id);
    }

    @Override
    public CartItem update(int proD, int qty) {
        CartItem cartitem = maps.get(proD);
        cartitem.setSoLuong(qty);
        return cartitem;
    }

    @Override
    public void clear() {
        maps.clear();
    }

    @Override
    public Collection<CartItem> getAllItems() {
        return maps.values();
    }

    @Override
    public int getCount() {
        return maps.values().size();
    }

    @Override
    public double getAmount() {
        return maps.values().stream()
                .mapToDouble(item -> item.getSoLuong() * Double.valueOf(item.getGiaNha().doubleValue()))
                .sum();
    }

    @Override
    public BigDecimal layTongTien(ArrayList<CartItem> cart) {
        if (cart == null) {
            return new BigDecimal(0);
        }
        if (cart.isEmpty()) {
            return new BigDecimal(0);
        }
        float count = 0;
        for (int i = 0; i < cart.size(); i++) {
            float price = cart.get(i).getGiaNha().floatValue();
            float quantity = cart.get(i).getSoLuong().floatValue();
            count += price * quantity;
        }
        return new BigDecimal(count);
    }

    public CartItem giamSL(int proD) {
        CartItem cartitem = maps.get(proD);
        Integer slHT = cartitem.getSoLuong();
        cartitem.setSoLuong(slHT - 1);
        return cartitem;
    }

    public CartItem tangSL(int proD) {
        CartItem cartitem = maps.get(proD);
        Integer slHT = cartitem.getSoLuong();
        cartitem.setSoLuong(slHT + 1);
        return cartitem;
    }
}
