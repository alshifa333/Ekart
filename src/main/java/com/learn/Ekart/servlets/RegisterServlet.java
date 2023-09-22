
package com.learn.Ekart.servlets;

import com.learn.Ekart.entity.User;
import com.learn.Ekart.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class RegisterServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
           
            try{
                String userName=request.getParameter("user_name");
                String userEmail=request.getParameter("user_email");
                String userPassword=request.getParameter("user_password");
                String userPhone=request.getParameter("user_phone");
                String userAddress=request.getParameter("user_address");
                
                //validation
                if(userName.isEmpty())
                {
                    out.println("name is blank");
                    return;
                }
                //creating user object to store data
                User user= new User(userName, userEmail, userPassword, userPhone, "default.jpg", userAddress,"normal");
                        
                Session hibernateSession =FactoryProvider.getFactory().openSession();
                Transaction tx = hibernateSession.beginTransaction();
                int userId=(int) hibernateSession.save(user);//it will save the data in user table
                
                
                tx.commit();
                hibernateSession.close();
                
                /*session is an object that is use to store a value for a limited
                amount of time unless and until we dont want to remove it*/
                
                HttpSession httpSession=request.getSession();
                httpSession.setAttribute("message","Registration Successful!!"+userId);
                response.sendRedirect("register.jsp");
                return;
                
                
                
                
            }catch(Exception e){
                e.printStackTrace(); 
            }
            
        }
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
