<%-- 
    Document   : ChitietSanpham
    Created on : Dec 2, 2023, 4:03:54 PM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="model.*"%>
<%@page import="dao.*"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Lention</title>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,500;0,700;1,500&family=Rubik+Distressed&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
        <link rel="stylesheet" href="fontawesome-free-6.3.0-web/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <link rel="stylesheet" href="./css/chitietsanpham.css">
        <script src="./js/chitietsanpham.js"></script>
        <script src="https://kit.fontawesome.com/6d254ad403.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="header">
            <div class="header_icon">
                <ul class="headericon">
                    <li class="icon1">
                        <a href=""><i class="fa-brands fa-facebook" ></i></a>
                    </li>
                    <li class="icon1">
                        <a href=""><i class="fa-brands fa-twitter" ></i></a>
                    </li>
                    <li class="icon1">
                        <a href=""><i class="fa-brands fa-google-plus-g" ></i></a>
                    </li>
                    <li class="icon1">
                        <a href=""><i class="fa-brands fa-youtube"></i></a>
                    </li>
                    <li class="icon1">
                        <a href=""><i class="fa-brands fa-linkedin-in" ></i></a>
                    </li>

                </ul>
            </div>
            <div class="header_item">
                <ul class="item_logo">
                    <li class="logo">
                        <a href="homeServlet"> <img src="http://cdn0308.cdn4s.com/media/logo/logo.png"></a>
                    </li>
                </ul>
                <ul class="item_navbar">
                    <li class="navbar">
                        <a href="sanpham.jsp">Sản phẩm</a>
                        <div class="header_navbar">
                            <ul class="header_navbar-sanpham">
                                <li>
                                    <a href="Docking.html">Docking Station</a>
                                </li>
                                <li>
                                    <a href="hub.html">HUBS</a>
                                </li>
                                <li >
                                    <a href="cap.html">Cáp các loại</a>
                                </li>
                                <li >
                                    <a href="phukien.html">Phụ kiện khác</a>
                                </li>
                            </ul>                          
                        </div>
                    </li> 
                    <li class="navbar">
                        <a href="support.html">Hỗ trợ</a>
                    </li>   
                    <li class="navbar">
                        <a href="about-us.html">Về chúng tôi</a>
                    </li>
                    <li class="navbar">
                        <a href="liên-hệ.html">Mua ở đâu</a>
                    </li>
                    <li class="navbar">
                        <a href="group.html">Group</a>
                    </li>
                </ul>
                <ul class="item_icon">
                    <li class="item__icon">
                        <a href=""><i class="fa-regular fa-user"></i></a>
                    </li>
                    <li class="item__icon">
                        <a href=""><i class="fa-solid fa-magnifying-glass"></i></a>
                    </li>
                    <li class="item__icon">
                        <a href=""><i class="fa-solid fa-cart-plus"></i></a>
                    </li>

                    </li>
                </ul>
            </div>
            <div class="header_list">
                <button class="list-js">Giao hàng miễn phí với đơn hàng trên 5.000.000 vnđ</button>
                <button class="list-js__2">Chính sách trả và đổi hàng trong vòng 30 ngày</button>
                <button class="list-js__3">Bảo hành chất lượng sản phẩm lên tới 12 tháng</button>
                <button class="list-js__4">Hỗ trợ khách hàng 24/7</button>
            </div>
        </div>
        <!-- body -->
        <div class="body"
             <%
     // Lấy thông tin sản phẩm từ URL (tham số id)
     String productId = request.getParameter("id");

     // Kiểm tra xem id có tồn tại và có là một số nguyên không
     if (productId != null) {
         // Lấy thông tin sản phẩm từ cơ sở dữ liệu
         productDAO proDAO = new productDAO();
         Product product = proDAO.getProductById(productId);

         // Kiểm tra xem sản phẩm có tồn tại không
         if (product != null) {
             %>
             <div class="home_page">
            <a href="homeServlet">Trang chủ ></a> <b><%= product.getName()%></b>
        </div>

        <!-- Hiển thị thông tin chi tiết của sản phẩm -->
        <div class=chitietsanpham >
            <table class="pro_table">
                <tr>
                    <td> <img src="<%= product.getImage() %>" alt="<%= product.getName() %>"></td>
                    <td>
                <b1 class="pro_name"><%= product.getName()%></b1><br>
                <p1 class="pro_id"> <b>Mã sản phẩm:</b> <%= product.getId()%></p1><br>
                <p2>Giá: <%= product.getPrice() %> VND</p2><br>
                <p3 class="pro_sl"><b>Số lượng còn:</b> <%= product.getQuantity() %></p3><br>
                <div nh-quantity-product="wrap" class="product-quantity">
                    <span class="btn-quantity" onclick="decreaseQuantity()">
                        <i class="fas fa-minus-circle"></i>
                    </span>

                    <input nh-quantity-product="quantity" value="1" class="text-center quantity-input events-none" type="text" id="quantityInput">

                    <span  class="btn-quantity" onclick="increaseQuantity()">
                        <i class="fas fa-plus-circle"></i>
                    </span>
                </div>
                <form action="update" method="get">
                    <input type="submit" class="pro_addcart" value="Thêm giỏ hàng">
                </form>
                <form action="dathang" method="post">
                    <input type="submit" class="pro_buy" value="Đặt hàng">
                </form>
                <p4 class="pro_mota"><b>Mô tả:</b> <%= product.getDes().replaceAll("\n", "<br>")%></p4><br>

                </td>
                </tr>
            </table>
        </div>

        <%}
       }%>
    </div>


    <!-- Phần bình luận và đánh giá -->
    <div class="comment-section">
        <h3>Bình luận và đánh giá sản phẩm</h3>

        <!-- Hiển thị danh sách bình luận và đánh giá -->
        <div class="comment-list" id="commentList">
            <% 
                int iduser = 2; // Lấy user id từ session
                FeedBackDAO fbDAO = new FeedBackDAO();
                ArrayList<FeedBack> listfb = fbDAO.getListFeedBack();
                int count = 0;
                for (FeedBack comment : listfb) {
                    if (comment.getIdProduct().equals(productId)) {
                        count++;
                        UserDAO uDAO = new UserDAO();
                        User u = uDAO.getUserByID(comment.getIdUser());
            %>
            <div class="comment" <% if (count > 5) { %>style="display: none;"<% } %>>
                <div class="user-info">
                    <h4><%= u.getName() %>:</h4>
                </div>
                <div class="comment-details">
                    <p><%= comment.getComment() %></p>
                    <p>Đánh giá:</p>
                    <div class="star-icons" id="star-icons_<%= comment.getId() %>">
                    </div>
                </div>
            </div>
            <script>
                document.getElementById("star-icons_<%= comment.getId() %>").innerHTML = getStarIcons(<%= comment.getRate() %>);
            </script>
            <% }} %>
        </div>

        <!-- Nút Xem thêm -->
        <button class="btn_xemthem" id="viewMoreBtn" onclick="viewMoreComments()">Xem thêm</button>
    </div>




    <%--    <div class="comment-section">
            <h3>Bình luận và đánh giá sản phẩm</h3>

         Hiển thị danh sách bình luận và đánh giá 
        <div class="comment-list">
            <% 
                int iduser = 2; //lay user id t? secsion
                FeedBackDAO fbDAO = new FeedBackDAO();
                ArrayList<FeedBack> listfb = fbDAO.getListFeedBack();
                for (FeedBack comment : listfb) {
                    if (comment.getIdProduct().equals(productId)) {
                        UserDAO uDAO = new UserDAO();
                        User u = uDAO.getUserByID(comment.getIdUser());
            %>
            <div class="comment">
                <div class="user-info">
                    <h4><%= u.getName() %>:</h4>
                </div>
                <div class="comment-details">
                    <p><%= comment.getComment() %></p>
                    <p>Đánh giá:</p>
                    <div class="star-icons" id="star-icons_<%= comment.getId() %>">
                    </div>
                </div>
            </div>
            <script>
                document.getElementById("star-icons_<%= comment.getId() %>").innerHTML = getStarIcons(<%= comment.getRate() %>);
            </script>
            <% }} %>
        </div>--%>



    <!-- Form bình luận -->
    <form action="processfeedback" method="post" class="comment-form">
        <label for="content">Nội dung:</label>
        <textarea name="content" required></textarea>

        <label for="rating">Đánh giá:</label>
        <select name="rating" required>
            <option value="0"></option>
            <option value="1">&#9733;</option>
            <option value="2">&#9733;&#9733;</option>
            <option value="3">&#9733;&#9733;&#9733;</option>
            <option value="4">&#9733;&#9733;&#9733;&#9733;</option>
            <option value="5">&#9733;&#9733;&#9733;&#9733;&#9733;</option>
        </select>

        <input type="hidden" name="idUser" value="<%= iduser %>">
        <input type="hidden" name="idProduct" value="<%= productId %>">
        <input type="submit" value="Gửi bình luận">
    </form>
