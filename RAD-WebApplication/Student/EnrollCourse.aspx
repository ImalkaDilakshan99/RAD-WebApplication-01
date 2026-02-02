<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Enroll Course - Student Dashboard</title>

    <style>
        * { margin:0; padding:0; box-sizing:border-box; }
        body {
            font-family: Arial, sans-serif;
            background: #f4f4f4;
            color: #222;
            min-height: 100vh;
        }

        header{
            background:#003366;
            color:#fff;
            padding:18px 0;
            box-shadow:0 2px 10px rgba(0,0,0,0.12);
        }
        header .container{
            max-width:1200px;
            margin:0 auto;
            padding:0 18px;
            display:flex;
            align-items:center;
            justify-content:space-between;
            gap:12px;
        }
        header h1{ font-size:22px; letter-spacing:1px; }
        .user-chip{
            display:flex; align-items:center; gap:10px;
            background:rgba(255,255,255,0.12);
            padding:8px 12px; border-radius:999px;
            font-size:14px;
        }
        .user-dot{ width:10px; height:10px; border-radius:50%; background:#39d98a; }

        .layout{
            max-width:1200px;
            margin:18px auto;
            padding:0 18px 40px;
            display:grid;
            grid-template-columns: 260px 1fr;
            gap:18px;
        }

        aside{
            background:#fff;
            border-radius:12px;
            box-shadow:0 4px 10px rgba(0,0,0,0.08);
            overflow:hidden;
        }
        .aside-head{
            padding:14px 14px;
            background:#0b4a84;
            color:#fff;
            display:flex;
            align-items:center;
            justify-content:space-between;
        }
        .aside-head button{
            border:none;
            background:rgba(255,255,255,0.2);
            color:#fff;
            padding:8px 10px;
            border-radius:8px;
            cursor:pointer;
        }
        .menu{
            padding:10px;
            display:flex;
            flex-direction:column;
            gap:6px;
        }
        .menu a{
            text-decoration:none;
            color:#203040;
            padding:10px 12px;
            border-radius:10px;
            display:flex;
            align-items:center;
            justify-content:space-between;
            transition:0.2s;
        }
        .menu a:hover{ background:#f0f6ff; }
        .menu a.active{ background:#e7f1ff; font-weight:bold; }
        .badge{
            background:#ffcc00;
            color:#111;
            font-size:12px;
            padding:3px 8px;
            border-radius:999px;
            font-weight:bold;
        }

        main{
            display:flex;
            flex-direction:column;
            gap:16px;
        }

        .hero{
            background: linear-gradient(135deg, #003366, #0b4a84);
            color:#fff;
            border-radius:12px;
            padding:18px;
            box-shadow:0 4px 10px rgba(0,0,0,0.08);
        }
        .hero h2{ font-size:22px; margin-bottom:6px; }

        .card{
            background:#fff;
            border-radius:12px;
            padding:18px;
            box-shadow:0 4px 10px rgba(0,0,0,0.08);
        }
        .card h3{ font-size:18px; margin-bottom:16px; color:#003366; }

        .filter-bar{
            display:flex;
            gap:10px;
            margin-bottom:16px;
            flex-wrap:wrap;
        }
        .filter-bar input, .filter-bar select{
            padding:8px 12px;
            border:1px solid #ddd;
            border-radius:8px;
            font-size:14px;
        }
        .filter-bar input{ flex:1; min-width:200px; }

        .course-grid{
            display:grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap:14px;
        }
        .course-card{
            border:1px solid #e5e5e5;
            border-radius:12px;
            padding:16px;
            transition:0.2s;
            background:#fff;
        }
        .course-card:hover{
            box-shadow:0 4px 12px rgba(0,0,0,0.12);
            transform:translateY(-2px);
        }
        .course-header{
            display:flex;
            justify-content:space-between;
            align-items:start;
            margin-bottom:10px;
        }
        .course-code{
            font-size:12px;
            background:#e7f1ff;
            color:#003366;
            padding:4px 8px;
            border-radius:6px;
            font-weight:bold;
        }
        .course-title{
            font-size:16px;
            font-weight:bold;
            color:#003366;
            margin-bottom:8px;
        }
        .course-info{
            font-size:13px;
            color:#666;
            margin-bottom:6px;
        }
        .course-stats{
            display:flex;
            gap:12px;
            margin:10px 0;
            font-size:12px;
        }
        .stat-item{
            display:flex;
            align-items:center;
            gap:4px;
        }
        .btn-enroll{
            width:100%;
            padding:8px;
            background:#003366;
            color:#fff;
            border:none;
            border-radius:8px;
            cursor:pointer;
            font-weight:bold;
            margin-top:10px;
        }
        .btn-enroll:hover{
            background:#0b4a84;
        }
        .btn-enroll:disabled{
            background:#ccc;
            cursor:not-allowed;
        }
        .status-badge{
            display:inline-block;
            padding:4px 8px;
            border-radius:999px;
            font-size:11px;
            font-weight:bold;
        }
        .status-badge.available{
            background:#e7fff2;
            color:#097a3a;
        }
        .status-badge.full{
            background:#ffe7e7;
            color:#8a1010;
        }
        .status-badge.enrolled{
            background:#fff7df;
            color:#8a5b00;
        }

        footer{
            background:#222;
            color:#fff;
            text-align:center;
            padding:18px 0;
        }

        @media (max-width: 980px){
            .layout{ grid-template-columns: 1fr; }
            .course-grid{ grid-template-columns: 1fr; }
        }
    </style>
</head>

<body>
<header>
    <div class="container">
        <h1>University Portal</h1>
        <div class="user-chip">
            <span class="user-dot"></span>
            <span>Student: John Doe</span>
        </div>
    </div>
</header>

<div class="layout">
    <aside id="sidebar">
        <div class="aside-head">
            <strong>Student Menu</strong>
            <button type="button" onclick="toggleMenu()">☰</button>
        </div>

        <nav class="menu" id="menu">
            <a href="Student-Dashboard.aspx">Dashboard <span class="badge">New</span></a>
            <a href="MyCourses.aspx">My Courses</a>
            <a class="active" href="EnrollCourse.aspx">Enroll Course</a>
            <a href="TimeTable.aspx">Timetable</a>
            <a href="Results.aspx">Results</a>
            <a href="Profile.aspx">Profile</a>
            <a href="#">Logout</a>
        </nav>
    </aside>

    <main>
        <section class="hero">
            <h2>Course Enrollment</h2>
            <p>Browse and enroll in available courses for Semester 5</p>
        </section>

        <div class="card">
            <h3>Available Courses</h3>
            <div class="filter-bar">
                <input type="text" placeholder="Search courses..." oninput="alert('Search: ' + this.value)" />
                <select onchange="alert('Filter by: ' + this.value)">
                    <option value="all">All Departments</option>
                    <option value="cs">Computer Science</option>
                    <option value="ba">Business Analytics</option>
                    <option value="en">English</option>
                    <option value="mt">Mathematics</option>
                </select>
                <select onchange="alert('Filter by: ' + this.value)">
                    <option value="all">All Levels</option>
                    <option value="level1">Level 1</option>
                    <option value="level2">Level 2</option>
                    <option value="level3">Level 3</option>
                </select>
            </div>

            <div class="course-grid">
                <div class="course-card">
                    <div class="course-header">
                        <div class="course-code">CS3101</div>
                        <span class="status-badge available">Available</span>
                    </div>
                    <div class="course-title">Machine Learning</div>
                    <div class="course-info">📚 Instructor: Dr. Wijesinghe</div>
                    <div class="course-info">🕐 Mon & Wed, 8:00 AM - 10:00 AM</div>
                    <div class="course-stats">
                        <div class="stat-item">💳 Credits: 4</div>
                        <div class="stat-item">👥 35/40 seats</div>
                    </div>
                    <button class="btn-enroll" onclick="enrollCourse('Machine Learning')">Enroll Now</button>
                </div>

                <div class="course-card">
                    <div class="course-header">
                        <div class="course-code">CS3102</div>
                        <span class="status-badge available">Available</span>
                    </div>
                    <div class="course-title">Cloud Computing</div>
                    <div class="course-info">📚 Instructor: Ms. Rajapaksha</div>
                    <div class="course-info">🕐 Tue & Thu, 10:00 AM - 12:00 PM</div>
                    <div class="course-stats">
                        <div class="stat-item">💳 Credits: 4</div>
                        <div class="stat-item">👥 28/40 seats</div>
                    </div>
                    <button class="btn-enroll" onclick="enrollCourse('Cloud Computing')">Enroll Now</button>
                </div>

                <div class="course-card">
                    <div class="course-header">
                        <div class="course-code">CS3103</div>
                        <span class="status-badge full">Full</span>
                    </div>
                    <div class="course-title">Mobile App Development</div>
                    <div class="course-info">📚 Instructor: Mr. Gunasekara</div>
                    <div class="course-info">🕐 Mon & Wed, 2:00 PM - 4:00 PM</div>
                    <div class="course-stats">
                        <div class="stat-item">💳 Credits: 4</div>
                        <div class="stat-item">👥 40/40 seats</div>
                    </div>
                    <button class="btn-enroll" disabled>Course Full</button>
                </div>

                <div class="course-card">
                    <div class="course-header">
                        <div class="course-code">BA3101</div>
                        <span class="status-badge available">Available</span>
                    </div>
                    <div class="course-title">Data Mining</div>
                    <div class="course-info">📚 Instructor: Dr. Samarasinghe</div>
                    <div class="course-info">🕐 Tue & Thu, 2:00 PM - 4:00 PM</div>
                    <div class="course-stats">
                        <div class="stat-item">💳 Credits: 3</div>
                        <div class="stat-item">👥 22/35 seats</div>
                    </div>
                    <button class="btn-enroll" onclick="enrollCourse('Data Mining')">Enroll Now</button>
                </div>

                <div class="course-card">
                    <div class="course-header">
                        <div class="course-code">CS3104</div>
                        <span class="status-badge available">Available</span>
                    </div>
                    <div class="course-title">Software Engineering</div>
                    <div class="course-info">📚 Instructor: Dr. Dissanayake</div>
                    <div class="course-info">🕐 Fri, 8:00 AM - 12:00 PM</div>
                    <div class="course-stats">
                        <div class="stat-item">💳 Credits: 4</div>
                        <div class="stat-item">👥 30/40 seats</div>
                    </div>
                    <button class="btn-enroll" onclick="enrollCourse('Software Engineering')">Enroll Now</button>
                </div>

                <div class="course-card">
                    <div class="course-header">
                        <div class="course-code">CS3105</div>
                        <span class="status-badge available">Available</span>
                    </div>
                    <div class="course-title">Artificial Intelligence</div>
                    <div class="course-info">📚 Instructor: Dr. Karunaratne</div>
                    <div class="course-info">🕐 Wed & Fri, 10:00 AM - 12:00 PM</div>
                    <div class="course-stats">
                        <div class="stat-item">💳 Credits: 4</div>
                        <div class="stat-item">👥 25/35 seats</div>
                    </div>
                    <button class="btn-enroll" onclick="enrollCourse('Artificial Intelligence')">Enroll Now</button>
                </div>

                <div class="course-card">
                    <div class="course-header">
                        <div class="course-code">BA3102</div>
                        <span class="status-badge available">Available</span>
                    </div>
                    <div class="course-title">Business Intelligence</div>
                    <div class="course-info">📚 Instructor: Ms. Jayawardena</div>
                    <div class="course-info">🕐 Mon & Thu, 2:00 PM - 4:00 PM</div>
                    <div class="course-stats">
                        <div class="stat-item">💳 Credits: 3</div>
                        <div class="stat-item">👥 18/30 seats</div>
                    </div>
                    <button class="btn-enroll" onclick="enrollCourse('Business Intelligence')">Enroll Now</button>
                </div>

                <div class="course-card">
                    <div class="course-header">
                        <div class="course-code">EN3101</div>
                        <span class="status-badge available">Available</span>
                    </div>
                    <div class="course-title">Professional Communication</div>
                    <div class="course-info">📚 Instructor: Mr. Silva</div>
                    <div class="course-info">🕐 Tue, 2:00 PM - 4:00 PM</div>
                    <div class="course-stats">
                        <div class="stat-item">💳 Credits: 2</div>
                        <div class="stat-item">👥 20/30 seats</div>
                    </div>
                    <button class="btn-enroll" onclick="enrollCourse('Professional Communication')">Enroll Now</button>
                </div>
            </div>
        </div>

        <div class="card">
            <h3>Enrollment Guidelines</h3>
            <ul style="line-height:1.8; padding-left:20px;">
                <li>Maximum credit limit per semester: 18 credits</li>
                <li>Minimum credit requirement: 12 credits</li>
                <li>Ensure no timetable conflicts before enrolling</li>
                <li>Prerequisites must be completed before enrolling in advanced courses</li>
                <li>Enrollment deadline: February 15, 2026</li>
                <li>Course drops allowed within first 2 weeks of semester</li>
            </ul>
        </div>
    </main>
</div>

<footer>
    <p>&copy; 2026 Uva Wellassa University | All rights reserved.</p>
</footer>

<script>
    function toggleMenu() {
        const menu = document.getElementById('menu');
        menu.style.display = (menu.style.display === 'none') ? 'flex' : 'none';
    }

    function enrollCourse(courseName) {
        if (confirm('Are you sure you want to enroll in ' + courseName + '?')) {
            alert('Successfully enrolled in ' + courseName + '!\n\nPlease check your timetable for schedule details.');
        }
    }
</script>
</body>
</html>