package model;

import java.util.ArrayList;

public class OrderDetail {

    private int id;
    private int quantity;
    private Product product;

    public OrderDetail(int id, int quantity, Product product) {
        this.id = id;
        this.quantity = quantity;
        this.product = product;
    }


    public int getId() {
        return id;
    }

    public Product getProduct() {
        return product;
    }


    public int getQuantity() {
        return quantity;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    
}