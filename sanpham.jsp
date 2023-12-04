<%-- 
    Document   : sanpham.jsp
    Created on : Dec 2, 2023, 2:35:05 PM
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

        <link rel="stylesheet" href="./css/sanpham.css">
        <script src="https://kit.fontawesome.com/6d254ad403.js" crossorigin="anonymous"></script>

    </head>
    <body>
        <div class="header">
            <div class="header_icon">
                <ul class="headericon">
                    <li class="icon1">
                        <a href=""><i class="fa-brands fa-facebook" style="color:black"></i></a>
                    </li>
                    <li class="icon1">
                        <a href=""><i class="fa-brands fa-twitter" style="color:black"></i></a>
                    </li>
                    <li class="icon1">
                        <a href=""><i class="fa-brands fa-google-plus-g" style="color:black"></i></a>
                    </li>
                    <li class="icon1">
                        <a href=""><i class="fa-brands fa-youtube" style="color:black"></i></a>
                    </li>
                    <li class="icon1">
                        <a href=""><i class="fa-brands fa-linkedin-in" style="color:black"></i></a>
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
                        <a href=""><i class="fa-regular fa-user"style="color:black"></i></a>
                    </li>
                    <li class="item__icon">
                        <a href=""><i class="fa-solid fa-magnifying-glass"style="color:black"></i></a>
                    </li>
                    <li class="item__icon">
                        <a href=""><i class="fa-solid fa-cart-plus"style="color:black"></i></a>
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
        
        <div class="body">
            <div class="home_page">
                <a href="homeServlet">Trang chủ ><b>Danh sách sản phẩm</b></a>
            </div>
            <div class="product">
                <div class="product_list">
                    <ul >
                        <h3>Danh Mục</h3>
                        <li class="ngunam-docking">
                            <a  href="Docking.html">Docking Station</a>
                        </li>
                        <li class="ngunam-hub">
                            <a  href="hub.html">HUBS</a>
                        </li>
                        <li class="ngunam-cap">
                            <a   href="cap.html">Cáp các loại</a>
                        </li>
                        <li class="ngunam-phukien">
                            <a  href="phukien.html">Phụ kiện khác</a>
                        </li>
                    </ul>
                </div>
                <%
    // Lấy giá trị trang từ tham số trong URL, mặc định là 1 nếu không có
    int currentPage = (request.getParameter("page") != null) ? Integer.parseInt(request.getParameter("page")) : 1;

    productDAO proDAO = new productDAO();
    ArrayList<Product> products = proDAO.getProduct();
    int productsPerPage = 8;
    int startIdx = (currentPage - 1) * productsPerPage;
    int endIdx = Math.min(currentPage * productsPerPage, products.size());

    // Kiểm tra xem trang hiện tại có hợp lệ hay không
    if (currentPage <= 0 || startIdx >= products.size()) {
        response.sendRedirect(request.getContextPath() + "/your-product-jsp-page.jsp"); // Chuyển hướng đến trang mặc định nếu trang không hợp lệ
    }
                %>
                <div class="product_container">
                    <div class="product_header">
                        <h3>Hiện thị:<a href="">12</a>/<a href="">24</a>/<a href="">36</a></h3>
                        <h3 class="product_header-sort">Sắp xếp </h3>
                    </div>
                    <div class="grid__row">
                        <% 
                for (int i = startIdx; i < endIdx; i++) {
                    Product product = products.get(i);
                        %>
                        <div class="grid__column-4" style="margin-left: 48px;">
                            <div class="item-border">
                                <a href="ChitietSanpham.jsp?id=<%= product.getId() %>" class="item-list__img" target="_blank" title="<%=product.getName()%>">
                                    <div class="item-list__img--display" style="background-image:url(<%=product.getImage()%>)">
                                    </div>
                                    <div class="item-list__img--hidden" style="background-image:url(<%=product.getImage()%>)">
                                    </div>
                                    <div class="item-list__img--outstand">
                                        nổi bật
                                    </div>
                                    <div class="item-list__img--option">
                                        <ul class="item-list__img--option-list">
                                            <li class="item-list__img--option-item">
                                                <a href="" class="item-list__img--option-link" title="chi tiết" target="_blank">
                                                    <i class="fa-solid fa-star"></i>
                                                </a>
                                            </li>
                                            <li class="item-list__img--option-item">
                                                <a href="" class="item-list__img--option-link" title="xem nhanh">
                                                    <i class="fa-regular fa-eye"></i>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </a>

                                <div class="item-list__description">
                                    <a href="" class="item-list__description-title">
                                        <%=product.getName()%>
                                    </a>

                                </div>
                                <div class="item-list__price">
                                    <div class="item-list__price-num">
                                        <%=product.getPrice()%> <span style="font-size:1.1rem">VND</span>

                                    </div>
                                    <div class="item-list__price-star">
                                        <i class="item-list__price-star-icon fa-solid fa-star"></i>
                                        <i class="item-list__price-star-icon fa-solid fa-star"></i>
                                        <i class="item-list__price-star-icon fa-solid fa-star"></i>
                                        <i class="item-list__price-star-icon fa-solid fa-star"></i>
                                        <i class="item-list__price-star-icon fa-solid fa-star"></i>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <%}%> 
                    </div>
                    <div class="pagination">
                        <!-- Add pagination links here -->
                        <!-- Example: -->
                        <% for (int i = 1; i <= Math.ceil((double)products.size() / productsPerPage); i++) { %>
                        <a href="?page=<%= i %>"><%= i %></a>
                        <% } %>
                        <!-- ... -->
                    </div>
                </div>
            </div>



        </div>
        <br/><br/><br/><br/>
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