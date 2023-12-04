/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dao.OrderDAO;
import java.util.*;


/**
 *
 * @author Asus
 */
public class TKCustomer {
    private int idUser,slmua;
    private ArrayList<Product> products;
    private int totalmoney;

    public TKCustomer() {
    }

    public TKCustomer(int idUser, int slmua, ArrayList<Product> products, int totalmoney) {
        this.idUser = idUser;
        this.slmua = slmua;
        this.products = products;
        this.totalmoney = totalmoney;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public int getSlmua() {
        return slmua;
    }

    public void setSlmua(int slmua) {
        this.slmua = slmua;
    }

    public ArrayList<Product> getProducts() {
        return products;
    }

    public void setProducts(ArrayList<Product> products) {
        this.products = products;
    }

    public int getTotalmoney() {
        return totalmoney;
    }

    public void setTotalmoney(int totalmoney) {
        this.totalmoney = totalmoney;
    }
    
    public ArrayList<TKCustomer> getAllTKCustomer() {
    ArrayList<TKCustomer> ds = new ArrayList<>();
    ArrayList<Order> orders = new OrderDAO().getAllOrder();
    Map<Integer, TKCustomer> customerMap = new HashMap<>();

    // Duyệt qua danh sách đơn đặt hàng
    for (Order order : orders) {
        int idUser = order.getU().getId();
        int totalMoney = calculateTotalMoney(order);
        int quantity = calculateTotalQuantity(order);
        ArrayList<Product> products = getDistinctProducts(order);

        // Kiểm tra xem người dùng đã tồn tại trong Map chưa
        if (customerMap.containsKey(idUser)) {
            // Nếu tồn tại, cộng thêm thông tin vào người dùng đã có
            TKCustomer existingCustomer = customerMap.get(idUser);
            existingCustomer.setSlmua(existingCustomer.getSlmua() + quantity);
            existingCustomer.setTotalmoney(existingCustomer.getTotalmoney() + totalMoney);
            existingCustomer.getProducts().addAll(products);
        } else {
            // Nếu chưa tồn tại, tạo mới người dùng và thêm vào Map
            TKCustomer tkCustomer = new TKCustomer(idUser, quantity, products, totalMoney);
            customerMap.put(idUser, tkCustomer);
        }
    }

    // Sắp xếp danh sách theo tổng tiền giảm dần
    ds.addAll(customerMap.values());
    ds.sort(Comparator.comparingInt(TKCustomer::getTotalmoney).reversed());

    return ds;
}


private int calculateTotalMoney(Order order) {
    int totalMoney = 0;
    for (OrderDetail orderDetail : order.getList()) {
        totalMoney += orderDetail.getQuantity() * orderDetail.getProduct().getPrice();
    }
    return totalMoney;
}

private int calculateTotalQuantity(Order order) {
    int totalQuantity = 0;
    for (OrderDetail orderDetail : order.getList()) {
        totalQuantity += orderDetail.getQuantity();
    }
    return totalQuantity;
}

private ArrayList<Product> getDistinctProducts(Order order) {
    ArrayList<Product> distinctProducts = new ArrayList<>();
    for (OrderDetail orderDetail : order.getList()) {
        Product product = orderDetail.getProduct();
        if (!distinctProducts.contains(product)) {
            distinctProducts.add(product);
        }
    }
    return distinctProducts;
}
//public static void main(String[] args) {
//    // Tạo một đối tượng TKCustomer
//    TKCustomer tkCustomer = new TKCustomer();
//
//    // Gọi hàm để lấy danh sách thông tin khách hàng
//    ArrayList<TKCustomer> customerList = tkCustomer.getAllTKCustomer();
//
//    // In thông tin khách hàng
//    for (TKCustomer customer : customerList) {
//        System.out.println("ID Người Dùng: " + customer.getIdUser());
//        System.out.println("Tổng Số Lượng Mua: " + customer.getSlmua());
//        System.out.println("Tổng Số Tiền: " + customer.getTotalmoney());
//
//        System.out.println("Danh Sách Sản Phẩm:");
//        for (Product product : customer.getProducts()) {
//            System.out.println("   - ID Sản Phẩm: " + product.getId());
//            System.out.println("   - Tên Sản Phẩm: " + product.getName());
//            // Thêm các thông tin khác nếu cần
//
//            System.out.println(); // Xuống dòng giữa các sản phẩm
//        }
//
//        System.out.println(); // Xuống dòng giữa các khách hàng
//    }
//}

}
