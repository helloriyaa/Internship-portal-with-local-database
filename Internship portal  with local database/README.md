# Internship Portal

A complete internship management system built with Java Servlets, JSP, and MySQL.

## Technology Stack

- Backend: Java Servlets, JDBC
- Frontend: JSP, Tailwind CSS (CDN), Vanilla JavaScript
- Database: MySQL
- Server: Apache Tomcat 10+
- IDE: Eclipse Enterprise Edition

## Setup Instructions

### 1. Database Setup

1. Start your MySQL server
2. Run the database script:
   ```bash
   mysql -u root -p < database/internship_portal.sql
   ```
3. The database `internship_portal` will be created with all necessary tables and a default admin user:
   - Email: helloriya49@gmail.com
   - Password: admin123 (note: in the current code, the password is stored as a plain string, you should implement password hashing)

### 2. Project Setup in Eclipse

1. Open Eclipse Enterprise Edition
2. File → Import → Existing Projects into Workspace
3. Select this project directory
4. Make sure you have Apache Tomcat 10 configured in Eclipse
5. Add MySQL Connector/J to your project's build path

### 3. Database Connection Configuration

Update the database credentials in `src/utility/DBConnection.java`:

```java
private static final String URL = "jdbc:mysql://localhost:3306/internship_portal";
private static final String USERNAME = "root"; // your MySQL username
private static final String PASSWORD = ""; // your MySQL password
```

### 4. Run the Application

1. Right-click on the project → Run As → Run on Server
2. Select Apache Tomcat 10
3. The application will start at `http://localhost:8080/Internship_portal_with_local_database/`

## Features

- User Authentication (Student, HR, Mentor, Admin)
- Internship Posting and Browsing
- Online Application System
- File Upload (Resume, CV)
- Dashboard for each user role
- Responsive UI with Tailwind CSS

## User Roles

1. **Student**: Register, login, browse internships, apply online
2. **HR**: Register, login, create internship postings, view applicants
3. **Mentor**: Login (account created by Admin), manage assigned students
4. **Admin**: Login, manage all users and applications

## Project Structure

```
Internship_portal_with_local_database/
├── src/
│   ├── controller/      # Servlet controllers
│   ├── dao/            # Data Access Objects
│   ├── model/          # Java Beans (models)
│   └── utility/        # Utility classes (DB connection)
├── WebContent/
│   ├── student/        # Student pages
│   ├── hr/             # HR pages
│   ├── mentor/         # Mentor pages
│   ├── admin/          # Admin pages
│   ├── uploads/        # File upload directory
│   └── WEB-INF/
│       └── web.xml     # Deployment descriptor
└── database/
    └── internship_portal.sql  # Database schema
```

## Notes

- The current implementation stores passwords as plain text for simplicity. For a real application, use BCrypt or similar hashing.
- File uploads are stored in the `uploads` directory.
- This is a basic implementation suitable for a college project.
