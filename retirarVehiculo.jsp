<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Retirar Vehículo</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: system-ui, -apple-system, sans-serif;
        }

        body {
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #004d4d;
        }

        .container {
            background-color: white;
            padding: 2.5rem;
            border-radius: 1rem;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
            width: 90%;
            max-width: 450px;
        }

        h1 {
            color: #004d4d;
            font-size: 2rem;
            margin-bottom: 1.5rem;
            text-align: center;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        label {
            display: block;
            color: #333;
            margin-bottom: 0.5rem;
            font-size: 1rem;
        }

        input[type="text"] {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid #e2e8f0;
            border-radius: 0.5rem;
            font-size: 1rem;
            transition: border-color 0.2s ease;
        }

        input[type="text"]:focus {
            outline: none;
            border-color: #009688;
            box-shadow: 0 0 0 3px rgba(0, 150, 136, 0.1);
        }

        button[type="submit"] {
            width: 100%;
            padding: 0.75rem;
            background-color: #009688;
            color: white;
            border: none;
            border-radius: 0.5rem;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.2s ease;
        }

        button[type="submit"]:hover {
            background-color: #00796b;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 1.5rem;
            color: #004d4d;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.2s ease;
        }

        .back-link:hover {
            color: #009688;
        }

        .error-message {
            background-color: #fee2e2;
            border: 1px solid #ef4444;
            color: #dc2626;
            padding: 0.75rem;
            border-radius: 0.5rem;
            margin-bottom: 1rem;
            font-size: 0.875rem;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Retirar Vehículo</h1>
        
        <!-- Error message container -->
        

        <!-- Form that connects to the servlet -->
        <form action="retirarVehiculo" method="post">
            <div class="form-group">
                <label for="placa">Ingrese la placa del vehículo:</label>
                <input 
                    type="text" 
                    id="placa" 
                    name="placa" 
                    placeholder="Ingrese la placa" 
                    required
                    autocomplete="off"
                >
            </div>
            <button type="submit">Retirar</button>
        </form>
        
        <a href="index.jsp" class="back-link">Volver al menú principal</a>
    </div>
</body>
</html>