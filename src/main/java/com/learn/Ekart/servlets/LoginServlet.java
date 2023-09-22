
package com.learn.Ekart.servlets;

import com.learn.Ekart.dao.UserDao;
import com.learn.Ekart.entity.User;
import com.learn.Ekart.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class LoginServlet extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           //coding area(fetching data part)
           
           
          String email= request.getParameter("email");
           String password=request.getParameter("password");
           
           
           //validations
           
           //Authenticate User (to check the given or entered password is correct or not)
           
           
           UserDao userDao=new UserDao(FactoryProvider.getFactory());
           User user=userDao.getUserByEmailAndPassword(email,password);
          // System.out.println(user);
          HttpSession httpSession=request.getSession();
          if(user==null){
              
              
              httpSession.setAttribute("message", "Invalid Details!! try with correct details");
              response.sendRedirect("login.jsp");
          }else{
              out.println("<h1> Welcome "+user.getUserName()+"</h1>");
              
              //login
              httpSession.setAttribute("current-user", user);
              
              if(user.getUserType().equals("admin"))
              {
                  response.sendRedirect("admin.jsp");
              }else if(user.getUserType().equals("normal")){
                  //normal user normal.jsp
                  response.sendRedirect("normal.jsp");
              
              }else
              {
                  out.println("we have not identified user type");
              }
              
              
              
              
              
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
    }// </editor-fold>

}
