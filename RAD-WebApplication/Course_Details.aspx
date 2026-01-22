<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course Details</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
        }

        header {
            background-color: #003366;
            color: white;
            padding: 20px 0;
        }

        header .container {
            max-width: 1200px;
            margin: auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 20px;
        }

        header h1 {
            font-size: 2.2em;
        }

        nav ul {
            list-style: none;
            display: flex;
            gap: 20px;
        }

        nav ul li a {
            color: white;
            text-decoration: none;
            font-weight: bold;
        }

        nav ul li a:hover {
            color: #ffcc00;
        }

        .course-list {
            max-width: 1200px;
            margin: 40px auto;
            background: white;
            padding: 30px;
            border-radius: 8px;
        }

        .course-list h2 {
            text-align: center;
            color: #003366;
            margin-bottom: 30px;
        }

        .courses {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
            justify-content: center;
        }

        .course-card {
            width: 260px;
            background: #f9f9f9;
            padding: 20px;
            border-radius: 8px;
            border: 1px solid #ddd;
            cursor: pointer;
            text-align: center;
            transition: 0.3s;
        }

        .course-card:hover {
            background: #ffcc00;
            color: white;
        }

        .course-card h3 {
            margin-bottom: 10px;
        }

        /* Modal */
        .modal {
            display: none;
            position: fixed;
            inset: 0;
            background: rgba(0,0,0,0.5);
            justify-content: center;
            align-items: center;
            z-index: 100;
        }

        .modal-content {
            background: white;
            width: 90%;
            max-width: 800px;
            padding: 30px;
            border-radius: 8px;
            max-height: 90vh;
            overflow-y: auto;
        }

        .modal-content h3 {
            color: #003366;
            margin-bottom: 15px;
        }

        .modal-content ul {
            margin-left: 20px;
            margin-top: 10px;
        }

        .modal-buttons {
            margin-top: 25px;
            display: flex;
            justify-content: flex-end;
            gap: 10px;
        }

        .btn {
            padding: 10px 18px;
            border: none;
            border-radius: 5px;
            font-size: 1em;
            cursor: pointer;
        }

        .btn-enroll {
            background: #28a745;
            color: white;
        }

        .btn-enroll:hover {
            background: #218838;
        }

        .btn-close {
            background: #003366;
            color: white;
        }

        .btn-close:hover {
            background: #005a9c;
        }

        footer {
            margin-top: 60px;
            background: #222;
            color: white;
            text-align: center;
            padding: 15px;
            font-size: 0.9em;
        }

        @media(max-width:768px) {
            nav ul {
                flex-direction: column;
                text-align: center;
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
                <li><a href="Enrollment.aspx">Enroll</a></li>
                <li><a href="/contact">Contact</a></li>
            </ul>
        </nav>
    </div>
</header>

<div class="course-list">
    <h2>Available Courses</h2>

    <div class="courses">

        <div class="course-card" data-course="ICT101">
            <h3>ICT101</h3>
            <p>Introduction to Programming</p>
        </div>

        <div class="course-card" data-course="ICT205">
            <h3>ICT205</h3>
            <p>Web Application Development</p>
        </div>

        <div class="course-card" data-course="MGT210">
            <h3>MGT210</h3>
            <p>Business Management</p>
        </div>

    </div>
</div>

<!-- Modal -->
<div id="courseModal" class="modal">
    <div class="modal-content">
        <h3 id="courseTitle"></h3>
        <div id="courseDescription"></div>

        <div class="modal-buttons">
            <button class="btn btn-enroll" id="enrollBtn">Enroll Now</button>
            <button class="btn btn-close" id="closeBtn">Close</button>
        </div>
    </div>
</div>

<footer>
    &copy; 2026 Uva Wellassa University | All Rights Reserved
</footer>

<script>
    const courseData = {
        'ICT101': {
            title: 'ICT101 – Introduction to Programming',
            description: `Duration: 1 Semester<br>Credits: 3<br>Semester: Year 1 – Semester 1<br><br>
                <strong>Description:</strong><br>
                This course introduces fundamental programming concepts and problem-solving techniques.<br><br>
                <strong>Key Topics:</strong>
                <ul>
                    <li>Algorithms & Flowcharts</li>
                    <li>Variables & Data Types</li>
                    <li>Control Structures</li>
                    <li>Functions</li>
                </ul>`
        },
        'ICT205': {
            title: 'ICT205 – Web Application Development',
            description: `Duration: 1 Semester<br>Credits: 3<br>Semester: Year 2 – Semester 1<br><br>
                <strong>Description:</strong><br>
                Focuses on modern web development using front-end and basic back-end concepts.<br><br>
                <strong>Key Topics:</strong>
                <ul>
                    <li>HTML & CSS</li>
                    <li>JavaScript</li>
                    <li>Responsive Design</li>
                    <li>Client-Server Model</li>
                </ul>`
        },
        'MGT210': {
            title: 'MGT210 – Business Management',
            description: `Duration: 1 Semester<br>Credits: 2<br>Semester: Year 2 – Semester 2<br><br>
                <strong>Description:</strong><br>
                Introduces management principles and organizational behavior.<br><br>
                <strong>Key Topics:</strong>
                <ul>
                    <li>Leadership</li>
                    <li>Planning & Strategy</li>
                    <li>Finance Basics</li>
                    <li>Human Resource Management</li>
                </ul>`
        }
    };

    let selectedCourseCode = "";

    // Add event listeners to course cards
    document.querySelectorAll('.course-card').forEach(card => {
        card.addEventListener('click', function () {
            const courseCode = this.getAttribute('data-course');
            openModal(courseCode);
        });
    });

    // Close button event
    document.getElementById('closeBtn').addEventListener('click', closeModal);

    // Enroll button event
    document.getElementById('enrollBtn').addEventListener('click', enrollNow);

    // Close modal when clicking outside
    document.getElementById('courseModal').addEventListener('click', function (e) {
        if (e.target === this) {
            closeModal();
        }
    });

    function openModal(courseCode) {
        const course = courseData[courseCode];
        if (course) {
            document.getElementById("courseTitle").innerText = course.title;
            document.getElementById("courseDescription").innerHTML = course.description;
            selectedCourseCode = courseCode;
            document.getElementById("courseModal").style.display = "flex";
        }
    }

    function closeModal() {
        document.getElementById("courseModal").style.display = "none";
    }

    function enrollNow() {
        window.location.href = "Enrollment.aspx?course=" + selectedCourseCode;
    }
</script>

</body>
</html>