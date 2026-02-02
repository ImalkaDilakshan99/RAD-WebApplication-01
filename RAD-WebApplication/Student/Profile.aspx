<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Profile - Student Dashboard</title>

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

        .card{
            background:#fff;
            border-radius:12px;
            padding:18px;
            box-shadow:0 4px 10px rgba(0,0,0,0.08);
        }
        .card h3{ font-size:18px; margin-bottom:16px; color:#003366; }

        .profile-header{
            display:flex;
            align-items:center;
            gap:20px;
            padding:20px;
            background: linear-gradient(135deg, #003366, #0b4a84);
            color:#fff;
            border-radius:12px;
            margin-bottom:16px;
        }
        .avatar-container{
            position:relative;
        }
        .avatar{
            width:100px;
            height:100px;
            border-radius:50%;
            background:#fff;
            display:flex;
            align-items:center;
            justify-content:center;
            font-size:40px;
            font-weight:bold;
            color:#003366;
            overflow:hidden;
            border:3px solid #fff;
        }
        .avatar img{
            width:100%;
            height:100%;
            object-fit:cover;
        }
        .avatar-upload-btn{
            position:absolute;
            bottom:0;
            right:0;
            width:32px;
            height:32px;
            border-radius:50%;
            background:#ffcc00;
            border:2px solid #fff;
            display:flex;
            align-items:center;
            justify-content:center;
            cursor:pointer;
            font-size:16px;
        }
        .avatar-upload-btn:hover{
            background:#ffd633;
        }
        .profile-info h2{ font-size:24px; margin-bottom:6px; }
        .profile-info p{ opacity:0.9; }
        
        .image-upload-section{
            display:flex;
            flex-direction:column;
            gap:12px;
        }
        .image-preview{
            display:flex;
            align-items:center;
            gap:16px;
        }
        .preview-avatar{
            width:80px;
            height:80px;
            border-radius:50%;
            background:#f0f0f0;
            display:flex;
            align-items:center;
            justify-content:center;
            font-size:32px;
            color:#003366;
            overflow:hidden;
            border:2px solid #ddd;
        }
        .preview-avatar img{
            width:100%;
            height:100%;
            object-fit:cover;
        }
        .file-input-wrapper{
            position:relative;
            display:inline-block;
        }
        .file-input-wrapper input[type="file"]{
            position:absolute;
            opacity:0;
            width:0;
            height:0;
        }
        .file-input-label{
            display:inline-block;
            padding:8px 16px;
            background:#003366;
            color:#fff;
            border-radius:8px;
            cursor:pointer;
            font-size:14px;
            font-weight:bold;
        }
        .file-input-label:hover{
            background:#0b4a84;
        }
        .file-name{
            font-size:13px;
            color:#666;
            margin-top:6px;
        }

        .form-grid{
            display:grid;
            grid-template-columns: 1fr 1fr;
            gap:16px;
        }
        .form-group{
            display:flex;
            flex-direction:column;
            gap:6px;
        }
        .form-group.full{ grid-column: 1 / -1; }
        .form-group label{
            font-weight:bold;
            color:#003366;
            font-size:14px;
        }
        .form-group input, .form-group textarea, .form-group select{
            padding:10px 12px;
            border:1px solid #ddd;
            border-radius:8px;
            font-size:14px;
            font-family:inherit;
        }
        .form-group textarea{ resize:vertical; min-height:80px; }

        .btn-group{
            display:flex;
            gap:10px;
            margin-top:10px;
        }
        .btn{
            border:none;
            padding:10px 20px;
            border-radius:10px;
            cursor:pointer;
            font-weight:bold;
            font-size:14px;
        }
        .btn-primary{
            background:#003366;
            color:#fff;
        }
        .btn-secondary{
            background:#e5e5e5;
            color:#333;
        }

        footer{
            background:#222;
            color:#fff;
            text-align:center;
            padding:18px 0;
        }

        @media (max-width: 980px){
            .layout{ grid-template-columns: 1fr; }
            .form-grid{ grid-template-columns: 1fr; }
            .profile-header{ flex-direction:column; text-align:center; }
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
            <a href="Results.aspx">Results</a>
            <a class="active" href="Profile.aspx">Profile</a>
            <a href="#">Logout</a>
        </nav>
    </aside>

    <main>
        <div class="profile-header">
            <div class="avatar-container">
                <div class="avatar" id="headerAvatar">JD</div>
                <label for="quickImageUpload" class="avatar-upload-btn" title="Change profile picture">📷</label>
                <input type="file" id="quickImageUpload" accept="image/*" style="display:none;" onchange="handleQuickImageUpload(event)">
            </div>
            <div class="profile-info">
                <h2>John Doe</h2>
                <p>Student ID: UWU/2022/CS/001</p>
                <p>Computer Science - Year 2</p>
            </div>
        </div>

        <div class="card">
            <h3>Profile Picture</h3>
            <div class="image-upload-section">
                <div class="image-preview">
                    <div class="preview-avatar" id="previewAvatar">JD</div>
                    <div>
                        <div class="file-input-wrapper">
                            <input type="file" id="profileImageUpload" accept="image/*" onchange="handleImageUpload(event)">
                            <label for="profileImageUpload" class="file-input-label">Choose Image</label>
                        </div>
                        <div class="file-name" id="fileName">No file chosen</div>
                        
                    </div>
                </div>
                <div class="btn-group">
                    <button type="button" class="btn btn-primary" onclick="uploadProfileImage()">Upload Image</button>
                    <button type="button" class="btn btn-secondary" onclick="removeProfileImage()">Remove Image</button>
                </div>
            </div>
        </div>

        <div class="card">
            <h3>Personal Information</h3>
            <form onsubmit="event.preventDefault(); alert('Profile Updated Successfully!');">
                <div class="form-grid">
                    <div class="form-group">
                        <label>First Name</label>
                        <input type="text" value="John" required />
                    </div>
                    <div class="form-group">
                        <label>Last Name</label>
                        <input type="text" value="Doe" required />
                    </div>
                    <div class="form-group">
                        <label>Email</label>
                        <input type="email" value="john.doe@uwu.ac.lk" required />
                    </div>
                    <div class="form-group">
                        <label>Phone Number</label>
                        <input type="tel" value="+94 71 234 5678" required />
                    </div>
                    <div class="form-group">
                        <label>Date of Birth</label>
                        <input type="date" value="2002-05-15" required />
                    </div>
                    <div class="form-group">
                        <label>Gender</label>
                        <select required>
                            <option>Male</option>
                            <option>Female</option>
                            <option>Other</option>
                        </select>
                    </div>
                    <div class="form-group full">
                        <label>Address</label>
                        <textarea required>123, Main Street, Colombo 07, Sri Lanka</textarea>
                    </div>
                </div>
                <div class="btn-group">
                    <button type="submit" class="btn btn-primary">Save Changes</button>
                    <button type="button" class="btn btn-secondary" onclick="alert('Changes Cancelled')">Cancel</button>
                </div>
            </form>
        </div>

        <div class="card">
            <h3>Academic Information</h3>
            <div class="form-grid">
                <div class="form-group">
                    <label>Student ID</label>
                    <input type="text" value="UWU/2022/CS/001" readonly style="background:#f5f5f5;" />
                </div>
                <div class="form-group">
                    <label>Program</label>
                    <input type="text" value="Computer Science" readonly style="background:#f5f5f5;" />
                </div>
                <div class="form-group">
                    <label>Year</label>
                    <input type="text" value="Year 2" readonly style="background:#f5f5f5;" />
                </div>
                <div class="form-group">
                    <label>GPA</label>
                    <input type="text" value="3.68" readonly style="background:#f5f5f5;" />
                </div>
            </div>
        </div>

        <div class="card">
            <h3>Change Password</h3>
            <form onsubmit="event.preventDefault(); alert('Password Changed Successfully!');">
                <div class="form-grid">
                    <div class="form-group full">
                        <label>Current Password</label>
                        <input type="password" required />
                    </div>
                    <div class="form-group">
                        <label>New Password</label>
                        <input type="password" required />
                    </div>
                    <div class="form-group">
                        <label>Confirm New Password</label>
                        <input type="password" required />
                    </div>
                </div>
                <div class="btn-group">
                    <button type="submit" class="btn btn-primary">Update Password</button>
                </div>
            </form>
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

    let selectedImage = null;

    function handleImageUpload(event) {
        const file = event.target.files[0];
        if (file) {
            // Check file size (5MB limit)
            if (file.size > 5 * 1024 * 1024) {
                alert('File size exceeds 5MB. Please choose a smaller image.');
                return;
            }

            // Check file type
            if (!file.type.match('image.*')) {
                alert('Please select an image file (JPG, PNG, or GIF).');
                return;
            }

            // Update file name display
            document.getElementById('fileName').textContent = file.name;

            // Preview the image
            const reader = new FileReader();
            reader.onload = function (e) {
                selectedImage = e.target.result;
                const previewAvatar = document.getElementById('previewAvatar');
                previewAvatar.innerHTML = `<img src="${e.target.result}" alt="Preview">`;
            };
            reader.readAsDataURL(file);
        }
    }

    function handleQuickImageUpload(event) {
        const file = event.target.files[0];
        if (file) {
            // Check file size
            if (file.size > 5 * 1024 * 1024) {
                alert('File size exceeds 5MB. Please choose a smaller image.');
                return;
            }

            if (!file.type.match('image.*')) {
                alert('Please select an image file.');
                return;
            }

            const reader = new FileReader();
            reader.onload = function (e) {
                // Update all avatar displays
                const headerAvatar = document.getElementById('headerAvatar');
                const previewAvatar = document.getElementById('previewAvatar');

                headerAvatar.innerHTML = `<img src="${e.target.result}" alt="Profile">`;
                previewAvatar.innerHTML = `<img src="${e.target.result}" alt="Profile">`;

                selectedImage = e.target.result;
                document.getElementById('fileName').textContent = file.name;

                alert('Profile picture updated successfully!');
            };
            reader.readAsDataURL(file);
        }
    }

    function uploadProfileImage() {
        if (!selectedImage) {
            alert('Please select an image first.');
            return;
        }

        // Update header avatar
        const headerAvatar = document.getElementById('headerAvatar');
        headerAvatar.innerHTML = `<img src="${selectedImage}" alt="Profile">`;

        alert('Profile picture uploaded successfully!');
    }

    function removeProfileImage() {
        if (confirm('Are you sure you want to remove your profile picture?')) {
            // Reset to initials
            const headerAvatar = document.getElementById('headerAvatar');
            const previewAvatar = document.getElementById('previewAvatar');

            headerAvatar.innerHTML = 'JD';
            previewAvatar.innerHTML = 'JD';

            // Clear file input
            document.getElementById('profileImageUpload').value = '';
            document.getElementById('quickImageUpload').value = '';
            document.getElementById('fileName').textContent = 'No file chosen';

            selectedImage = null;

            alert('Profile picture removed successfully!');
        }
    }
</script>
</body>
</html>