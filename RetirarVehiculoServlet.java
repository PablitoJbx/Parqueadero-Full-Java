import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.concurrent.TimeUnit;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/retirarVehiculo")
public class RetirarVehiculoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("/retirarVehiculo.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        String placa = request.getParameter("placa");
        
        if (placa == null || placa.trim().isEmpty()) {
            request.setAttribute("error", "La placa es requerida.");
            request.getRequestDispatcher("/retirarVehiculo.jsp").forward(request, response);
            return;
        }

        Connection connection = null;
        PreparedStatement selectStmt = null;
        PreparedStatement updateStmt = null;
        ResultSet rs = null;

        try {
            connection = DbConnection.getConnection();
            connection.setAutoCommit(false);

            String selectSql = "SELECT v.placa, v.tipoVehiculo, v.propietario, v.fecharegistro FROM vehiculo v WHERE v.placa = ?";
            selectStmt = connection.prepareStatement(selectSql);
            selectStmt.setString(1, placa);
            rs = selectStmt.executeQuery();

            if (rs.next()) {
                String tipo = rs.getString("tipoVehiculo");
                String propietario = rs.getString("propietario");
                Timestamp fechaIngreso = rs.getTimestamp("fecharegistro");
                Timestamp fechaSalida = new Timestamp(System.currentTimeMillis());

                // Calcular la duración en horas
                long duracionMilis = fechaSalida.getTime() - fechaIngreso.getTime();
                long duracionHoras = TimeUnit.MILLISECONDS.toHours(duracionMilis);
                
                // Si la duración es menor a 1 hora, se considera como 1 hora
                if (duracionHoras == 0) {
                    duracionHoras = 1;
                }

                // Calcular el pago
                double pago = calcularPago(tipo, duracionHoras);

                String updateSql = "UPDATE vehiculo SET fechasalida = ?, pago = ? WHERE placa = ?";
                updateStmt = connection.prepareStatement(updateSql);
                updateStmt.setTimestamp(1, fechaSalida);
                updateStmt.setDouble(2, pago);
                updateStmt.setString(3, placa);
                updateStmt.executeUpdate();

                request.setAttribute("placa", placa);
                request.setAttribute("tipo", tipo);
                request.setAttribute("propietario", propietario);
                request.setAttribute("fechaIngreso", fechaIngreso);
                request.setAttribute("fechaSalida", fechaSalida);
                request.setAttribute("pago", pago);
                request.setAttribute("duracionHoras", duracionHoras);

                connection.commit();

                request.getRequestDispatcher("/ticket.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "No se encontró un vehículo con esa placa.");
                connection.rollback();
                request.getRequestDispatcher("/retirarVehiculo.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                if (connection != null) {
                    connection.rollback();
                }
            } catch (SQLException rollbackEx) {
                rollbackEx.printStackTrace();
            }
            request.setAttribute("error", "Error al procesar la solicitud: " + e.getMessage());
            request.getRequestDispatcher("/retirarVehiculo.jsp").forward(request, response);
        } finally {
            try {
                if (rs != null) rs.close();
                if (selectStmt != null) selectStmt.close();
                if (updateStmt != null) updateStmt.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    private double calcularPago(String tipoVehiculo, long horas) {
        double tarifaPorHora;
        switch (tipoVehiculo.toLowerCase()) {
            case "moto":
                tarifaPorHora = 500;
                break;
            case "carro":
                tarifaPorHora = 1000;
                break;
            case "camioneta":
                tarifaPorHora = 1500;
                break;
            default:
                tarifaPorHora = 1000; // Tarifa por defecto
        }
        return tarifaPorHora * horas;
    }
}

