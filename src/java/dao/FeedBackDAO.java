package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.FeedBack;
import model.User;

public class FeedBackDAO extends DBContext {

    public ArrayList<FeedBack> getListFeedBack() {
        ArrayList<FeedBack> FeedBacks = new ArrayList<>();
        try {
            String select = "SELECT * FROM FeedBack";
            PreparedStatement ps = c.prepareStatement(select);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                FeedBacks.add(
                        new FeedBack(
                                rs.getInt("id"),
                                rs.getString("idProduct"),
                                rs.getInt("idUser"),
                                rs.getString("comment"),
                                rs.getInt("rate")
                        ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return FeedBacks;
    }

    public ArrayList<FeedBack> getFeedBack(String id) {
        ArrayList<FeedBack> a = new ArrayList<>();
        try {
            String sql = "SELECT * FROM idProduct = ?";
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                a.add(new FeedBack(rs.getInt("id"), rs.getString("idProduct"), rs.getInt("idUser"), rs.getString("comment"), rs.getInt("rate")));
            }
        } catch (Exception e) {
        }
        return a;
    }

    public boolean addFeedBack(FeedBack fb) {
    try {
        // Loại bỏ cột 'id' khỏi danh sách cột
        String sql = "INSERT INTO FeedBack(idProduct, idUser, comment, rate) VALUES(?, ?, ?, ?)";
        PreparedStatement ps = c.prepareStatement(sql);

        // Đặt giá trị cho các cột khác
        ps.setString(1, fb.getIdProduct());
        ps.setInt(2, fb.getIdUser());
        ps.setString(3, fb.getComment());
        ps.setInt(4, fb.getRate());

        ps.execute();
        return true;
    } catch (Exception e) {
        e.printStackTrace();
    }
    return false;
}

}
