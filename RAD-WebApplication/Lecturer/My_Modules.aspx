<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>My Modules - Lecturer Dashboard</title>

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

        .page-header{
            background:#fff;
            border-radius:12px;
            padding:18px;
            box-shadow:0 4px 10px rgba(0,0,0,0.08);
            display:flex; align-items:center; justify-content:space-between; gap:14px;
        }
        .page-header h2{ font-size:22px; color:#003366; }
        .page-header .btn{
            background:#003366;
            color:#fff;
            border:none;
            border-radius:10px;
            padding:10px 14px;
            cursor:pointer;
            font-weight:bold;
        }

        .module-card{
            background:#fff;
            border-radius:12px;
            padding:18px;
            box-shadow:0 4px 10px rgba(0,0,0,0.08);
            margin-bottom:14px;
        }
        .module-header{
            display:flex; justify-content:space-between; align-items:start; margin-bottom:12px;
        }
        .module-header h3{ color:#003366; font-size:18px; margin-bottom:4px; }
        .module-code{ color:#666; font-size:14px; }
        .module-actions{ display:flex; gap:8px; }
        .module-actions button{
            border:none;
            background:#f0f6ff;
            color:#003366;
            padding:8px 12px;
            border-radius:8px;
            cursor:pointer;
            font-size:13px;
        }
        .module-actions button:hover{ background:#e7f1ff; }

        .module-stats{
            display:grid; grid-template-columns:repeat(4, 1fr); gap:12px;
            padding:12px 0;
            border-top:1px solid #e8e8e8;
            border-bottom:1px solid #e8e8e8;
            margin-bottom:12px;
        }
        .stat{ text-align:center; }
        .stat-num{ font-size:20px; font-weight:bold; color:#003366; }
        .stat-label{ font-size:12px; color:#666; margin-top:4px; }

        .module-details{
            display:grid; grid-template-columns:repeat(3, 1fr); gap:12px;
            font-size:14px;
        }
        .detail-item strong{ color:#003366; display:block; margin-bottom:4px; }
        .detail-item span{ color:#666; }

        footer{ background:#222; color:#fff; text-align:center; padding:18px 0; margin-top:40px; }

        @media (max-width: 980px){
            .layout{ grid-template-columns: 1fr; }
            .module-stats{ grid-template-columns:repeat(2, 1fr); }
            .module-details{ grid-template-columns: 1fr; }
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
            <a href="Lecture_Dashboard.aspx">Dashboard</a>
            <a class="active" href="my-modules.html">My Modules</a>
            <a href="Student_List.aspx">Student List</a>
            <a href="Attendence.aspx">Attendance</a>
            <a href="Assignments.aspx">Assignments</a>
            <a href="Marks.aspx">Marks / Results</a>
            <a href="Messages.aspx">Messages</a>
            <a href="#">Logout</a>
        </nav>
    </aside>

    <main>
        <section class="page-header">
            <h2>My Modules</h2>
            <button class="btn" type="button" onclick="alert('Add New Module')">+ Add Module</button>
        </section>

        <div class="module-card">
            <div class="module-header">
                <div>
                    <h3>Web Development</h3>
                    <div class="module-code">CSC2043 | Semester 1, 2026</div>
                </div>
                <div class="module-actions">
                    <button type="button" onclick="alert('View Materials')">📚 Materials</button>
                    <button type="button" onclick="alert('Edit Module')">✏️ Edit</button>
                </div>
            </div>

            <div class="module-stats">
                <div class="stat">
                    <div class="stat-num">62</div>
                    <div class="stat-label">Students</div>
                </div>
                <div class="stat">
                    <div class="stat-num">24</div>
                    <div class="stat-label">Sessions</div>
                </div>
                <div class="stat">
                    <div class="stat-num">5</div>
                    <div class="stat-label">Assignments</div>
                </div>
                <div class="stat">
                    <div class="stat-num">85%</div>
                    <div class="stat-label">Avg. Attendance</div>
                </div>
            </div>

            <div class="module-details">
                <div class="detail-item">
                    <strong>Schedule</strong>
                    <span>Mon 09:00-11:00, Wed 13:00-15:00</span>
                </div>
                <div class="detail-item">
                    <strong>Venue</strong>
                    <span>Lab 02, Building A</span>
                </div>
                <div class="detail-item">
                    <strong>Credits</strong>
                    <span>3 Units</span>
                </div>
            </div>
        </div>

        <div class="module-card">
            <div class="module-header">
                <div>
                    <h3>Network Security</h3>
                    <div class="module-code">CSC3021 | Semester 1, 2026</div>
                </div>
                <div class="module-actions">
                    <button type="button" onclick="alert('View Materials')">📚 Materials</button>
                    <button type="button" onclick="alert('Edit Module')">✏️ Edit</button>
                </div>
            </div>

            <div class="module-stats">
                <div class="stat">
                    <div class="stat-num">45</div>
                    <div class="stat-label">Students</div>
                </div>
                <div class="stat">
                    <div class="stat-num">20</div>
                    <div class="stat-label">Sessions</div>
                </div>
                <div class="stat">
                    <div class="stat-num">4</div>
                    <div class="stat-label">Assignments</div>
                </div>
                <div class="stat">
                    <div class="stat-num">78%</div>
                    <div class="stat-label">Avg. Attendance</div>
                </div>
            </div>

            <div class="module-details">
                <div class="detail-item">
                    <strong>Schedule</strong>
                    <span>Tue 13:00-15:00, Thu 09:00-11:00</span>
                </div>
                <div class="detail-item">
                    <strong>Venue</strong>
                    <span>Hall A, Building B</span>
                </div>
                <div class="detail-item">
                    <strong>Credits</strong>
                    <span>4 Units</span>
                </div>
            </div>
        </div>

        <div class="module-card">
            <div class="module-header">
                <div>
                    <h3>Database Systems</h3>
                    <div class="module-code">CSC2055 | Semester 1, 2026</div>
                </div>
                <div class="module-actions">
                    <button type="button" onclick="alert('View Materials')">📚 Materials</button>
                    <button type="button" onclick="alert('Edit Module')">✏️ Edit</button>
                </div>
            </div>

            <div class="module-stats">
                <div class="stat">
                    <div class="stat-num">39</div>
                    <div class="stat-label">Students</div>
                </div>
                <div class="stat">
                    <div class="stat-num">22</div>
                    <div class="stat-label">Sessions</div>
                </div>
                <div class="stat">
                    <div class="stat-num">6</div>
                    <div class="stat-label">Assignments</div>
                </div>
                <div class="stat">
                    <div class="stat-num">92%</div>
                    <div class="stat-label">Avg. Attendance</div>
                </div>
            </div>

            <div class="module-details">
                <div class="detail-item">
                    <strong>Schedule</strong>
                    <span>Wed 15:30-17:00, Fri 10:00-12:00</span>
                </div>
                <div class="detail-item">
                    <strong>Venue</strong>
                    <span>Room 12, Building C</span>
                </div>
                <div class="detail-item">
                    <strong>Credits</strong>
                    <span>3 Units</span>
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
</script>
</body>
</html>