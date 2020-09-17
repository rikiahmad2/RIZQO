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
public class Angsuran {
    public Connection con;
    public PreparedStatement pst;
    
    public void tambah() throws SQLException, ClassNotFoundException{
            
            Class.forName("com.mysql.jdbc.Driver");  
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/akuntansi","root","");
            String sql = "insert into angsuran (kode_pinjaman,tanggal_bayar,hari_ke,angsuran_ke,kualitas)" + 
                         "values(?,?,?,?,?)";
            pst = con.prepareStatement(sql);
    }
    
     public void count() throws SQLException, ClassNotFoundException{
            
            Class.forName("com.mysql.jdbc.Driver");  
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/akuntansi","root","");
            String sql = "SELECT COUNT(*) + 1 AS angsuran_ke FROM angsuran WHERE kode_pinjaman = ?";
            pst = con.prepareStatement(sql);
    }
}
