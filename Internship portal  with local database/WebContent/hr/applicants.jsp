<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="model.User" %>
<%@ page import="dao.ApplicationDAO" %>
<%@ page import="dao.InternshipDAO" %>
<%@ page import="model.Application" %>
<%@ page import="model.Internship" %>
<%@ page import="java.util.List" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"hr".equals(user.getRole())) {
        response.sendRedirect("../login.jsp");
        return;
    }
    
    int internshipId = Integer.parseInt(request.getParameter("id"));
    ApplicationDAO applicationDAO = new ApplicationDAO();
    List<Application> applications = applicationDAO.getApplicationsByInternship(internshipId);
    
    InternshipDAO internshipDAO = new InternshipDAO();
    Internship internship = internshipDAO.getInternshipById(internshipId);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Applicants - <%= internship.getTitle() %></title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50">
    <nav class="bg-white shadow-lg">
        <div class="max-w-7xl mx-auto px-4">
            <div class="flex justify-between items-center py-4">
                <h1 class="text-2xl font-bold text-blue-600">Applicants for <%= internship.getTitle() %></h1>
                <div class="flex items-center gap-4">
                    <a href="dashboard.jsp" class="text-gray-600 hover:text-gray-800">← Back</a>
                    <span class="text-gray-700"><%= user.getEmail() %></span>
                    <a href="../logout" class="text-red-600 hover:text-red-800 font-medium">Logout</a>
                </div>
            </div>
        </div>
    </nav>

    <div class="max-w-5xl mx-auto px-4 py-8">
        <h2 class="text-2xl font-bold text-gray-800 mb-8">Total Applicants: <%= applications.size() %></h2>
        
        <div class="space-y-6">
            <% for (Application app : applications) { %>
                <div class="bg-white p-6 rounded-xl shadow-md">
                    <div class="flex justify-between items-start mb-4">
                        <div>
                            <p class="text-xl font-semibold text-gray-800">Applicant #<%= app.getId() %></p>
                            <p class="text-gray-600">College: <%= app.getCollege() %></p>
                            <p class="text-gray-600">Branch: <%= app.getBranch() %> - <%= app.getSemester() %></p>
                            <p class="text-gray-600">CGPA: <%= app.getCgpa() %></p>
                        </div>
                        <span class="px-3 py-1 rounded-full text-sm font-medium <%= 
                            "pending".equals(app.getStatus()) ? "bg-yellow-100 text-yellow-800" : 
                            "approved".equals(app.getStatus()) ? "bg-green-100 text-green-800" : 
                            "bg-red-100 text-red-800" %>">
                            <%= app.getStatus().toUpperCase() %>
                        </span>
                    </div>
                    <p class="text-gray-700 mb-4"><strong>Why should we hire you?</strong><br><%= app.getWhyHire() %></p>
                    <p class="text-gray-600 text-sm">Applied on: <%= app.getAppliedAt() %></p>
                </div>
            <% } %>
        </div>
    </div>
</body>
</html>
