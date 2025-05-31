
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Banderas Center</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #004d4d;
        }

        .container {
            width: 100%;
            max-width: 400px;
            padding: 20px;
            text-align: center;
        }

        .title {
            color: white;
            font-size: 2rem;
            margin-bottom: 20px;
        }

        .logo {
            width: 200px;
            height: 150px;
            background-color: #000033;
            margin: 0 auto 20px;
            border-radius: 10px;
            display: flex;
            justify-content: center;
            align-items: center;
            box-shadow: 0 0 20px rgba(0,0,0,0.3);
        }

        .logo img {
            width: 80px;
            height: 80px;
            filter: drop-shadow(0 0 10px rgba(0,255,255,0.5));
        }

        .button-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 15px;
            margin-top: 20px;
        }

        .button {
            padding: 15px;
            border: 2px solid #00857d;
            background-color: transparent;
            color: white;
            cursor: pointer;
            border-radius: 5px;
            transition: all 0.3s ease;
            font-size: 1rem;
        }

        .button:hover {
            background-color: #00857d;
            transform: translateY(-2px);
        }

        @media (max-width: 480px) {
            .container {
                padding: 10px;
            }
            
            .button-grid {
                gap: 10px;
            }

            .button {
                padding: 12px;
                font-size: 0.9rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div id="mainMenu">
            <h1 class="title">ParkingSoft - PSTE</h1>
            <div class="logo">
                <img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='%2300d1ff'%3E%3Cpath d='M12 0C7.6 0 4 3.6 4 8c0 5.4 8 16 8 16s8-10.6 8-16c0-4.4-3.6-8-8-8zm0 12c-2.2 0-4-1.8-4-4s1.8-4 4-4 4 1.8 4 4-1.8 4-4 4zm1-4h-2v2h2V8z'/%3E%3C/svg%3E" alt="Parking Logo">
            </div>
            <div class="button-grid">
                <button class="button" onclick="window.location.href='Registrar_vehiculo.jsp'">Ingresar Vehiculo</button>
                <button class="button" onclick="window.location.href='retirarVehiculo.jsp'">Retirar vehiculo</button>
                <button class="button" onclick="window.location.href='vehiculos_form.jsp'">Vehiculo Registrados</button>
                <button class="button" onclick="window.location.href='salir.jsp'">Salir</button>
            </div>
        </div>
    </div>
</body>
</html>