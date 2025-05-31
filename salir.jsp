
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gracias por su visita - ParkingSoft</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #007bff;
            color: white;
        }
        .container {
            text-align: center;
            padding: 20px;
            border-radius: 10px;
            background-color: rgba(255, 255, 255, 0.1);
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h1 {
            font-size: 2rem;
            margin-bottom: 20px;
        }
        img {
            width: 150px;
            height: 150px;
            margin-bottom: 20px;
        }
        p {
            font-size: 1.2rem;
            margin-bottom: 30px;
        }
        .button {
            background-color: #ff6600;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1rem;
            text-decoration: none;
            transition: background-color 0.3s;
        }
        .button:hover {
            background-color: #e55c00;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Puedes insertar una imagen aquí, o usar una imagen por defecto -->
        <img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='150' height='150' viewBox='0 0 150 150'/%3E" alt="Logo">
        <h1>¡Gracias por usar nuestro parqueadero!</h1>
        <p>Esperamos verle pronto.</p>
        <a href="index.jsp" class="button">Volver al inicio</a>
    </div>
</body>
</html>
