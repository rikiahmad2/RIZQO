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
public class Pinjaman {
    public Connection con;
    public PreparedStatement pst;
    public void tambah() throws SQLException, ClassNotFoundException{
            
            Class.forName("com.mysql.jdbc.Driver");  
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/akuntansi","root","");
            String sql = "insert into pinjaman (kode_mitra,jumlah_pinjaman,tgl_pinjaman,tgl_tempo,lama_pinjaman,angsuran_pokok,non_bunga,total_pinjaman,bunga,bunga_bln,cr)" + 
                         "values(?,?,?,?,?,?,?,?,?,?,?)";
            pst = con.prepareStatement(sql);
    }
     public void delete() throws SQLException, ClassNotFoundException{
            Class.forName("com.mysql.jdbc.Driver");  
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/akuntansi","root","");
            String sql = "delete from pinjaman where kode_pinjaman = ?";
            pst = con.prepareStatement(sql);
    }
     
     public void show_edit() throws ClassNotFoundException, SQLException{
            Class.forName("com.mysql.jdbc.Driver");  
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/akuntansi","root","");
            String sql = "Select * from pinjaman where kode_pinjaman = ?";
            pst = con.prepareStatement(sql);
    }
     public void edit() throws SQLException, ClassNotFoundException{
            
            Class.forName("com.mysql.jdbc.Driver");  
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/akuntansi","root","");
            String sql = "UPDATE pinjaman SET jumlah_pinjaman = ?, tgl_pinjaman = ?, tgl_tempo = ?, lama_pinjaman = ?, bunga = ?,non_bunga = ?,total_pinjaman= ?,angsuran_pokok = ?,bunga_bln = ?,cr=? Where kode_pinjaman = ?" ;
            pst = con.prepareStatement(sql);
    }
     
     public void edit_hutang() throws SQLException, ClassNotFoundException{
            
            Class.forName("com.mysql.jdbc.Driver");  
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/akuntansi","root","");
            String sql = "UPDATE pinjaman SET total_pinjaman= ?, cr = ? Where kode_pinjaman = ?" ;
            pst = con.prepareStatement(sql);
    }
     
     public void sum() throws SQLException, ClassNotFoundException{
            
            Class.forName("com.mysql.jdbc.Driver");  
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/akuntansi","root","");
            String sql = "SELECT SUM(cr) AS total FROM pinjaman" ;
            pst = con.prepareStatement(sql);
    }
}
