import java.sql.*;

public class FirstProgBis {
  public static void main(String[] args) {
    try (Connection conn =
            DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/HW_EBOOKSHOP", "testuser", "password");
        Statement stmt = conn.createStatement(); ) {
      // start snippet alternate
      // code/java/FirstProgBis.java
      String strSelect = "SELECT * FROM BOOKS";
      ResultSet rset = stmt.executeQuery(strSelect);

      System.out.println("The records selected are:");

      ResultSetMetaData rsmd = rset.getMetaData();
      int columnsNumber = rsmd.getColumnCount();
      String columnValue;
      while (rset.next()) {
        for (int i = 1; i <= columnsNumber; i++) {
          if (i > 1) System.out.print(",  ");
          columnValue = rset.getString(i);
          System.out.print(columnValue + " " + rsmd.getColumnName(i));
        }
        System.out.println();
        // end snippet alternate
      }
      conn.close();
    } catch (SQLException ex) {
      ex.printStackTrace();
    }
  }
}
