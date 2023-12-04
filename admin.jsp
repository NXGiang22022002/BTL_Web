<%@page import="model.*"%>
<%@page import="dao.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controller.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Trang quan tri noi dung</title>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,500;0,700;1,500&family=Rubik+Distressed&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
        <link rel="stylesheet" href="/font/fontawesome-free-6.3.0-web/css/all.min.css">
        <link rel="stylesheet" href="./css/admin.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    </head>

    <body>
        <div class="header">
            <h1>Trang quan tri noi dung</h1>
            <nav>
                <ul>
                    <li><a href="homeServlet">Trang chu</a></li>
                    <li><a href="http://localhost:3000/admin/create">Trang báo moi</a></li>
                    <li><a href="http://localhost:3000/admin/stored-main">Noi dung trang chu</a></li>
                    <li><a href="http://localhost:3000/admin/stored-c1">Bai bao Champion League</a></li>
                    <li><a href="http://localhost:3000/admin/stored-euro">Bai bao Euro</a></li>
                    <li><a href="http://localhost:3000/admin/stored-epl">Bai bao Epl</a></li>
                    <li><a href="ProcessLogout">Sign out</a></li>

                </ul>
            </nav>
        </div>
        <div class="content">
            <div class="sidebar">
                <ul>
                    <li style="margin-left: 12px;"><a href="admin?action=manage_product" class="manage_product" >Quan ly san pham</a></li>
                    <li style="margin-left: 12px;"><a href="admin?action=manage_user" class="manage_user">Quan ly nguoi dung</a></li>
                    <li style="margin-left: 12px;"><a href="admin?action=thongke">Thong kê</a></li>
                </ul>
            </div>
            <div class="main">
                <a href="EditProduct?action=add_new_product">Thêm san pham</a> <br>

                <c:if test="${sessionScope.displayUser eq 'block'}">
                    <form action="admin" method="get" style="padding-bottom: 10px">
                        <input type="hidden" name="action" value="search_user">
                        <input type="text" class="searcher" style="margin-top: 5px" name="name">
                        <input type="submit" value="search" id="submit">
                    </form>
                </c:if>

                <c:if test="${sessionScope.displayProduct eq 'block'}">
                    <form action="admin" method="get" style="padding-bottom: 10px">
                        <input type="hidden" name="action" value="search_product">
                        <input type="text" class="searcher" style="margin-top: 5px" name="name">
                        <input type="submit" value="search" id="submit">
                    </form>
                </c:if>

                <c:if test="${sessionScope.displayThongke eq 'block'}">
                    <form action="admin" method="get" style="padding-bottom: 10px">
                        <input type="hidden" name="action" value="search_thongke">
                        <label for="thongkeSelect">Chọn thống kê:</label>
                        <select name="loaithongke" id="thongkeSelect">
                            <option value="1">Chung</option>
                            <option value="2">Thống kê top sản phẩm bán chạy nhất</option>
                            <option value="3">Thống kê người dùng VIP mua nhiều nhất</option>
                            <!-- Thêm các tùy chọn khác nếu cần -->
                        </select>
                        <input type="submit" value="search" id="submit">
                    </form>
                </c:if>

                <table class="table" style="overflow: auto ;color: rgb(36, 38, 41); display: <%= Validate.StringUtil((String) session.getAttribute("displayUser")) %> ; ">
                    <thead>
                        <tr >
                            <th scope="col" style="color: rgb(36, 38, 41);">Tên</th>
                            <th scope="col" style="color: rgb(36, 38, 41);">Email</th>
                            <th scope="col" style="color: rgb(36, 38, 41);">SDT</th>
                            <th style="color: rgb(36, 38, 41);">Ch?nh s?a</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% ArrayList<User> ctvList = (ArrayList<User>) request.getAttribute("users"); 
                    int stt = 1; %> 
                        <% for(User x : ctvList) { 
                        if (!"admin".equals(x.getRole())) { %> 
                        <tr>
                            <th scope="row" style="color: black;"><%= x.getName() %> </th>
                            <td><%= x.getEmail() %></td>
                            <td ><%= x.getPhone() %></td>
                            <td>
                                <!--<a href="/c1/{{this._id}}/edit" class="btn btn-primary">S?a</a>-->
                                <a href="EditUser?action=Delete&email=<%= x.getEmail() %>" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#delete-course-modal">XÃ³a</a>
                                <a href="/c1/{{this.slug}}" class="btn btn-primary">Xem bÃ i vi?t</a>

                            </td>
                        </tr>
                        <% } 
                    } %>

                    </tbody>
                </table> 

                <table class="table" style="color: rgb(36, 38, 41); display: <%= Validate.StringUtil((String) session.getAttribute("displayProduct")) %>; ">
                    <thead>
                        <tr >
                            <th scope="col" style="color: rgb(36, 38, 41);">ID</th>
                            <th scope="col" style="color: rgb(36, 38, 41);">Name</th>
                            <th scope="col" style="color: rgb(36, 38, 41);">Price</th>
                            <th scope="col" style="color: rgb(36, 38, 41);">Type</th>
                            <th style="color: rgb(36, 38, 41);">Edit</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${product}" var="product">
                            <c:set var="id" value="${product.id}"/>
                            <tr>
                                <th scope="row" style="color: black;">${product.id}</th>
                                <td>${product.name}</td>
                                <td >${product.price} VNÃ</td>
                                <td>${product.cate.nameCate}</td>
                                <td>
                                    <a href="EditProduct?action=Edit_product&id=${id}" class="btn btn-primary">Edit</a>
                                    <a href="EditProduct?action=deleteProduct&id=${id}" class="btn btn-primary">Dele</a>
                                    <a href="/c1/{{this.slug}}" class="btn btn-primary">View detail</a>

                                </td>
                            </tr>
                        </c:forEach>

                    </tbody>
                </table> 
                <!--                    thong ke-->
                <table class="table" style="overflow: auto ;color: rgb(36, 38, 41); display: <%= Validate.StringUtil((String) session.getAttribute("displayThongke")) %> ; ">
                    <% ArrayList<Order> listorder1 = (ArrayList<Order>) request.getAttribute("listorder");
                    ArrayList<Product> listorder2 = (ArrayList<Product>) request.getAttribute("listproduct");
                    ArrayList<TKCustomer> listorder3 = (ArrayList<TKCustomer>) request.getAttribute("listcustomerorder");
                    if(listorder1!=null){
                    %>
                    <b>Thống kê theo đơn hàng:</b>
                    <thead>
                        <tr >
                            <th scope="col" style="color: rgb(36, 38, 41);">id</th>
                            <th scope="col" style="color: rgb(36, 38, 41);">Customer</th>
                            <th scope="col" style="color: rgb(36, 38, 41);">Product</th>
                            <th scope="col" style="color: rgb(36, 38, 41);">Quantity</th>
                            <th scope="col" style="color: rgb(36, 38, 41);">Total Money</th>
                            <th scope="col" style="color: rgb(36, 38, 41);">Order date</th>
                            <th scope="col" style="color: rgb(36, 38, 41);">Payment Method</th>
                            <th scope="col" style="color: rgb(36, 38, 41);">State</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                     int tongthunhap=0;
                     for(Order x : listorder1) { 
                      for(OrderDetail y : x.getList()){
                      if(x.getState()==4){
                            tongthunhap +=y.getQuantity()*y.getProduct().getPrice();
                            }
                        %> 
                        <tr>
                            <th scope="row" style="color: black;"><%= x.getId() %> </th>
                            <td><%= x.getU().getName() %></td>
                            <td ><%=y.getProduct().getName()%></td>
                            <td><%=y.getQuantity()%></td>
                            <td><%=y.getQuantity()*y.getProduct().getPrice()%> VNÐ</td>
                            <td><%= x.getOrder_date()%></td>
                            <td><%= x.getPaymentMethod()%></td>
                            <% if(x.getState()==0){
                            %>
                            <td>Đơn hàng đã bị hủy</td>
                            <%
                                }if(x.getState()==1){
                            %>
                            <td>Chờ duyệt</td>
                            <%
                                }if(x.getState()==2){
                            %>
                            <td>Chờ giao</td>
                            <%
                                }if(x.getState()==3){
                            %>
                            <td>Ðang vận chuyển</td>
                            <%
                                }if(x.getState()==4){
                            %>
                            <td>Thành công</td>
                            <%
                                }%>
                        </tr>
                        <%  }
                    } %>
                    <br><b>Tổng thu nhập: <%=tongthunhap%> VNÐ</b>
                    </tbody>
                    <%}
                     if(listorder2!=null){
                    %>
                    <b>Thống kê top sản phẩm bán chạy nhất</b>
                    <thead>
                        <tr >
                            <th scope="col" style="color: rgb(36, 38, 41);">ID Product</th>
                            <th scope="col" style="color: rgb(36, 38, 41);">Nane Product</th>
                            <th scope="col" style="color: rgb(36, 38, 41);">Quantity</th>
                            <th scope="col" style="color: rgb(36, 38, 41);">Total Money</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                     for(Product x : listorder2) { 
                        %>
                        <tr>
                            <td ><%=x.getId()%></td>
                            <td><%=x.getName()%></td>
                            <td><%=x.getQuantity()%></td>
                            <td><%=x.getQuantity()*x.getPrice()%> VNÐ</td>
                        </tr>
                        <%  
                    } %>
                    </tbody>
                    <%}if(listorder3!=null){
                    %>
                    <b>Thống kê người dùng VIP chi nhiều nhất</b>
                    <thead>
                        <tr >
                            <th scope="col" style="color: rgb(36, 38, 41);">ID</th>
                            <th scope="col" style="color: rgb(36, 38, 41);">Name</th>
                            <th scope="col" style="color: rgb(36, 38, 41);">Quantity</th>
                            <th scope="col" style="color: rgb(36, 38, 41);">Total Money</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                     for(TKCustomer x : listorder3) { 
                        %>
                        <tr>
                            <td ><%=x.getIdUser()%></td>
                            <%
                                User a = new UserDAO().getUserByID(x.getIdUser());
                            %>
                            <td><%=a.getName()%></td>
                            <td><%=x.getSlmua()%></td>
                            <td><%=x.getTotalmoney()%> VNÐ</td>
                        </tr>
                        <%  
                    } %>
                    </tbody>
                    <%}%>
                </table> 
            </div>
        </div>

        <div class="footer">
            <p>Â© 2023</p>
        </div>

        <!-- confirm  delete -->
        <!--  -->

        <div id="delete-course-modal" class="modal" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Xác nhan</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <p>B?n ch?c ch?n mu?n xÃ³a bÃ i vi?t nÃ y ?</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Huy</button>
                        <button id="btn-delete-c1" type="button" class="btn btn-danger">Xoa</button>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
