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
    <title>Apply for Internship</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50">
    <nav class="bg-white shadow-lg">
        <div class="max-w-7xl mx-auto px-4">
            <div class="flex justify-between items-center py-4">
                <h1 class="text-2xl font-bold text-blue-600">Apply for Internship</h1>
                <div class="flex items-center gap-4">
                    <a href="internship.jsp?id=<%= internshipId %>" class="text-gray-600 hover:text-gray-800">← Back</a>
                    <span class="text-gray-700"><%= user.getEmail() %></span>
                    <a href="../logout" class="text-red-600 hover:text-red-800 font-medium">Logout</a>
                </div>
            </div>
        </div>
    </nav>

    <div class="max-w-3xl mx-auto px-4 py-8">
        <div class="bg-white p-8 rounded-xl shadow-lg">
            <h2 class="text-2xl font-bold text-gray-800 mb-6">Application for <%= internship.getTitle() %></h2>
            
            <form action="../applyInternship" method="post" enctype="multipart/form-data">
                <input type="hidden" name="internshipId" value="<%= internshipId %>">
                
                <div class="mb-6">
                    <label class="block text-gray-700 font-medium mb-2">College</label>
                    <input type="text" name="college" required 
                        class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 outline-none">
                </div>
                
                <div class="mb-6">
                    <label class="block text-gray-700 font-medium mb-2">Branch</label>
                    <input type="text" name="branch" required 
                        class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 outline-none">
                </div>
                
                <div class="mb-6">
                    <label class="block text-gray-700 font-medium mb-2">Semester</label>
                    <input type="text" name="semester" required 
                        class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 outline-none">
                </div>
                
                <div class="mb-6">
                    <label class="block text-gray-700 font-medium mb-2">CGPA</label>
                    <input type="number" step="0.01" name="cgpa" required 
                        class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 outline-none">
                </div>
                
                <div class="mb-6">
                    <label class="block text-gray-700 font-medium mb-2">Why should we hire you?</label>
                    <textarea name="whyHire" rows="4" required 
                        class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 outline-none"></textarea>
                </div>
                
                <div class="mb-6">
                    <label class="block text-gray-700 font-medium mb-2">Resume (PDF)</label>
                    <input type="file" name="resume" accept=".pdf" 
                        class="w-full px-4 py-3 border border-gray-300 rounded-lg">
                </div>
                
                <div class="mb-6">
                    <label class="block text-gray-700 font-medium mb-2">CV (PDF)</label>
                    <input type="file" name="cv" accept=".pdf" 
                        class="w-full px-4 py-3 border border-gray-300 rounded-lg">
                </div>
                
                <div class="mb-6">
                    <label class="flex items-center gap-2">
                        <input type="checkbox" name="declaration" required class="w-4 h-4">
                        <span class="text-gray-700">I declare that all information provided is true and accurate</span>
                    </label>
                </div>
                
                <button type="submit" 
                    class="w-full bg-blue-600 text-white py-3 rounded-lg font-medium hover:bg-blue-700 transition">
                    Submit Application
                </button>
            </form>
        </div>
    </div>
</body>
</html>
