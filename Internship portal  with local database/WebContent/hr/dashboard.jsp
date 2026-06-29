<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="model.User" %>
<%@ page import="dao.InternshipDAO" %>
<%@ page import="model.Internship" %>
<%@ page import="java.util.List" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"hr".equals(user.getRole())) {
        response.sendRedirect("../login.jsp");
        return;
    }
    
    InternshipDAO internshipDAO = new InternshipDAO();
    List<Internship> internships = internshipDAO.getInternshipsByHR(user.getId());
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HR Dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50">
    <nav class="bg-white shadow-lg">
        <div class="max-w-7xl mx-auto px-4">
            <div class="flex justify-between items-center py-4">
                <h1 class="text-2xl font-bold text-blue-600">HR Dashboard</h1>
                <div class="flex items-center gap-4">
                    <a href="createInternship.jsp" class="bg-teal-600 text-white px-4 py-2 rounded-lg hover:bg-teal-700 transition">Create Internship</a>
                    <span class="text-gray-700"><%= user.getEmail() %></span>
                    <a href="../logout" class="text-red-600 hover:text-red-800 font-medium">Logout</a>
                </div>
            </div>
        </div>
    </nav>

    <div class="max-w-7xl mx-auto px-4 py-8">
        <h2 class="text-3xl font-bold text-gray-800 mb-8">Your Internships</h2>
        
        <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
            <% for (Internship internship : internships) { %>
                <div class="bg-white p-6 rounded-xl shadow-md">
                    <h3 class="text-xl font-bold text-gray-800 mb-2"><%= internship.getTitle() %></h3>
                    <p class="text-gray-600 mb-2"><%= internship.getDepartment() %></p>
                    <p class="text-gray-500 mb-1">📍 <%= internship.getLocation() %></p>
                    <p class="text-gray-500 mb-1">⏱️ <%= internship.getDuration() %></p>
                    <p class="text-green-600 font-semibold mb-4">₹<%= internship.getStipend() %>/month</p>
                    <p class="text-gray-500 mb-4">Status: <span class="<%= "active".equals(internship.getStatus()) ? "text-green-600" : "text-red-600" %> font-semibold"><%= internship.getStatus() %></span></p>
                    <a href="applicants.jsp?id=<%= internship.getId() %>" 
                        class="inline-block bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700 transition">
                        View Applicants
                    </a>
                </div>
            <% } %>
        </div>
    </div>
</body>
</html>
