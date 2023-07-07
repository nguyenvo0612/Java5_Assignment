package assignment.demo.util;

import assignment.demo.entitis.CartItem;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public interface CarrtItemService {
    public void add(CartItem item);

    public void remove(int id);

    public CartItem update(int proD, int qty);

    public void clear();

    public Collection<CartItem> getAllItems();

    public int getCount();

    public double getAmount();

    public BigDecimal layTongTien(ArrayList<CartItem> cart);
}
