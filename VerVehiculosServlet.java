import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

@WebServlet("/VerVehiculosServlet")
public class VerVehiculosServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

        try (PrintWriter out = response.getWriter()) {
            // Agregar estilos CSS
            out.println("<style>");
            out.println("table { width: 100%; border-collapse: separate; border-spacing: 2px; font-family: Arial, sans-serif; }");
            out.println("th { background-color: #f5f5f5; color: #000; font-weight: 700; padding: 12px 15px; text-align: left; }");
            out.println("td { padding: 12px 15px; background-color: white; font-weight: normal; }");
            out.println("th:first-child, td:first-child { width: 5%; }");
            out.println("th:nth-child(2), td:nth-child(2) { width: 10%; }");
            out.println("th:nth-child(3), td:nth-child(3) { width: 15%; }");
            out.println("th:nth-child(4), td:nth-child(4) { width: 15%; }");
            out.println("th:nth-child(5), td:nth-child(5) { width: 15%; }");
            out.println("th:nth-child(6), td:nth-child(6) { width: 15%; }");
            out.println("th:nth-child(7), td:nth-child(7) { width: 15%; }");
            out.println("</style>");

            // Tabla sin bordes
            out.println("<table>");
            out.println("<thead>");
            out.println("<tr>");
            out.println("<th>Id</th>");
            out.println("<th>Placa</th>");
            out.println("<th>Propietario</th>");
            out.println("<th>Tipo de Vehículo</th>");
            out.println("<th>Hora Entrada</th>");
            out.println("<th>Hora Salida</th>");
            out.println("<th>Pago</th>");
            out.println("</tr>");
            out.println("</thead>");
            out.println("<tbody>");

            // Obtener conexión desde DbConnection
            connection = DbConnection.getConnection();

            // Consulta SQL
            String query = "SELECT id, placa, propietario, tipoVehiculo, fechaRegistro, fechaSalida, pago FROM vehiculo";

            // Crear un Statement y ejecutar la consulta
            statement = connection.createStatement();
            resultSet = statement.executeQuery(query);

            // Generar las filas de la tabla
            while (resultSet.next()) {
                out.println("<tr>");
                out.println("<td>" + resultSet.getInt("id") + "</td>");
                out.println("<td>" + resultSet.getString("placa") + "</td>");
                out.println("<td>" + resultSet.getString("propietario") + "</td>");
                out.println("<td>" + resultSet.getString("tipoVehiculo") + "</td>");
                out.println("<td>" + resultSet.getString("fechaRegistro") + "</td>");
                out.println("<td>" + resultSet.getString("fechaSalida") + "</td>");
                out.println("<td>" + (resultSet.getDouble("pago") == 0 ? "Pendiente" : "$" + String.format("%.2f", resultSet.getDouble("pago"))) + "</td>");
                out.println("</tr>");
            }

            out.println("</tbody>");
            out.println("</table>");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<p>Error al obtener los datos de los vehículos.</p>");
        } finally {
            // Cerrar recursos
            try {
                if (resultSet != null) resultSet.close();
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}

