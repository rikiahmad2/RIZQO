/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package akuntansi;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Chutenks
 */
public class Pengguna {

    public Connection con;
    public PreparedStatement pst;
    
    //query login ke database
    public void login() throws SQLException, ClassNotFoundException{
        Class.forName("com.mysql.jdbc.Driver");  
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/akuntansi","root","");
            String sql = "Select * from user where username=? and password =?";
            pst = con.prepareStatement(sql);
    }
    
     public void tambah() throws SQLException, ClassNotFoundException{
            
            Class.forName("com.mysql.jdbc.Driver");  
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/akuntansi","root","");
            String sql = "insert into user (username,password,level)" + 
                         "values(?,?,?)";
            pst = con.prepareStatement(sql);
    }
     
     public void delete() throws SQLException, ClassNotFoundException{
            Class.forName("com.mysql.jdbc.Driver");  
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/akuntansi","root","");
            String sql = "delete from user where kd_user = ?";
            pst = con.prepareStatement(sql);
    }
}
