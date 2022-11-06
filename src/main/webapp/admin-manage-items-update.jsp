<%@ page import="com.model.Item" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Pasindu Dinal
  Date: 11/01/2022
  Time: 3:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="./employee-header.jsp" %>

<html>
<head>
    <title>Update Item</title>
    <link rel="stylesheet" href="styles/item.css">
</head>
<body>
<%
    // HTTP 1.1
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    // HTTP 1.0
    response.setHeader("Pragma", "no-cache");
    // Proxies
    response.setHeader("Expires", "0");
    //if (session.getAttribute("username") == null) {
    //    response.sendRedirect("./employee.jsp");
    //}
%>
<div class="container-sm create-form">
    <form name="update-name" action="ItemsUpdateRedirect" method="get">
<%
    Item item =  (Item) request.getAttribute("items");
    out.print(
            "<div class='form-group'>" +
                    "<input class='create-form' name='id' type='text' value='" + item.getId() + "' hidden>" +
                        "<label for='name'>Name:</label> </br>"+
                        "<input id='update-name' class='item-create-form' name='item-name' type='text' value='" + item.getName() + "'>" +
                        "<p id='error-name'></p>" +
                    "</div>" +
                    "<div class='form-group'>" +
                        "<label for='name'>Price:</label> </br>"+
                        "<input id='update-price' class='item-create-form' name='price' type='text' value='" + item.getPrice() + "'>" +
                        "<p id='error-price'></p>" +
                    "</div>" +
                    "<div class='form-group'>" +
                        "<label for='name'>Description:</label> </br>"+
                        "<input id='update-description' class='item-create-form' name='description' type='text' value='" + item.getDescription() + "'>" +
                        "<p id='error-price'></p>" +
                    "</div>" +
                    "<div class='form-group'>" +
                        "<label for='name'>Category:</label> </br>"+
                        "<input id='update-category' class='item-create-form' name='category' type='text' value='" + item.getCategory() + "'>" +
                        "<p id='error-price'></p>" +
                    "</div>" +
                    "<div class='form-group'>" +
                        "<label for='name'>Image:</label> </br>"+
                        "<input id='update-image' class='item-create-form' name='image' type='text' value='" + item.getImage() + "'>" +
                        "<p id='error-image'></p>" +
                    "</div>" +
                        "<input type='submit' class='btn btn-primary create-item-button' value='Update'></form> " +
            "</div>"
    );
%>
    </form>
    <div class="cancel-create-form">
        <a class="text-center" href="ItemsGet">Cancel</a>
    </div>
</div>
<script src="scripts/employee-order-update.js"></script>
</body>
</html>


