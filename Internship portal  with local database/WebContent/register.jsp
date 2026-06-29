<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Internship Portal</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50 min-h-screen flex items-center justify-center px-4 py-8">
    <div class="bg-white rounded-2xl shadow-xl p-8 max-w-md w-full">
        <h1 class="text-3xl font-bold text-center text-blue-600 mb-8">Create Account</h1>
        
        <% if (request.getParameter("error") != null) { %>
            <div class="bg-red-100 text-red-700 p-3 rounded-lg mb-4">
                <%= request.getParameter("error") %>
            </div>
        <% } %>

        <form action="register" method="post" id="registerForm">
            <div class="mb-6">
                <label class="block text-gray-700 font-medium mb-2">Role</label>
                <select name="role" id="roleSelect" required 
                    class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 outline-none">
                    <option value="student">Student</option>
                    <option value="hr">Company HR</option>
                </select>
            </div>
            
            <div class="mb-6" id="nameField">
                <label class="block text-gray-700 font-medium mb-2">Full Name</label>
                <input type="text" name="name" 
                    class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 outline-none">
            </div>
            
            <div class="mb-6" id="companyField" style="display: none;">
                <label class="block text-gray-700 font-medium mb-2">Company Name</label>
                <input type="text" name="companyName" 
                    class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 outline-none">
            </div>
            
            <div class="mb-6">
                <label class="block text-gray-700 font-medium mb-2">Email</label>
                <input type="email" name="email" required 
                    class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 outline-none">
            </div>
            <div class="mb-6">
                <label class="block text-gray-700 font-medium mb-2">Password</label>
                <input type="password" name="password" required 
                    class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 outline-none">
            </div>
            <button type="submit" 
                class="w-full bg-blue-600 text-white py-3 rounded-lg font-medium hover:bg-blue-700 transition">
                Register
            </button>
        </form>
        
        <p class="text-center text-gray-600 mt-6">
            Already have an account? <a href="login.jsp" class="text-blue-600 font-medium hover:text-blue-800">Login</a>
        </p>
        <p class="text-center text-gray-500 mt-4">
            <a href="index.jsp" class="text-gray-500 hover:text-gray-700">← Back to Home</a>
        </p>
    </div>

    <script>
        document.getElementById('roleSelect').addEventListener('change', function() {
            if (this.value === 'student') {
                document.getElementById('nameField').style.display = 'block';
                document.getElementById('companyField').style.display = 'none';
            } else if (this.value === 'hr') {
                document.getElementById('nameField').style.display = 'none';
                document.getElementById('companyField').style.display = 'block';
            }
        });
    </script>
</body>
</html>
