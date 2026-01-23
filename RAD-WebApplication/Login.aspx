<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Form</title>
    <style>
        /* General Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            color: #333;
            font-size: 16px;
            padding: 50px 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        /* Login Form Styling */
        .login-container {
            background-color: white;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }

        .login-container h2 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 2em;
            color: #003366;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-size: 1.1em;
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            font-size: 1em;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .form-group input[type="submit"] {
            background-color: #003366;
            color: white;
            font-size: 1.1em;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .form-group input[type="submit"]:hover {
            background-color: #005A9C;
        }

        .form-group p {
            text-align: center;
            margin-top: 10px;
        }

        .form-group p a {
            color: #003366;
            text-decoration: none;
        }

        .form-group p a:hover {
            text-decoration: underline;
        }

        /* Error Message Styling */
        .error-message {
            color: red;
            font-size: 0.9em;
            margin-top: 10px;
            text-align: center;
        }

    </style>
</head>
<body>
    <!-- Login Form Section -->
    <div class="login-container">
        <h2>Login</h2>
        <form id="loginForm" onsubmit="return validateForm(event)">
            <div class="form-group">
                <label for="username">Username or Email</label>
                <input type="text" id="username" name="username" required placeholder="Enter your username or email">
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required placeholder="Enter your password">
            </div>
            <div class="form-group">
                <input type="submit" value="Login">
            </div>
            <div class="form-group">
                <p>Don't have an account? <a href="Registration.aspx">Sign Up</a></p>
            </div>
        </form>
        <div id="error-message" class="error-message"></div>
    </div>

    <!-- JavaScript -->
    <script>
        // Function to validate form input
        function validateForm(event) {
            event.preventDefault(); // Prevent form submission

            // Get form data
            const username = document.getElementById('username').value;
            const password = document.getElementById('password').value;
            const errorMessage = document.getElementById('error-message');

            // Basic form validation (empty fields)
            if (username === "" || password === "") {
                errorMessage.textContent = "Both fields are required!";
                return false;
            }

            // Simulate login validation (for example, check if username and password match)
            if (username === "user@example.com" && password === "password123") {
                errorMessage.textContent = ""; // Clear any previous error messages
                alert("Login successful!"); // Show login success message
                window.location.href = "/dashboard"; // Redirect to the dashboard (or home page)
            } else {
                errorMessage.textContent = "Invalid username or password. Please try again.";
                return false;
            }
        }
    </script>
</body>
</html>
