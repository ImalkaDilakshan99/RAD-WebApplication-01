<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Marks / Results - Lecturer Dashboard</title>

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
        }
        .page-header h2{ font-size:22px; color:#003366; margin-bottom:12px; }

        .filters{
            display:flex; gap:10px; flex-wrap:wrap; align-items:center;
        }
        .filters select{
            padding:8px 12px;
            border:1px solid #ddd;
            border-radius:8px;
            font-size:14px;
        }
        .filters button{
            background:#003366;
            color:#fff;
            border:none;
            padding:8px 14px;
            border-radius:8px;
            cursor:pointer;
            font-weight:bold;
        }

        .stats-row{
            display:grid; grid-template-columns:repeat(4, 1fr); gap:12px;
        }
        .stat-card{
            background:#fff;
            border-radius:12px;
            padding:16px;
            box-shadow:0 4px 10px rgba(0,0,0,0.08);
            text-align:center;
        }
        .stat-num{ font-size:28px; font-weight:bold; color:#003366; margin-bottom:4px; }
        .stat-label{ font-size:13px; color:#666; }

        .content-card{
            background:#fff;
            border-radius:12px;
            padding:18px;
            box-shadow:0 4px 10px rgba(0,0,0,0.08);
        }
        .content-card h3{ color:#003366; margin-bottom:14px; }

        table{ width:100%; border-collapse:collapse; }
        th, td{ padding:12px 10px; border-bottom:1px solid #e8e8e8; text-align:left; font-size:14px; }
        th{ background:#f8f9fa; color:#003366; font-weight:bold; }
        tr:hover td{ background:#f8f9fa; }

        .grade-input{
            width:70px; padding:6px; border:1px solid #ddd; border-radius:6px;
            text-align:center; font-size:14px;
        }

        .grade-badge{
            display:inline-block; padding:4px 10px; border-radius:12px;
            font-size:12px; font-weight:bold;
        }
        .grade-a{ background:#e7fff2; color:#097a3a; }
        .grade-b{ background:#e7f1ff; color:#003366; }
        .grade-c{ background:#fff7df; color:#8a5b00; }
        .grade-d{ background:#ffe7e7; color:#c41e3a; }

        .action-btn{
            background:#f0f6ff;
            color:#003366;
            border:none;
            padding:6px 10px;
            border-radius:6px;
            cursor:pointer;
            font-size:12px;
            margin-right:4px;
        }
        .action-btn:hover{ background:#e7f1ff; }

        .save-btn{
            background:#28a745;
            color:#fff;
            border:none;
            padding:10px 20px;
            border-radius:8px;
            cursor:pointer;
            font-weight:bold;
            margin-top:14px;
        }

        .chart-container{
            background:#fff;
            border-radius:12px;
            padding:18px;
            box-shadow:0 4px 10px rgba(0,0,0,0.08);
        }

        footer{ background:#222; color:#fff; text-align:center; padding:18px 0; margin-top:40px; }

        @media (max-width: 980px){
            .layout{ grid-template-columns: 1fr; }
            .stats-row{ grid-template-columns:repeat(2, 1fr); }
            table{ font-size:12px; }
            th, td{ padding:8px; }
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
            <a href="Assignments.aspx">Assignments</a>
            <a class="active" href="marks.html">Marks / Results</a>
            <a href="Messages.aspx">Messages</a>
            <a href="#">Logout</a>
        </nav>
    </aside>

    <main>
        <section class="page-header">
            <h2>Marks & Results</h2>
            <div class="filters">
                <select id="moduleFilter" onchange="loadMarks()">
                    <option value="web">Web Development - CSC2043</option>
                    <option value="network">Network Security - CSC3021</option>
                    <option value="database">Database Systems - CSC2055</option>
                </select>
                <select id="assessmentFilter" onchange="loadMarks()">
                    <option value="all">All Assessments</option>
                    <option value="a1">Assignment 01</option>
                    <option value="a2">Assignment 02</option>
                    <option value="a3">Assignment 03</option>
                    <option value="mid">Mid Semester Exam</option>
                    <option value="final">Final Exam</option>
                </select>
                <button type="button" onclick="exportMarks()">📊 Export</button>
                <button type="button" onclick="generateReport()">📄 Report</button>
            </div>
        </section>

        <section class="stats-row">
            <div class="stat-card">
                <div class="stat-num">72.5%</div>
                <div class="stat-label">Class Average</div>
            </div>
            <div class="stat-card">
                <div class="stat-num" style="color:#28a745;">18</div>
                <div class="stat-label">Grade A</div>
            </div>
            <div class="stat-card">
                <div class="stat-num" style="color:#003366;">28</div>
                <div class="stat-label">Grade B</div>
            </div>
            <div class="stat-card">
                <div class="stat-num" style="color:#dc3545;">4</div>
                <div class="stat-label">Below Average</div>
            </div>
        </section>

        <div class="content-card">
            <h3>Student Marks - Web Development (Assignment 03)</h3>
            <table id="marksTable">
                <thead>
                    <tr>
                        <th>Student ID</th>
                        <th>Name</th>
                        <th>Marks (/100)</th>
                        <th>Grade</th>
                        <th>Feedback</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>UWU/ICT/22/001</td>
                        <td>Anura Jayasinghe</td>
                        <td><input type="number" class="grade-input" value="85" min="0" max="100" /></td>
                        <td><span class="grade-badge grade-a">A</span></td>
                        <td><input type="text" style="width:100%; padding:4px; border:1px solid #ddd; border-radius:4px;" value="Excellent work!" /></td>
                        <td>
                            <button class="action-btn" onclick="viewSubmission('001')">View</button>
                        </td>
                    </tr>
                    <tr>
                        <td>UWU/ICT/22/015</td>
                        <td>Samanthi Perera</td>
                        <td><input type="number" class="grade-input" value="78" min="0" max="100" /></td>
                        <td><span class="grade-badge grade-b">B+</span></td>
                        <td><input type="text" style="width:100%; padding:4px; border:1px solid #ddd; border-radius:4px;" value="Good implementation" /></td>
                        <td>
                            <button class="action-btn" onclick="viewSubmission('015')">View</button>
                        </td>
                    </tr>
                    <tr>
                        <td>UWU/ICT/22/023</td>
                        <td>Nuwan Rathnayake</td>
                        <td><input type="number" class="grade-input" value="92" min="0" max="100" /></td>
                        <td><span class="grade-badge grade-a">A+</span></td>
                        <td><input type="text" style="width:100%; padding:4px; border:1px solid #ddd; border-radius:4px;" value="Outstanding!" /></td>
                        <td>
                            <button class="action-btn" onclick="viewSubmission('023')">View</button>
                        </td>
                    </tr>
                    <tr>
                        <td>UWU/ICT/22/037</td>
                        <td>Kavindi Fernando</td>
                        <td><input type="number" class="grade-input" value="65" min="0" max="100" /></td>
                        <td><span class="grade-badge grade-c">C+</span></td>
                        <td><input type="text" style="width:100%; padding:4px; border:1px solid #ddd; border-radius:4px;" value="Needs improvement" /></td>
                        <td>
                            <button class="action-btn" onclick="viewSubmission('037')">View</button>
                        </td>
                    </tr>
                    <tr>
                        <td>UWU/ICT/22/041</td>
                        <td>Dinesh Wickrama</td>
                        <td><input type="number" class="grade-input" value="45" min="0" max="100" /></td>
                        <td><span class="grade-badge grade-d">D</span></td>
                        <td><input type="text" style="width:100%; padding:4px; border:1px solid #ddd; border-radius:4px;" value="Please see me" /></td>
                        <td>
                            <button class="action-btn" onclick="viewSubmission('041')">View</button>
                        </td>
                    </tr>
                    <tr>
                        <td>UWU/ICT/22/058</td>
                        <td>Tharindu Silva</td>
                        <td><input type="number" class="grade-input" value="88" min="0" max="100" /></td>
                        <td><span class="grade-badge grade-a">A</span></td>
                        <td><input type="text" style="width:100%; padding:4px; border:1px solid #ddd; border-radius:4px;" value="Very good work" /></td>
                        <td>
                            <button class="action-btn" onclick="viewSubmission('058')">View</button>
                        </td>
                    </tr>
              
                    <tr>
                        <td>UWU/ICT/22/089</td>
                        <td>Dilshan Senanayake</td>
                        <td><input type="number" class="grade-input" value="" min="0" max="100" placeholder="--" /></td>
                        <td><span style="color:#999;">Not Graded</span></td>
                        <td><input type="text" style="width:100%; padding:4px; border:1px solid #ddd; border-radius:4px;" placeholder="Feedback..." /></td>
                        <td>
                            <button class="action-btn" onclick="viewSubmission('089')">View</button>
                        </td>
                    </tr>
                </tbody>
            </table>
            <button class="save-btn" onclick="saveMarks()">💾 Save All Marks</button>
        </div>

        <div class="chart-container">
            <h3 style="color:#003366; margin-bottom:14px;">Grade Distribution</h3>
            <div style="display:flex; gap:20px; align-items:end; height:200px; padding:20px;">
                <div style="flex:1; text-align:center;">
                    <div style="background:#28a745; height:160px; border-radius:8px 8px 0 0; position:relative;">
                        <div style="position:absolute; top:10px; left:50%; transform:translateX(-50%); color:#fff; font-weight:bold;">18</div>
                    </div>
                    <div style="margin-top:8px; font-weight:bold;">A</div>
                </div>
                <div style="flex:1; text-align:center;">
                    <div style="background:#003366; height:140px; border-radius:8px 8px 0 0; position:relative;">
                        <div style="position:absolute; top:10px; left:50%; transform:translateX(-50%); color:#fff; font-weight:bold;">28</div>
                    </div>
                    <div style="margin-top:8px; font-weight:bold;">B</div>
                </div>
                <div style="flex:1; text-align:center;">
                    <div style="background:#ffc107; height:80px; border-radius:8px 8px 0 0; position:relative;">
                        <div style="position:absolute; top:10px; left:50%; transform:translateX(-50%); color:#fff; font-weight:bold;">12</div>
                    </div>
                    <div style="margin-top:8px; font-weight:bold;">C</div>
                </div>
                <div style="flex:1; text-align:center;">
                    <div style="background:#dc3545; height:40px; border-radius:8px 8px 0 0; position:relative;">
                        <div style="position:absolute; top:10px; left:50%; transform:translateX(-50%); color:#fff; font-weight:bold;">4</div>
                    </div>
                    <div style="margin-top:8px; font-weight:bold;">D/F</div>
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

    function loadMarks() {
        alert('Loading marks for selected module and assessment...');
    }

    function exportMarks() {
        alert('Exporting marks to Excel...');
    }

    function generateReport() {
        alert('Generating performance report...');
    }

    function viewSubmission(studentId) {
        alert('Viewing submission for student: ' + studentId);
    }

    function saveMarks() {
        alert('Saving all marks and feedback...');
    }
</script>
</body>
</html>