<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Student Dashboard</title>

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
        .hero p{ opacity:0.9; }
        .hero .btn{
            background:#ffcc00;
            color:#111;
            border:none;
            border-radius:10px;
            padding:10px 14px;
            cursor:pointer;
            font-weight:bold;
        }

        .cards{
            display:grid;
            grid-template-columns: repeat(3, 1fr);
            gap:14px;
        }
        .card{
            background:#fff;
            border-radius:12px;
            padding:14px;
            box-shadow:0 4px 10px rgba(0,0,0,0.08);
        }
        .card h3{ font-size:16px; margin-bottom:10px; color:#003366; }
        .stat{
            display:flex; align-items:flex-end; justify-content:space-between;
            gap:10px;
        }
        .stat .num{ font-size:28px; font-weight:bold; }
        .stat .hint{ font-size:12px; color:#666; }

        .grid2{
            display:grid;
            grid-template-columns: 1.2fr 0.8fr;
            gap:14px;
        }

        table{
            width:100%;
            border-collapse:collapse;
            overflow:hidden;
            border-radius:10px;
        }
        th, td{
            padding:10px 12px;
            border-bottom:1px solid #e8e8e8;
            text-align:left;
            font-size:14px;
        }
        th{
            background:#003366;
            color:#fff;
            font-weight:bold;
        }
        tr:nth-child(even) td{ background:#fafafa; }

        .pill{
            display:inline-block;
            padding:4px 10px;
            border-radius:999px;
            font-size:12px;
            font-weight:bold;
        }
        .pill.ok{ background:#e7fff2; color:#097a3a; }
        .pill.warn{ background:#fff7df; color:#8a5b00; }
        .pill.bad{ background:#ffe7e7; color:#8a1010; }

        .quick-actions{
            display:flex;
            flex-direction:column;
            gap:10px;
        }
        .qa{
            border:1px solid #e5e5e5;
            border-radius:12px;
            padding:12px;
            display:flex;
            justify-content:space-between;
            align-items:center;
            gap:10px;
            background:#fff;
        }
        .qa button{
            border:none;
            background:#003366;
            color:#fff;
            border-radius:10px;
            padding:8px 10px;
            cursor:pointer;
        }

        footer{
            background:#222;
            color:#fff;
            text-align:center;
            padding:18px 0;
        }

        @media (max-width: 980px){
            .layout{ grid-template-columns: 1fr; }
            .cards{ grid-template-columns: 1fr; }
            .grid2{ grid-template-columns: 1fr; }
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
            <a class="active" href="#">Dashboard <span class="badge">New</span></a>
            <a href="MyCourses.aspx">My Courses</a>
            <a href="EnrollCourse.aspx">Enroll Course</a>
            <a href="TimeTable.aspx">Timetable</a>
            <a href="Results.aspx">Results</a>
            <a href="Profile.aspx">Profile</a>
            <a href="#">Logout</a>
        </nav>
    </aside>

    <main>
        <section class="hero">
            <div>
                <h2>Welcome back, John 👋</h2>
                <p>Check your enrolled courses, assignments, and announcements.</p>
            </div>
            <button class="btn" type="button" onclick="alert('Open Enrollment Page')">Enroll a Course</button>
        </section>

        <section class="cards">
            <div class="card">
                <h3>Enrolled Courses</h3>
                <div class="stat">
                    <div class="num">4</div>
                    <div class="hint">This semester</div>
                </div>
            </div>
            <div class="card">
                <h3>Pending Assignments</h3>
                <div class="stat">
                    <div class="num">2</div>
                    <div class="hint">Due this week</div>
                </div>
            </div>
            <div class="card">
                <h3>Attendance</h3>
                <div class="stat">
                    <div class="num">92%</div>
                    <div class="hint">Keep it above 80%</div>
                </div>
            </div>
        </section>

        <section class="grid2">
            <div class="card">
                <h3>My Courses</h3>
                <table>
                    <thead>
                        <tr>
                            <th>Course</th>
                            <th>Lecturer</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Web Development</td>
                            <td>Dr. Silva</td>
                            <td><span class="pill ok">Active</span></td>
                        </tr>
                        <tr>
                            <td>Database Systems</td>
                            <td>Ms. Perera</td>
                            <td><span class="pill ok">Active</span></td>
                        </tr>
                        <tr>
                            <td>Business Analytics</td>
                            <td>Mr. Fernando</td>
                            <td><span class="pill warn">Quiz Soon</span></td>
                        </tr>
                        <tr>
                            <td>Network Security</td>
                            <td>Dr. Jayasena</td>
                            <td><span class="pill ok">Active</span></td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="card">
                <h3>Quick Actions</h3>
                <div class="quick-actions">
                    <div class="qa">
                        <div>
                            <strong>Update Profile</strong>
                            <div style="font-size:12px; color:#666;">Phone, email, address</div>
                        </div>
                        <button type="button" onclick="alert('Open Profile Page')">Open</button>
                    </div>
                    <div class="qa">
                        <div>
                            <strong>Download Timetable</strong>
                            <div style="font-size:12px; color:#666;">PDF format</div>
                        </div>
                        <button type="button" onclick="alert('Download Timetable')">Download</button>
                    </div>
                    <div class="qa">
                        <div>
                            <strong>View Results</strong>
                            <div style="font-size:12px; color:#666;">Mid / Final</div>
                        </div>
                        <button type="button" onclick="alert('Open Results Page')">Open</button>
                    </div>
                </div>
            </div>
        </section>
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
