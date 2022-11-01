package com.controller.cart;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;

import com.dao.cartDao;
import com.model.cartItem;

@WebServlet(name = "PlusCartItemQuantity", value = "/PlusCartItemQuantity")
public class PlusCartItemQuantity extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        int cartid = Integer.parseInt(request.getParameter("cartid"));
        cartDao cart = new cartDao();
        int res = cart.plusItem(id,cartid);

        if(res > 0){
            System.out.println( "nice " + res + " rows deleted" );
            request.setAttribute("result", "pass");
        }
        else{
            System.out.println( "works" );
            request.setAttribute("result", "fail");
        }

        ArrayList<cartItem> disCart =  cart.displayCart(cartid);
        request.setAttribute("cart", disCart);

        RequestDispatcher dis = request.getRequestDispatcher("./cart.jsp");
        dis.forward(request, response);
    }
}
