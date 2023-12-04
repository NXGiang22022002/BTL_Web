/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import static dao.DBContext.c;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import model.Order;
import model.OrderDetail;
import model.User;

/**
 *
 * @author ADMIN
 */
public class OrderDAO extends DBContext{
    
    public String getDateTime() {
        LocalDateTime currentDateTime = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String formattedDateTime = currentDateTime.format(formatter);
        return formattedDateTime;
    }
    
    public boolean addOrder(Order order){
        try {
            String sql = "INSERT INTO Orders(idUser, order_date, paymentMethod, state) VALUES(?,?,?,?)";
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setInt(1, order.getU().getId());
            ps.setString(2, getDateTime());
            ps.setString(3, order.getPaymentMethod());
            ps.setInt(4, 0);
            ps.executeUpdate();			
            //get id of the new inserted booking
            ResultSet generatedKeys = ps.getGeneratedKeys();
            if (generatedKeys.next()) {
                order.setId(generatedKeys.getInt(1));
                String sqlAddOrderDetail = "INSERT INTO OrderDetail(idOrder, idProduct, quantity) values (?,?,?)";
                String sqlUpdateQuantity = "UPDATE Product SET quantity = ? WHERE id = ?";
                for(OrderDetail orderDetail : order.getList()){
                    ps = c.prepareStatement(sqlAddOrderDetail);
                    ps.setInt(1, order.getId());
                    ps.setString(2, orderDetail.getProduct().getId());
                    ps.setInt(3, orderDetail.getQuantity());
                    ps.executeUpdate();
                    
                    generatedKeys = ps.getGeneratedKeys();
                    if (generatedKeys.next()) {
                        orderDetail.setId(generatedKeys.getInt(1));
                    }
                    
                    ps = c.prepareStatement(sqlUpdateQuantity);
                    // Minus quantity of Product
//                    ps.setInt(1, new productDAO().selectProduct(orderDetail.getProduct().getId()).getQuantity() - orderDetail.getQuantity());
                    ps.setInt(1, orderDetail.getProduct().getQuantity() - orderDetail.getQuantity());
                    ps.setString(2, orderDetail.getProduct().getId());
                    ps.execute();
                }
                
            }
            return true;
        } catch (Exception e) {
        }
        return false;
    }
    
    public void removeOrder(Order order){
        try {
            String sqlDelOrderDetail = "DELETE FROM OrderDetail WHERE idOrder = ?";
            String sql = "DELETE FROM Orders WHERE id = ?";
            String sqlUpdateQuantity = "UPDATE Product SET quantity = ? WHERE id = ?";
            
            for(OrderDetail orderDetail : order.getList()){
                PreparedStatement ps = c.prepareStatement(sqlUpdateQuantity);
                ps.setInt(1, orderDetail.getProduct().getQuantity() + orderDetail.getQuantity());
                ps.setString(2, orderDetail.getProduct().getId());
                ps.executeUpdate();
            }
            
            PreparedStatement ps = c.prepareStatement(sqlDelOrderDetail);
            ps.setInt(1, order.getId());
            ps.execute();
            
            ps = c.prepareStatement(sql);
            ps.setInt(1, order.getId());
            ps.execute();
        } catch (Exception e) {
        }
    }
    
    public ArrayList<OrderDetail> getOrderDetail(int idOrder){
        ArrayList<OrderDetail> a = new ArrayList<>();
        try {
            String sql = "SELECT * FROM OrderDetail WHERE idOrder = ?";
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setInt(1, idOrder);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                a.add(new OrderDetail(rs.getInt("id"), rs.getInt("quantity"), new productDAO().selectProduct(rs.getString("idProduct"))));
            }
        } catch (Exception e) {
        }
        return a;
    }
     public ArrayList<OrderDetail> getALLOrderDetail(){
        ArrayList<OrderDetail> a = new ArrayList<>();
        try {
            String sql = "SELECT * FROM OrderDetail";
            PreparedStatement ps = c.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                a.add(new OrderDetail(rs.getInt("id"), rs.getInt("quantity"), new productDAO().selectProduct(rs.getString("idProduct"))));
            }
        } catch (Exception e) {
        }
        return a;
    }
    
    public ArrayList<Order> getAllOrderByUser(User user){
        ArrayList<Order> a = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Orders WHERE idUser = ?";
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setInt(1, user.getId());
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                a.add(new Order(
                        rs.getInt("id"), 
                        rs.getString("order_date"), 
                        rs.getString("paymentMethod"), 
                        rs.getInt("state"), 
                        new OrderDAO().getOrderDetail(rs.getInt("id")),
                        user,
                        new ShipmentDAO().getShipmentOfOrder(rs.getInt("id")))
                );
            }
        } catch (Exception e) {
        }
        return a;
    }
    public ArrayList<Order> getAllOrder(){
        ArrayList<Order> a = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Orders";
            PreparedStatement ps = c.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                a.add(new Order(
                        rs.getInt("id"), 
                        rs.getString("order_date"), 
                        rs.getString("paymentMethod"), 
                        rs.getInt("state"), 
                        new OrderDAO().getOrderDetail(rs.getInt("id")),
                        new UserDAO().getUserByID(rs.getInt("idUser")),
                        new ShipmentDAO().getShipmentOfOrder(rs.getInt("id")))
                );
            }
        } catch (Exception e) {
        }
        return a;
    }
}
