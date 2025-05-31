
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Registro de Vehículo - Parqueadero</title>
  <style>
    @media print {
      button {
        display: none; /* Oculta todos los botones */
      }
      .ticket .terms {
        display: block; /* Mostrar términos en la impresión */
      }
      #title {
        display: none; /* Oculta el título en el ticket */
      }
    }
    body {
      font-family: Arial, sans-serif;
      background-color: #2d2d48;
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
      margin: 0;
    }
    .container {
      background-color: white;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      width: 100%;
      max-width: 800px;
    }
    h2 {
      text-align: center;
      color: #ea971a;
      margin-bottom: 20px;
    }
    .spot-grid {
      display: grid;
      grid-template-columns: repeat(5, 1fr);
      gap: 10px;
      margin-bottom: 20px;
    }
    .spot-btn {
      width: 50px;
      height: 50px;
      border-radius: 4px;
      background-color: #4FD1C5;
      color: white;
      font-weight: bold;
      cursor: pointer;
      display: flex;
      justify-content: center;
      align-items: center;
      font-size: 14px;
      border: none;
      transition: box-shadow 0.3s ease; /* Transición para el efecto de sombra */
    }

    .spot-btn:hover {
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.2); /* Sombra suave al pasar el mouse */
    }

    .spot-btn:disabled {
      background-color: #E53E3E; /* Rojo para puestos ocupados */
      cursor: not-allowed;
      box-shadow: none; /* Elimina la sombra cuando el puesto está deshabilitado */
    }

    .form-group {
      margin-bottom: 1em;
    }
    .form-group label {
      display: block;
      font-weight: bold;
      margin-bottom: 5px;
    }
    .form-group input {
      width: 100%;
      padding: 8px;
      border-radius: 4px;
      border: 1px solid #ccc;
      box-sizing: border-box;
    }
    .form-group button {
      width: 100%;
      padding: 10px;
      background-color: #4FD1C5;
      color: white;
      border: none;
      border-radius: 4px;
      font-weight: bold;
      cursor: pointer;
    }
    .form-group button:hover {
      background-color: #38B2AC;
    }
    .ticket {
      padding: 20px;
      background-color: #F6FFFC;
      margin-top: 20px;
      border-radius: 8px;
      border: 1px solid #E2E8F0;
    }
    .ticket p {
      font-size: 16px;
      margin: 5px 0;
    }
    .ticket button {
      background-color: #48BB78;
      margin-right: 10px;
    }
    .ticket button:disabled {
      background-color: #CBD5E0;
    }
    .ticket .terms {
      font-size: 12px;
      color: #999;
      margin-top: 20px;
      text-align: center;
    }
  </style>
