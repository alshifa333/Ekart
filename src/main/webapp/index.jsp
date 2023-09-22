<%@page import="com.learn.Ekart.helper.Helper"%>
<%@page import="com.learn.Ekart.entity.Category"%>
<%@page import="com.learn.Ekart.dao.CategoryDao"%>
<%@page import="com.learn.Ekart.entity.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.Ekart.dao.ProductDao"%>
<%@page import="com.learn.Ekart.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ekart home</title>
           <%@include file="components/common_css_js.jsp"%>
                  <link rel="stylesheet" href="css/style.css">

        
       
        
    </head>
    <body>
        <%@include file="components/Navbar.jsp" %>
        
         <div class="container-fluid">
             
        <div class="row mt-2 mx-2">
           
            <%
                String cat =request.getParameter("category");
                //out.println(cat);
                ProductDao dao=new ProductDao(FactoryProvider.getFactory());
                List<Product> list=null;
                if(cat==null)
                {
                   list=dao.getAllProducts();
                }
                else if(cat.trim().equals("all"))
                {
                    list=dao.getAllProducts();
                }
                else{
                    int cid=Integer.parseInt(cat.trim());
                     list=dao.getAllProductsById(cid);
                }
                CategoryDao cdao= new CategoryDao(FactoryProvider.getFactory());
              List<Category> clist=cdao.getCategories();
            %>
            
            
             <!--show categories-->
            
             <div class="col-md-2">
                 <div class="list-group mt-4">
                     <a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
                          <b>All Products: <%= clist.size()%></b>
                      </a>
                  
                 <%
                     for(Category c:clist){
                         
                  %>
                    <a href="index.jsp?category=<%= c.getCategoryId()%>" class="list-group-item list-group-item-action"><%= c.getCategoryTitle() %></a>     
                         
                  <%      
                     }
                  %>
                 
                 </div>  
            </div>
            <!--show products-->
            <div class="col-md-10 ">
               <!--row-->
               <div class="row mt-4">
                   
                   
                   
                   <!--col with 12 grid-->
                   
                   <div class="col-md-12">
                       <div class="card-columns">
                           
                           <%
                             for(Product p:list){  
                           %>
                           <!--Product Card-->
                           <div class="card product-card" style="cursor: pointer;">
                               <img class="card-img-top" src="img/products/<%= p.getpPhoto() %>" alt="...">
                               <div class="card-body">
                                   <h5 class="card-title"><%= p.getpName()%></h5>
                                   <p class="card-text">
                                       
                                       <%=Helper.get10Words(p.getpDesc())%>
                                       
                                   </p>
                               </div>
                                <div class="card-footer text-center">
                                    <button class="btn custom-bg text-white" onclick="add_to_cart(<%=p.getpId()%>, `<%=p.getpName()%>`,<%= p.getPriceAfterApplyDiscount()%>)">Add to Cart</button>
                                 <button class="btn btn-outline-success ">&#8377; <%= p.getPriceAfterApplyDiscount()%>/- <span  style="font-size: 10px;" class="text-secondary discount-label">&#8377;<%= p.getpPrice()%> (<%= p.getpDiscount()%>% off)</span></button>
                             </div>
                               
                           </div>
                          
                          <%
                              }
                              
                             if(list.size()==0)
                              {
                                out.println("<h2>No item is available in this category</h2>");
                              }
                          
                          %>
                       </div>
                       
                   </div>
                       
               </div>
            </div>
            
        </div>
        
        </div> 
           <%@include file="components/common_modals.jsp"%>
    </body>
</html>
