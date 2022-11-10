<%@ page import="com.model.Order" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Sapumal Wijekoon
  Date: 10/23/2022
  Time: 1:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="./employee-header.jsp" %>
<html>
<head>
    <title>Orders- Pending Orders</title>
    <link rel="stylesheet" href="styles/button.css">
</head>
<body>
<%
    // HTTP 1.1
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    // HTTP 1.0
    response.setHeader("Pragma", "no-cache");
    // Proxies
    response.setHeader("Expires", "0");
    if (session.getAttribute("username") == null) {
        response.sendRedirect("./employee.jsp");
    }
%>
<%@include file="./employee-manage-orders-header.jsp" %>
<h2 class="display-3 text-center">Pending Orders</h2>
<%
    ArrayList<Order> orders = (ArrayList<Order>) request.getAttribute("orders");
    if(orders.size() > 0){
%>
<div class="container">
    <table class="table">
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Customer ID</th>
            <th scope="col">Status</th>
            <th scope="col">Total Price</th>
            <th scope="col">Ordered Time</th>
            <th scope="col">Process</th>
        </tr>
        </thead>
        <tbody>
        <%
            for(int i = 0; i < orders.size(); i++) {
                    out.print("<tr>" +
                            "<td>" + orders.get(i).getId() + "</td>" +
                            "<td>" + orders.get(i).getCusid() + "</td>" +
                            "<td>" + orders.get(i).getStatus() + "</td>" +
                            "<td>" + orders.get(i).getTprice() + "</td>" +
                            "<td>" + orders.get(i).getOrderedtime() + "</td>" +
                            "<td>" +
                                "<a class='mBtn btn btn-info' href='ManageOrderViewItems?id=" + orders.get(i).getId() + "'>View Order</a>" +
                                "<a class='mBtn btn btn-success' href='ManageOrderPrepare?id=" + orders.get(i).getId() + "'>Prepare</a>" +
                                "<a class='mBtn btn btn-danger'href='ManageOrderDelete?id=" + orders.get(i).getId() + "'>Delete</a>" +
                            "</td>" +
                            "</tr>");
            }
            out.print("</tbody></table>");
    }else{ %>
        <div class="container alert alert-primary" role="alert">
            <p class="text-center">No more pending orders!</p>
        </div>
    <% } %>
    </div>
    <%
        try {
            String prepareStatus = (String) request.getAttribute("prepareStatus");
            if(!prepareStatus.equals(null)){
                if(prepareStatus.equalsIgnoreCase("success")){
    %>
                        <script>
                            swal({
                                title: "Order is preparing!",
                                icon: "success",
                                button: "Ok",
                            });
                        </script>
    <%
                }else{
    %>
                        <script>
                            swal({
                                title: "Order is not preparing!",
                                icon: "error",
                                button: "Ok",
                            });
                        </script>
    <%
                }
            }
            request.removeAttribute("prepareStatus");
        }catch (Exception e){
            e.printStackTrace();
        }
    %>
    <%
        try {
            String deleteStatus = (String) request.getAttribute("deleteStatus");
            if(!deleteStatus.equals(null)){
                if(deleteStatus.equalsIgnoreCase("success")){
    %>
    <script>
        swal({
            title: "Order is deleted!",
            icon: "success",
            button: "Ok",
        });
    </script>
    <%
    }else{
    %>
    <script>
        swal({
            title: "Order is not deleted!",
            icon: "error",
            button: "Ok",
        });
    </script>
    <%
                }
            }
            request.removeAttribute("deleteStatus");
        }catch (Exception e){
            e.printStackTrace();
        }
    %>
</body>
</html>
