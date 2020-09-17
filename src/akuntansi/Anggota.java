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
public class Anggota {
    public Connection con;
    public PreparedStatement pst;
    
     ////query menambahkan data penerbangan ke database
    public void tambah() throws SQLException, ClassNotFoundException{
            
            Class.forName("com.mysql.jdbc.Driver");  
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/akuntansi","root","");
            String sql = "insert into mitra (no,nama_mb,nama_pemilik,kode,tahun,sektor_usaha,alamat_usaha,desa_kelurahan,kecamatan,wilayah,no_spk,tgl_spk,pinj_tahap,bentuk_jaminan,jenis_jaminan)" + 
                         "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            pst = con.prepareStatement(sql);
    }
    
    public void delete() throws SQLException, ClassNotFoundException{
            Class.forName("com.mysql.jdbc.Driver");  
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/akuntansi","root","");
            String sql = "delete from mitra where kode = ?";
            pst = con.prepareStatement(sql);
    }
    
    public void show_edit() throws ClassNotFoundException, SQLException{
            Class.forName("com.mysql.jdbc.Driver");  
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/akuntansi","root","");
            String sql = "Select * from mitra where kode = ?";
            pst = con.prepareStatement(sql);
   }
    
    public void edit() throws SQLException, ClassNotFoundException{
            
            Class.forName("com.mysql.jdbc.Driver");  
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/akuntansi","root","");
            String sql = "UPDATE mitra SET no = ?, nama_mb = ?, nama_pemilik = ?, kode = ?, tahun = ?, sektor_usaha = ?, alamat_usaha = ?, desa_kelurahan = ?, kecamatan = ?, wilayah = ?, no_spk = ?, tgl_spk = ?, pinj_tahap = ?, bentuk_jaminan = ?, jenis_jaminan = ? where kode = ?" ;
            pst = con.prepareStatement(sql);
    }
}
