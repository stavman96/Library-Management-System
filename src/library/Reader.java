package library;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.ResultSet;

public class Reader {
    public void displayAll() {
  
      try {
          Class.forName("com.mysql.jdbc.Driver");

          Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/library?" + "user=root&password=root");

          Statement statement = connect.createStatement();

          ResultSet resultSet = statement.executeQuery("select * from readers");
          
          System.out.println("All the users that can take books from the library");
          while(resultSet.next()) {
              System.out.println(resultSet.getString("fname"));
          }
          
          System.out.println(" ");

      }
      catch(Exception e) {
          System.out.println(e.getMessage());
        
      }
    
    }
}
