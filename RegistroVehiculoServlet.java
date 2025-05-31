import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/registrarVehiculo")
public class RegistroVehiculoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Obtener parámetros del formulario
        String tipoVehiculo = request.getParameter("tipoVehiculo");
        String placa = request.getParameter("placa");
        String propietario = request.getParameter("propietario");

        // Validar que los campos no estén vacíos
        if (placa == null || placa.trim().isEmpty() || 
            propietario == null || propietario.trim().isEmpty() || 
            tipoVehiculo == null || tipoVehiculo.trim().isEmpty()) {
            
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("Todos los campos son requeridos.");
            return;
        }

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = DbConnection.getConnection();

            // Obtener la fecha y hora actual
            Timestamp fecharegistro = new Timestamp(System.currentTimeMillis());

            // Preparar la consulta SQL especificando explícitamente las columnas
            String sql = "INSERT INTO vehiculo (tipoVehiculo, placa, propietario, fecharegistro, fechasalida, pago) " +
                        "VALUES (?, ?, ?, ?, NULL,NULL)";
            preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1, tipoVehiculo);
            preparedStatement.setString(2, placa);
            preparedStatement.setString(3, propietario);
            preparedStatement.setTimestamp(4, fecharegistro);

            int rowsInserted = preparedStatement.executeUpdate();
            if (rowsInserted > 0) {
                // El vehículo fue registrado correctamente
                RequestDispatcher dispatcher = request.getRequestDispatcher("/registroexitoso.jsp");
                dispatcher.forward(request, response);
            } else {
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                response.getWriter().write("No se pudo registrar el vehículo.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("Ocurrió un error al procesar la solicitud.");
        } finally {
            try {
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}