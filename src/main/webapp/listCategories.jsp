<%@ page import="java.util.List, com.task.tracker.model.Category" %>
<html>
<head>
    <title>Manage Categories</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Courier+Prime&family=Libre+Barcode+39&family=Oswald:wght@300&display=swap');
        body { background-color: #1a3a5a; color: #eae2ca; font-family: 'Courier Prime'; padding: 60px; display: flex; flex-direction: column; align-items: center; }
        .container { width: 100%; max-width: 800px; padding: 40px; border: 1px solid #eae2ca; box-shadow: 0 0 0 10px #1a3a5a, 0 0 0 11px #eae2ca; }
        header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px; }
        h2 { font-family: 'Oswald'; text-transform: uppercase; letter-spacing: 5px; }
        table { width: 100%; border-collapse: collapse; }
        th, td { padding: 12px; text-align: left; border-bottom: 1px solid rgba(234,226,202,0.2); }
        th:nth-child(1), td:nth-child(1) { width: 60px; color: #c5a059; } /* ID Space */
        .btn-add { text-decoration: none; color: #eae2ca; border: 1px solid #eae2ca; padding: 5px 10px; font-family: 'Oswald'; font-size: 0.7rem; }
        .back { display: block; margin-top: 30px; font-family: 'Libre Barcode 39'; font-size: 2rem; color: #c5a059; text-decoration: none; text-align: center; }
    </style>
</head>
<body>
<div class="container">
    <header>
        <h2>Categories</h2>
        <a href="categories?action=add" class="btn-add">New Category +</a>
    </header>
    <table>
        <thead><tr><th>ID</th><th>Name</th><th>Actions</th></tr></thead>
        <tbody>
        <%-- Your Loop Logic Here --%>
        </tbody>
    </table>
    <a href="tasks" class="back">BACK</a>
</div>
</body>
</html>