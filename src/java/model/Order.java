package model;

import java.util.ArrayList;

public class Order {

    private int id;
    private String order_date;
    private String paymentMethod;
    private int state;
    private ArrayList<OrderDetail> list;
    private User u;
    private Shipment shipment;

    public Order(int id, String order_date, String paymentMethod, int state, ArrayList<OrderDetail> list, User u, Shipment shipment) {
        this.id = id;
        this.order_date = order_date;
        this.paymentMethod = paymentMethod;
        this.state = state;
        this.list = list;
        this.u = u;
        this.shipment = shipment;
    }

    public Shipment getShipment() {
        return shipment;
    }

    public void setShipment(Shipment shipment) {
        this.shipment = shipment;
    }
    
    public Order() {
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public int getId() {
        return id;
    }

    public ArrayList<OrderDetail> getList() {
        return list;
    }

    public String getOrder_date() {
        return order_date;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }


    public User getU() {
        return u;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setList(ArrayList<OrderDetail> list) {
        this.list = list;
    }

    public void setOrder_date(String order_date) {
        this.order_date = order_date;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public void setU(User u) {
        this.u = u;
    }
    
}