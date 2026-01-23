<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
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

        /* Forgot Password Container */
        .forgot-password-container {
            background-color: white;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 500px;
        }

        .forgot-password-container h2 {
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

        /* Hide New Password Fields Initially */
        #newPasswordSection {
            display: none;
        }
    </style>
</head>
<body>
    <!-- Forgot Password Form Section -->
    <div class="forgot-password-container">
        <h2>Forgot Password</h2>
        <form id="forgotPasswordForm" onsubmit="return handleForgotPassword(event)">
            <div class="form-group">
                <label for="usernameOrEmail">Username or Email</label>
                <input type="text" id="usernameOrEmail" name="usernameOrEmail" required placeholder="Enter your username or email address">
            </div>
            <div class="form-group">
                <input type="submit" value="Check Availability">
            </div>
        </form>

        <!-- New Password Section (Hidden Initially) -->
        <div id="newPasswordSection">
            <h2>Reset Your Password</h2>
            <form id="resetPasswordForm" onsubmit="return handleResetPassword(event)">
                <div class="form-group">
                    <label for="newPassword">New Password</label>
                    <input type="password" id="newPassword" name="newPassword" required placeholder="Enter your new password">
                </div>
                <div class="form-group">
                    <label for="confirmPassword">Confirm Password</label>
                    <input type="password" id="confirmPassword" name="confirmPassword" required placeholder="Confirm your new password">
                </div>
                <div class="form-group">
                    <input type="submit" value="Reset Password">
                </div>
            </form>
        </div>

        <div id="error-message" class="error-message"></div>
    </div>

    <!-- JavaScript -->
    <script>
        // Simulating checking if the username/email exists in the database
        function handleForgotPassword(event) {
            event.preventDefault(); // Prevent default form submission

            const usernameOrEmail = document.getElementById('usernameOrEmail').value;
            const errorMessage = document.getElementById('error-message');

            // Simulated database check (in a real application, make an API call here)
            const validEmail = "user@example.com"; // Simulated valid email for demonstration

            // Check if email exists
            if (usernameOrEmail === validEmail) {
                // Clear previous error message
                errorMessage.textContent = "";

                // Show the New Password section
                document.getElementById('newPasswordSection').style.display = "block";
            } else {
                // Show error message if the email doesn't exist
                errorMessage.textContent = "Email or Username not found! Please check and try again.";
            }
        }

        // Handle password reset
        function handleResetPassword(event) {
            event.preventDefault(); // Prevent form submission

            const newPassword = document.getElementById('newPassword').value;
            const confirmPassword = document.getElementById('confirmPassword').value;
            const errorMessage = document.getElementById('error-message');

            // Validate if passwords match
            if (newPassword !== confirmPassword) {
                errorMessage.textContent = "Passwords do not match! Please try again.";
                return false;
            }

            // Simulate password reset success
            alert("Your password has been successfully reset!");
            document.getElementById('forgotPasswordForm').reset();
            document.getElementById('resetPasswordForm').reset();

            // Hide the New Password section
            document.getElementById('newPasswordSection').style.display = "none";
            return true;
        }
    </script>
</body>
</html>
