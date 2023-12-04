package dao;

import java.sql.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;
import model.Cart;
import model.CartItem;
import model.Order;
import model.OrderDetail;
import model.User;


public class UserDAO extends DBContext{
    
    public String getDateTime() {
        LocalDateTime currentDateTime = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String formattedDateTime = currentDateTime.format(formatter);
        return formattedDateTime;
    }
    
    public boolean addUser(User user){
        try {
            String insert = "INSERT INTO Users (email, name, password, phone, address, role) VALUES (?, ? ,? ,? ,?, ?)";
            PreparedStatement ps = c.prepareStatement(insert);
            ps.setString(1, user.getEmail());
            ps.setString(2, user.getName());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getPhone());
            ps.setString(5, user.getAddress());
            ps.setString(6, "user");
            
            ps.executeUpdate();
            ResultSet generatedKeys = ps.getGeneratedKeys();
            if(generatedKeys.next())
                user.setId(generatedKeys.getInt(1));
            new cartDAO().addCart(user.getId());
            
            return true;
        } catch(Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean UpdateUser(User user){
        try{
            String sql = "UPDATE Users set name = ?, phone = ?, address = ? where email = ?";
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setString(1, user.getName());
            ps.setString(2, user.getPhone());
            ps.setString(3, user.getAddress());
            ps.setString(4, user.getEmail());
            ps.execute();
            return true;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean deleteUser(String email){
        try{
            String sql = "DELETE FROM Users where email = ?";
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setString(1, email);
            ps.execute();
            return true;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return  false;
    }
    
    private ArrayList<User> users; // Thêm thuộc tính users

    // ...

    public ArrayList<User> getUsers(){
        if (users == null) {
            users = new ArrayList<>();
            try {
                String select = "SELECT * FROM Users";
                PreparedStatement ps=c.prepareStatement(select);
                ResultSet rs = ps.executeQuery();
                while (rs.next()){
                    users.add(
                        new User(rs.getInt("id"), rs.getString("email"), rs.getString("name"), rs.getString("phone"), rs.getString("address"), rs.getString("password"), rs.getString("role")
                    ));
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return users;
    }
    
    public ArrayList<User> getUserByName(String name){
        ArrayList<User> user = new ArrayList<>();
        try {
            String select = "SELECT * FROM Users where LOWER(name) LIKE ?";
            PreparedStatement ps=c.prepareStatement(select);
            ps.setString(1, "%" + name.toLowerCase() + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                user.add(
                    new User(rs.getInt("id"), rs.getString("email"), rs.getString("name"), rs.getString("phone"), rs.getString("address"), rs.getString("password"), rs.getString("role")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
    public User getUserByID(int id){
        User user = null;
        try {
            String select = "SELECT * FROM Users where LOWER(id) LIKE ?";
            PreparedStatement ps=c.prepareStatement(select);
            ps.setInt(1,id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                  user =  new User(rs.getInt("id"), rs.getString("email"), rs.getString("name"), rs.getString("phone"), rs.getString("address"), rs.getString("password"), rs.getString("role")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
    
    public boolean login(User user){
        String select= "select id, name, phone, address, role from Users where email = ? and password = ?";  
        try{
            PreparedStatement ps=c.prepareStatement(select);
            ps.setString(1, user.getEmail());
            ps.setString(2, user.getPassword());
            
            ResultSet rs=ps.executeQuery();
            
            if(rs.next()){
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setPhone(rs.getString("phone"));
                user.setAddress(rs.getString("address"));
                user.setRole(rs.getString("role"));
               return true;
            }
            return false;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public String getName(String email){
        boolean isLogin = false;
        String select= "select name from Users "+" where email = ?";  
        try {
            PreparedStatement ps=c.prepareStatement(select);
            ps.setString(1, email);
            ResultSet rs=ps.executeQuery();
            isLogin=rs.next();
            return rs.getString("name");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }
    
    
    public boolean huyDonHang(int id){
        try {
            String insert = "DELETE FROM donhang WHERE order_id = ?";
            PreparedStatement ps = c.prepareStatement(insert);
            ps.setInt(1, id);
            ps.execute();
            return true;
        } catch(Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
//    public boolean insertDonHang(String email, String fullname, String phone, String address, String tensp, int soluong, String paymentMethod, int tongtien){
//        try {
//            String insert = "INSERT INTO donhang(email, fullname, phone, address, tensp, order_date, soluong, payment_method, tongtien) VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?)";
//            PreparedStatement ps = c.prepareStatement(insert);
//            ps.setString(1, email);
//            ps.setString(2, fullname);
//            ps.setString(3, phone);
//            ps.setString(4, address);
//            ps.setString(5, tensp);  
//            ps.setString(6, getDateTime());
//            ps.setInt(7, soluong);   
//            ps.setString(8, paymentMethod);   
//            ps.setInt(9, tongtien);   
//            ps.execute();
//            return true;
//        } catch(Exception e) {
//            e.printStackTrace();
//        }
//        return false;
//    }
    
//    public boolean login(User user){
//        String select= "select name, phone, address, role from profile where email = ? and password = ?";  
//        try{
//            PreparedStatement ps=c.prepareStatement(select);
//            ps.setString(1, user.getEmail());
//            ps.setString(2, user.getPassword());
//            
//            ResultSet rs=ps.executeQuery();
//            
//            if(rs.next()){
//                user.setName(rs.getString("name"));
//                user.setPhone(rs.getString("phone"));
//                user.setAddress(rs.getString("address"));
//                user.setRole(rs.getString("role"));
//               return true;
//            }
//            return false;
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return false;
//    }
//    
//    public String getName(String email){
//        boolean isLogin = false;
//        String select= "select name from User "+" where email = ?";  
//        try {
//            PreparedStatement ps=c.prepareStatement(select);
//            ps.setString(1, email);
//            ResultSet rs=ps.executeQuery();
//            isLogin=rs.next();
//            return rs.getString("name");
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return "";
//    }
    
//    public ArrayList<Order> getAllOrder(String email){
//        ArrayList<Order> result = new ArrayList<>();
//        try {
//            String select = "SELECT * FROM donhang WHERE email = ?";
//            PreparedStatement ps=c.prepareStatement(select);
//            
//            ps.setString(1, email);
//            ResultSet rs = ps.executeQuery();
//            while (rs.next()){
//                result.add(new Order(rs.getInt("order_id"), rs.getString("email"), rs.getString("fullname"),rs.getString("phone") , rs.getString("address"), rs.getString("tensp"), rs.getString("order_date"), rs.getInt("soluong"), rs.getString("payment_method"), rs.getInt("tongtien")));
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return result;
//    }
//    private ArrayList<User> users; // Thêm thuộc tính users
//
//    // ...
//
//    public ArrayList<User> getUsers(){
//        if (users == null) {
//            users = new ArrayList<>();
//            try {
//                String select = "SELECT * FROM User";
//                PreparedStatement ps=c.prepareStatement(select);
//                ResultSet rs = ps.executeQuery();
//                while (rs.next()){
//                    users.add(
//                        new User(rs.getInt("id"), rs.getString("email"), rs.getString("name"), rs.getString("phone"), rs.getString("address"), rs.getString("password"), rs.getString("role")
//                    ));
//                }
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
//        }
//        return users;
//    }
//    
//    public ArrayList<User> getUserByName(String name){
//        ArrayList<User> user = new ArrayList<>();
//        try {
//            String select = "SELECT * FROM User where LOWER(name) LIKE ?";
//            PreparedStatement ps=c.prepareStatement(select);
//            ps.setString(1, "%" + name.toLowerCase() + "%");
//            ResultSet rs = ps.executeQuery();
//            while (rs.next()){
//                user.add(
//                    new User(rs.getInt("id"), rs.getString("email"), rs.getString("name"), rs.getString("phone"), rs.getString("address"), rs.getString("password"), rs.getString("role")
//                ));
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return user;
//    }
}