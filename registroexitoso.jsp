
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro Exitoso</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 400px;
        }
        h1 {
            color: #28a745;
            text-align: center;
            font-size: 2em;
            margin-bottom: 20px;
        }
        .ticket {
            background-color: #28a745;
            color: white;
            padding: 10px;
            margin-top: 20px;
            border-radius: 5px;
            font-size: 16px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>¡Registro Exitoso!</h1>
        <p>Tu vehículo ha sido registrado correctamente.</p>
        <div class="ticket">
            <p>Ticket de Registro:</p>
            <p>
                <!-- Mostrar la hora enviada desde el servlet -->
                <% 
                    String horaRegistro = request.getParameter("hora");
                    if (horaRegistro != null) {
                        out.print(horaRegistro);
                    } else {
                        out.print("Hora no disponible");
                    }
                %>
            </p>
        </div>
    </div>
</body>
</html>
