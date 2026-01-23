<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign-Up Form</title>
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

        /* Sign-Up Form Styling */
        .signup-container {
            background-color: white;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 500px;
        }

        .signup-container h2 {
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
    <!-- Sign-Up Form Section -->
    <div class="signup-container">
        <h2>Sign Up</h2>
        <form id="signupForm" onsubmit="return validateForm(event)">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" required placeholder="Enter your username">
            </div>
            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" id="email" name="email" required placeholder="Enter your email address">
            </div>
            <div class="form-group">
                <label for="contact">Contact Number</label>
                <input type="text" id="contact" name="contact" required placeholder="Enter your contact number">
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required placeholder="Enter your password">
            </div>
            <div class="form-group">
                <label for="confirmPassword">Confirm Password</label>
                <input type="password" id="confirmPassword" name="confirmPassword" required placeholder="Confirm your password">
            </div>
            <div class="form-group">
                <input type="submit" value="Sign Up">
            </div>
            <div class="form-group">
                <p>Already have an account? <a href="Login.aspx"/login">Login here</a></p>
            </div>
        </form>
        <div id="error-message" class="error-message"></div>
    </div>

    <!-- JavaScript -->
    <script>
        function validateForm(event) {
            event.preventDefault(); // Prevent the default form submission

            // Clear any previous error messages
            document.getElementById('error-message').textContent = "";

            // Get form data
            const username = document.getElementById('username').value;
            const email = document.getElementById('email').value;
            const contact = document.getElementById('contact').value;
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirmPassword').value;
            const errorMessage = document.getElementById('error-message');

            // Basic validation (check if fields are not empty)
            if (username === "" || email === "" || contact === "" || password === "" || confirmPassword === "") {
                errorMessage.textContent = "All fields are required!";
                return false;
            }

            // Validate password length
            if (password.length < 6) {
                errorMessage.textContent = "Password must be at least 6 characters long!";
                return false;
            }

            // Check if passwords match
            if (password !== confirmPassword) {
                errorMessage.textContent = "Passwords do not match!";
                return false;
            }

            // Simple email validation
            const emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
            if (!emailPattern.test(email)) {
                errorMessage.textContent = "Please enter a valid email address!";
                return false;
            }

            // Simple contact number validation (10 digits)
            const contactPattern = /^[0-9]{10}$/;
            if (!contactPattern.test(contact)) {
                errorMessage.textContent = "Please enter a valid contact number!";
                return false;
            }

            // If all validations pass, simulate successful signup
            alert("Sign Up successful!");
            document.getElementById('signupForm').reset(); // Reset the form
            return true; // Allow form submission
        }
    </script>
</body>
</html>
