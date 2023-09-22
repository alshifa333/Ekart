
package com.learn.Ekart.dao;

import com.learn.Ekart.entity.User;
import org.hibernate.query.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;


public class UserDao {
    private SessionFactory factory;

    public UserDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    //get user by email and password
    public User getUserByEmailAndPassword(String email,String password)
    {
        User user=null;
        try{
          
            String query="from User where userEmail=: e and userPassword=: p";
            Session session=this.factory.openSession();
            
            
            Query q=session.createQuery(query);
            q.setParameter("e",email);
            q.setParameter("p",password);
            
            
            // to fire query
           user=(User) q.uniqueResult();
            
            session.close();
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        
        return user;
    }

    public User getUserByEmailAndPAssword(String email, String password) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
    
}
