<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Lecturer Dashboard</title>

    <style>
        *{ margin:0; padding:0; box-sizing:border-box; }
        body{ font-family:Arial, sans-serif; background:#f4f4f4; color:#222; min-height:100vh; }

        header{ background:#003366; color:#fff; padding:18px 0; box-shadow:0 2px 10px rgba(0,0,0,0.12); }
        header .container{
            max-width:1200px; margin:0 auto; padding:0 18px;
            display:flex; align-items:center; justify-content:space-between; gap:12px;
        }
        header h1{ font-size:22px; letter-spacing:1px; }
        .user-chip{ display:flex; gap:10px; align-items:center; background:rgba(255,255,255,0.12); padding:8px 12px; border-radius:999px; font-size:14px; }
        .user-dot{ width:10px; height:10px; border-radius:50%; background:#39d98a; }

        .layout{
            max-width:1200px; margin:18px auto; padding:0 18px 40px;
            display:grid; grid-template-columns:260px 1fr; gap:18px;
        }
        aside{ background:#fff; border-radius:12px; box-shadow:0 4px 10px rgba(0,0,0,0.08); overflow:hidden; }
        .aside-head{ padding:14px; background:#0b4a84; color:#fff; display:flex; justify-content:space-between; align-items:center; }
        .aside-head button{ border:none; background:rgba(255,255,255,0.2); color:#fff; padding:8px 10px; border-radius:8px; cursor:pointer; }

        .menu{ padding:10px; display:flex; flex-direction:column; gap:6px; }
        .menu a{ text-decoration:none; color:#203040; padding:10px 12px; border-radius:10px; transition:0.2s; }
        .menu a:hover{ background:#f0f6ff; }
        .menu a.active{ background:#e7f1ff; font-weight:bold; }

        main{ display:flex; flex-direction:column; gap:16px; }

        .hero{
            background: linear-gradient(135deg, #0b4a84, #003366);
            color:#fff;
            border-radius:12px;
            padding:18px;
            box-shadow:0 4px 10px rgba(0,0,0,0.08);
            display:flex; align-items:center; justify-content:space-between; gap:14px;
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

        .cards{ display:grid; grid-template-columns: repeat(3, 1fr); gap:14px; }
        .card{
            background:#fff;
            border-radius:12px;
            padding:14px;
            box-shadow:0 4px 10px rgba(0,0,0,0.08);
        }
        .card h3{ font-size:16px; margin-bottom:10px; color:#003366; }
        .num{ font-size:28px; font-weight:bold; }
        .hint{ font-size:12px; color:#666; margin-top:6px; }

        .grid2{ display:grid; grid-template-columns: 1.2fr 0.8fr; gap:14px; }

        table{ width:100%; border-collapse:collapse; border-radius:10px; overflow:hidden; }
        th, td{ padding:10px 12px; border-bottom:1px solid #e8e8e8; text-align:left; font-size:14px; }
        th{ background:#003366; color:#fff; }
        tr:nth-child(even) td{ background:#fafafa; }

        .pill{ display:inline-block; padding:4px 10px; border-radius:999px; font-size:12px; font-weight:bold; }
        .pill.ok{ background:#e7fff2; color:#097a3a; }
        .pill.warn{ background:#fff7df; color:#8a5b00; }

        .panel{
            background:#fff; border-radius:12px; padding:14px;
            box-shadow:0 4px 10px rgba(0,0,0,0.08);
        }
        .panel h3{ color:#003366; margin-bottom:10px; font-size:16px; }

        .task{
            border:1px solid #e5e5e5; border-radius:12px; padding:12px;
            display:flex; justify-content:space-between; align-items:center; gap:10px;
            margin-top:10px;
        }
        .task small{ color:#666; }
        .task button{
            border:none; background:#003366; color:#fff;
            border-radius:10px; padding:8px 10px; cursor:pointer;
        }

        footer{ background:#222; color:#fff; text-align:center; padding:18px 0; }

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
            <span>Lecturer: Dr. Silva</span>
        </div>
    </div>
</header>

<div class="layout">
    <aside>
        <div class="aside-head">
            <strong>Lecturer Menu</strong>
            <button type="button" onclick="toggleMenu()">☰</button>
        </div>

        <nav class="menu" id="menu">
            <a class="active" href="#">Dashboard</a>
            <a href="My_Modules.aspx">My Modules</a>
            <a href="Student_List.aspx">Student List</a>
            <a href="Attendence.aspx">Attendance</a>
            <a href="Assignments.aspx">Assignments</a>
            <a href="Marks.aspx">Marks / Results</a>
            <a href="Messages.aspx">Messages</a>
            <a href="#">Logout</a>
        </nav>
    </aside>

    <main>
        <section class="hero">
            <div>
                <h2>Hello, Dr. Silva 👋</h2>
                <p>Manage modules, attendance, assignments, and results.</p>
            </div>
            <button class="btn" type="button" onclick="alert('Create New Assignment')">+ New Assignment</button>
        </section>

        <section class="cards">
            <div class="card">
                <h3>My Modules</h3>
                <div class="num">3</div>
                <div class="hint">This semester</div>
            </div>
            <div class="card">
                <h3>Total Students</h3>
                <div class="num">146</div>
                <div class="hint">Across your modules</div>
            </div>
            <div class="card">
                <h3>Pending Marking</h3>
                <div class="num">18</div>
                <div class="hint">Submissions</div>
            </div>
        </section>

        <section class="grid2">
            <div class="panel">
                <h3>Today’s Sessions</h3>
                <table>
                    <thead>
                        <tr>
                            <th>Time</th>
                            <th>Module</th>
                            <th>Room</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>09:00 - 11:00</td>
                            <td>Web Development</td>
                            <td>Lab 02</td>
                            <td><span class="pill ok">Scheduled</span></td>
                        </tr>
                        <tr>
                            <td>13:00 - 15:00</td>
                            <td>Network Security</td>
                            <td>Hall A</td>
                            <td><span class="pill warn">Prepare Slides</span></td>
                        </tr>
                        <tr>
                            <td>15:30 - 17:00</td>
                            <td>Database Systems</td>
                            <td>Room 12</td>
                            <td><span class="pill ok">Scheduled</span></td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="panel">
                <h3>Quick Tasks</h3>

                <div class="task">
                    <div>
                        <strong>Mark Assignment 02</strong><br />
                        <small>18 pending submissions</small>
                    </div>
                    <button type="button" onclick="alert('Open Marking Page')">Open</button>
                </div>

                <div class="task">
                    <div>
                        <strong>Upload Lecture Slides</strong><br />
                        <small>Network Security (Today)</small>
                    </div>
                    <button type="button" onclick="alert('Open Upload Page')">Upload</button>
                </div>

                <div class="task">
                    <div>
                        <strong>Update Attendance</strong><br />
                        <small>Web Development</small>
                    </div>
                    <button type="button" onclick="alert('Open Attendance Page')">Update</button>
                </div>
            </div>
        </section>
    </main>
</div>

<footer>
    <p>&copy; 2026 Uva Wellassa University| All rights reserved.</p>
</footer>

<script>
    function toggleMenu() {
        const menu = document.getElementById('menu');
        menu.style.display = (menu.style.display === 'none') ? 'flex' : 'none';
    }
</script>
</body>
</html>
