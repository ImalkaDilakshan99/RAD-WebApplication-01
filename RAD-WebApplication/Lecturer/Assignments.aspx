<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Assignments - Lecturer Dashboard</title>

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
            display:flex; align-items:center; justify-content:space-between; flex-wrap:wrap; gap:12px;
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

        .tabs{
            display:flex; gap:8px; background:#fff; padding:14px 18px 0; border-radius:12px 12px 0 0;
            box-shadow:0 4px 10px rgba(0,0,0,0.08);
        }
        .tab{
            padding:10px 18px; border:none; background:transparent; cursor:pointer;
            font-size:14px; font-weight:bold; color:#666; border-bottom:3px solid transparent;
        }
        .tab.active{ color:#003366; border-bottom-color:#003366; }

        .assignment-card{
            background:#fff;
            border-radius:12px;
            padding:18px;
            box-shadow:0 4px 10px rgba(0,0,0,0.08);
            margin-bottom:14px;
        }
        .assignment-header{
            display:flex; justify-content:space-between; align-items:start; margin-bottom:12px;
        }
        .assignment-header h3{ color:#003366; font-size:18px; margin-bottom:4px; }
        .assignment-meta{ color:#666; font-size:14px; }
        .assignment-actions{ display:flex; gap:8px; }
        .assignment-actions button{
            border:none;
            background:#f0f6ff;
            color:#003366;
            padding:8px 12px;
            border-radius:8px;
            cursor:pointer;
            font-size:13px;
        }
        .assignment-actions button:hover{ background:#e7f1ff; }

        .status-badge{
            display:inline-block; padding:5px 12px; border-radius:12px;
            font-size:12px; font-weight:bold; margin-left:8px;
        }
        .status-active{ background:#e7f1ff; color:#003366; }
        .status-closed{ background:#f0f0f0; color:#666; }
        .status-grading{ background:#fff7df; color:#8a5b00; }

        .assignment-stats{
            display:grid; grid-template-columns:repeat(4, 1fr); gap:12px;
            padding:12px 0;
            border-top:1px solid #e8e8e8;
            margin-top:12px;
        }
        .stat{ text-align:center; }
        .stat-num{ font-size:20px; font-weight:bold; color:#003366; }
        .stat-label{ font-size:12px; color:#666; margin-top:4px; }

        .progress-bar{
            width:100%; height:8px; background:#e8e8e8; border-radius:4px;
            overflow:hidden; margin-top:8px;
        }
        .progress-fill{
            height:100%; background:#28a745; transition:0.3s;
        }

        footer{ background:#222; color:#fff; text-align:center; padding:18px 0; margin-top:40px; }

        @media (max-width: 980px){
            .layout{ grid-template-columns: 1fr; }
            .assignment-stats{ grid-template-columns:repeat(2, 1fr); }
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
            <a href="My_Modules.aspx">My Modules</a>
            <a href="Student_List.aspx">Student List</a>
            <a href="Attendence.aspx">Attendance</a>
            <a class="active" href="assignments.html">Assignments</a>
            <a href="Marks.aspx">Marks / Results</a>
            <a href="messages.html">Messages</a>
            <a href="#">Logout</a>
        </nav>
    </aside>

    <main>
        <section class="page-header">
            <h2>Assignments</h2>
            <button class="btn" type="button" onclick="createAssignment()">+ Create Assignment</button>
        </section>

        <div class="tabs">
            <button class="tab active" onclick="showTab('active')">Active</button>
            <button class="tab" onclick="showTab('grading')">Pending Grading</button>
            <button class="tab" onclick="showTab('completed')">Completed</button>
        </div>

        <div id="activeTab">
            <div class="assignment-card">
                <div class="assignment-header">
                    <div>
                        <h3>
                            Assignment 03: REST API Development
                            <span class="status-badge status-active">Active</span>
                        </h3>
                        <div class="assignment-meta">
                            Web Development (CSC2043) | Due: Feb 05, 2026, 23:59
                        </div>
                    </div>
                    <div class="assignment-actions">
                        <button type="button" onclick="viewAssignment('A03')">📄 View</button>
                        <button type="button" onclick="editAssignment('A03')">✏️ Edit</button>
                        <button type="button" onclick="viewSubmissions('A03')">📥 Submissions</button>
                    </div>
                </div>

                <p style="color:#555; line-height:1.6; margin:12px 0;">
                    Create a RESTful API using Node.js and Express. The API should handle CRUD operations for a resource of your choice. Include proper error handling, validation, and documentation.
                </p>

                <div class="assignment-stats">
                    <div class="stat">
                        <div class="stat-num">62</div>
                        <div class="stat-label">Total Students</div>
                    </div>
                    <div class="stat">
                        <div class="stat-num" style="color:#28a745;">45</div>
                        <div class="stat-label">Submitted</div>
                    </div>
                    <div class="stat">
                        <div class="stat-num" style="color:#ffc107;">12</div>
                        <div class="stat-label">Late Submissions</div>
                    </div>
                    <div class="stat">
                        <div class="stat-num" style="color:#dc3545;">5</div>
                        <div class="stat-label">Not Submitted</div>
                    </div>
                </div>

                <div style="margin-top:12px;">
                    <small style="color:#666;">Submission Progress: 73%</small>
                    <div class="progress-bar">
                        <div class="progress-fill" style="width:73%;"></div>
                    </div>
                </div>
            </div>

            <div class="assignment-card">
                <div class="assignment-header">
                    <div>
                        <h3>
                            Assignment 04: Frontend Integration
                            <span class="status-badge status-active">Active</span>
                        </h3>
                        <div class="assignment-meta">
                            Web Development (CSC2043) | Due: Feb 15, 2026, 23:59
                        </div>
                    </div>
                    <div class="assignment-actions">
                        <button type="button" onclick="viewAssignment('A04')">📄 View</button>
                        <button type="button" onclick="editAssignment('A04')">✏️ Edit</button>
                        <button type="button" onclick="viewSubmissions('A04')">📥 Submissions</button>
                    </div>
                </div>

                <p style="color:#555; line-height:1.6; margin:12px 0;">
                    Build a frontend interface that consumes the REST API created in Assignment 03. Use React or Vue.js for the implementation. The interface should be responsive and user-friendly.
                </p>

                <div class="assignment-stats">
                    <div class="stat">
                        <div class="stat-num">62</div>
                        <div class="stat-label">Total Students</div>
                    </div>
                    <div class="stat">
                        <div class="stat-num" style="color:#28a745;">8</div>
                        <div class="stat-label">Submitted</div>
                    </div>
                    <div class="stat">
                        <div class="stat-num" style="color:#ffc107;">0</div>
                        <div class="stat-label">Late Submissions</div>
                    </div>
                    <div class="stat">
                        <div class="stat-num" style="color:#dc3545;">54</div>
                        <div class="stat-label">Not Submitted</div>
                    </div>
                </div>

                <div style="margin-top:12px;">
                    <small style="color:#666;">Submission Progress: 13%</small>
                    <div class="progress-bar">
                        <div class="progress-fill" style="width:13%;"></div>
                    </div>
                </div>
            </div>

            <div class="assignment-card">
                <div class="assignment-header">
                    <div>
                        <h3>
                            Lab Exercise 05: SQL Injection Prevention
                            <span class="status-badge status-active">Active</span>
                        </h3>
                        <div class="assignment-meta">
                            Network Security (CSC3021) | Due: Feb 02, 2026, 23:59
                        </div>
                    </div>
                    <div class="assignment-actions">
                        <button type="button" onclick="viewAssignment('L05')">📄 View</button>
                        <button type="button" onclick="editAssignment('L05')">✏️ Edit</button>
                        <button type="button" onclick="viewSubmissions('L05')">📥 Submissions</button>
                    </div>
                </div>

                <p style="color:#555; line-height:1.6; margin:12px 0;">
                    Analyze vulnerable code samples and implement proper SQL injection prevention techniques. Submit a report documenting your findings and solutions.
                </p>

                <div class="assignment-stats">
                    <div class="stat">
                        <div class="stat-num">45</div>
                        <div class="stat-label">Total Students</div>
                    </div>
                    <div class="stat">
                        <div class="stat-num" style="color:#28a745;">32</div>
                        <div class="stat-label">Submitted</div>
                    </div>
                    <div class="stat">
                        <div class="stat-num" style="color:#ffc107;">5</div>
                        <div class="stat-label">Late Submissions</div>
                    </div>
                    <div class="stat">
                        <div class="stat-num" style="color:#dc3545;">8</div>
                        <div class="stat-label">Not Submitted</div>
                    </div>
                </div>

                <div style="margin-top:12px;">
                    <small style="color:#666;">Submission Progress: 71%</small>
                    <div class="progress-bar">
                        <div class="progress-fill" style="width:71%;"></div>
                    </div>
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

    function showTab(tabName) {
        const tabs = document.querySelectorAll('.tab');
        tabs.forEach(tab => tab.classList.remove('active'));
        event.target.classList.add('active');
        
        alert('Showing ' + tabName + ' assignments');
    }

    function createAssignment() {
        alert('Opening assignment creation form...');
    }

    function viewAssignment(id) {
        alert('Viewing assignment: ' + id);
    }

    function editAssignment(id) {
        alert('Editing assignment: ' + id);
    }

    function viewSubmissions(id) {
        alert('Viewing submissions for assignment: ' + id);
    }
</script>
</body>
</html>