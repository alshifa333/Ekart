package com.learn.Ekart.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


 @Entity
public class User {
    @Id 
    @GeneratedValue(strategy=GenerationType.IDENTITY)//for aurto increment of values
    
    @Column(length=10,name="user_id")
    private int userId;
    @Column(length=50,name="user_name")
    private String userName;
     @Column(length=70,name="user_email")
    private String userEmail;
     @Column(length=30,name="user_password")
    private String userPassword;
     @Column(length=15,name="user_phone")
    private String userPhone;
     @Column(length=30,name="user_img")
    private String userImg;
     //if we need bigger address we'll add more column
    @Column(length=1500,name="user_address")
    private String userAddress;

    @Column(name="user_type")
    private String userType; 
    
    public User(int userId, String userName, String userEmail, String userPassword, String userPhone, String userImg, String userAddress,String userType) {
        this.userId = userId;
        this.userName = userName;
        this.userEmail = userEmail;
        this.userPassword = userPassword;
        this.userPhone = userPhone;
        this.userImg = userImg;
        this.userAddress = userAddress;
        this.userType=userType;
    }

    public User(String userName, String userEmail, String userPassword, String userPhone, String userImg, String userAddress,String userType) {
        this.userName = userName;
        this.userEmail = userEmail;
        this.userPassword = userPassword;
        this.userPhone = userPhone;
        this.userImg = userImg;
        this.userAddress = userAddress;
        this.userType=userType;
        
    }

    public User() {
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    public String getUserImg() {
        return userImg;
    }

    public void setUserImg(String userImg) {
        this.userImg = userImg;
    }

    public String getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    
    
    
    
    
    
    @Override
    public String toString() {
        return "User{" + "userId=" + userId + ", userName=" + userName + ", userEmail=" + userEmail + ", userPassword=" + userPassword + ", userPhone=" + userPhone + ", userImg=" + userImg + ", userAddress=" + userAddress + '}';
    }

    public User getUserByEmailAndPAssword(String email, String password) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
 }
    
    
    
    


