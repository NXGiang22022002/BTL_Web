package model;

import java.util.ArrayList;

public class Product {

    private String id;
    private String name;
    private int price;
    private String image;
    private int quantity;
    private String des;
    private Category cate;
    private ArrayList<FeedBack> list;
    
    
    
    public Product(String id, String name, int price, String image, int quantity, String des, Category cate, ArrayList<FeedBack> list) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.image = image;
        this.quantity = quantity;
        this.des = des;
        this.cate = cate;
        this.list = list;
    }

    public Product() {
    }

    public void setCate(Category cate) {
        this.cate = cate;
    }

    public Category getCate() {
        return cate;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getId() {
        return id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setList(ArrayList<FeedBack> list) {
        this.list = list;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }


    public String getName() {
        return name;
    }

    public int getPrice() {
        return price;
    }

    public String getImage() {
        return image;
    }

    public int getQuantity() {
        return quantity;
    }

    public ArrayList<FeedBack> getList() {
        return list;
    }
    
    
}