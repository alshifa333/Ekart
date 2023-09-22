package com.learn.Ekart.servlets;

import com.learn.Ekart.dao.CategoryDao;
import com.learn.Ekart.dao.ProductDao;
import com.learn.Ekart.entity.Category;
import com.learn.Ekart.entity.Product;
import com.learn.Ekart.helper.FactoryProvider;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
@MultipartConfig
public class ProductOperationServlet extends HttpServlet 
{
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
         response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) 
        {
            
            //servlet 2;
            //addcategory
            //addproduct
            //now we are fetching the data here of operation
            String op=request.getParameter("operation");
            //and now what value what we have get?
            if(op.trim().equals("addcategory")){
            //add category                
            //fetching category data
            //we are not setting the value of id as the value is already generated in catergory.java 
            String title=request.getParameter("catTitle");
            String description=request.getParameter("catDescription");
            
            
           //it's CATERGORY here 
           
            Category category=new Category();
            category.setCategoryTitle(title);
            category.setCategoryDescription(description);
            
            
            
            //now we'll save the category in database
            
            CategoryDao categoryDao=new CategoryDao(FactoryProvider.getFactory());
            int catId=categoryDao.saveCategory(category);
            
            out.println("Category Saved");
            HttpSession httpSession=request.getSession();
            httpSession.setAttribute("message", "Category added Successfully:"+catId);
            response.sendRedirect("admin.jsp");
            return;
            
            }
            
            else if(op.trim().equals("addproduct"))
            {
                //add product
                String pName=request.getParameter("pName");
                String pDesc=request.getParameter("pDesc");
                int pPrice=Integer.parseInt(request.getParameter("pPrice"));
                int pDiscount=Integer.parseInt(request.getParameter("pDiscount"));
                int pQuantity=Integer.parseInt(request.getParameter("pQuantity"));
                int catId=Integer.parseInt(request.getParameter("catId"));
                Part part=request.getPart("pPic");
                
                Product p=new Product();
                p.setpName(pName);
                p.setpDesc(pDesc);
                p.setpPrice(pPrice);
                p.setpDiscount(pDiscount);
                p.setpQuantity(pQuantity);
                p.setpPhoto(part.getSubmittedFileName());
                
                //get category by ID
                CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
                Category category =cdao.getCategoryById(catId);
                p.setCategory(category);
                //product save...
                ProductDao pdao=new ProductDao(FactoryProvider.getFactory());
                pdao.saveProduct(p);
               
               //pic upload
               //find out the path to upload photo
               
               String path=request.getRealPath("img")+File.separator+"products"+File.separator+File.separator+part.getSubmittedFileName();
               System.out.println(path);
               
               //uploading code..
             
               
               FileOutputStream fos =new FileOutputStream(path);
               InputStream is=part.getInputStream();
               
               //Reading data
               
               byte[] data=new byte[is.available()];
               is.read(data);
              
               
               //writing data
               fos.write(data);
               fos.close();
               
            
              out.println("Product Saved");
              HttpSession httpSession=request.getSession();
              httpSession.setAttribute("message", "Project is added Successfully");
              response.sendRedirect("admin.jsp");
             return;
            }   
        }     
    }
}