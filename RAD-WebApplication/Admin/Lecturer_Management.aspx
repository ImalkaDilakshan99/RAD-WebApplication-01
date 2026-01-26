<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Lecturers Management</title>

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
        .pill.senior{ background:#fff7df; color:#8a5b00; }
        .pill.junior{ background:#e7f1ff; color:#003366; }

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
            max-width:600px; width:90%; max-height:90vh; overflow-y:auto;
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

        .courses-list{ margin-top:10px; }
        .course-tag{
            display:inline-block; padding:6px 12px; margin:4px;
            background:#e7f1ff; color:#003366; border-radius:999px;
            font-size:12px; font-weight:bold;
        }

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
            <a href="Students_Management.aspx">Students</a>
            <a class="active" href="#">Lecturers</a>
            <a href="#">Courses</a>
            <a href="#">Enrollments</a>
            <a href="#">Reports</a>
            <a href="#">Settings</a>
            <a href="#">Logout</a>
        </nav>
    </aside>

    <main>
        <section class="topbar">
            <h2 class="page-title">Lecturers Management</h2>
            <div class="search">
                <span style="font-weight:bold; color:#003366;">🔍</span>
                <input type="text" id="searchInput" placeholder="Search by name, ID, email..." onkeyup="filterLecturers()" />
            </div>
            <button class="btn yellow" type="button" onclick="openAddModal()">+ Add Lecturer</button>
        </section>

        <section class="filters">
            <div class="filter-group">
                <label>Department</label>
                <select id="departmentFilter" onchange="filterLecturers()">
                    <option value="">All Departments</option>
                    <option value="Computer Science">Computer Science</option>
                    <option value="Mathematics">Mathematics</option>
                    <option value="Physics">Physics</option>
                    <option value="Business">Business</option>
                    <option value="Languages">Languages</option>
                </select>
            </div>
            <div class="filter-group">
                <label>Rank</label>
                <select id="rankFilter" onchange="filterLecturers()">
                    <option value="">All Ranks</option>
                    <option value="Professor">Professor</option>
                    <option value="Associate Professor">Associate Professor</option>
                    <option value="Senior Lecturer">Senior Lecturer</option>
                    <option value="Lecturer">Lecturer</option>
                    <option value="Assistant Lecturer">Assistant Lecturer</option>
                </select>
            </div>
            <div class="filter-group">
                <label>Status</label>
                <select id="statusFilter" onchange="filterLecturers()">
                    <option value="">All Status</option>
                    <option value="Active">Active</option>
                    <option value="Inactive">Inactive</option>
                </select>
            </div>
            <button class="btn primary" onclick="clearFilters()" style="align-self:flex-end;">Clear Filters</button>
        </section>

        <section class="panel">
            <table id="lecturersTable">
                <thead>
                    <tr>
                        <th>Lecturer ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Department</th>
                        <th>Rank</th>
                        <th>Courses</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody id="lecturersBody">
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

<!-- Add/Edit Lecturer Modal -->
<div class="modal" id="lecturerModal">
    <div class="modal-content">
        <div class="modal-header">
            <h2 id="modalTitle">Add New Lecturer</h2>
            <button class="close-btn" onclick="closeModal()">&times;</button>
        </div>
        <form id="lecturerForm" onsubmit="saveLecturer(event)">
            <input type="hidden" id="lecturerIndex" value="-1">
            
            <div class="form-group">
                <label>Lecturer ID *</label>
                <input type="text" id="lecturerId" required placeholder="e.g., LEC2026001">
            </div>
            
            <div class="form-group">
                <label>Full Name *</label>
                <input type="text" id="lecturerName" required placeholder="e.g., Dr. John Smith">
            </div>
            
            <div class="form-group">
                <label>Email *</label>
                <input type="email" id="lecturerEmail" required placeholder="e.g., john.smith@university.edu">
            </div>
            
            <div class="form-group">
                <label>Phone</label>
                <input type="tel" id="lecturerPhone" placeholder="e.g., +94771234567">
            </div>
            
            <div class="form-group">
                <label>Department *</label>
                <select id="lecturerDepartment" required>
                    <option value="">Select Department</option>
                    <option value="Computer Science">Computer Science</option>
                    <option value="Mathematics">Mathematics</option>
                    <option value="Physics">Physics</option>
                    <option value="Business">Business</option>
                    <option value="Languages">Languages</option>
                </select>
            </div>
            
            <div class="form-group">
                <label>Rank *</label>
                <select id="lecturerRank" required>
                    <option value="">Select Rank</option>
                    <option value="Professor">Professor</option>
                    <option value="Associate Professor">Associate Professor</option>
                    <option value="Senior Lecturer">Senior Lecturer</option>
                    <option value="Lecturer">Lecturer</option>
                    <option value="Assistant Lecturer">Assistant Lecturer</option>
                </select>
            </div>

            <div class="form-group">
                <label>Qualifications</label>
                <input type="text" id="lecturerQualifications" placeholder="e.g., PhD Computer Science, MSc, BSc">
            </div>
            
            <div class="form-group">
                <label>Assigned Courses (comma-separated)</label>
                <input type="text" id="lecturerCourses" placeholder="e.g., Web Development, Database Systems">
            </div>
            
            <div class="form-group">
                <label>Status *</label>
                <select id="lecturerStatus" required>
                    <option value="Active">Active</option>
                    <option value="Inactive">Inactive</option>
                </select>
            </div>
            
            <div class="form-actions">
                <button type="button" class="btn" onclick="closeModal()">Cancel</button>
                <button type="submit" class="btn success">Save Lecturer</button>
            </div>
        </form>
    </div>
</div>

<script>
    let lecturers = [
        { id: 'LEC2024001', name: 'Dr. Saman Kumara', email: 'saman.k@university.edu', phone: '+94711234567', department: 'Computer Science', rank: 'Senior Lecturer', qualifications: 'PhD CS, MSc CS', courses: ['Web Development', 'Software Engineering'], status: 'Active' },
        { id: 'LEC2024002', name: 'Prof. Nirmala Perera', email: 'nirmala.p@university.edu', phone: '+94712345678', department: 'Mathematics', rank: 'Professor', qualifications: 'PhD Mathematics', courses: ['Calculus', 'Linear Algebra'], status: 'Active' },
        { id: 'LEC2024003', name: 'Dr. Jayantha Silva', email: 'jayantha.s@university.edu', phone: '+94713456789', department: 'Computer Science', rank: 'Lecturer', qualifications: 'PhD IT, MSc CS', courses: ['Database Systems', 'Network Security'], status: 'Active' },
        { id: 'LEC2024004', name: 'Ms. Chandani Fernando', email: 'chandani.f@university.edu', phone: '+94714567890', department: 'Business', rank: 'Assistant Lecturer', qualifications: 'MBA, BSc Business', courses: ['Business Analytics', 'Marketing'], status: 'Active' },
        { id: 'LEC2024005', name: 'Dr. Rohan Wickramasinghe', email: 'rohan.w@university.edu', phone: '+94715678901', department: 'Physics', rank: 'Senior Lecturer', qualifications: 'PhD Physics', courses: ['Quantum Physics', 'Thermodynamics'], status: 'Inactive' },
        { id: 'LEC2024006', name: 'Prof. Anura Gunasekara', email: 'anura.g@university.edu', phone: '+94716789012', department: 'Languages', rank: 'Associate Professor', qualifications: 'PhD Linguistics', courses: ['English Literature', 'Communication'], status: 'Active' }
    ];

    let currentPage = 1;
    const itemsPerPage = 5;
    let filteredLecturers = [...lecturers];

    function toggleMenu() {
        const menu = document.getElementById('menu');
        menu.style.display = (menu.style.display === 'none') ? 'flex' : 'none';
    }

    function renderLecturers() {
        const tbody = document.getElementById('lecturersBody');
        const startIndex = (currentPage - 1) * itemsPerPage;
        const endIndex = startIndex + itemsPerPage;
        const pageLecturers = filteredLecturers.slice(startIndex, endIndex);

        tbody.innerHTML = pageLecturers.map((lecturer, index) => `
            <tr>
                <td>${lecturer.id}</td>
                <td>${lecturer.name}</td>
                <td>${lecturer.email}</td>
                <td>${lecturer.department}</td>
                <td><span class="pill ${lecturer.rank.includes('Professor') ? 'senior' : 'junior'}">${lecturer.rank}</span></td>
                <td><span style="font-size:12px;">${lecturer.courses.length} course(s)</span></td>
                <td><span class="pill ${lecturer.status.toLowerCase()}">${lecturer.status}</span></td>
                <td>
                    <div class="actions">
                        <button class="btn-icon" onclick="viewLecturer(${lecturers.indexOf(lecturer)})" title="View">👁️</button>
                        <button class="btn-icon" onclick="editLecturer(${lecturers.indexOf(lecturer)})" title="Edit">✏️</button>
                        <button class="btn-icon" onclick="deleteLecturer(${lecturers.indexOf(lecturer)})" title="Delete">🗑️</button>
                    </div>
                </td>
            </tr>
        `).join('');

        renderPagination();
    }

    function renderPagination() {
        const pagination = document.getElementById('pagination');
        const totalPages = Math.ceil(filteredLecturers.length / itemsPerPage);

        let html = '<button onclick="changePage(-1)" ' + (currentPage === 1 ? 'disabled' : '') + '>Previous</button>';
        
        for (let i = 1; i <= totalPages; i++) {
            html += `<button class="${i === currentPage ? 'active' : ''}" onclick="goToPage(${i})">${i}</button>`;
        }
        
        html += '<button onclick="changePage(1)" ' + (currentPage === totalPages ? 'disabled' : '') + '>Next</button>';
        
        pagination.innerHTML = html;
    }

    function changePage(direction) {
        const totalPages = Math.ceil(filteredLecturers.length / itemsPerPage);
        currentPage += direction;
        if (currentPage < 1) currentPage = 1;
        if (currentPage > totalPages) currentPage = totalPages;
        renderLecturers();
    }

    function goToPage(page) {
        currentPage = page;
        renderLecturers();
    }

    function filterLecturers() {
        const searchTerm = document.getElementById('searchInput').value.toLowerCase();
        const departmentFilter = document.getElementById('departmentFilter').value;
        const rankFilter = document.getElementById('rankFilter').value;
        const statusFilter = document.getElementById('statusFilter').value;

        filteredLecturers = lecturers.filter(lecturer => {
            const matchesSearch = lecturer.name.toLowerCase().includes(searchTerm) ||
                                lecturer.id.toLowerCase().includes(searchTerm) ||
                                lecturer.email.toLowerCase().includes(searchTerm);
            const matchesDepartment = !departmentFilter || lecturer.department === departmentFilter;
            const matchesRank = !rankFilter || lecturer.rank === rankFilter;
            const matchesStatus = !statusFilter || lecturer.status === statusFilter;

            return matchesSearch && matchesDepartment && matchesRank && matchesStatus;
        });

        currentPage = 1;
        renderLecturers();
    }

    function clearFilters() {
        document.getElementById('searchInput').value = '';
        document.getElementById('departmentFilter').value = '';
        document.getElementById('rankFilter').value = '';
        document.getElementById('statusFilter').value = '';
        filterLecturers();
    }

    function openAddModal() {
        document.getElementById('modalTitle').textContent = 'Add New Lecturer';
        document.getElementById('lecturerForm').reset();
        document.getElementById('lecturerIndex').value = '-1';
        document.getElementById('lecturerModal').classList.add('show');
    }

    function editLecturer(index) {
        const lecturer = lecturers[index];
        document.getElementById('modalTitle').textContent = 'Edit Lecturer';
        document.getElementById('lecturerIndex').value = index;
        document.getElementById('lecturerId').value = lecturer.id;
        document.getElementById('lecturerName').value = lecturer.name;
        document.getElementById('lecturerEmail').value = lecturer.email;
        document.getElementById('lecturerPhone').value = lecturer.phone;
        document.getElementById('lecturerDepartment').value = lecturer.department;
        document.getElementById('lecturerRank').value = lecturer.rank;
        document.getElementById('lecturerQualifications').value = lecturer.qualifications;
        document.getElementById('lecturerCourses').value = lecturer.courses.join(', ');
        document.getElementById('lecturerStatus').value = lecturer.status;
        document.getElementById('lecturerModal').classList.add('show');
    }

    function viewLecturer(index) {
        const lecturer = lecturers[index];
        const coursesHtml = lecturer.courses.map(c => `<span class="course-tag">${c}</span>`).join('');
        alert(`Lecturer Details:\n\nID: ${lecturer.id}\nName: ${lecturer.name}\nEmail: ${lecturer.email}\nPhone: ${lecturer.phone}\nDepartment: ${lecturer.department}\nRank: ${lecturer.rank}\nQualifications: ${lecturer.qualifications}\nCourses: ${lecturer.courses.join(', ')}\nStatus: ${lecturer.status}`);
    }

    function deleteLecturer(index) {
        if (confirm('Are you sure you want to delete this lecturer?')) {
            lecturers.splice(index, 1);
            filterLecturers();
        }
    }

    function closeModal() {
        document.getElementById('lecturerModal').classList.remove('show');
    }

    function saveLecturer(event) {
        event.preventDefault();
        
        const index = parseInt(document.getElementById('lecturerIndex').value);
        const coursesInput = document.getElementById('lecturerCourses').value;
        const coursesArray = coursesInput ? coursesInput.split(',').map(c => c.trim()) : [];
        
        const lecturerData = {
            id: document.getElementById('lecturerId').value,
            name: document.getElementById('lecturerName').value,
            email: document.getElementById('lecturerEmail').value,
            phone: document.getElementById('lecturerPhone').value,
            department: document.getElementById('lecturerDepartment').value,
            rank: document.getElementById('lecturerRank').value,
            qualifications: document.getElementById('lecturerQualifications').value,
            courses: coursesArray,
            status: document.getElementById('lecturerStatus').value
        };

        if (index === -1) {
            lecturers.push(lecturerData);
        } else {
            lecturers[index] = lecturerData;
        }

        closeModal();
        filterLecturers();
    }

    renderLecturers();
</script>
</body>
</html>