
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Registration</title>
    <style>
        /* General Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            line-height: 1.6;
            background-color: #f4f4f4;
            color: #333;
            font-size: 16px;
        }

        /* Header Styling */
        header {
            background-color: #003366;
            color: #fff;
            padding: 20px 0;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        header .container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        header h1 {
            font-size: 2.5em;
            font-weight: bold;
            letter-spacing: 2px;
        }

        header nav ul {
            list-style: none;
            display: flex;
            gap: 20px;
        }

        header nav ul li {
            display: inline;
        }

        header nav ul li a {
            color: white;
            text-decoration: none;
            font-weight: bold;
            transition: all 0.3s ease;
        }

        header nav ul li a:hover {
            color: #ffcc00;
            text-decoration: underline;
        }

        /* Registration Form Styling */
        .form-container {
            max-width: 800px;
            margin: 40px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .form-container h2 {
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

        .form-group input,
        .form-group select {
            width: 100%;
            padding: 10px;
            font-size: 1em;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .form-group input[type="submit"],
        .form-group input[type="reset"] {
            background-color: #003366;
            color: white;
            font-size: 1.1em;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .form-group input[type="submit"]:hover,
        .form-group input[type="reset"]:hover {
            background-color: #005A9C;
        }

        .form-group input[type="reset"] {
            background-color: #ccc;
            margin-left: 10px;
        }

        /* Footer Styling */
        footer {
            background-color: #222;
            color: white;
            text-align: center;
            padding: 20px 0;
            margin-top: 60px;
            font-size: 0.9em;
        }

        footer a {
            color: #ffcc00;
            text-decoration: none;
        }

        footer a:hover {
            text-decoration: underline;
        }

        /* Responsive Styles */
        @media (max-width: 768px) {
            header .container {
                flex-direction: column;
                text-align: center;
            }

            header nav ul {
                flex-direction: column;
                gap: 15px;
            }

            .form-container {
                padding: 15px;
            }

            .form-group input,
            .form-group select {
                padding: 12px;
                font-size: 1.1em;
            }

            .form-group input[type="submit"],
            .form-group input[type="reset"] {
                font-size: 1.2em;
            }
        }
    </style>
</head>
<body>
    <!-- Header Section -->
    <header>
        <div class="container">
           <h1>Uva Wellassa University</h1>
            <nav>
                <ul>
                   <li><a href="Home.aspx">Home</a></li>
                   <li><a href="Student.aspx">Student Registration</a></li>
                     <li><a href="Course_Details.aspx">Course Details</a></li>
                    <li><a href="Enrollment.aspx">Enroll for Courses</a></li>
                  <li><a href="/about">About Us</a></li>
                  <li><a href="/academics">Academics</a></li>
                  <li><a href="/admissions">Admissions</a></li>
                  <li><a href="/contact">Contact</a></li>
                    <li><a href="Login.aspx">LogIn</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <!-- Registration Form Section -->
    <div class="form-container">
        <h2>Student Registration</h2>
        <form action="/register" method="POST">
            <div class="form-group">
                <label for="firstName">First Name</label>
                <input type="text" id="firstName" name="firstName" required placeholder="Enter your first name">
            </div>
            <div class="form-group">
                <label for="lastName">Last Name</label>
                <input type="text" id="lastName" name="lastName" required placeholder="Enter your last name">
            </div>
            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" id="email" name="email" required placeholder="Enter your email">
            </div>
            <div class="form-group">
                <label for="course">Course</label>
                <select id="course" name="course" required>
                    <option value="computer-science">Computer Science</option>
                    <option value="engineering">Engineering</option>
                    <option value="business">Business Administration</option>
                    <option value="medicine">Medicine</option>
                </select>
            </div>
            <div class="form-group">
                <input type="submit" value="Register">
                <input type="reset" value="Clear">
            </div>
        </form>
    </div>

    <!-- Footer Section -->
    <footer>
        <div class="container">
            <p>&copy; 2026 Uva Wellassa University | All rights reserved.</p>
        </div>
    </footer>
</body>
</html>
