<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Students Management</title>

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
            display:flex; align-items:center; justify-content:space-between; gap:12px; flex-wrap:wrap;
        }
        .page-title{ font-size:20px; color:#003366; font-weight:bold; }
        .search{
            flex:1; min-width:250px;
            display:flex; gap:10px; align-items:center;
            border:1px solid #e5e5e5; border-radius:12px; padding:10px 12px;
            background:#fafafa;
        }
        .search input{ width:100%; border:none; outline:none; background:transparent; font-size:14px; }
        .btn{
            border:none; border-radius:10px; padding:10px 16px;
            cursor:pointer; font-weight:bold; font-size:14px;
        }
        .btn.primary{ background:#003366; color:#fff; }
        .btn.yellow{ background:#ffcc00; color:#111; }
        .btn.danger{ background:#dc3545; color:#fff; }
        .btn.success{ background:#28a745; color:#fff; }

        .filters{
            background:#fff; border-radius:12px; padding:14px;
            box-shadow:0 4px 10px rgba(0,0,0,0.08);
            display:flex; gap:12px; flex-wrap:wrap; align-items:center;
        }
        .filter-group{ display:flex; flex-direction:column; gap:4px; }
        .filter-group label{ font-size:12px; color:#666; font-weight:bold; }
        .filter-group select, .filter-group input{
            padding:8px 12px; border:1px solid #e5e5e5; border-radius:8px;
            background:#fafafa; font-size:14px;
        }

        .panel{
            background:#fff; border-radius:12px; padding:14px;
            box-shadow:0 4px 10px rgba(0,0,0,0.08);
        }

        table{ width:100%; border-collapse:collapse; border-radius:10px; overflow:hidden; }
        th, td{ padding:12px; border-bottom:1px solid #e8e8e8; text-align:left; font-size:14px; }
        th{ background:#003366; color:#fff; font-weight:bold; }
        tr:hover td{ background:#f0f6ff; }
        tr:nth-child(even) td{ background:#fafafa; }
        tr:nth-child(even):hover td{ background:#f0f6ff; }

        .pill{ display:inline-block; padding:4px 10px; border-radius:999px; font-size:12px; font-weight:bold; }
        .pill.active{ background:#e7fff2; color:#097a3a; }
        .pill.inactive{ background:#ffe7e7; color:#8a1010; }

        .actions{ display:flex; gap:6px; }
        .btn-icon{ 
            border:none; background:none; cursor:pointer; padding:6px 10px;
            border-radius:6px; font-size:14px; transition:0.2s;
        }
        .btn-icon:hover{ background:#e5e5e5; }

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

        .form-actions{ display:flex; gap:10px; justify-content:flex-end; margin-top:20px; }

        .pagination{
            display:flex; justify-content:center; align-items:center; gap:10px;
            margin-top:20px; padding:10px;
        }
        .pagination button{
            padding:8px 12px; border:1px solid #e5e5e5; background:#fff;
            border-radius:6px; cursor:pointer; font-size:14px;
        }
        .pagination button:disabled{ opacity:0.5; cursor:not-allowed; }
        .pagination button.active{ background:#003366; color:#fff; border-color:#003366; }

        footer{ background:#222; color:#fff; text-align:center; padding:18px 0; margin-top:30px; }

        @media (max-width: 1060px){
            .layout{ grid-template-columns: 1fr; }
        }
        @media (max-width: 520px){
            .topbar, .filters{ flex-direction:column; align-items:stretch; }
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
            <a href="Admin_Dashboard.aspx">Dashboard</a>
            <a class="active" href="#">Students</a>
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
            <h2 class="page-title">Students Management</h2>
            <div class="search">
                <span style="font-weight:bold; color:#003366;">🔍</span>
                <input type="text" id="searchInput" placeholder="Search by name, ID, email..." onkeyup="filterStudents()" />
            </div>
            <button class="btn yellow" type="button" onclick="openAddModal()">+ Add Student</button>
        </section>

        <section class="filters">
            <div class="filter-group">
                <label>Year</label>
                <select id="yearFilter" onchange="filterStudents()">
                    <option value="">All Years</option>
                    <option value="1">Year 1</option>
                    <option value="2">Year 2</option>
                    <option value="3">Year 3</option>
                    <option value="4">Year 4</option>
                </select>
            </div>
            <div class="filter-group">
                <label>Faculty</label>
                <select id="facultyFilter" onchange="filterStudents()">
                    <option value="">All Faculties</option>
                    <option value="Engineering">Engineering</option>
                    <option value="Science">Science</option>
                    <option value="Business">Business</option>
                    <option value="Arts">Arts</option>
                </select>
            </div>
            <div class="filter-group">
                <label>Status</label>
                <select id="statusFilter" onchange="filterStudents()">
                    <option value="">All Status</option>
                    <option value="Active">Active</option>
                    <option value="Inactive">Inactive</option>
                </select>
            </div>
            <button class="btn primary" onclick="clearFilters()" style="align-self:flex-end;">Clear Filters</button>
        </section>

        <section class="panel">
            <table id="studentsTable">
                <thead>
                    <tr>
                        <th>Student ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Faculty</th>
                        <th>Year</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody id="studentsBody">
                    <!-- Data will be populated by JavaScript -->
                </tbody>
            </table>

            <div class="pagination" id="pagination"></div>
        </section>
    </main>
</div>

<footer>
    <p>&copy; 2026 Uva Wellassa University | All rights reserved.</p>
</footer>

<!-- Add/Edit Student Modal -->
<div class="modal" id="studentModal">
    <div class="modal-content">
        <div class="modal-header">
            <h2 id="modalTitle">Add New Student</h2>
            <button class="close-btn" onclick="closeModal()">&times;</button>
        </div>
        <form id="studentForm" onsubmit="saveStudent(event)">
            <input type="hidden" id="studentIndex" value="-1">
            
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
                <label>Status *</label>
                <select id="studentStatus" required>
                    <option value="Active">Active</option>
                    <option value="Inactive">Inactive</option>
                </select>
            </div>
            
            <div class="form-actions">
                <button type="button" class="btn" onclick="closeModal()">Cancel</button>
                <button type="submit" class="btn success">Save Student</button>
            </div>
        </form>
    </div>
</div>

<script>
    let students = [
        { id: 'STU2024001', name: 'Nimal Perera', email: 'nimal@university.edu', phone: '+94771234567', faculty: 'Engineering', year: '3', status: 'Active' },
        { id: 'STU2024002', name: 'Kasun Silva', email: 'kasun@university.edu', phone: '+94772345678', faculty: 'Science', year: '2', status: 'Active' },
        { id: 'STU2024003', name: 'Tharindu Jay', email: 'tharindu@university.edu', phone: '+94773456789', faculty: 'Engineering', year: '4', status: 'Active' },
        { id: 'STU2024004', name: 'Ayesha Fernando', email: 'ayesha@university.edu', phone: '+94774567890', faculty: 'Business', year: '1', status: 'Active' },
        { id: 'STU2024005', name: 'Dilshan Wickrama', email: 'dilshan@university.edu', phone: '+94775678901', faculty: 'Arts', year: '2', status: 'Inactive' },
        { id: 'STU2024006', name: 'Ishara Madushani', email: 'ishara@university.edu', phone: '+94776789012', faculty: 'Science', year: '3', status: 'Active' },
        { id: 'STU2024007', name: 'Chaminda Perera', email: 'chaminda@university.edu', phone: '+94777890123', faculty: 'Engineering', year: '1', status: 'Active' },
        { id: 'STU2024008', name: 'Ruwan Fernando', email: 'ruwan@university.edu', phone: '+94778901234', faculty: 'Business', year: '4', status: 'Active' }
    ];

    let currentPage = 1;
    const itemsPerPage = 5;
    let filteredStudents = [...students];

    function toggleMenu() {
        const menu = document.getElementById('menu');
        menu.style.display = (menu.style.display === 'none') ? 'flex' : 'none';
    }

    function renderStudents() {
        const tbody = document.getElementById('studentsBody');
        const startIndex = (currentPage - 1) * itemsPerPage;
        const endIndex = startIndex + itemsPerPage;
        const pageStudents = filteredStudents.slice(startIndex, endIndex);

        tbody.innerHTML = pageStudents.map((student, index) => `
            <tr>
                <td>${student.id}</td>
                <td>${student.name}</td>
                <td>${student.email}</td>
                <td>${student.faculty}</td>
                <td>Year ${student.year}</td>
                <td><span class="pill ${student.status.toLowerCase()}">${student.status}</span></td>
                <td>
                    <div class="actions">
                        <button class="btn-icon" onclick="viewStudent(${students.indexOf(student)})" title="View">👁️</button>
                        <button class="btn-icon" onclick="editStudent(${students.indexOf(student)})" title="Edit">✏️</button>
                        <button class="btn-icon" onclick="deleteStudent(${students.indexOf(student)})" title="Delete">🗑️</button>
                    </div>
                </td>
            </tr>
        `).join('');

        renderPagination();
    }

    function renderPagination() {
        const pagination = document.getElementById('pagination');
        const totalPages = Math.ceil(filteredStudents.length / itemsPerPage);

        let html = '<button onclick="changePage(-1)" ' + (currentPage === 1 ? 'disabled' : '') + '>Previous</button>';
        
        for (let i = 1; i <= totalPages; i++) {
            html += `<button class="${i === currentPage ? 'active' : ''}" onclick="goToPage(${i})">${i}</button>`;
        }
        
        html += '<button onclick="changePage(1)" ' + (currentPage === totalPages ? 'disabled' : '') + '>Next</button>';
        
        pagination.innerHTML = html;
    }

    function changePage(direction) {
        const totalPages = Math.ceil(filteredStudents.length / itemsPerPage);
        currentPage += direction;
        if (currentPage < 1) currentPage = 1;
        if (currentPage > totalPages) currentPage = totalPages;
        renderStudents();
    }

    function goToPage(page) {
        currentPage = page;
        renderStudents();
    }

    function filterStudents() {
        const searchTerm = document.getElementById('searchInput').value.toLowerCase();
        const yearFilter = document.getElementById('yearFilter').value;
        const facultyFilter = document.getElementById('facultyFilter').value;
        const statusFilter = document.getElementById('statusFilter').value;

        filteredStudents = students.filter(student => {
            const matchesSearch = student.name.toLowerCase().includes(searchTerm) ||
                                student.id.toLowerCase().includes(searchTerm) ||
                                student.email.toLowerCase().includes(searchTerm);
            const matchesYear = !yearFilter || student.year === yearFilter;
            const matchesFaculty = !facultyFilter || student.faculty === facultyFilter;
            const matchesStatus = !statusFilter || student.status === statusFilter;

            return matchesSearch && matchesYear && matchesFaculty && matchesStatus;
        });

        currentPage = 1;
        renderStudents();
    }

    function clearFilters() {
        document.getElementById('searchInput').value = '';
        document.getElementById('yearFilter').value = '';
        document.getElementById('facultyFilter').value = '';
        document.getElementById('statusFilter').value = '';
        filterStudents();
    }

    function openAddModal() {
        document.getElementById('modalTitle').textContent = 'Add New Student';
        document.getElementById('studentForm').reset();
        document.getElementById('studentIndex').value = '-1';
        document.getElementById('studentModal').classList.add('show');
    }

    function editStudent(index) {
        const student = students[index];
        document.getElementById('modalTitle').textContent = 'Edit Student';
        document.getElementById('studentIndex').value = index;
        document.getElementById('studentId').value = student.id;
        document.getElementById('studentName').value = student.name;
        document.getElementById('studentEmail').value = student.email;
        document.getElementById('studentPhone').value = student.phone;
        document.getElementById('studentFaculty').value = student.faculty;
        document.getElementById('studentYear').value = student.year;
        document.getElementById('studentStatus').value = student.status;
        document.getElementById('studentModal').classList.add('show');
    }

    function viewStudent(index) {
        const student = students[index];
        alert(`Student Details:\n\nID: ${student.id}\nName: ${student.name}\nEmail: ${student.email}\nPhone: ${student.phone}\nFaculty: ${student.faculty}\nYear: ${student.year}\nStatus: ${student.status}`);
    }

    function deleteStudent(index) {
        if (confirm('Are you sure you want to delete this student?')) {
            students.splice(index, 1);
            filterStudents();
        }
    }

    function closeModal() {
        document.getElementById('studentModal').classList.remove('show');
    }

    function saveStudent(event) {
        event.preventDefault();
        
        const index = parseInt(document.getElementById('studentIndex').value);
        const studentData = {
            id: document.getElementById('studentId').value,
            name: document.getElementById('studentName').value,
            email: document.getElementById('studentEmail').value,
            phone: document.getElementById('studentPhone').value,
            faculty: document.getElementById('studentFaculty').value,
            year: document.getElementById('studentYear').value,
            status: document.getElementById('studentStatus').value
        };

        if (index === -1) {
            students.push(studentData);
        } else {
            students[index] = studentData;
        }

        closeModal();
        filterStudents();
    }

    renderStudents();
</script>
</body>
</html>