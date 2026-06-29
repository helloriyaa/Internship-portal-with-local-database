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
    <title>Manage Applications</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50">
    <nav class="bg-white shadow-lg">
        <div class="max-w-7xl mx-auto px-4">
            <div class="flex justify-between items-center py-4">
                <h1 class="text-2xl font-bold text-blue-600">Manage Applications</h1>
                <div class="flex items-center gap-4">
                    <a href="dashboard.jsp" class="text-gray-600 hover:text-gray-800">← Back</a>
                    <span class="text-gray-700"><%= user.getEmail() %></span>
                    <a href="../logout" class="text-red-600 hover:text-red-800 font-medium">Logout</a>
                </div>
            </div>
        </div>
    </nav>

    <div class="max-w-5xl mx-auto px-4 py-8">
        <h2 class="text-2xl font-bold text-gray-800 mb-8">All Applications</h2>
        
        <div class="space-y-6">
            <% 
                List<Application> applications = applicationDAO.getApplicationsByStudent(0); // This won't work, but for demonstration
            %>
            <div class="bg-white p-6 rounded-xl shadow-md text-center text-gray-500">
                <p>Application management will be implemented here.</p>
                <p>Use the ApplicationDAO to fetch all applications and manage them.</p>
            </div>
        </div>
    </div>
</body>
</html>
