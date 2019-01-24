package ui;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.ResultSet;
import javax.swing.JOptionPane;

public class DatabaseConnect {
    public static Connection connect(){
        Connection connect=null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
             connect = (Connection)DriverManager.getConnection("jdbc:mysql://localhost/library?" + "user=root&password=root");
             
        }
        catch(Exception e) {
            JOptionPane.showMessageDialog(null,e);
            
        }
        return connect;
    }
    
    
    
}
