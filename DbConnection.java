import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection {

    private static final String URL = "jdbc:mysql://localhost:3306/parqueadero"; // Cambia la URL si es necesario
    private static final String USER = "root"; // Usuario de la base de datos
    private static final String PASSWORD = ""; // Contraseña de la base de datos

    public static Connection getConnection() throws SQLException {
        try {
            // Registrar el driver de MySQL
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            throw new SQLException("Error al conectar con la base de datos", e);
        }
    }
}
