<%@ page import="java.util.List, com.task.tracker.model.Task" %>
<html>
<head>
    <title>Task Tracker</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Courier+Prime:ital,wght@0,400;0,700;1,400&family=Libre+Barcode+39&family=Oswald:wght@300;500&display=swap');
        * { box-sizing: border-box; }
        body {
            background-color: #1a3a5a;
            background-image: linear-gradient(rgba(234,226,202,0.1) 1px, transparent 1px), linear-gradient(90deg, rgba(234,226,202,0.1) 1px, transparent 1px);
            background-size: 30px 30px;
            color: #eae2ca;
            font-family: 'Courier Prime', monospace;
            padding: 60px 20px;
            display: flex; flex-direction: column; align-items: center;
        }
        .container {
            width: 100%; max-width: 1100px; padding: 60px;
            border: 1px solid #eae2ca; background-color: #1a3a5a;
            box-shadow: 0 0 0 15px #1a3a5a, 0 0 0 16px #eae2ca, 0 30px 100px rgba(0,0,0,0.5);
            position: relative;
        }
        header { display: flex; justify-content: space-between; align-items: center; border-bottom: 2px solid #eae2ca; margin-bottom: 30px; padding-bottom: 20px; }
        h2 { font-family: 'Oswald', sans-serif; text-transform: uppercase; letter-spacing: 8px; margin: 0; font-size: 2.2rem; }
        .btn-add, .btn-cat {
            text-decoration: none; color: #eae2ca; border: 1px solid #eae2ca; padding: 8px 15px;
            font-family: 'Oswald', sans-serif; text-transform: uppercase; font-size: 0.8rem; margin-left: 10px;
        }
        .btn-add:hover, .btn-cat:hover { background: #eae2ca; color: #1a3a5a; }
        table { width: 100%; border-collapse: collapse; table-layout: fixed; }
        th { font-family: 'Oswald', sans-serif; text-transform: uppercase; border-bottom: 2px solid #eae2ca; padding: 10px 5px; text-align: left; }
        td { padding: 15px 5px; border-bottom: 1px solid rgba(234, 226, 202, 0.1); white-space: nowrap; overflow: hidden; text-overflow: ellipsis; }

        /* THE SPACING REFACTOR */
        th:nth-child(1), td:nth-child(1) { width: 45px; color: #c5a059; } /* ID: Tiny */
        th:nth-child(2), td:nth-child(2) { width: 20%; } /* Title: Standard */
        th:nth-child(3), td:nth-child(3) { width: 40%; padding-left: 50px; border-left: 1px dashed rgba(234,226,202,0.2); } /* Description: THE GAP */
        th:nth-child(4), td:nth-child(4) { width: 10%; } /* Category */
        th:nth-child(5), td:nth-child(5) { width: 10%; } /* Status */
        th:nth-child(6), td:nth-child(6) { width: 15%; text-align: right; } /* Actions */

        a { color: #c5a059; text-decoration: none; font-weight: bold; }
        tr.completed td { opacity: 0.4; font-style: italic; }
    </style>
</head>
<body>
<div class="container">
    <header>
        <h2>Task Tracker</h2>
        <div>
            <a href="categories" class="btn-cat">Categories</a>
            <a href="tasks?action=add" class="btn-add">New Task +</a>
        </div>
    </header>
    <table>
        <thead>
        <tr><th>Id</th><th>Title</th><th>Description</th><th>Cat</th><th>Stat</th><th>Actions</th></tr>
        </thead>
        <tbody>
        <%
            List<Task> tasks = (List<Task>) request.getAttribute("tasks");
            if(tasks != null){
                for(Task t:tasks){
        %>
        <tr class="<%= t.isCompleted() ? "completed" : "" %>">
            <td><%=t.getId()%></td>
            <td><%=t.getTitle()%></td>
            <td><%=t.getDescription()%></td>
            <td><%= t.getCategory() != null ? t.getCategory().getName() : "-" %></td>
            <td><%= t.isCompleted() ? "Done" : "Pending" %> <a href="tasks?action=toggleCompletion&id=<%= t.getId() %>" style="font-size: 0.6rem;">[T]</a></td>
            <td>
                <a href="tasks?action=edit&id=<%= t.getId() %>">Edit</a> |
                <a href="tasks?action=delete&id=<%= t.getId() %>" onclick="return confirm('Archive entry?')">Del</a>
            </td>
        </tr>
        <% } } %>
        </tbody>
    </table>
</div>
</body>
</html>