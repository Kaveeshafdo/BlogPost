package javaServerlet;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Member {

    private String name, email;
    private int id;

    public Member() {
        super();
    }

    public Member(int id) {
        super();
        try {
            this.id = id;
            
            ResultSet rs = DbConnect.getDb("SELECT Name,Email FROM Users WHERE Id='"+this.id+"'");
            if(rs.next()){
                this.name = rs.getString("Name");
                this.email = rs.getString("Email");
            }
        } catch (SQLException ex) {
            Logger.getLogger(Member.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

}
