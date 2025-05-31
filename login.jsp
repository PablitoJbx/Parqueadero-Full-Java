
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login - Parqueadero</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
      margin: 0;
      background-color: #2d2d48;
    }
    .login-container {
      background-color: white;
      padding: 20px 30px;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
      width: 100%;
      max-width: 400px;
      text-align: center;
    }
    .login-container h2 {
      color: #2d2d48;
      margin-bottom: 20px;
      font-size: 24px;
      font-weight: bold;
    }
    .form-group {
      margin-bottom: 15px;
      text-align: left;
    }
    .form-group label {
      display: block;
      font-size: 14px;
      font-weight: bold;
      margin-bottom: 5px;
    }
    .form-group input {
      width: 100%;
      padding: 10px;
      font-size: 14px;
      border-radius: 4px;
      border: 1px solid #ccc;
      box-sizing: border-box;
    }
    .form-group input:focus {
      border-color: #4FD1C5;
      outline: none;
      box-shadow: 0 0 5px rgba(79, 209, 197, 0.5);
    }
    button {
      width: 100%;
      padding: 10px;
      background-color: #4FD1C5;
      color: white;
      border: none;
      border-radius: 4px;
      font-weight: bold;
      font-size: 16px;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }
    button:hover {
      background-color: #38B2AC;
    }
    .error-message {
      color: #E53E3E;
      font-size: 14px;
      margin-top: 15px;
      display: none; /* Oculto por defecto */
    }
  </style>
</head>
<body>
  <div class="login-container">
    <h2>Iniciar Sesión</h2>
    <form id="loginForm" onsubmit="login(event)">
      <div class="form-group">
        <label for="username">Usuario</label>
        <input type="text" id="username" placeholder="Ingrese su usuario" required />
      </div>
      <div class="form-group">
        <label for="password">Contraseña</label>
        <input type="password" id="password" placeholder="Ingrese su contraseña" required />
      </div>
      <button type="submit">Entrar</button>
    </form>
    <p class="error-message" id="errorMessage">Usuario o contraseña incorrecta. Inténtalo de nuevo.</p>
  </div>

  <script>
    function login(event) {
      event.preventDefault();

      // Credenciales correctas simuladas
      const correctUsername = "admin";
      const correctPassword = "12345";

      // Obtener valores ingresados
      const username = document.getElementById("username").value;
      const password = document.getElementById("password").value;

      // Validar credenciales
      if (username === correctUsername && password === correctPassword) {
        // Redirigir al sistema principal si es correcto
        window.location.href = "index.jsp";
      } else {
        // Mostrar mensaje de error
        const errorMessage = document.getElementById("errorMessage");
        errorMessage.style.display = "block";
      }
    }
  </script>
</body>
</html>