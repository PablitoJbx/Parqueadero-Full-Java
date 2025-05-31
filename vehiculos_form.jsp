<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vehículos Registrados</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #004d4d;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        .table-container {
            margin: 20px 0;
            overflow-x: auto;
        }

        iframe {
            width: 100%;
            min-height: 400px;
            border: none;
        }

        .buttons {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-top: 20px;
        }

        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
        }

        button:hover {
            background-color: #45a049;
        }

        @media screen and (max-width: 768px) {
            body {
                padding: 10px;
            }

            .container {
                padding: 15px;
            }

            button {
                padding: 8px 16px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Vehículos Registrados</h2>
        <div class="table-container">
            <iframe src="VerVehiculosServlet"></iframe>
        </div>
        <div class="buttons">
            <button onclick="window.location.href='index.jsp'">Volver al Menú Principal</button>
        </div>
    </div>
</body>
</html>