</head>
<body>

  <div class="container" id="container">
    <h2 id="title">Registrar Vehiculo</h2>

    <!-- Zona de selección de puestos -->
    <div id="spot-selection">
      <div class="form-group">
        <h3>Motocicletas</h3>
        <div class="spot-grid">
          <button class="spot-btn" id="spot-1" onclick="selectSpot('Motocicleta', 1)">1</button>
          <button class="spot-btn" id="spot-2" onclick="selectSpot('Motocicleta', 2)">2</button>
          <button class="spot-btn" id="spot-3" onclick="selectSpot('Motocicleta', 3)">3</button>
          <button class="spot-btn" id="spot-4" onclick="selectSpot('Motocicleta', 4)">4</button>
          <button class="spot-btn" id="spot-5" onclick="selectSpot('Motocicleta', 5)">5</button>
        </div>
      </div>

      <div class="form-group">
        <h3>Automóviles</h3>
        <div class="spot-grid">
          <button class="spot-btn" id="spot-6" onclick="selectSpot('Automovil', 6)">6</button>
          <button class="spot-btn" id="spot-7" onclick="selectSpot('Automovil', 7)">7</button>
          <button class="spot-btn" id="spot-8" onclick="selectSpot('Automovil', 8)">8</button>
          <button class="spot-btn" id="spot-9" onclick="selectSpot('Automovil', 9)">9</button>
          <button class="spot-btn" id="spot-10" onclick="selectSpot('Automovil', 10)">10</button>
        </div>
      </div>

      <div class="form-group">
        <h3>Camionetas</h3>
        <div class="spot-grid">
          <button class="spot-btn" id="spot-11" onclick="selectSpot('Camioneta', 11)">11</button>
          <button class="spot-btn" id="spot-12" onclick="selectSpot('Camioneta', 12)">12</button>
          <button class="spot-btn" id="spot-13" onclick="selectSpot('Camioneta', 13)">13</button>
          <button class="spot-btn" id="spot-14" onclick="selectSpot('Camioneta', 14)">14</button>
          <button class="spot-btn" id="spot-15" onclick="selectSpot('Camioneta', 15)">15</button>
        </div>
      </div>
      <div class="form-group">
        <button type="button" onclick="goBackToMenu()">Volver al Menú Principal</button>
      </div>
    </div>

    <!-- Formulario de registro -->
    <div id="form-section" style="display: none;">
      <h3>Registrar Vehiculo</h3>
      <form id="registerForm" action="RegistroVehiculo" method="POST" onsubmit="submitForm(event)">
        <div class="form-group">
          <label for="plate">Placa:</label>
          <input type="text" id="plate" name="plate" required>
        </div>
        <div class="form-group">
          <label for="owner">Propietario:</label>
          <input type="text" id="owner" name="owner" required>
        </div>
        <div class="form-group">
          <button type="submit">Registrar Vehículo</button>
        </div>
      </form>
    </div>

    <!-- Ticket de estacionamiento -->
    <div id="ticket-section" style="display: none;">
      <div class="ticket">
        <h3>Ticket de Estacionamiento</h3>
        <p><strong>Parqueadero:</strong> Banderas Center</p>
        <p><strong>Puesto:</strong> <span id="ticket-spot"></span></p>
        <p><strong>Tipo de Vehículo:</strong> <span id="ticket-vehicle-type"></span></p>
        <p><strong>Placa:</strong> <span id="ticket-plate"></span></p>
        <p><strong>Propietario:</strong> <span id="ticket-owner"></span></p>
        <p><strong>Hora de Registro:</strong> <span id="ticket-time"></span></p>
        <div class="terms">
          <p>Gracias por usar nuestro servicio. Este ticket es válido para un solo vehículo.</p>
        </div>
        <button onclick="printTicket()">Imprimir Ticket</button>
        <button onclick="resetForm()">Volver a Registrar</button>
      </div>
    </div>
  </div>

  <script>
    let selectedSpot = null;
    let occupiedSpots = new Set();

    function selectSpot(type, id) {
      if (occupiedSpots.has(id)) {
        alert("Este puesto ya está ocupado.");
        return;
      }

      selectedSpot = { type, id };
      document.getElementById("form-section").style.display = "block";
      document.getElementById("spot-selection").style.display = "none";
      document.getElementById("title").textContent = "Registrar Vehículo";
    }

    function goBackToMenu() {
        window.location.href = 'index.jsp';
    }

   function submitForm(event) {
    event.preventDefault();
    const plate = document.getElementById("plate").value;
    const owner = document.getElementById("owner").value;

    if (selectedSpot) {
        // Crear objeto con los datos
        const formData = new URLSearchParams();
        formData.append("tipoVehiculo", selectedSpot.type);
        formData.append("placa", plate);
        formData.append("propietario", owner);
        
        // Agregar timestamp de entrada
        const entryTime = new Date().toISOString();
        formData.append("horaEntrada", entryTime);
        
        // Guardar en sessionStorage para uso posterior
        const vehicleData = {
            parqueadero: "PARKING SOFT",
            puesto: selectedSpot.id,
            tipoVehiculo: selectedSpot.type,
            placa: plate,
            propietario: owner,
            horaEntrada: entryTime
        };
        sessionStorage.setItem(`vehicle_${plate}`, JSON.stringify(vehicleData));

        // Enviar datos al servlet
        fetch('registrarVehiculo', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: formData.toString()
        })
        .then(response => {
            if (!response.ok) {
                return response.text().then(text => {
                    throw new Error(text);
                });
            }
            return response.text();
        })
        .then(message => {
            // Si el registro fue exitoso
            occupiedSpots.add(selectedSpot.id);
            const currentTime = new Date().toLocaleTimeString();
            
            // Actualizar el ticket con todos los datos
            document.getElementById("ticket-spot").innerText = selectedSpot.id;
            document.getElementById("ticket-vehicle-type").innerText = selectedSpot.type;
            document.getElementById("ticket-plate").innerText = plate;
            document.getElementById("ticket-owner").innerText = owner;
            document.getElementById("ticket-time").innerText = currentTime;
            
            // Mostrar el ticket
            document.getElementById("form-section").style.display = "none";
            document.getElementById("ticket-section").style.display = "block";
            
            // Deshabilitar el botón del puesto ocupado
            document.getElementById(`spot-${selectedSpot.id}`).disabled = true;
            
            alert(message); // Mostrar mensaje de éxito
        })
        .catch(error => {
            alert(error.message || "Error al procesar la solicitud");
            console.error('Error:', error);
        });
    }
}

    function printTicket() {
      window.print();
    }

    function resetForm() {
      document.getElementById("registerForm").reset();
      document.getElementById("ticket-section").style.display = "none";
      document.getElementById("spot-selection").style.display = "block";
      selectedSpot = null;
    }
  </script>

</body>
</html>


