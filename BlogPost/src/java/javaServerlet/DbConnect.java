/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javaServerlet;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Kaveesha FDO
 */
public class DbConnect {

   //static PreparedStatement pst = null;
   static Statement st = null;
   static ResultSet rs = null;
   static Connection conn = null;

    public static Connection connect() {

        try {
            String dbURL = "jdbc:jtds:sqlserver://localhost:1433/blog";
            String user = "sa";
            String pass = "123";
            conn = DriverManager.getConnection(dbURL, user, pass);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return conn;
    }

    public static void insertDb(String query) {
        if (conn == null) {
            connect();
        }
        try {
            st = conn.createStatement();
            st.execute(query);
        } catch (SQLException ex) {
            Logger.getLogger(DbConnect.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static ResultSet getDb(String query) {
        if (conn == null) {
            connect();
        }

        try {
            st = conn.createStatement();
            rs = st.executeQuery(query);
        } catch (SQLException ex) {
            Logger.getLogger(DbConnect.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

}
