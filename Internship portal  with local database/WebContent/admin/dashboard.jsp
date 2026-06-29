<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="model.User" %>
<%@ page import="dao.ApplicationDAO" %>
<%@ page import="model.Application" %>
<%@ page import="java.util.List" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"admin".equals(user.getRole())) {
        response.sendRedirect("../login.jsp");
        return;
    }
    
    ApplicationDAO applicationDAO = new ApplicationDAO();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50">
    <nav class="bg-white shadow-lg">
        <div class="max-w-7xl mx-auto px-4">
            <div class="flex justify-between items-center py-4">
                <h1 class="text-2xl font-bold text-blue-600">Admin Dashboard</h1>
                <div class="flex items-center gap-4">
                    <a href="applications.jsp" class="bg-purple-600 text-white px-4 py-2 rounded-lg hover:bg-purple-700 transition">Manage Applications</a>
                    <span class="text-gray-700"><%= user.getEmail() %></span>
                    <a href="../logout" class="text-red-600 hover:text-red-800 font-medium">Logout</a>
                </div>
            </div>
        </div>
    </nav>

    <div class="max-w-7xl mx-auto px-4 py-8">
        <h2 class="text-3xl font-bold text-gray-800 mb-8">Welcome Admin!</h2>
        
        <div class="grid md:grid-cols-3 gap-8">
            <div class="bg-white p-8 rounded-xl shadow-md">
                <h3 class="text-2xl font-bold text-blue-600 mb-4">Manage Students</h3>
                <p class="text-gray-600 mb-4">View and manage all registered students.</p>
            </div>
            <div class="bg-white p-8 rounded-xl shadow-md">
                <h3 class="text-2xl font-bold text-teal-600 mb-4">Manage HRs</h3>
                <p class="text-gray-600 mb-4">View and manage all registered HRs.</p>
            </div>
            <div class="bg-white p-8 rounded-xl shadow-md">
                <h3 class="text-2xl font-bold text-purple-600 mb-4">Create Mentors</h3>
                <p class="text-gray-600 mb-4">Create and manage mentor accounts.</p>
            </div>
        </div>
    </div>
</body>
</html>
