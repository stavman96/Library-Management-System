package library;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.ResultSet;

public class Book {
     public void displayAll() {
  
      try {
          Class.forName("com.mysql.jdbc.Driver");

          Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/library?" + "user=root&password=root");

          Statement statement = connect.createStatement();

          ResultSet resultSet = statement.executeQuery("select * from books");
 
          while(resultSet.next()) {
              System.out.println(resultSet.getString("title"));
          }

      }
      catch(Exception e) {
          System.out.println(e.getMessage());
        
      }

   }

    
}
