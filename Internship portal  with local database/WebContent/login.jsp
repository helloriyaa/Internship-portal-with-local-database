<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Internship Portal</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50 min-h-screen flex items-center justify-center px-4">
    <div class="bg-white rounded-2xl shadow-xl p-8 max-w-md w-full">
        <h1 class="text-3xl font-bold text-center text-blue-600 mb-8">Welcome Back</h1>
        
        <% if (request.getParameter("error") != null) { %>
            <div class="bg-red-100 text-red-700 p-3 rounded-lg mb-4">
                <%= request.getParameter("error") %>
            </div>
        <% } %>
        
        <% if (request.getParameter("success") != null) { %>
            <div class="bg-green-100 text-green-700 p-3 rounded-lg mb-4">
                <%= request.getParameter("success") %>
            </div>
        <% } %>

        <form action="login" method="post">
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
                Login
            </button>
        </form>
        
        <p class="text-center text-gray-600 mt-6">
            Don't have an account? <a href="register.jsp" class="text-blue-600 font-medium hover:text-blue-800">Register</a>
        </p>
        <p class="text-center text-gray-500 mt-4">
            <a href="index.jsp" class="text-gray-500 hover:text-gray-700">← Back to Home</a>
        </p>
    </div>
</body>
</html>
