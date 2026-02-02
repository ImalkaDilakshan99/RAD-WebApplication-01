<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Results - Student Dashboard</title>

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

        .stats-grid{
            display:grid;
            grid-template-columns: repeat(4, 1fr);
            gap:14px;
            margin-bottom:16px;
        }
        .stat-card{
            background:#f8f9fa;
            border-radius:10px;
            padding:14px;
            text-align:center;
        }
        .stat-card .label{
            font-size:12px;
            color:#666;
            margin-bottom:6px;
        }
        .stat-card .value{
            font-size:24px;
            font-weight:bold;
            color:#003366;
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

        .grade{
            display:inline-block;
            padding:4px 10px;
            border-radius:999px;
            font-size:13px;
            font-weight:bold;
        }
        .grade.a{ background:#e7fff2; color:#097a3a; }
        .grade.b{ background:#e7f1ff; color:#0b4a84; }
        .grade.c{ background:#fff7df; color:#8a5b00; }
        .grade.d{ background:#ffe7e7; color:#8a1010; }

        .filter-bar{
            display:flex;
            gap:10px;
            margin-bottom:16px;
        }
        .filter-bar select{
            padding:8px 12px;
            border:1px solid #ddd;
            border-radius:8px;
            font-size:14px;
        }
        .btn{
            border:none;
            background:#003366;
            color:#fff;
            padding:8px 16px;
            border-radius:8px;
            cursor:pointer;
            font-weight:bold;
        }

        footer{
            background:#222;
            color:#fff;
            text-align:center;
            padding:18px 0;
        }

        @media (max-width: 980px){
            .layout{ grid-template-columns: 1fr; }
            .stats-grid{ grid-template-columns: repeat(2, 1fr); }
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
            <a href="TimeTable.aspx">Timetable</a>
            <a class="active" href="Results.aspx">Results</a>
            <a href="Profile.aspx">Profile</a>
            <a href="#">Logout</a>
        </nav>
    </aside>

    <main>
        <section class="hero">
            <h2>Academic Results</h2>
            <p>View your exam results and academic performance</p>
        </section>

        <div class="stats-grid">
            <div class="stat-card">
                <div class="label">Current GPA</div>
                <div class="value">3.68</div>
            </div>
            <div class="stat-card">
                <div class="label">Credits Earned</div>
                <div class="value">48</div>
            </div>
            <div class="stat-card">
                <div class="label">Courses Passed</div>
                <div class="value">12</div>
            </div>
            <div class="stat-card">
                <div class="label">Current Semester</div>
                <div class="value">4</div>
            </div>
        </div>

        <div class="card">
            <h3>Semester Results</h3>
            <div class="filter-bar">
                <select onchange="alert('Filter by: ' + this.value)">
                    <option value="all">All Semesters</option>
                    <option value="sem4" selected>Semester 4 (Current)</option>
                    <option value="sem3">Semester 3</option>
                    <option value="sem2">Semester 2</option>
                    <option value="sem1">Semester 1</option>
                </select>
                <button class="btn" onclick="alert('Downloading Transcript...')">Download Transcript</button>
            </div>

            <table>
                <thead>
                    <tr>
                        <th>Course Code</th>
                        <th>Course Name</th>
                        <th>Credits</th>
                        <th>Mid Exam</th>
                        <th>Final Exam</th>
                        <th>Total</th>
                        <th>Grade</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>CS2201</td>
                        <td>Web Development</td>
                        <td>4</td>
                        <td>42/50</td>
                        <td>45/50</td>
                        <td>87/100</td>
                        <td><span class="grade a">A</span></td>
                    </tr>
                    <tr>
                        <td>CS2202</td>
                        <td>Database Systems</td>
                        <td>4</td>
                        <td>38/50</td>
                        <td>40/50</td>
                        <td>78/100</td>
                        <td><span class="grade b">B+</span></td>
                    </tr>
                    <tr>
                        <td>BA2101</td>
                        <td>Business Analytics</td>
                        <td>3</td>
                        <td>35/50</td>
                        <td>38/50</td>
                        <td>73/100</td>
                        <td><span class="grade b">B</span></td>
                    </tr>
                    <tr>
                        <td>CS2203</td>
                        <td>Network Security</td>
                        <td>4</td>
                        <td>44/50</td>
                        <td>48/50</td>
                        <td>92/100</td>
                        <td><span class="grade a">A+</span></td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="card">
            <h3>Previous Semester - Semester 3</h3>
            <table>
                <thead>
                    <tr>
                        <th>Course Code</th>
                        <th>Course Name</th>
                        <th>Credits</th>
                        <th>Mid Exam</th>
                        <th>Final Exam</th>
                        <th>Total</th>
                        <th>Grade</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>CS1301</td>
                        <td>Data Structures</td>
                        <td>4</td>
                        <td>40/50</td>
                        <td>42/50</td>
                        <td>82/100</td>
                        <td><span class="grade a">A-</span></td>
                    </tr>
                    <tr>
                        <td>CS1302</td>
                        <td>Object Oriented Programming</td>
                        <td>4</td>
                        <td>36/50</td>
                        <td>39/50</td>
                        <td>75/100</td>
                        <td><span class="grade b">B+</span></td>
                    </tr>
                    <tr>
                        <td>MT1301</td>
                        <td>Discrete Mathematics</td>
                        <td>3</td>
                        <td>33/50</td>
                        <td>35/50</td>
                        <td>68/100</td>
                        <td><span class="grade c">C+</span></td>
                    </tr>
                    <tr>
                        <td>EN1301</td>
                        <td>Technical Writing</td>
                        <td>2</td>
                        <td>45/50</td>
                        <td>46/50</td>
                        <td>91/100</td>
                        <td><span class="grade a">A+</span></td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="card">
            <h3>GPA Progress</h3>
            <table>
                <thead>
                    <tr>
                        <th>Semester</th>
                        <th>Credits</th>
                        <th>Semester GPA</th>
                        <th>Cumulative GPA</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Semester 1</td>
                        <td>12</td>
                        <td>3.50</td>
                        <td>3.50</td>
                        <td><span class="grade b">Pass</span></td>
                    </tr>
                    <tr>
                        <td>Semester 2</td>
                        <td>13</td>
                        <td>3.62</td>
                        <td>3.56</td>
                        <td><span class="grade b">Pass</span></td>
                    </tr>
                    <tr>
                        <td>Semester 3</td>
                        <td>13</td>
                        <td>3.71</td>
                        <td>3.61</td>
                        <td><span class="grade a">Pass</span></td>
                    </tr>
                    <tr>
                        <td>Semester 4</td>
                        <td>15</td>
                        <td>3.82</td>
                        <td>3.68</td>
                        <td><span class="grade a">Pass</span></td>
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