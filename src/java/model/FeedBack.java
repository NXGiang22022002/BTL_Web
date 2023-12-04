package model;

public class FeedBack {

    private int id;
    private String idProduct;
    private int idUser;
    private String comment;
    private int rate;

    public FeedBack() {
    }

    public FeedBack(int id, String idProduct, int idUser, String comment, int rate) {
        this.id = id;
        this.idProduct = idProduct;
        this.idUser = idUser;
        this.comment = comment;
        this.rate = rate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(String idProduct) {
        this.idProduct = idProduct;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getRate() {
        return rate;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }

   

}