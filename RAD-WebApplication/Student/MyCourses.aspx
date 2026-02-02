<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>My Courses - Student Dashboard</title>

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

        .course-detail{
            border:1px solid #e5e5e5;
            border-radius:12px;
            padding:18px;
            margin-bottom:14px;
            background:#fff;
        }
        .course-header{
            display:flex;
            justify-content:space-between;
            align-items:start;
            margin-bottom:14px;
            padding-bottom:14px;
            border-bottom:2px solid #f0f0f0;
        }
        .course-title{
            font-size:18px;
            font-weight:bold;
            color:#003366;
            margin-bottom:6px;
        }
        .course-code{
            font-size:12px;
            background:#e7f1ff;
            color:#003366;
            padding:4px 8px;
            border-radius:6px;
            font-weight:bold;
        }
        .course-info-grid{
            display:grid;
            grid-template-columns: repeat(3, 1fr);
            gap:12px;
            margin-bottom:14px;
        }
        .info-item{
            display:flex;
            flex-direction:column;
            gap:4px;
        }
        .info-label{
            font-size:12px;
            color:#666;
            font-weight:bold;
        }
        .info-value{
            font-size:14px;
            color:#222;
        }

        .progress-bar{
            background:#f0f0f0;
            border-radius:999px;
            height:8px;
            overflow:hidden;
            margin:10px 0;
        }
        .progress-fill{
            background:#003366;
            height:100%;
            border-radius:999px;
            transition:0.3s;
        }

        .tabs{
            display:flex;
            gap:8px;
            border-bottom:2px solid #e5e5e5;
            margin-bottom:14px;
        }
        .tab{
            padding:8px 16px;
            border:none;
            background:none;
            cursor:pointer;
            font-weight:bold;
            color:#666;
            border-bottom:2px solid transparent;
            margin-bottom:-2px;
        }
        .tab.active{
            color:#003366;
            border-bottom-color:#003366;
        }

        .assignment-list{
            display:flex;
            flex-direction:column;
            gap:10px;
        }
        .assignment-item{
            display:flex;
            justify-content:space-between;
            align-items:center;
            padding:12px;
            background:#f9f9f9;
            border-radius:8px;
            border-left:3px solid #003366;
        }
        .assignment-item.overdue{
            border-left-color:#dc3545;
            background:#fff5f5;
        }
        .assignment-item.upcoming{
            border-left-color:#ffc107;
            background:#fffef5;
        }
        .assignment-info{
            flex:1;
        }
        .assignment-title{
            font-weight:bold;
            margin-bottom:4px;
        }
        .assignment-meta{
            font-size:12px;
            color:#666;
        }
        .btn-small{
            padding:6px 12px;
            background:#003366;
            color:#fff;
            border:none;
            border-radius:6px;
            cursor:pointer;
            font-size:13px;
        }

        .material-list{
            display:flex;
            flex-direction:column;
            gap:8px;
        }
        .material-item{
            display:flex;
            align-items:center;
            gap:10px;
            padding:10px;
            background:#f9f9f9;
            border-radius:8px;
        }
        .material-icon{
            width:32px;
            height:32px;
            background:#003366;
            color:#fff;
            border-radius:6px;
            display:flex;
            align-items:center;
            justify-content:center;
            font-size:14px;
        }
        .material-info{
            flex:1;
        }
        .material-name{
            font-weight:bold;
            font-size:14px;
        }
        .material-size{
            font-size:12px;
            color:#666;
        }

        footer{
            background:#222;
            color:#fff;
            text-align:center;
            padding:18px 0;
        }

        @media (max-width: 980px){
            .layout{ grid-template-columns: 1fr; }
            .course-info-grid{ grid-template-columns: 1fr; }
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
            <a class="active" href="MyCourses.aspx">My Courses</a>
            <a href="EnrollCourse.aspx">Enroll Course</a>
            <a href="TimeTable.aspx">Timetable</a>
            <a href="Results.aspx">Results</a>
            <a href="Profile.aspx">Profile</a>
            <a href="../Login.aspx">Logout</a>
        </nav>
    </aside>

    <main>
        <section class="hero">
            <h2>My Enrolled Courses</h2>
            <p>Semester 4 - 2025/2026 Academic Year</p>
        </section>

        <!-- Course 1: Web Development -->
        <div class="course-detail">
            <div class="course-header">
                <div>
                    <div class="course-title">Web Development</div>
                    <div style="font-size:13px; color:#666; margin-top:4px;">👨‍🏫 Dr. Silva • 🕐 Tue & Fri, 8:00 AM - 10:00 AM • 📍 Room 301</div>
                </div>
                <div class="course-code">CS2201</div>
            </div>

            <div class="course-info-grid">
                <div class="info-item">
                    <div class="info-label">Credits</div>
                    <div class="info-value">4</div>
                </div>
                <div class="info-item">
                    <div class="info-label">Attendance</div>
                    <div class="info-value">94% (17/18)</div>
                </div>
                <div class="info-item">
                    <div class="info-label">Current Grade</div>
                    <div class="info-value">87/100 (A)</div>
                </div>
            </div>

            <div class="tabs">
                <button class="tab active" onclick="switchTab(event, 'assignments-1')">Assignments</button>
                <button class="tab" onclick="switchTab(event, 'materials-1')">Materials</button>
                <button class="tab" onclick="switchTab(event, 'grades-1')">Grades</button>
            </div>

            <div id="assignments-1" class="tab-content">
                <div class="assignment-list">
                    <div class="assignment-item upcoming">
                        <div class="assignment-info">
                            <div class="assignment-title">Assignment 3: React Component Design</div>
                            <div class="assignment-meta">Due: Feb 10, 2026 • Weight: 15%</div>
                        </div>
                        <button class="btn-small" onclick="alert('Opening assignment...')">View</button>
                    </div>
                    <div class="assignment-item">
                        <div class="assignment-info">
                            <div class="assignment-title">Assignment 2: CSS Layouts</div>
                            <div class="assignment-meta">Submitted • Score: 92/100</div>
                        </div>
                        <button class="btn-small" onclick="alert('Opening feedback...')">Feedback</button>
                    </div>
                </div>
            </div>

            <div id="materials-1" class="tab-content" style="display:none;">
                <div class="material-list">
                    <div class="material-item">
                        <div class="material-icon">📄</div>
                        <div class="material-info">
                            <div class="material-name">Lecture Notes - Week 7</div>
                            <div class="material-size">PDF • 2.4 MB</div>
                        </div>
                        <button class="btn-small" onclick="alert('Downloading...')">Download</button>
                    </div>
                    <div class="material-item">
                        <div class="material-icon">📺</div>
                        <div class="material-info">
                            <div class="material-name">React Tutorial Video</div>
                            <div class="material-size">Video • 45 mins</div>
                        </div>
                        <button class="btn-small" onclick="alert('Opening video...')">Watch</button>
                    </div>
                </div>
            </div>

            <div id="grades-1" class="tab-content" style="display:none;">
                <div style="padding:10px;">
                    <div style="display:flex; justify-content:space-between; margin-bottom:6px;">
                        <span>Mid Exam: 42/50</span>
                        <span>Final Exam: 45/50</span>
                    </div>
                    <div style="font-weight:bold; margin-top:10px;">Total: 87/100 (Grade: A)</div>
                </div>
            </div>
        </div>

        <!-- Course 2: Database Systems -->
        <div class="course-detail">
            <div class="course-header">
                <div>
                    <div class="course-title">Database Systems</div>
                    <div style="font-size:13px; color:#666; margin-top:4px;">👩‍🏫 Ms. Perera • 🕐 Thu, 8:00 AM - 10:00 AM • 📍 Room 205</div>
                </div>
                <div class="course-code">CS2202</div>
            </div>

            <div class="course-info-grid">
                <div class="info-item">
                    <div class="info-label">Credits</div>
                    <div class="info-value">4</div>
                </div>
                <div class="info-item">
                    <div class="info-label">Attendance</div>
                    <div class="info-value">89% (16/18)</div>
                </div>
                <div class="info-item">
                    <div class="info-label">Current Grade</div>
                    <div class="info-value">78/100 (B+)</div>
                </div>
            </div>

            <div class="tabs">
                <button class="tab active" onclick="switchTab(event, 'assignments-2')">Assignments</button>
                <button class="tab" onclick="switchTab(event, 'materials-2')">Materials</button>
                <button class="tab" onclick="switchTab(event, 'grades-2')">Grades</button>
            </div>

            <div id="assignments-2" class="tab-content">
                <div class="assignment-list">
                    <div class="assignment-item">
                        <div class="assignment-info">
                            <div class="assignment-title">Lab 4: Query Optimization</div>
                            <div class="assignment-meta">Submitted • Score: 85/100</div>
                        </div>
                        <button class="btn-small" onclick="alert('Opening feedback...')">Feedback</button>
                    </div>
                </div>
            </div>

            <div id="materials-2" class="tab-content" style="display:none;">
                <div class="material-list">
                    <div class="material-item">
                        <div class="material-icon">📄</div>
                        <div class="material-info">
                            <div class="material-name">SQL Cheat Sheet</div>
                            <div class="material-size">PDF • 1.2 MB</div>
                        </div>
                        <button class="btn-small" onclick="alert('Downloading...')">Download</button>
                    </div>
                </div>
            </div>

            <div id="grades-2" class="tab-content" style="display:none;">
                <div style="padding:10px;">
                    <div style="display:flex; justify-content:space-between; margin-bottom:6px;">
                        <span>Mid Exam: 38/50</span>
                        <span>Final Exam: 40/50</span>
                    </div>
                    <div style="font-weight:bold; margin-top:10px;">Total: 78/100 (Grade: B+)</div>
                </div>
            </div>
        </div>

        <!-- Course 3: Business Analytics -->
        <div class="course-detail">
            <div class="course-header">
                <div>
                    <div class="course-title">Business Analytics</div>
                    <div style="font-size:13px; color:#666; margin-top:4px;">👨‍💼 Mr. Fernando • 🕐 Wed & Thu, 10:00 AM - 12:00 PM • 📍 Room 110</div>
                </div>
                <div class="course-code">BA2101</div>
            </div>

            <div class="course-info-grid">
                <div class="info-item">
                    <div class="info-label">Credits</div>
                    <div class="info-value">3</div>
                </div>
                <div class="info-item">
                    <div class="info-label">Attendance</div>
                    <div class="info-value">91% (20/22)</div>
                </div>
                <div class="info-item">
                    <div class="info-label">Current Grade</div>
                    <div class="info-value">73/100 (B)</div>
                </div>
            </div>

            <div class="tabs">
                <button class="tab active" onclick="switchTab(event, 'assignments-3')">Assignments</button>
                <button class="tab" onclick="switchTab(event, 'materials-3')">Materials</button>
                <button class="tab" onclick="switchTab(event, 'grades-3')">Grades</button>
            </div>

            <div id="assignments-3" class="tab-content">
                <div class="assignment-list">
                    <div class="assignment-item upcoming">
                        <div class="assignment-info">
                            <div class="assignment-title">Quiz 2: Data Visualization</div>
                            <div class="assignment-meta">Due: Feb 08, 2026 • Weight: 10%</div>
                        </div>
                        <button class="btn-small" onclick="alert('Start Quiz')">Start</button>
                    </div>
                </div>
            </div>

            <div id="materials-3" class="tab-content" style="display:none;">
                <div class="material-list">
                    <div class="material-item">
                        <div class="material-icon">📊</div>
                        <div class="material-info">
                            <div class="material-name">Power BI Tutorial</div>
                            <div class="material-size">PPTX • 5.6 MB</div>
                        </div>
                        <button class="btn-small" onclick="alert('Downloading...')">Download</button>
                    </div>
                </div>
            </div>

            <div id="grades-3" class="tab-content" style="display:none;">
                <div style="padding:10px;">
                    <div style="display:flex; justify-content:space-between; margin-bottom:6px;">
                        <span>Mid Exam: 35/50</span>
                        <span>Final Exam: 38/50</span>
                    </div>
                    <div style="font-weight:bold; margin-top:10px;">Total: 73/100 (Grade: B)</div>
                </div>
            </div>
        </div>

        <!-- Course 4: Network Security -->
        <div class="course-detail">
            <div class="course-header">
                <div>
                    <div class="course-title">Network Security</div>
                    <div style="font-size:13px; color:#666; margin-top:4px;">👨‍🏫 Dr. Jayasena • 🕐 Mon & Tue, 10:00 AM - 12:00 PM • 📍 Room 302</div>
                </div>
                <div class="course-code">CS2203</div>
            </div>

            <div class="course-info-grid">
                <div class="info-item">
                    <div class="info-label">Credits</div>
                    <div class="info-value">4</div>
                </div>
                <div class="info-item">
                    <div class="info-label">Attendance</div>
                    <div class="info-value">95% (19/20)</div>
                </div>
                <div class="info-item">
                    <div class="info-label">Current Grade</div>
                    <div class="info-value">92/100 (A+)</div>
                </div>
            </div>

            <div class="tabs">
                <button class="tab active" onclick="switchTab(event, 'assignments-4')">Assignments</button>
                <button class="tab" onclick="switchTab(event, 'materials-4')">Materials</button>
                <button class="tab" onclick="switchTab(event, 'grades-4')">Grades</button>
            </div>

            <div id="assignments-4" class="tab-content">
                <div class="assignment-list">
                    <div class="assignment-item">
                        <div class="assignment-info">
                            <div class="assignment-title">Project: Firewall Configuration</div>
                            <div class="assignment-meta">Submitted • Score: 95/100</div>
                        </div>
                        <button class="btn-small" onclick="alert('Opening feedback...')">Feedback</button>
                    </div>
                </div>
            </div>

            <div id="materials-4" class="tab-content" style="display:none;">
                <div class="material-list">
                    <div class="material-item">
                        <div class="material-icon">📄</div>
                        <div class="material-info">
                            <div class="material-name">Cryptography Basics</div>
                            <div class="material-size">PDF • 3.8 MB</div>
                        </div>
                        <button class="btn-small" onclick="alert('Downloading...')">Download</button>
                    </div>
                </div>
            </div>

            <div id="grades-4" class="tab-content" style="display:none;">
                <div style="padding:10px;">
                    <div style="display:flex; justify-content:space-between; margin-bottom:6px;">
                        <span>Mid Exam: 44/50</span>
                        <span>Final Exam: 48/50</span>
                    </div>
                    <div style="font-weight:bold; margin-top:10px;">Total: 92/100 (Grade: A+)</div>
                </div>
            </div>
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

    function switchTab(event, tabId) {
        const parent = event.target.closest('.course-detail');
        const tabs = parent.querySelectorAll('.tab');
        const contents = parent.querySelectorAll('.tab-content');

        tabs.forEach(t => t.classList.remove('active'));
        contents.forEach(c => c.style.display = 'none');

        event.target.classList.add('active');
        document.getElementById(tabId).style.display = 'block';
    }
</script>
</body>
</html>