</div>


<!-- footer -->
<div class="footer">
    <div class="boxcenter">
        <div class="row1">
            <a href="">
                <img
                    src="http://cdn0308.cdn4s.com/media/gioi-thieu/gioi-thieu.jpg"
                    style="width: 960px; height: 430px"
                    />
            </a>
        </div>
        <div class="row2">
            <h2 class="heading" style="font-size: 150%">
                CÔNG TY CỔ PHẦN THƯƠNG <br />
                MẠI KIẾN HƯNG VIỆT NAM
            </h2>
            <div>
                LENTION là thương hiệu toàn cầu chuyên về phụ kiện kỹ thuật số như bộ
                điều hợp, chuyển đổi, đế cắm, cáp và các phụ kiện dành cho laptop,
                tablet khác, cung cấp các giải pháp tốt nhất và đáp ứng nhu cầu sáng
                tạo cho khách hàng.
            </div>
            <br />
            <div>
                Là một thương hiệu dựa trên khách hàng, Lention nhấn mạnh vào việc
                kiểm soát chất lượng nghiêm ngặt và hoàn thành các dịch vụ sau bán
                hàng. Bằng cách chia sẻ ý tưởng về các sản phẩm và dịch vụ, chúng tôi
                hy vọng mọi khách hàng đều có thể cảm nhận được sự cải tiến và lợi ích
                mang lại từ các sản phẩm và nhận ra khái niệm LENTION. KIẾN HƯNG tự
                hào là nhà phân phối chính hãng các sản phẩm mang thương hiệu LENTION,
                quý khách có nhu cầu đặt hàng vui lòng liên hệ chúng tôi để biết thêm
                chi tiết.
            </div>
        </div>
    </div>
    <hr class="hrColor" />
    <div class="table">
        <div class="table1">
            <h3 class="heading" style="font-size: 130%">
                CÔNG TY CỔ PHẦN THƯƠNG MẠI KIẾN HƯNG VIỆT NAM
            </h3>
            <div class="info">
                <div>
                    KIẾN HƯNG tự hào là nhà phân phối chỉnh hãng các sản phẩm mang
                    thương hiệu LENTION, quý khách có nhu cầu <br />đặt hàng vui lòng
                    liên hệ chúng tôi để biết thêm chi tiết.
                </div>
                <br />
                <div>
                    <b>Địa chỉ :</b> Số nhà 5A, ngõ 4, đường Lý Tự Trọng, Phường La Khê,
                    Quận Hà Đông
                </div>
                <br />
                <div><b>Số điện thoại : </b>0922103999</div>
                <br />
                <div><b>Email :</b> kienhungvncompany@gmail.com</div>
                <br />
                <div>Thời gian làm việc: 8-17h</div>
                <br />
                <div class="icon-container">
                    <div class="icon">
                        <a href=""><i class="fa-brands fa-facebook-f"></i></a>
                    </div>
                    <div class="icon">
                        <a href=""><i class="fa-brands fa-twitter"></i></a>
                    </div>
                    <div class="icon">
                        <a><i class="fa-brands fa-google-plus-g"></i></a>
                    </div>
                    <div class="icon">
                        <a href=""><i class="fa-brands fa-youtube"></i></a>
                    </div>
                    <div class="icon">
                        <a href=""><i class="fa-brands fa-linkedin"></i></a>
                    </div>
                </div>
            </div>
        </div>

        <div class="table2">
            <ul class="row_boxfooter2">
                <h3 class="heading" style="font-size: 130%">VỀ CHÚNG TÔI</h3>
                <p><a href="">Liên hệ</a></p>
                <p><a href="">Chính sách vận chuyển</a></p>
                <p><a href="">Chính sách bảo hành</a></p>
                <p><a href="">Chính sách đổi trả</a></p>
                <p><a href="">Tin khuyến mãi</a></p>
                <p><a href="">Hệ thống đại lý</a></p>
            </ul>
        </div>

        <div class="table3">
            <div class="row boxfooter3">
                <h3 class="heading" style="font-size: 130%">MAP</h3>
                <iframe
                    src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d14902.090252383596!2d105.769882!3d20.97168!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x313453262cb85207%3A0x2c3d48f455e506c!2zNCBMw70gVOG7sSBUcuG7jW5nLCBQLiBRdWFuZyBUcnVuZywgSMOgIMSQw7RuZywgSMOgIE7hu5lpLCBWaeG7h3QgTmFt!5e0!3m2!1svi!2sus!4v1678213773058!5m2!1svi!2sus"
                    width="300"
                    height="300"
                    style="border: 0"
                    allowfullscreen=""
                    loading="lazy"
                    referrerpolicy="no-referrer-when-downgrade"
                    ></iframe>
            </div>
        </div>
    </div>
    <div class="copyright">
        <hr class="hrColor" />
        <p>Copyright © 2021 Lention All rights reserved.</p>
    </div>
</div>
<script src="./js/slider.js"></script>
</body>
</html>

