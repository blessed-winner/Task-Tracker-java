<%@ page import="com.task.tracker.model.Task, com.task.tracker.model.Category, java.util.List" %>
<html>
<head>
    <title>Edit Task</title>
    <%-- CSS is the same for add.jsp and edit.jsp --%>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Courier+Prime&family=Libre+Barcode+39&family=Oswald:wght@300&display=swap');
        * { box-sizing: border-box; }
        body { background-color: #1a3a5a; color: #eae2ca; font-family: 'Courier Prime'; padding: 60px; display: flex; flex-direction: column; align-items: center; }
        .form-box, .card {
            width: 100%; max-width: 700px; padding: 50px; background: #1a3a5a; border: 1px solid #eae2ca;
            box-shadow: 0 0 0 10px #1a3a5a, 0 0 0 11px #eae2ca;
        }
        h2 { font-family: 'Oswald'; text-transform: uppercase; letter-spacing: 5px; border-bottom: 1px solid #eae2ca; padding-bottom: 10px; }
        .field { margin-bottom: 20px; }
        label { display: block; font-size: 0.7rem; text-transform: uppercase; margin-bottom: 5px; color: #c5a059; }
        input[type="text"], textarea, select {
            width: 100%; background: rgba(255,255,255,0.05); border: 1px solid rgba(234,226,202,0.2);
            color: #eae2ca; padding: 12px; font-family: 'Courier Prime';
        }
        button { background: transparent; color: #eae2ca; border: 1px solid #eae2ca; padding: 10px 25px; font-family: 'Oswald'; cursor: pointer; text-transform: uppercase; }
        button:hover { background: #eae2ca; color: #1a3a5a; }
        .back { display: block; margin-top: 30px; text-align: center; color: #eae2ca; text-decoration: none; font-family: 'Libre Barcode 39'; font-size: 2.5rem; opacity: 0.6; }
    </style>
</head>
<body>
<%
    Task t = (Task) request.getAttribute("task");
    List<Category> categories = (List<Category>) request.getAttribute("categories");
%>
    <div class="card">
        <h2>Edit Task</h2>
        <form action="tasks" method="post">
            <input type="hidden" name="id" value="<%= t.getId() %>">
            <div class="field">
                <label for="title">Title</label>
                <input type="text" id="title" name="title" value="<%= t.getTitle() %>" required>
            </div>
            <div class="field">
                <label for="description">Description</label>
                <textarea id="description" name="description" rows="3"><%= t.getDescription() %></textarea>
            </div>
            <div class="field">
                <label for="categoryId">Category</label>
                <select id="categoryId" name="categoryId">
                    <option value="">-- No Category --</option>
                    <%
                        if (categories != null) {
                            for (Category c : categories) {
                                boolean isSelected = t.getCategory() != null && t.getCategory().getId().equals(c.getId());
                    %>
                    <option value="<%= c.getId() %>" <%= isSelected ? "selected" : "" %>><%= c.getName() %></option>
                    <%
                            }
                        }
                    %>
                </select>
            </div>
            <div class="field">
                <label>
                    <input type="checkbox" name="completed" value="true" <%= t.isCompleted() ? "checked" : "" %>> Mark as Completed
                </label>
            </div>
            <button type="submit" class="update-btn">Save Changes</button>
        </form>
        <a href="tasks" class="back">Discard Changes</a>
    </div>
</body>
</html>
