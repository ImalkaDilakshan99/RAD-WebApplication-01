<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin Dashboard</title>

    <style>
        * { margin:0; padding:0; box-sizing:border-box; }
        body { font-family: Arial, sans-serif; background:#f4f4f4; color:#222; min-height:100vh; }

        header{ background:#003366; color:#fff; padding:18px 0; box-shadow:0 2px 10px rgba(0,0,0,0.12); }
        header .container{
            max-width:1200px; margin:0 auto; padding:0 18px;
            display:flex; align-items:center; justify-content:space-between; gap:12px;
        }
        header h1{ font-size:22px; letter-spacing:1px; }
        .user-chip{ display:flex; gap:10px; align-items:center; background:rgba(255,255,255,0.12); padding:8px 12px; border-radius:999px; font-size:14px; }
        .user-dot{ width:10px; height:10px; border-radius:50%; background:#ffcc00; }

        .layout{
            max-width:1200px; margin:18px auto; padding:0 18px 40px;
            display:grid; grid-template-columns: 260px 1fr; gap:18px;
        }
        aside{ background:#fff; border-radius:12px; box-shadow:0 4px 10px rgba(0,0,0,0.08); overflow:hidden; }
        .aside-head{ padding:14px; background:#0b4a84; color:#fff; display:flex; justify-content:space-between; align-items:center; }
        .aside-head button{ border:none; background:rgba(255,255,255,0.2); color:#fff; padding:8px 10px; border-radius:8px; cursor:pointer; }

        .menu{ padding:10px; display:flex; flex-direction:column; gap:6px; }
        .menu a{ text-decoration:none; color:#203040; padding:10px 12px; border-radius:10px; transition:0.2s; }
        .menu a:hover{ background:#f0f6ff; }
        .menu a.active{ background:#e7f1ff; font-weight:bold; }

        main{ display:flex; flex-direction:column; gap:16px; }

        .topbar{
            background:#fff; border-radius:12px; padding:14px;
            box-shadow:0 4px 10px rgba(0,0,0,0.08);
            display:flex; align-items:center; justify-content:space-between; gap:12px;
        }
        .search{
            flex:1;
            display:flex; gap:10px; align-items:center;
            border:1px solid #e5e5e5; border-radius:12px; padding:10px 12px;
            background:#fafafa;
        }
        .search input{ width:100%; border:none; outline:none; background:transparent; font-size:14px; }
        .btn{
            border:none; border-radius:10px; padding:10px 12px;
            cursor:pointer; font-weight:bold;
        }
        .btn.primary{ background:#003366; color:#fff; }
        .btn.yellow{ background:#ffcc00; color:#111; }
        .btn.success{ background:#28a745; color:#fff; }

        .cards{ display:grid; grid-template-columns: repeat(4, 1fr); gap:14px; }
        .card{
            background:#fff; border-radius:12px; padding:14px;
            box-shadow:0 4px 10px rgba(0,0,0,0.08);
        }
        .card h3{ font-size:14px; color:#003366; margin-bottom:10px; }
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
        .pill.bad{ background:#ffe7e7; color:#8a1010; }

        .panel{
            background:#fff; border-radius:12px; padding:14px;
            box-shadow:0 4px 10px rgba(0,0,0,0.08);
        }
        .panel h3{ color:#003366; margin-bottom:10px; font-size:16px; }
        .action{
            display:flex; justify-content:space-between; align-items:center;
            border:1px solid #e5e5e5; border-radius:12px; padding:12px;
            margin-top:10px; background:#fff;
        }
        .action small{ color:#666; }

        .modal{
            display:none; position:fixed; top:0; left:0; width:100%; height:100%;
            background:rgba(0,0,0,0.5); justify-content:center; align-items:center; z-index:1000;
        }
        .modal.show{ display:flex; }
        .modal-content{
            background:#fff; border-radius:12px; padding:24px;
            max-width:500px; width:90%; max-height:90vh; overflow-y:auto;
        }
        .modal-header{ display:flex; justify-content:space-between; align-items:center; margin-bottom:20px; }
        .modal-header h2{ color:#003366; font-size:20px; }
        .close-btn{ border:none; background:none; font-size:24px; cursor:pointer; color:#666; }

        .form-group{ margin-bottom:16px; }
        .form-group label{ display:block; margin-bottom:6px; font-weight:bold; color:#333; font-size:14px; }
        .form-group input, .form-group select, .form-group textarea{
            width:100%; padding:10px 12px; border:1px solid #e5e5e5;
            border-radius:8px; font-size:14px; background:#fafafa;
        }
        .form-group textarea{ resize:vertical; min-height:80px; }
        .form-group input:focus, .form-group select:focus, .form-group textarea:focus{
            outline:none; border-color:#003366; background:#fff;
        }

        .form-actions{ display:flex; gap:10px; justify-content:flex-end; margin-top:20px; }

        .success-message{
            background:#e7fff2; color:#097a3a; padding:12px;
            border-radius:8px; margin-bottom:16px; display:none;
        }
        .success-message.show{ display:block; }

        footer{ background:#222; color:#fff; text-align:center; padding:18px 0; }

        @media (max-width: 1060px){
            .layout{ grid-template-columns: 1fr; }
            .cards{ grid-template-columns: repeat(2, 1fr); }
            .grid2{ grid-template-columns: 1fr; }
        }
        @media (max-width: 520px){
            .cards{ grid-template-columns: 1fr; }
        }
    </style>
</head>

<body>
<header>
    <div class="container">
        <h1>University Portal</h1>
        <div class="user-chip">
            <span class="user-dot"></span>
            <span>Admin: System</span>
        </div>
    </div>
</header>

<div class="layout">
    <aside>
        <div class="aside-head">
            <strong>Admin Menu</strong>
            <button type="button" onclick="toggleMenu()">☰</button>
        </div>

        <nav class="menu" id="menu">
            <a class="active" href="#">Dashboard</a>
            <a href="Students_Management.aspx">Students</a>
            <a href="Lecturer_Management.aspx">Lecturers</a>
            <a href="#">Courses</a>
            <a href="#">Enrollments</a>
            <a href="#">Reports</a>
            <a href="#">Settings</a>
            <a href="#">Logout</a>
        </nav>
    </aside>

    <main>
        <section class="topbar">
            <div class="search">
                <span style="font-weight:bold; color:#003366;">Search</span>
                <input type="text" placeholder="Search students, courses, lecturers..." />
            </div>
            <button class="btn yellow" type="button" onclick="openStudentModal()">+ Add Student</button>
            <button class="btn primary" type="button" onclick="openCourseModal()">+ Add Course</button>
        </section>

        <section class="cards">
            <div class="card">
                <h3>Total Students</h3>
                <div class="num" id="totalStudents">1,240</div>
                <div class="hint">Active this year</div>
            </div>
            <div class="card">
                <h3>Total Lecturers</h3>
                <div class="num">58</div>
                <div class="hint">All faculties</div>
            </div>
            <div class="card">
                <h3>Total Courses</h3>
                <div class="num" id="totalCourses">132</div>
                <div class="hint">Undergraduate + Postgraduate</div>
            </div>
            <div class="card">
                <h3>Pending Approvals</h3>
                <div class="num">7</div>
                <div class="hint">Enrollments / Requests</div>
            </div>
        </section>

        <section class="grid2">
            <div class="panel">
                <h3>Recent Enrollments</h3>
                <table>
                    <thead>
                        <tr>
                            <th>Student</th>
                            <th>Course</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody id="enrollmentsTable">
                        <tr>
                            <td>Nimal Perera</td>
                            <td>Web Development</td>
                            <td><span class="pill ok">Approved</span></td>
                        </tr>
                        <tr>
                            <td>Kasun Silva</td>
                            <td>Database Systems</td>
                            <td><span class="pill warn">Pending</span></td>
                        </tr>
                        <tr>
                            <td>Tharindu Jay</td>
                            <td>Network Security</td>
                            <td><span class="pill ok">Approved</span></td>
                        </tr>
                        <tr>
                            <td>Ayesha Fernando</td>
                            <td>Business Analytics</td>
                            <td><span class="pill bad">Rejected</span></td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="panel">
                <h3>Admin Quick Actions</h3>

                <div class="action">
                    <div>
                        <strong>Manage Courses</strong><br />
                        <small>Create/edit course catalog</small>
                    </div>
                    <button class="btn primary" type="button" onclick="alert('Navigate to Courses page')">Open</button>
                </div>

                <div class="action">
                    <div>
                        <strong>Manage Lecturers</strong><br />
                        <small>Add / assign modules</small>
                    </div>
                    <button class="btn primary" type="button" onclick="location.assign(Lecturer_Management.aspx)">Open</button>
                </div>

                <div class="action">
                    <div>
                        <strong>Generate Reports</strong><br />
                        <small>Enrollments, attendance, results</small>
                    </div>
                    <button class="btn yellow" type="button" onclick="alert('Generate report functionality')">Run</button>
                </div>
            </div>
        </section>
    </main>
</div>

<footer>
    <p>&copy; 2026 Uva Wellassa University | All rights reserved.</p>
</footer>

<!-- Add Student Modal -->
<div class="modal" id="studentModal">
    <div class="modal-content">
        <div class="modal-header">
            <h2>Add New Student</h2>
            <button class="close-btn" onclick="closeStudentModal()">&times;</button>
        </div>
        
        <div class="success-message" id="studentSuccess">
            Student added successfully!
        </div>

        <form id="studentForm" onsubmit="saveStudent(event)">
            <div class="form-group">
                <label>Student ID *</label>
                <input type="text" id="studentId" required placeholder="e.g., STU2026001">
            </div>
            
            <div class="form-group">
                <label>Full Name *</label>
                <input type="text" id="studentName" required placeholder="e.g., John Doe">
            </div>
            
            <div class="form-group">
                <label>Email *</label>
                <input type="email" id="studentEmail" required placeholder="e.g., john@university.edu">
            </div>
            
            <div class="form-group">
                <label>Phone</label>
                <input type="tel" id="studentPhone" placeholder="e.g., +94771234567">
            </div>
            
            <div class="form-group">
                <label>Faculty *</label>
                <select id="studentFaculty" required>
                    <option value="">Select Faculty</option>
                    <option value="Engineering">Engineering</option>
                    <option value="Science">Science</option>
                    <option value="Business">Business</option>
                    <option value="Arts">Arts</option>
                </select>
            </div>
            
            <div class="form-group">
                <label>Year *</label>
                <select id="studentYear" required>
                    <option value="">Select Year</option>
                    <option value="1">Year 1</option>
                    <option value="2">Year 2</option>
                    <option value="3">Year 3</option>
                    <option value="4">Year 4</option>
                </select>
            </div>
            
            <div class="form-group">
                <label>Address</label>
                <textarea id="studentAddress" placeholder="Enter student address"></textarea>
            </div>
            
            <div class="form-actions">
                <button type="button" class="btn" onclick="closeStudentModal()">Cancel</button>
                <button type="submit" class="btn success">Save Student</button>
            </div>
        </form>
    </div>
</div>

<!-- Add Course Modal -->
<div class="modal" id="courseModal">
    <div class="modal-content">
        <div class="modal-header">
            <h2>Add New Course</h2>
            <button class="close-btn" onclick="closeCourseModal()">&times;</button>
        </div>
        
        <div class="success-message" id="courseSuccess">
            Course added successfully!
        </div>

        <form id="courseForm" onsubmit="saveCourse(event)">
            <div class="form-group">
                <label>Course Code *</label>
                <input type="text" id="courseCode" required placeholder="e.g., CS101">
            </div>
            
            <div class="form-group">
                <label>Course Name *</label>
                <input type="text" id="courseName" required placeholder="e.g., Introduction to Programming">
            </div>
            
            <div class="form-group">
                <label>Faculty *</label>
                <select id="courseFaculty" required>
                    <option value="">Select Faculty</option>
                    <option value="Engineering">Engineering</option>
                    <option value="Science">Science</option>
                    <option value="Business">Business</option>
                    <option value="Arts">Arts</option>
                </select>
            </div>
            
            <div class="form-group">
                <label>Credits *</label>
                <input type="number" id="courseCredits" required min="1" max="6" placeholder="e.g., 3">
            </div>
            
            <div class="form-group">
                <label>Level *</label>
                <select id="courseLevel" required>
                    <option value="">Select Level</option>
                    <option value="Undergraduate">Undergraduate</option>
                    <option value="Postgraduate">Postgraduate</option>
                </select>
            </div>
            
            <div class="form-group">
                <label>Semester *</label>
                <select id="courseSemester" required>
                    <option value="">Select Semester</option>
                    <option value="1">Semester 1</option>
                    <option value="2">Semester 2</option>
                </select>
            </div>
            
            <div class="form-group">
                <label>Description</label>
                <textarea id="courseDescription" placeholder="Enter course description"></textarea>
            </div>
            
            <div class="form-actions">
                <button type="button" class="btn" onclick="closeCourseModal()">Cancel</button>
                <button type="submit" class="btn success">Save Course</button>
            </div>
        </form>
    </div>
</div>

<script>
    let students = [];
    let courses = [];

    function toggleMenu() {
        const menu = document.getElementById('menu');
        menu.style.display = (menu.style.display === 'none') ? 'flex' : 'none';
    }

    // Student Modal Functions
    function openStudentModal() {
        document.getElementById('studentModal').classList.add('show');
        document.getElementById('studentSuccess').classList.remove('show');
    }

    function closeStudentModal() {
        document.getElementById('studentModal').classList.remove('show');
        document.getElementById('studentForm').reset();
    }

    function saveStudent(event) {
        event.preventDefault();

        const studentData = {
            id: document.getElementById('studentId').value,
            name: document.getElementById('studentName').value,
            email: document.getElementById('studentEmail').value,
            phone: document.getElementById('studentPhone').value,
            faculty: document.getElementById('studentFaculty').value,
            year: document.getElementById('studentYear').value,
            address: document.getElementById('studentAddress').value,
            enrolledDate: new Date().toLocaleDateString()
        };

        students.push(studentData);

        // Show success message
        document.getElementById('studentSuccess').classList.add('show');

        // Update student count
        updateStudentCount();

        // Add to recent enrollments
        addRecentEnrollment(studentData.name, 'New Enrollment', 'warn');

        // Reset form after 1.5 seconds and close modal
        setTimeout(() => {
            closeStudentModal();
        }, 1500);

        console.log('Student saved:', studentData);
    }

    // Course Modal Functions
    function openCourseModal() {
        document.getElementById('courseModal').classList.add('show');
        document.getElementById('courseSuccess').classList.remove('show');
    }

    function closeCourseModal() {
        document.getElementById('courseModal').classList.remove('show');
        document.getElementById('courseForm').reset();
    }

    function saveCourse(event) {
        event.preventDefault();

        const courseData = {
            code: document.getElementById('courseCode').value,
            name: document.getElementById('courseName').value,
            faculty: document.getElementById('courseFaculty').value,
            credits: document.getElementById('courseCredits').value,
            level: document.getElementById('courseLevel').value,
            semester: document.getElementById('courseSemester').value,
            description: document.getElementById('courseDescription').value,
            createdDate: new Date().toLocaleDateString()
        };

        courses.push(courseData);

        // Show success message
        document.getElementById('courseSuccess').classList.add('show');

        // Update course count
        updateCourseCount();

        // Reset form after 1.5 seconds and close modal
        setTimeout(() => {
            closeCourseModal();
        }, 1500);

        console.log('Course saved:', courseData);
    }

    // Update Dashboard Counts
    function updateStudentCount() {
        const currentCount = 1240 + students.length;
        document.getElementById('totalStudents').textContent = currentCount.toLocaleString();
    }

    function updateCourseCount() {
        const currentCount = 132 + courses.length;
        document.getElementById('totalCourses').textContent = currentCount;
    }

    // Add to Recent Enrollments Table
    function addRecentEnrollment(studentName, courseName, status) {
        const tbody = document.getElementById('enrollmentsTable');
        const statusClass = status === 'ok' ? 'ok' : status === 'warn' ? 'warn' : 'bad';
        const statusText = status === 'ok' ? 'Approved' : status === 'warn' ? 'Pending' : 'Rejected';

        const row = document.createElement('tr');
        row.innerHTML = `
            <td>${studentName}</td>
            <td>${courseName}</td>
            <td><span class="pill ${statusClass}">${statusText}</span></td>
        `;

        // Insert at the beginning
        tbody.insertBefore(row, tbody.firstChild);

        // Keep only last 5 enrollments
        if (tbody.children.length > 5) {
            tbody.removeChild(tbody.lastChild);
        }
    }

    // Close modal when clicking outside
    window.onclick = function (event) {
        const studentModal = document.getElementById('studentModal');
        const courseModal = document.getElementById('courseModal');

        if (event.target === studentModal) {
            closeStudentModal();
        }
        if (event.target === courseModal) {
            closeCourseModal();
        }
    }
</script>
</body>
</html>