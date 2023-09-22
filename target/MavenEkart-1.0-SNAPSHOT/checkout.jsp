<%

 User user=(User) session.getAttribute("current-user");
   if(user==null)
   {
      session.setAttribute("message", "login your account");
      response.sendRedirect("login.jsp");
      return;
   }


%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>JSP Page</title>
           <%@include file="components/common_css_js.jsp"%>
    </head>
    <body>
         <%@include file="components/Navbar.jsp" %>
        
         <div class="container">
             <div class="row">
                 
                 <div class="col-md-6"><!--data of card-->
                     <div class="card mt-2">
                     <div class="card-body">
                         <h2 class="text-center my-1 mb-3">Your selected items</h2>
                        <div class="cart-body"> 
                            
                     </div>
                     
                     
                     </div>
                     </div>
                 </div>
                 <div class="col-md-6"><!--form details-->
                      <div class="card mt-2">
                     <div class="card-body">
                         <h2 class="text-center my-1 mb-3">Your details for order</h2>
                         <form action="#!">
                             <div class="form-group">
                             <label for="exampleInputEmail1">Email address</label>
                             <input value="<%= user.getUserEmail()%>" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Email">
                             </div>
                           
                             <div class="form-group">
                             <label for="exampleInputEmail1">Your Name</label>
                             <input value="<%= user.getUserName()%>" type="text" class="form-control" id="name" aria-describedby="emailname" placeholder="Enter Name">
                             </div>
                             
                             <div class="form-group">
                             <label for="exampleInputEmail1">Alternate Phone no.</label>
                             <input value="<%= user.getUserPhone()%>" type="text" class="form-control" id="phone" aria-describedby="emailnumber" placeholder="Enter Number">
                             </div>
                             
                              <div class="form-group">
                              <label for="exampleFormControlTextarea1">Delivery Address</label>
                              <textarea value="<%= user.getUserAddress()%>" class="form-control" id="address" rows="3" placeholder="Address"></textarea>
                              </div>
                             
                             <div class="container text-center" >
                                 <button class="btn btn-outline-success">Order Now</button>
                                 <button class="btn btn-outline-primary">Continue Shopping</button>
                             </div>
                             
                             
                             
                             </div>
                             </div>
                             
                         </form>
                     
                     
                     </div>
                     </div>
                     
                 </div>
                 <%@include file="components/common_modals.jsp"%>
    </body>
</html>
