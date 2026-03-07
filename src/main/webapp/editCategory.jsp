<%@ page import="com.task.tracker.model.Category" %>
<html>
<head>
    <title>Edit Category</title>
    <%-- Add/Edit Category Styling --%>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Courier+Prime&family=Libre+Barcode+39&family=Oswald:wght@300&display=swap');
        body { background-color: #1a3a5a; color: #eae2ca; font-family: 'Courier Prime'; padding: 60px; display: flex; flex-direction: column; align-items: center; }
        .form-box { width: 100%; max-width: 500px; padding: 40px; border: 1px solid #eae2ca; box-shadow: 0 0 0 10px #1a3a5a, 0 0 0 11px #eae2ca; }
        h2 { font-family: 'Oswald'; text-transform: uppercase; letter-spacing: 4px; border-bottom: 1px solid #eae2ca; }
        input[type="text"] { width: 100%; background: rgba(255,255,255,0.05); border: 1px solid rgba(234,226,202,0.2); color: #eae2ca; padding: 10px; }
        button { margin-top: 20px; background: transparent; color: #eae2ca; border: 1px solid #eae2ca; padding: 10px; font-family: 'Oswald'; cursor: pointer; width: 100%; }
        .back { display: block; margin-top: 20px; text-align: center; color: #c5a059; text-decoration: none; font-size: 0.8rem; font-weight: bold; }
    </style>
</head>
<body>
<% Category c = (Category) request.getAttribute("category"); %>
    <div class="form-box">
        <h2>Edit Category</h2>
        <form action="categories" method="post">
            <input type="hidden" name="id" value="<%= c.getId() %>">
            <div class="field">
                <label for="name">Category Name</label>
                <input type="text" id="name" name="name" value="<%= c.getName() %>" required>
            </div>
            <button type="submit">Save Changes</button>
        </form>
        <a href="categories" class="back">Cancel</a>
    </div>
</body>
</html>
