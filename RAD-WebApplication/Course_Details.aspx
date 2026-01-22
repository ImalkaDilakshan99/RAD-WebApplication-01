<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course Details</title>
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
            padding-top: 20px;
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
            gap: 30px;
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

        /* Course List Section */
        .course-list {
            max-width: 1200px;
            margin: 40px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .course-list h2 {
            font-size: 2.5em;
            color: #003366;
            text-align: center;
            margin-bottom: 40px;
        }

        .courses {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }

        .course-card {
            width: 250px;
            padding: 20px;
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            border-radius: 8px;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .course-card:hover {
            background-color: #ffcc00;
            color: white;
        }

        .course-card h3 {
            font-size: 1.5em;
            margin-bottom: 10px;
        }

        .course-card p {
            font-size: 1em;
            color: #555;
        }

        /* Modal Styling */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            justify-content: center;
            align-items: center;
            z-index: 10;
        }

        .modal-content {
            background-color: white;
            padding: 40px;
            border-radius: 8px;
            max-width: 800px;
            width: 100%;
        }

        .modal h3 {
            font-size: 2em;
            color: #003366;
        }

        .modal p {
            font-size: 1.2em;
            margin-top: 10px;
        }

        .modal button {
            padding: 10px 20px;
            background-color: #003366;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px;
            font-size: 1em;
        }

        .modal button:hover {
            background-color: #005A9C;
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

            .course-card {
                width: 100%;
                max-width: 300px;
            }

            .modal-content {
                padding: 30px;
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
                </ul>
            </nav>
        </div>
    </header>

    <!-- Course List Section -->
    <div class="course-list">
        <h2>Available Courses</h2>
        <div class="courses">
            <!-- Course Card 1 -->
            <div class="course-card" onclick="openModal('Course 1', 'This is a description of Course 1. It covers topics such as programming, software development, and project management.')">
                <h3>Course 1</h3>
                <p>Basic Programming</p>
            </div>
            <!-- Course Card 2 -->
            <div class="course-card" onclick="openModal('Course 2', 'This course covers advanced topics in web development, including HTML, CSS, JavaScript, and React.')">
                <h3>Course 2</h3>
                <p>Web Development</p>
            </div>
            <!-- Course Card 3 -->
            <div class="course-card" onclick="openModal('Course 3', 'A comprehensive course in business management, focusing on leadership, finance, and strategy.')">
                <h3>Course 3</h3>
                <p>Business Management</p>
            </div>
        </div>
    </div>

    <!-- Modal Section (hidden by default) -->
    <div id="courseModal" class="modal">
        <div class="modal-content">
            <h3 id="courseTitle">Course Title</h3>
            <p id="courseDescription">Course description goes here...</p>
            <button onclick="closeModal()">Close</button>
        </div>
    </div>

    <!-- Footer Section -->
    <footer>
        <p>&copy; 2026 Uva Wellassa University | All rights reserved.</p>
    </footer>

    <!-- JavaScript -->
    <script>
        // Function to open the modal and show the course details
        function openModal(title, description) {
            document.getElementById('courseTitle').innerText = title;
            document.getElementById('courseDescription').innerText = description;
            document.getElementById('courseModal').style.display = 'flex';
        }

        // Function to close the modal
        function closeModal() {
            document.getElementById('courseModal').style.display = 'none';
        }
    </script>
</body>
</html>
