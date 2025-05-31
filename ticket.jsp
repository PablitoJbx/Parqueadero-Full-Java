<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ticket de Estacionamiento - Salida</title>
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
            padding: 1rem;
        }

        .ticket {
            background-color: white;
            padding: 2.5rem;
            border-radius: 1rem;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
            width: 90%;
            max-width: 450px;
        }

        .ticket h1 {
            color: #004d4d;
            font-size: 1.5rem;
            margin-bottom: 2rem;
            text-align: center;
        }

        .details {
            display: grid;
            grid-template-columns: auto 1fr;
            gap: 0.75rem;
            margin-bottom: 2rem;
        }

        .details dt {
            font-weight: 600;
            color: #333;
        }

        .details dd {
            text-align: right;
            color: #444;
        }

        .total {
            font-size: 1.25rem;
            font-weight: 600;
            text-align: center;
            margin: 1.5rem 0;
            padding: 1rem 0;
            border-top: 1px solid #e2e8f0;
            border-bottom: 1px solid #e2e8f0;
        }

        .buttons {
            display: flex;
            gap: 1rem;
            justify-content: center;
            margin-bottom: 1.5rem;
        }

        .button {
            padding: 0.75rem 1.5rem;
            border-radius: 0.5rem;
            font-size: 1rem;
            cursor: pointer;
            transition: all 0.2s ease;
            border: none;
        }

        .button-primary {
            background-color: #009688;
            color: white;
        }

        .button-primary:hover {
            background-color: #00796b;
        }

        .button-secondary {
            background-color: #e2e8f0;
            color: #333;
        }

        .button-secondary:hover {
            background-color: #cbd5e1;
        }

        .disclaimer {
            font-size: 0.75rem;
            color: #666;
            text-align: center;
            margin-top: 1.5rem;
        }

        @media print {
            body {
                background: none;
                padding: 0;
            }

            .ticket {
                box-shadow: none;
                padding: 20px;
            }

            .buttons {
                display: none;
            }
        }
    </style>
</head>
<body>
    <div class="ticket">
        <h1>Ticket de Estacionamiento - Salida</h1>
        
        <dl class="details">
            <dt>Parqueadero:</dt>
            <dd>Banderas Center</dd>
            
            <dt>Tipo de Vehículo:</dt>
            <dd>${tipo}</dd>
            
            <dt>Placa:</dt>
            <dd>${placa}</dd>
            
            <dt>Propietario:</dt>
            <dd>${propietario}</dd>
            
            <dt>Hora de Entrada:</dt>
            <dd>${fechaIngreso}</dd>
            
            <dt>Hora de Salida:</dt>
            <dd>${fechaSalida}</dd>
            
            <dt>Pago Total:</dt>
            <dd>$${pago} pesos</dd>
        </dl>

        <div class="total">
            Total a Pagar: $${pago} pesos
        </div>

        <div class="buttons">
            <button onclick="window.print()" class="button button-primary">
                Imprimir
            </button>
            <button onclick="window.location.href='index.jsp'" class="button button-secondary">
                Cerrar
            </button>
        </div>

        <p class="disclaimer">
            Este ticket es válido solo para vehículos registrados. El parqueadero no se hace responsable por daños o pérdidas.
        </p>
    </div>

    <script>
        // Auto print when the page loads (optional)
        // window.onload = function() {
        //     window.print();
        // }
    </script>
</body>
</html>

