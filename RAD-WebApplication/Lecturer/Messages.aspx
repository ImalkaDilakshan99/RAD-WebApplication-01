<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Messages - Lecturer Dashboard</title>

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

        .messages-layout{
            display:grid; grid-template-columns:1fr 2fr; gap:14px;
            background:#fff;
            border-radius:12px;
            box-shadow:0 4px 10px rgba(0,0,0,0.08);
            overflow:hidden;
            height:600px;
        }

        .message-list{
            border-right:1px solid #e8e8e8;
            overflow-y:auto;
        }
        .message-list-header{
            padding:14px;
            background:#f8f9fa;
            border-bottom:1px solid #e8e8e8;
        }
        .message-list-header input{
            width:100%;
            padding:8px 12px;
            border:1px solid #ddd;
            border-radius:8px;
            font-size:14px;
        }

        .message-item{
            padding:14px;
            border-bottom:1px solid #e8e8e8;
            cursor:pointer;
            transition:0.2s;
        }
        .message-item:hover{ background:#f8f9fa; }
        .message-item.active{ background:#e7f1ff; }
        .message-item.unread{ background:#f0f6ff; }

        .msg-sender{
            display:flex; align-items:center; gap:10px; margin-bottom:6px;
        }
        .msg-avatar{
            width:40px; height:40px; border-radius:50%; background:#003366;
            color:#fff; display:flex; align-items:center; justify-content:center;
            font-weight:bold; font-size:14px; flex-shrink:0;
        }
        .msg-info{ flex:1; min-width:0; }
        .msg-name{ font-weight:bold; color:#003366; font-size:14px; }
        .msg-time{ font-size:12px; color:#999; }
        .msg-subject{ font-size:13px; color:#666; margin-top:4px; white-space:nowrap; overflow:hidden; text-overflow:ellipsis; }

        .unread-badge{
            width:8px; height:8px; background:#dc3545; border-radius:50%;
        }

        .conversation-area{
            display:flex; flex-direction:column;
        }
        .conversation-header{
            padding:14px 18px;
            background:#f8f9fa;
            border-bottom:1px solid #e8e8e8;
            display:flex; align-items:center; gap:12px;
        }
        .conversation-header .msg-avatar{ width:44px; height:44px; }
        .conv-info h3{ color:#003366; font-size:16px; }
        .conv-info p{ font-size:13px; color:#666; }

        .messages-container{
            flex:1;
            padding:18px;
            overflow-y:auto;
            display:flex;
            flex-direction:column;
            gap:14px;
        }

        .message-bubble{
            max-width:75%;
            padding:12px 14px;
            border-radius:12px;
            font-size:14px;
            line-height:1.5;
        }
        .message-received{
            align-self:flex-start;
            background:#f0f6ff;
            color:#222;
        }
        .message-sent{
            align-self:flex-end;
            background:#003366;
            color:#fff;
        }
        .message-time{
            font-size:11px;
            opacity:0.7;
            margin-top:4px;
        }

        .compose-area{
            padding:14px 18px;
            background:#f8f9fa;
            border-top:1px solid #e8e8e8;
        }
        .compose-form{
            display:flex;
            gap:10px;
            align-items:center;
        }
        .compose-form textarea{
            flex:1;
            padding:10px 12px;
            border:1px solid #ddd;
            border-radius:8px;
            font-size:14px;
            font-family:inherit;
            resize:none;
            min-height:44px;
        }
        .compose-form button{
            background:#003366;
            color:#fff;
            border:none;
            padding:10px 18px;
            border-radius:8px;
            cursor:pointer;
            font-weight:bold;
        }

        .empty-state{
            display:flex;
            flex-direction:column;
            align-items:center;
            justify-content:center;
            height:100%;
            color:#999;
        }
        .empty-state-icon{ font-size:48px; margin-bottom:12px; }

        footer{ background:#222; color:#fff; text-align:center; padding:18px 0; margin-top:40px; }

        @media (max-width: 980px){
            .layout{ grid-template-columns: 1fr; }
            .messages-layout{ grid-template-columns: 1fr; height:auto; }
            .message-list{ border-right:none; border-bottom:1px solid #e8e8e8; max-height:300px; }
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
            <a href="Marks.aspx">Marks / Results</a>
            <a class="active" href="messages.html">Messages</a>
            <a href="#">Logout</a>
        </nav>
    </aside>

    <main>
        <section class="page-header">
            <h2>Messages</h2>
            <button class="btn" type="button" onclick="composeNew()">✉️ Compose New</button>
        </section>

        <div class="messages-layout">
            <div class="message-list">
                <div class="message-list-header">
                    <input type="text" placeholder="Search messages..." />
                </div>

                <div class="message-item unread active" onclick="openConversation(this, 'anura')">
                    <div class="msg-sender">
                        <span class="msg-avatar">AJ</span>
                        <div class="msg-info">
                            <div style="display:flex; justify-content:space-between; align-items:center;">
                                <span class="msg-name">Anura Jayasinghe</span>
                                <span class="msg-time">10:30 AM</span>
                            </div>
                            <div class="msg-subject">Assignment 03 - Clarification needed</div>
                        </div>
                        <span class="unread-badge"></span>
                    </div>
                </div>

                <div class="message-item" onclick="openConversation(this, 'samanthi')">
                    <div class="msg-sender">
                        <span class="msg-avatar">SP</span>
                        <div class="msg-info">
                            <div style="display:flex; justify-content:space-between; align-items:center;">
                                <span class="msg-name">Samanthi Perera</span>
                                <span class="msg-time">Yesterday</span>
                            </div>
                            <div class="msg-subject">Thank you for the feedback!</div>
                        </div>
                    </div>
                </div>

                <div class="message-item unread" onclick="openConversation(this, 'kasun')">
                    <div class="msg-sender">
                        <span class="msg-avatar">KF</span>
                        <div class="msg-info">
                            <div style="display:flex; justify-content:space-between; align-items:center;">
                                <span class="msg-name">Kasun Fernando</span>
                                <span class="msg-time">Jan 27</span>
                            </div>
                            <div class="msg-subject">Extension request for Assignment 04</div>
                        </div>
                        <span class="unread-badge"></span>
                    </div>
                </div>

                <div class="message-item" onclick="openConversation(this, 'nilmini')">
                    <div class="msg-sender">
                        <span class="msg-avatar">NW</span>
                        <div class="msg-info">
                            <div style="display:flex; justify-content:space-between; align-items:center;">
                                <span class="msg-name">Nilmini Wickramasinghe</span>
                                <span class="msg-time">Jan 26</span>
                            </div>
                            <div class="msg-subject">Question about lecture slides</div>
                        </div>
                    </div>
                </div>

                <div class="message-item" onclick="openConversation(this, 'ravindu')">
                    <div class="msg-sender">
                        <span class="msg-avatar">RD</span>
                        <div class="msg-info">
                            <div style="display:flex; justify-content:space-between; align-items:center;">
                                <span class="msg-name">Ravindu Dissanayake</span>
                                <span class="msg-time">Jan 25</span>
                            </div>
                            <div class="msg-subject">Database Systems - Query help</div>
                        </div>
                    </div>
                </div>

                <div class="message-item" onclick="openConversation(this, 'tharushi')">
                    <div class="msg-sender">
                        <span class="msg-avatar">TR</span>
                        <div class="msg-info">
                            <div style="display:flex; justify-content:space-between; align-items:center;">
                                <span class="msg-name">Tharushi Rathnayake</span>
                                <span class="msg-time">Jan 24</span>
                            </div>
                            <div class="msg-subject">Meeting request</div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="conversation-area">
                <div class="conversation-header">
                    <span class="msg-avatar">AJ</span>
                    <div class="conv-info">
                        <h3>Anura Jayasinghe</h3>
                        <p>UWU/CSC/20/001 | Web Development</p>
                    </div>
                </div>

                <div class="messages-container" id="messagesContainer">
                    <div class="message-bubble message-received">
                        <div>Good morning Dr. Silva,</div>
                        <div style="margin-top:8px;">I have a question regarding Assignment 03. For the REST API development, should we implement authentication using JWT tokens or session-based authentication?</div>
                        <div class="message-time">Today, 10:30 AM</div>
                    </div>

                    <div class="message-bubble message-sent">
                        <div>Good morning Anura,</div>
                        <div style="margin-top:8px;">You can use either JWT or session-based authentication. Choose whichever you're more comfortable with. JWT is more modern and stateless, while sessions are simpler to implement. Both are acceptable for this assignment.</div>
                        <div class="message-time">Today, 10:35 AM</div>
                    </div>

                    <div class="message-bubble message-received">
                        <div>Thank you for the clarification! I'll proceed with JWT tokens then.</div>
                        <div class="message-time">Today, 10:37 AM</div>
                    </div>
                </div>

                <div class="compose-area">
                    <form class="compose-form" onsubmit="sendMessage(event)">
                        <textarea placeholder="Type your message..." id="messageInput" rows="1"></textarea>
                        <button type="submit">Send</button>
                    </form>
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

    function openConversation(element, userId) {
        // Remove active class from all items
        const items = document.querySelectorAll('.message-item');
        items.forEach(item => item.classList.remove('active'));
        
        // Add active class to clicked item
        element.classList.add('active');
        
        // Remove unread badge
        element.classList.remove('unread');
        const badge = element.querySelector('.unread-badge');
        if (badge) badge.remove();

        // Load conversation (in a real app, this would fetch from server)
        alert('Loading conversation with: ' + userId);
    }

    function composeNew() {
        alert('Opening new message compose window...');
    }

    function sendMessage(event) {
        event.preventDefault();
        
        const input = document.getElementById('messageInput');
        const message = input.value.trim();
        
        if (message) {
            const container = document.getElementById('messagesContainer');
            
            const bubble = document.createElement('div');
            bubble.className = 'message-bubble message-sent';
            bubble.innerHTML = `
                <div>${message}</div>
                <div class="message-time">Just now</div>
            `;
            
            container.appendChild(bubble);
            container.scrollTop = container.scrollHeight;
            
            input.value = '';
        }
    }

    // Auto-resize textarea
    document.getElementById('messageInput').addEventListener('input', function() {
        this.style.height = 'auto';
        this.style.height = (this.scrollHeight) + 'px';
    });
</script>
</body>
</html>