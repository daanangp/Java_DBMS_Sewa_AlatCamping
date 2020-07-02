/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;
import java.sql.Connection;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author UseR_Daan
 */
public class koneksi {
    private Connection connect;
    private Statement db;
    private String database = "sewa_alatcamping";
    
        public static void main(String[] args) {
        // TODO code application logic here
    System.out.println("Running Program ... ");
//Test Database
try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            System.out.println("Class Driver Ditemukan");
            
            try{
                Connection connect = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","sewa_alatcamping"/*username*/, "sewa_alatcamping"/*pass*/);
                System.out.println("Koneksi Datatbase sukses");
            } catch (SQLException se){
                System.out.println("Koneksi Database gagal = " + se);
            }
    } catch (ClassNotFoundException err){
            System.out.println("Class Driver Tidak Ditemukkan, Terjadi kesalahan pada : "+err);
        }
    }
    
    public ResultSet GetData(String sql){
        try {
            db = connect.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            return db.executeQuery(sql);
        } catch (SQLException e){
            return null;
        }
    }
  }

