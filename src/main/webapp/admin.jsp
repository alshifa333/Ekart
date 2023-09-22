
<%@page import="java.util.Map"%>
<%@page import="com.learn.Ekart.helper.Helper"%>
<%@page import="com.learn.Ekart.entity.Category"%>

<%@page import="java.util.List"%>
<%@page import="com.learn.Ekart.dao.CategoryDao"%>
<%@page import="com.learn.Ekart.helper.FactoryProvider"%>
<%@page import="com.learn.Ekart.entity.User"%>
<link rel="css/style.css" alt="css">
<%
   User user=(User) session.getAttribute("current-user");
   if(user==null)
   {
      session.setAttribute("message", "This page is for Admin");
      response.sendRedirect("login.jsp");
      return;
   }else
       //this is only executed when the credentials are right so further we have to check whether the person is admin or user
   {
       if(user.getUserType().equals("normal"))
       {
           session.setAttribute("message", "Abey chala ja na Admin ka page hai ye");
           response .sendRedirect("login.jsp");
       }
   }
%>


   <%
                     CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
                     List<Category> list=cdao.getCategories();
         //getting count
        Map<String,Long>m= Helper.getCounts(FactoryProvider.getFactory());

    %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
        <%@include file="components/common_css_js.jsp"%>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <%@include file="components/Navbar.jsp" %>
        <div class="container admin">
            <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
            </div>
       
        <!--1st col-->
        <div class="container-fluid">
            <div class="row mt-3 ">
                <div class="col-md-4 ">
                     <!--first col-->
                    <div class="card">
                    <div class="card-body text-center border">
                        <div class="container ">
                            <img style="max-width: 100px" class="img-fluid rounded-circle" src="img/user.png" alt="user_icon">
                        </div>
                        <h1><%=m.get("userCount")%></h1>
                        
                        <h1 class="text-uppercase text-muted">Users</h1>
                    </div>
                    </div>
                </div>
                
                <!--second col-->
                 <div class="col-md-4">
                     <div class="card">
                        <div class="card-body text-center  border ">
                            <div class="container">
                            <img style="max-width: 95px" class="img-fluid" src="img/list.png" alt="list_icon">
                        </div>
                            <h1><%= list.size() %></h1>
                            <h1 class="text-uppercase text-muted">Categories</h1>
                    </div>
              </div>
                     
         </div> 
                
                <!--Third col-->
                <div class="col-md-4">
                    <div class="card">
                       <div class="card-body text-center  border ">
                           <div class="container">
                            <img style="max-width: 100px" class="img-fluid" src="img/delivery-cart.png" alt="list_icon">
                        </div>
                           <h1><%=m.get("productCount")%></h1>
                        <h1 class="text-uppercase text-muted">Products</h1>
                    </div>
                  </div>
                </div>    
            
                </div>
        
        
        <!--second row-->
        <div class="row mt-3">
            <!--second row first column-->
            <div class="col-md-6">
                <div class="card" data-toggle="modal" data-target="#add-category-modal">
                       <div class="card-body text-center border">
                           <div class="container">
                            <img style="max-width: 120px" class="img-fluid" src="img/menu.png" alt="list_icon">
                        </div>
                         <p class="mt-2">Click here to add new category </p>
                        <h1 class="text-uppercase text-muted">Add Category</h1>
                    </div>
                  </div>
                </div>    
            
                
                
         
        <!--second row second column-->
        
            <div class="col-md-6">
                <div class="card" data-toggle="modal" data-target="#add-product-modal">
                       <div class="card-body text-center border ">
                           <div class="container">
                            <img style="max-width: 120px" class="img-fluid" src="img/add.png" alt="list_icon">
                        </div>
                           <p class="mt-2"> Click here to add products</p>
                        <h1 class="text-uppercase text-muted">Add Products</h1>
                    </div>
                  </div>
                </div>
            </div>
        </div> 
   </div>
        
        <!--Add Category modal-->
      


<!-- Modal -->
<div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document"><!--to enlarge the modal dialog box we are using modal-lg-->
    <div class="modal-content">
      <div class="modal-header custom-bg text-white">
        <h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          
          <!--form-->
          
          <form action="ProductOperationServlet" method="post">
              <!--ye neeche waali this field will also move to our form jiska data hum fetch kr skte hain-->
              <input type="hidden" name="operation" value="addcategory">
              <div class="form-group">
                  <input type="text" class="form-control" name="catTitle" placeholder="Enter category title" required/>
              </div>
              <div class="form-group">
                  <textarea style="height:100px;" class="form-control" placeholder="Enter Category Description" name="catDescription" required></textarea>
              </div>
              <div class="container text-center">
                  <button class="btn-outline-success">Add Category</button>
                   <button style="height:33px;" type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          </div>
          </form>
     
    </div>
  </div>
</div>
</div>
<!--End of Add Category Modal-->
<!--****************************************************************************************************-->
<!--Product modal-->



<!-- Modal -->
<div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white">
        <h5 class="modal-title" id="exampleModalLabel">Product Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <!--Form-->
        <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
           <input type="hidden" name="operation" value="addproduct"/>     
            
         <!--product title-->
         
        <div class="form-group">
        <input type="text" class="form-control" placeholder="Enter Product Title" name="pName" required/>
        </div>
         
        <!--Product Description-->
        
        <div class="form-group">
        <textarea style="height: 100px;" class="form-control" placeholder="Enter Product Description" name="pDesc"></textarea>
         </div>
        
        
         <!--Price-->
         
         <div class="form-group">
          <input type="number" class="form-control" placeholder="Enter Product Price" name="pPrice" required/>
          </div>  
         
          <!--Discount-->
          
            <div class="form-group">
           <input type="number" class="form-control" placeholder="Enter Product Discount" name="pDiscount" required/>
           </div>
            
           <!--Quantity-->
            <div class="form-group">
             <input type="number" class="form-control" placeholder="Enter Product Quantity" name="pQuantity" required/>
             </div>
            
           
           <!--Product Category-->
            

               
                  <div class="form-group">
                 <select name="catId" class="form-control" id="">
                  <%
                   for(Category c :list){
                  %>
                 <option value="<%= c.getCategoryId()%>"> <%= c.getCategoryTitle()%></option>
                 <%}%>
              
               </select>
           </div>
           
           <!--product file-->
           
               <div class="form-group">
                     <label for="pPic">Select Product Picture:</label>
                     <br>
                   <input type="file" id="pPic" name="pPic" required/>
               </div>
           
            <!--Submit button-->
            <div class="container text-center">
           <button class="btn-outline-success">Add Product</button>
            </div>   
            </form>
       
        <!-- ends here-->
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div> 
               
    <!--End Product modal-->
    <%@include file="components/common_modals.jsp" %>
    
</body>
</html>
