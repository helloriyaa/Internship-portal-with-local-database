<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="model.User" %>
<%@ page import="dao.InternshipDAO" %>
<%@ page import="model.Internship" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"student".equals(user.getRole())) {
        response.sendRedirect("../login.jsp");
        return;
    }
    
    int internshipId = Integer.parseInt(request.getParameter("id"));
    InternshipDAO internshipDAO = new InternshipDAO();
    Internship internship = internshipDAO.getInternshipById(internshipId);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= internship.getTitle() %></title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50">
    <nav class="bg-white shadow-lg">
        <div class="max-w-7xl mx-auto px-4">
            <div class="flex justify-between items-center py-4">
                <h1 class="text-2xl font-bold text-blue-600">Internship Details</h1>
                <div class="flex items-center gap-4">
                    <a href="dashboard.jsp" class="text-gray-600 hover:text-gray-800">← Back</a>
                    <span class="text-gray-700"><%= user.getEmail() %></span>
                    <a href="../logout" class="text-red-600 hover:text-red-800 font-medium">Logout</a>
                </div>
            </div>
        </div>
    </nav>

    <div class="max-w-4xl mx-auto px-4 py-8">
        <div class="bg-white p-8 rounded-xl shadow-lg">
            <h1 class="text-3xl font-bold text-gray-800 mb-4"><%= internship.getTitle() %></h1>
            <p class="text-gray-600 text-lg mb-6"><%= internship.getDepartment() %></p>
            
            <div class="grid md:grid-cols-2 gap-4 mb-8">
                <div class="bg-gray-50 p-4 rounded-lg">
                    <p class="text-gray-500 text-sm">Location</p>
                    <p class="text-gray-800 font-medium"><%= internship.getLocation() %></p>
                </div>
                <div class="bg-gray-50 p-4 rounded-lg">
                    <p class="text-gray-500 text-sm">Duration</p>
                    <p class="text-gray-800 font-medium"><%= internship.getDuration() %></p>
                </div>
                <div class="bg-gray-50 p-4 rounded-lg">
                    <p class="text-gray-500 text-sm">Stipend</p>
                    <p class="text-green-600 font-semibold">₹<%= internship.getStipend() %>/month</p>
                </div>
                <div class="bg-gray-50 p-4 rounded-lg">
                    <p class="text-gray-500 text-sm">Vacancies</p>
                    <p class="text-gray-800 font-medium"><%= internship.getVacancies() %></p>
                </div>
            </div>

            <div class="mb-8">
                <h2 class="text-xl font-bold text-gray-800 mb-4">Description</h2>
                <p class="text-gray-600"><%= internship.getDescription() %></p>
            </div>
            
            <div class="mb-8">
                <h2 class="text-xl font-bold text-gray-800 mb-4">Eligibility</h2>
                <p class="text-gray-600"><%= internship.getEligibility() %></p>
            </div>
            
            <div class="mb-8">
                <h2 class="text-xl font-bold text-gray-800 mb-4">Required Skills</h2>
                <p class="text-gray-600"><%= internship.getRequiredSkills() %></p>
            </div>

            <a href="apply.jsp?id=<%= internship.getId() %>" 
                class="inline-block bg-blue-600 text-white px-8 py-3 rounded-lg text-lg font-medium hover:bg-blue-700 transition">
                Apply Now
            </a>
        </div>
    </div>
</body>
</html>
