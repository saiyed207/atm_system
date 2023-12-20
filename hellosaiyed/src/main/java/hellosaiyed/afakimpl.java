package hellosaiyed;


import javax.jws.WebMethod;
import javax.jws.WebService;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebService(endpointInterface = "hellosaiyed.afak")
public class afakimpl implements afak {

    // Load the MySQL JDBC driver
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new RuntimeException("MySQL JDBC driver not found. Check your classpath.");
        }
    }

    @WebMethod
    public String getUserInfoByPin(String pin) {
        String jdbcUrl = "jdbc:mysql://localhost:3307/sbi";
        String dbUsername = "root";
        String dbPassword = "root";

        try (Connection connection = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword)) {
            String query = "SELECT id, account_holder, account_number, balance FROM users WHERE pin = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, pin);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                int id = resultSet.getInt("id");
                String accountHolder = resultSet.getString("account_holder");
                String accountNumber = resultSet.getString("account_number");
                double balance = resultSet.getDouble("balance");

                return "ID: " + id + ", Account Holder: " + accountHolder + ", Account Number: " + accountNumber + ", Balance: " + balance;
            } else {
                return "User not found.";
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return "Error fetching data: " + e.getMessage();
        }
    }
}

