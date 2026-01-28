<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Attendance - Lecturer Dashboard</title>

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
        .filters select, .filters input{
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
        th, td{ padding:12px; border-bottom:1px solid #e8e8e8; text-align:left; font-size:14px; }
        th{ background:#f8f9fa; color:#003366; font-weight:bold; }
        tr:hover td{ background:#f8f9fa; }

        .checkbox-cell{ text-align:center; }
        .checkbox-cell input[type="checkbox"]{ 
            width:18px; height:18px; cursor:pointer; 
            accent-color:#003366;
        }

        .attendance-badge{
            display:inline-block; padding:4px 10px; border-radius:12px;
            font-size:12px; font-weight:bold;
        }
        .present{ background:#e7fff2; color:#097a3a; }
        .absent{ background:#ffe7e7; color:#c41e3a; }
        .late{ background:#fff7df; color:#8a5b00; }

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
            <a class="active" href="attendance.html">Attendance</a>
            <a href="Assignments.aspx">Assignments</a>
            <a href="Marks.aspx">Marks / Results</a>
            <a href="Messages.aspx">Messages</a>
            <a href="#">Logout</a>
        </nav>
    </aside>

    <main>
        <section class="page-header">
            <h2>Mark Attendance</h2>
            <div class="filters">
                <select id="moduleFilter" onchange="updateSession()">
                    <option value="web">Web Development - CSC2043</option>
                    <option value="network">Network Security - CSC3021</option>
                    <option value="database">Database Systems - CSC2055</option>
                </select>
                <input type="date" id="dateFilter" value="2026-01-28" />
                <select id="sessionFilter">
                    <option value="1">Session 1 (09:00 - 11:00)</option>
                    <option value="2">Session 2 (13:00 - 15:00)</option>
                </select>
                <button type="button" onclick="loadAttendance()">Load</button>
                <button type="button" onclick="viewHistory()">View History</button>
            </div>
        </section>

        <section class="stats-row">
            <div class="stat-card">
                <div class="stat-num" id="totalStudents">62</div>
                <div class="stat-label">Total Students</div>
            </div>
            <div class="stat-card">
                <div class="stat-num" style="color:#28a745;" id="presentCount">54</div>
                <div class="stat-label">Present</div>
            </div>
            <div class="stat-card">
                <div class="stat-num" style="color:#ffc107;" id="lateCount">3</div>
                <div class="stat-label">Late</div>
            </div>
            <div class="stat-card">
                <div class="stat-num" style="color:#dc3545;" id="absentCount">5</div>
                <div class="stat-label">Absent</div>
            </div>
        </section>

        <div class="content-card">
            <h3>Attendance Sheet - Web Development (Session 1)</h3>
            <table id="attendanceTable">
                <thead>
                    <tr>
                        <th>Student ID</th>
                        <th>Name</th>
                        <th class="checkbox-cell">Present</th>
                        <th class="checkbox-cell">Late</th>
                        <th class="checkbox-cell">Absent</th>
                        <th>Remarks</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>UWU/ICT/22/001</td>
                        <td>Imalka Dilakshan</td>
                        <td class="checkbox-cell"><input type="radio" name="att_001" value="present" checked /></td>
                        <td class="checkbox-cell"><input type="radio" name="att_001" value="late" /></td>
                        <td class="checkbox-cell"><input type="radio" name="att_001" value="absent" /></td>
                        <td><input type="text" style="width:100%; padding:4px; border:1px solid #ddd; border-radius:4px;" placeholder="Optional note" /></td>
                    </tr>
                    <tr>
                        <td>UWU/ICT/22/015</td>
                        <td>Hasith Randitha</td>
                        <td class="checkbox-cell"><input type="radio" name="att_015" value="present" checked /></td>
                        <td class="checkbox-cell"><input type="radio" name="att_015" value="late" /></td>
                        <td class="checkbox-cell"><input type="radio" name="att_015" value="absent" /></td>
                        <td><input type="text" style="width:100%; padding:4px; border:1px solid #ddd; border-radius:4px;" placeholder="Optional note" /></td>
                    </tr>
                    <tr>
                        <td>UWU/ICT/22/023</td>
                        <td>Daniru Dayarathna</td>
                        <td class="checkbox-cell"><input type="radio" name="att_023" value="present" /></td>
                        <td class="checkbox-cell"><input type="radio" name="att_023" value="late" checked /></td>
                        <td class="checkbox-cell"><input type="radio" name="att_023" value="absent" /></td>
                        <td><input type="text" style="width:100%; padding:4px; border:1px solid #ddd; border-radius:4px;" value="Arrived 10 mins late" /></td>
                    </tr>
                    <tr>
                        <td>UWU/ICT/22/037</td>
                        <td>Kavindi Fernando</td>
                        <td class="checkbox-cell"><input type="radio" name="att_037" value="present" checked /></td>
                        <td class="checkbox-cell"><input type="radio" name="att_037" value="late" /></td>
                        <td class="checkbox-cell"><input type="radio" name="att_037" value="absent" /></td>
                        <td><input type="text" style="width:100%; padding:4px; border:1px solid #ddd; border-radius:4px;" placeholder="Optional note" /></td>
                    </tr>
                    
           
                </tbody>
            </table>
            <button class="save-btn" onclick="saveAttendance()">💾 Save Attendance</button>
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

    function updateSession() {
        alert('Loading students for selected module...');
    }

    function loadAttendance() {
        alert('Loading attendance for selected date and session...');
    }

    function viewHistory() {
        alert('Opening attendance history...');
    }

    function saveAttendance() {
        const table = document.getElementById('attendanceTable');
        const rows = table.getElementsByTagName('tbody')[0].getElementsByTagName('tr');
        let attendance = [];

        for (let i = 0; i < rows.length; i++) {
            const cells = rows[i].getElementsByTagName('td');
            const studentId = cells[0].textContent;
            const radios = rows[i].querySelectorAll('input[type="radio"]');
            let status = '';
            
            for (let radio of radios) {
                if (radio.checked) {
                    status = radio.value;
                    break;
                }
            }

            attendance.push({ id: studentId, status: status });
        }

        console.log('Saving attendance:', attendance);
        alert('Attendance saved successfully!');
    }
</script>
</body>
</html>