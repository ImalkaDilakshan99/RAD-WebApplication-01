@{
    ViewBag.Title = "University Home Page";
}

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Uva Wellassa University</title>
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

        /* Hero Section Styling */
        .hero {
            background: url('https://via.placeholder.com/1920x800?text=University+Campus') no-repeat center center/cover;
            color: white;
            padding: 100px 20px;
            text-align: center;
            position: relative;
        }

        .hero::after {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.4);
            z-index: 1;
        }

        .hero .hero-content {
            position: relative;
            z-index: 2;
        }

        .hero h2 {
            font-size: 3.5em;
            margin-bottom: 20px;
            font-weight: bold;
            letter-spacing: 1px;
        }

        .hero p {
            font-size: 1.5em;
            margin-bottom: 30px;
        }

        .cta-button {
            background-color: #ffcc00;
            color: black;
            padding: 15px 30px;
            text-decoration: none;
            font-size: 1.3em;
            border-radius: 5px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }

        .cta-button:hover {
            background-color: #e6b800;
            transform: translateY(-5px);
        }

        /* News Section Styling */
        .news {
            background-color: #fff;
            padding: 60px 20px;
            text-align: center;
            max-width: 1200px;
            margin: 0 auto;
        }

        .news h2 {
            font-size: 2.5em;
            margin-bottom: 40px;
            font-weight: bold;
            color: #003366;
        }

        .news ul {
            list-style: none;
            padding-left: 0;
        }

        .news ul li {
            margin: 15px 0;
        }

        .news ul li a {
            color: #003366;
            text-decoration: none;
            font-size: 1.1em;
            transition: all 0.3s ease;
        }

        .news ul li a:hover {
            color: #ffcc00;
            text-decoration: underline;
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

            .hero h2 {
                font-size: 2.8em;
            }

            .hero p {
                font-size: 1.2em;
            }

            .cta-button {
                font-size: 1.1em;
            }

            .news h2 {
                font-size: 2.2em;
            }

            .news ul li a {
                font-size: 1em;
            }
        }
    </style>
</head>
<body>
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

    <main>
        <section class="hero">
            <div class="hero-content">
                <h2>Welcome to Our University</h2>
                <p>Empowering the future with world-class education.</p>
                <a href="Student.aspx" class="cta-button">Apply Now</a>
            </div>
        </section>

        <section class="news">
            <h2>Latest News</h2>
            <ul>
                <li><a href="#">University wins global research award</a></li>
                <li><a href="#">New courses offered for the upcoming semester</a></li>
                <li><a href="#">Sports meet happening this weekend</a></li>
            </ul>
        </section>
    </main>

    <footer>
        <div class="container">
            <p>&copy; 2026 Uva Wellassa University | All rights reserved.</p>
        </div>
    </footer>
</body>
</html>
