<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"hr".equals(user.getRole())) {
        response.sendRedirect("../login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Internship</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50">
    <nav class="bg-white shadow-lg">
        <div class="max-w-7xl mx-auto px-4">
            <div class="flex justify-between items-center py-4">
                <h1 class="text-2xl font-bold text-blue-600">Create Internship</h1>
                <div class="flex items-center gap-4">
                    <a href="dashboard.jsp" class="text-gray-600 hover:text-gray-800">← Back</a>
                    <span class="text-gray-700"><%= user.getEmail() %></span>
                    <a href="../logout" class="text-red-600 hover:text-red-800 font-medium">Logout</a>
                </div>
            </div>
        </div>
    </nav>

    <div class="max-w-3xl mx-auto px-4 py-8">
        <div class="bg-white p-8 rounded-xl shadow-lg">
            <h2 class="text-2xl font-bold text-gray-800 mb-6">New Internship Posting</h2>
            
            <form action="../createInternship" method="post">
                <div class="mb-6">
                    <label class="block text-gray-700 font-medium mb-2">Internship Title</label>
                    <input type="text" name="title" required 
                        class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 outline-none">
                </div>
                
                <div class="mb-6">
                    <label class="block text-gray-700 font-medium mb-2">Department</label>
                    <input type="text" name="department" required 
                        class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 outline-none">
                </div>
                
                <div class="mb-6">
                    <label class="block text-gray-700 font-medium mb-2">Location</label>
                    <input type="text" name="location" required 
                        class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 outline-none">
                </div>
                
                <div class="mb-6">
                    <label class="block text-gray-700 font-medium mb-2">Duration (e.g., 3 Months)</label>
                    <input type="text" name="duration" required 
                        class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 outline-none">
                </div>
                
                <div class="mb-6">
                    <label class="block text-gray-700 font-medium mb-2">Stipend (Monthly)</label>
                    <input type="number" name="stipend" required 
                        class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 outline-none">
                </div>
                
                <div class="mb-6">
                    <label class="block text-gray-700 font-medium mb-2">Vacancies</label>
                    <input type="number" name="vacancies" required 
                        class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 outline-none">
                </div>
                
                <div class="mb-6">
                    <label class="block text-gray-700 font-medium mb-2">Description</label>
                    <textarea name="description" rows="4" required 
                        class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 outline-none"></textarea>
                </div>
                
                <div class="mb-6">
                    <label class="block text-gray-700 font-medium mb-2">Eligibility</label>
                    <textarea name="eligibility" rows="3" required 
                        class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 outline-none"></textarea>
                </div>
                
                <div class="mb-6">
                    <label class="block text-gray-700 font-medium mb-2">Required Skills</label>
                    <textarea name="requiredSkills" rows="3" required 
                        class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 outline-none"></textarea>
                </div>
                
                <div class="mb-6">
                    <label class="block text-gray-700 font-medium mb-2">Application Deadline</label>
                    <input type="date" name="deadline" required 
                        class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 outline-none">
                </div>
                
                <button type="submit" 
                    class="w-full bg-teal-600 text-white py-3 rounded-lg font-medium hover:bg-teal-700 transition">
                    Create Internship
                </button>
            </form>
        </div>
    </div>
</body>
</html>
