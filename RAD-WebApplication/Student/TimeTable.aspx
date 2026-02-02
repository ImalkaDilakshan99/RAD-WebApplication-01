<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Timetable - Student Dashboard</title>

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
            display:flex;
            align-items:center;
            justify-content:space-between;
            gap:14px;
        }
        .hero h2{ font-size:22px; margin-bottom:6px; }
        .hero .btn{
            background:#ffcc00;
            color:#111;
            border:none;
            border-radius:10px;
            padding:10px 14px;
            cursor:pointer;
            font-weight:bold;
        }

        .card{
            background:#fff;
            border-radius:12px;
            padding:18px;
            box-shadow:0 4px 10px rgba(0,0,0,0.08);
        }
        .card h3{ font-size:18px; margin-bottom:16px; color:#003366; }

        .timetable-grid{
            display:grid;
            grid-template-columns: 80px repeat(5, 1fr);
            gap:1px;
            background:#e0e0e0;
            border:1px solid #e0e0e0;
            border-radius:10px;
            overflow:hidden;
        }
        .time-cell, .day-header, .class-cell{
            background:#fff;
            padding:10px;
            min-height:60px;
            display:flex;
            align-items:center;
            justify-content:center;
        }
        .day-header{
            background:#003366;
            color:#fff;
            font-weight:bold;
            font-size:14px;
        }
        .time-cell{
            background:#f5f5f5;
            font-size:12px;
            font-weight:bold;
            color:#666;
        }
        .class-cell{
            padding:8px;
            flex-direction:column;
            align-items:flex-start;
            justify-content:flex-start;
        }
        .class-cell.has-class{
            background:#e7f1ff;
            border-left:3px solid #003366;
        }
        .class-cell.lab{
            background:#fff7df;
            border-left:3px solid #ffcc00;
        }
        .class-name{
            font-weight:bold;
            font-size:13px;
            color:#003366;
            margin-bottom:4px;
        }
        .class-info{
            font-size:11px;
            color:#666;
        }

        .legend{
            display:flex;
            gap:20px;
            margin-top:10px;
        }
        .legend-item{
            display:flex;
            align-items:center;
            gap:8px;
            font-size:13px;
        }
        .legend-box{
            width:20px;
            height:20px;
            border-radius:4px;
        }
        .legend-box.lecture{ background:#e7f1ff; border:2px solid #003366; }
        .legend-box.lab{ background:#fff7df; border:2px solid #ffcc00; }

        footer{
            background:#222;
            color:#fff;
            text-align:center;
            padding:18px 0;
        }

        @media (max-width: 980px){
            .layout{ grid-template-columns: 1fr; }
            .timetable-grid{
                grid-template-columns: 60px repeat(5, 1fr);
                font-size:11px;
            }
            .class-name{ font-size:11px; }
            .class-info{ font-size:10px; }
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
            <a href="EnrollCourse.aspx">Enroll Course</a>
            <a class="active" href="timetable.aspx">Timetable</a>
            <a href="Results.aspx">Results</a>
            <a href="Profile.aspx">Profile</a>
            <a href="#">Logout</a>
        </nav>
    </aside>

    <main>
        <section class="hero">
            <div>
                <h2>Weekly Timetable</h2>
                <p>Semester 4 - 2025/2026</p>
            </div>
            <button class="btn" type="button" onclick="alert('Downloading Timetable PDF...')">Download PDF</button>
        </section>

        <div class="card">
            <h3>Class Schedule</h3>
            <div class="timetable-grid">
                <!-- Header Row -->
                <div class="time-cell"></div>
                <div class="day-header">Monday</div>
                <div class="day-header">Tuesday</div>
                <div class="day-header">Wednesday</div>
                <div class="day-header">Thursday</div>
                <div class="day-header">Friday</div>

                <!-- 8:00 AM -->
                <div class="time-cell">8:00 AM</div>
                <div class="class-cell"></div>
                <div class="class-cell has-class">
                    <div class="class-name">Web Development</div>
                    <div class="class-info">Dr. Silva • Room 301</div>
                </div>
                <div class="class-cell"></div>
                <div class="class-cell has-class">
                    <div class="class-name">Database Systems</div>
                    <div class="class-info">Ms. Perera • Room 205</div>
                </div>
                <div class="class-cell"></div>

                <!-- 10:00 AM -->
                <div class="time-cell">10:00 AM</div>
                <div class="class-cell has-class">
                    <div class="class-name">Network Security</div>
                    <div class="class-info">Dr. Jayasena • Room 302</div>
                </div>
                <div class="class-cell"></div>
                <div class="class-cell has-class">
                    <div class="class-name">Business Analytics</div>
                    <div class="class-info">Mr. Fernando • Room 110</div>
                </div>
                <div class="class-cell"></div>
                <div class="class-cell has-class">
                    <div class="class-name">Web Development</div>
                    <div class="class-info">Dr. Silva • Room 301</div>
                </div>

                <!-- 12:00 PM -->
                <div class="time-cell">12:00 PM</div>
                <div class="class-cell"></div>
                <div class="class-cell"></div>
                <div class="class-cell"></div>
                <div class="class-cell"></div>
                <div class="class-cell"></div>

                <!-- 2:00 PM -->
                <div class="time-cell">2:00 PM</div>
                <div class="class-cell lab">
                    <div class="class-name">Web Dev Lab</div>
                    <div class="class-info">Lab Instructor • Lab 1</div>
                </div>
                <div class="class-cell has-class">
                    <div class="class-name">Network Security</div>
                    <div class="class-info">Dr. Jayasena • Room 302</div>
                </div>
                <div class="class-cell lab">
                    <div class="class-name">Database Lab</div>
                    <div class="class-info">Lab Instructor • Lab 2</div>
                </div>
                <div class="class-cell has-class">
                    <div class="class-name">Business Analytics</div>
                    <div class="class-info">Mr. Fernando • Room 110</div>
                </div>
                <div class="class-cell"></div>

                <!-- 4:00 PM -->
                <div class="time-cell">4:00 PM</div>
                <div class="class-cell"></div>
                <div class="class-cell"></div>
                <div class="class-cell"></div>
                <div class="class-cell lab">
                    <div class="class-name">Network Lab</div>
                    <div class="class-info">Lab Instructor • Lab 3</div>
                </div>
                <div class="class-cell"></div>
            </div>

            <div class="legend">
                <div class="legend-item">
                    <div class="legend-box lecture"></div>
                    <span>Lecture</span>
                </div>
                <div class="legend-item">
                    <div class="legend-box lab"></div>
                    <span>Lab Session</span>
                </div>
            </div>
        </div>

        <div class="card">
            <h3>Upcoming Classes Today</h3>
            <table style="width:100%; border-collapse:collapse;">
                <thead>
                    <tr style="background:#003366; color:#fff;">
                        <th style="padding:10px; text-align:left;">Time</th>
                        <th style="padding:10px; text-align:left;">Course</th>
                        <th style="padding:10px; text-align:left;">Instructor</th>
                        <th style="padding:10px; text-align:left;">Room</th>
                        <th style="padding:10px; text-align:left;">Type</th>
                    </tr>
                </thead>
                <tbody>
                    <tr style="border-bottom:1px solid #e8e8e8;">
                        <td style="padding:10px;">10:00 AM - 12:00 PM</td>
                        <td style="padding:10px;">Network Security</td>
                        <td style="padding:10px;">Dr. Jayasena</td>
                        <td style="padding:10px;">Room 302</td>
                        <td style="padding:10px;"><span style="background:#e7f1ff; padding:4px 10px; border-radius:999px; font-size:12px; font-weight:bold;">Lecture</span></td>
                    </tr>
                    <tr style="border-bottom:1px solid #e8e8e8; background:#fafafa;">
                        <td style="padding:10px;">2:00 PM - 4:00 PM</td>
                        <td style="padding:10px;">Web Development Lab</td>
                        <td style="padding:10px;">Lab Instructor</td>
                        <td style="padding:10px;">Lab 1</td>
                        <td style="padding:10px;"><span style="background:#fff7df; padding:4px 10px; border-radius:999px; font-size:12px; font-weight:bold;">Lab</span></td>
                    </tr>
                </tbody>
            </table>
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
</script>
</body>
</html>