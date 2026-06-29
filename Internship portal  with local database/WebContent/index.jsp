<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Internship Portal</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50">
    <nav class="bg-white shadow-lg">
        <div class="max-w-7xl mx-auto px-4">
            <div class="flex justify-between items-center py-4">
                <h1 class="text-2xl font-bold text-blue-600">Internship Portal</h1>
                <div class="flex gap-4">
                    <a href="login.jsp" class="text-blue-600 hover:text-blue-800 font-medium">Login</a>
                    <a href="register.jsp" class="bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700 transition">Register</a>
                </div>
            </div>
        </div>
    </nav>

    <div class="max-w-7xl mx-auto px-4 py-16">
        <div class="text-center mb-12">
            <h2 class="text-5xl font-bold text-gray-800 mb-4">Find Your Perfect Internship</h2>
            <p class="text-xl text-gray-600">Connect with top companies and kickstart your career today</p>
        </div>

        <div class="grid md:grid-cols-3 gap-8">
            <div class="bg-white p-8 rounded-xl shadow-md hover:shadow-lg transition">
                <h3 class="text-2xl font-bold text-blue-600 mb-4">For Students</h3>
                <p class="text-gray-600 mb-4">Browse internships, apply online, and manage your applications.</p>
                <a href="register.jsp" class="text-blue-600 font-medium hover:text-blue-800">Register Now →</a>
            </div>
            <div class="bg-white p-8 rounded-xl shadow-md hover:shadow-lg transition">
                <h3 class="text-2xl font-bold text-teal-600 mb-4">For Companies</h3>
                <p class="text-gray-600 mb-4">Post internships, find talent, and manage your hiring process.</p>
                <a href="register.jsp" class="text-teal-600 font-medium hover:text-teal-800">Get Started →</a>
            </div>
            <div class="bg-white p-8 rounded-xl shadow-md hover:shadow-lg transition">
                <h3 class="text-2xl font-bold text-purple-600 mb-4">For Mentors</h3>
                <p class="text-gray-600 mb-4">Guide interns, review projects, and help shape the next generation.</p>
                <a href="#" class="text-purple-600 font-medium hover:text-purple-800">Learn More →</a>
            </div>
        </div>
    </div>
</body>
</html>
