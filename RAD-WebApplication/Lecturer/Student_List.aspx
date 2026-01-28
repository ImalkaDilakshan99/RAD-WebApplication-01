<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Student List - Lecturer Dashboard</title>

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
            display:flex; gap:10px; flex-wrap:wrap;
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

        .content-card{
            background:#fff;
            border-radius:12px;
            padding:18px;
            box-shadow:0 4px 10px rgba(0,0,0,0.08);
        }

        table{ width:100%; border-collapse:collapse; }
        th, td{ padding:12px; border-bottom:1px solid #e8e8e8; text-align:left; font-size:14px; }
        th{ background:#f8f9fa; color:#003366; font-weight:bold; }
        tr:hover td{ background:#f8f9fa; }

        .avatar{
            width:36px; height:36px; border-radius:50%; background:#003366;
            color:#fff; display:inline-flex; align-items:center; justify-content:center;
            font-weight:bold; font-size:14px;
        }

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

        footer{ background:#222; color:#fff; text-align:center; padding:18px 0; margin-top:40px; }

        @media (max-width: 980px){
            .layout{ grid-template-columns: 1fr; }
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
            <a class="active" href="student-list.html">Student List</a>
            <a href="Attendence.aspx">Attendance</a>
            <a href="Assignments.aspx">Assignments</a>
            <a href="Marks.aspx">Marks / Results</a>
            <a href="Messages.aspx">Messages</a>
            <a href="#">Logout</a>
        </nav>
    </aside>

    <main>
        <section class="page-header">
            <h2>Student List</h2>
            <div class="filters">
                <select id="moduleFilter">
                    <option value="">All Modules</option>
                    <option value="web">Web Development</option>
                    <option value="network">Network Security</option>
                    <option value="database">Database Systems</option>
                </select>
                <input type="text" placeholder="Search by name or ID..." id="searchInput" />
                <button type="button" onclick="filterStudents()">Search</button>
                <button type="button" onclick="exportList()">Export List</button>
            </div>
        </section>

        <div class="content-card">
            <table id="studentTable">
                <thead>
                    <tr>
                        <th>Student ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Module</th>
                        <th>Year</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>UWU/ICT/20/001</td>
                        <td>
                            <div style="display:flex; align-items:center; gap:10px;">
                                <span class="avatar">AN</span>
                                <span>Imalka Dilakshan</span>
                            </div>
                        </td>
                        <td>imalka@student.uwu.ac.lk</td>
                        <td>Web Development</td>
                        <td>2nd Year</td>
                        <td>
                            <button class="action-btn" onclick="viewProfile('001')">View</button>
                            <button class="action-btn" onclick="sendMessage('001')">Message</button>
                        </td>
                    </tr>
                    <tr>
                        <td>UWU/ICT/20/015</td>
                        <td>
                            <div style="display:flex; align-items:center; gap:10px;">
                                <span class="avatar">SP</span>
                                <span>Hasith Randitha</span>
                            </div>
                        </td>
                        <td>hasith@student.uwu.ac.lk</td>
                        <td>Web Development</td>
                        <td>2nd Year</td>
                        <td>
                            <button class="action-btn" onclick="viewProfile('015')">View</button>
                            <button class="action-btn" onclick="sendMessage('015')">Message</button>
                        </td>
                    </tr>
                    <tr>
                        <td>UWU/ICT/19/032</td>
                        <td>
                            <div style="display:flex; align-items:center; gap:10px;">
                                <span class="avatar">KF</span>
                                <span>Kasun Fernando</span>
                            </div>
                        </td>
                        <td>kasun.f@student.uwu.ac.lk</td>
                        <td>Network Security</td>
                        <td>3rd Year</td>
                        <td>
                            <button class="action-btn" onclick="viewProfile('032')">View</button>
                            <button class="action-btn" onclick="sendMessage('032')">Message</button>
                        </td>
                    </tr>
                    <tr>
                        <td>UWU/ICT/19/045</td>
                        <td>
                            <div style="display:flex; align-items:center; gap:10px;">
                                <span class="avatar">NW</span>
                                <span>Nilmini Wickramasinghe</span>
                            </div>
                        </td>
                        <td>nilmini.w@student.uwu.ac.lk</td>
                        <td>Network Security</td>
                        <td>3rd Year</td>
                        <td>
                            <button class="action-btn" onclick="viewProfile('045')">View</button>
                            <button class="action-btn" onclick="sendMessage('045')">Message</button>
                        </td>
                    </tr>
                    <tr>
                        <td>UWU/ICT/20/058</td>
                        <td>
                            <div style="display:flex; align-items:center; gap:10px;">
                                <span class="avatar">RD</span>
                                <span>Ravindu Dissanayake</span>
                            </div>
                        </td>
                        <td>ravindu.d@student.uwu.ac.lk</td>
                        <td>Database Systems</td>
                        <td>2nd Year</td>
                        <td>
                            <button class="action-btn" onclick="viewProfile('058')">View</button>
                            <button class="action-btn" onclick="sendMessage('058')">Message</button>
                        </td>
                    </tr>
                    <tr>
                        <td>UWU/ICT/20/072</td>
                        <td>
                            <div style="display:flex; align-items:center; gap:10px;">
                                <span class="avatar">TR</span>
                                <span>Tharushi Rathnayake</span>
                            </div>
                        </td>
                        <td>tharushi.r@student.uwu.ac.lk</td>
                        <td>Database Systems</td>
                        <td>2nd Year</td>
                        <td>
                            <button class="action-btn" onclick="viewProfile('072')">View</button>
                            <button class="action-btn" onclick="sendMessage('072')">Message</button>
                        </td>
                    </tr>
                    <tr>
                        <td>UWU/ICT/20/089</td>
                        <td>
                            <div style="display:flex; align-items:center; gap:10px;">
                                <span class="avatar">DS</span>
                                <span>Dilshan Silva</span>
                            </div>
                        </td>
                        <td>dilshan.s@student.uwu.ac.lk</td>
                        <td>Web Development</td>
                        <td>2nd Year</td>
                        <td>
                            <button class="action-btn" onclick="viewProfile('089')">View</button>
                            <button class="action-btn" onclick="sendMessage('089')">Message</button>
                        </td>
                    </tr>
                    <tr>
                        <td>UWU/ICT/19/103</td>
                        <td>
                            <div style="display:flex; align-items:center; gap:10px;">
                                <span class="avatar">PM</span>
                                <span>Piyumi Mendis</span>
                            </div>
                        </td>
                        <td>piyumi.m@student.uwu.ac.lk</td>
                        <td>Network Security</td>
                        <td>3rd Year</td>
                        <td>
                            <button class="action-btn" onclick="viewProfile('103')">View</button>
                            <button class="action-btn" onclick="sendMessage('103')">Message</button>
                        </td>
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

    function filterStudents() {
        const searchInput = document.getElementById('searchInput').value.toLowerCase();
        const moduleFilter = document.getElementById('moduleFilter').value.toLowerCase();
        const table = document.getElementById('studentTable');
        const rows = table.getElementsByTagName('tbody')[0].getElementsByTagName('tr');

        for (let i = 0; i < rows.length; i++) {
            const cells = rows[i].getElementsByTagName('td');
            const studentId = cells[0].textContent.toLowerCase();
            const studentName = cells[1].textContent.toLowerCase();
            const moduleName = cells[3].textContent.toLowerCase();

            const matchesSearch = studentId.includes(searchInput) || studentName.includes(searchInput);
            const matchesModule = moduleFilter === '' || moduleName.includes(moduleFilter);

            if (matchesSearch && matchesModule) {
                rows[i].style.display = '';
            } else {
                rows[i].style.display = 'none';
            }
        }
    }

    function viewProfile(studentId) {
        alert('Viewing profile for student: ' + studentId);
    }

    function sendMessage(studentId) {
        alert('Opening message compose for student: ' + studentId);
    }

    function exportList() {
        alert('Exporting student list...');
    }
</script>
</body>
</html>