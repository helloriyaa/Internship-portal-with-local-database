package controller;

import dao.StudentProfileDAO;
import dao.HRProfileDAO;
import dao.UserDAO;
import model.StudentProfile;
import model.HRProfile;
import model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private UserDAO userDAO = new UserDAO();
    private StudentProfileDAO studentProfileDAO = new StudentProfileDAO();
    private HRProfileDAO hrProfileDAO = new HRProfileDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        String name = request.getParameter("name");
        String companyName = request.getParameter("companyName");

        User user = new User();
        user.setEmail(email);
        user.setPassword(password);
        user.setRole(role);

        if (userDAO.registerUser(user)) {
            if ("student".equals(role)) {
                StudentProfile profile = new StudentProfile();
                profile.setUserId(user.getId());
                profile.setName(name);
                studentProfileDAO.createProfile(profile);
            } else if ("hr".equals(role)) {
                HRProfile profile = new HRProfile();
                profile.setUserId(user.getId());
                profile.setCompanyName(companyName);
                hrProfileDAO.createProfile(profile);
            }
            response.sendRedirect("login.jsp?success=Registration successful! Please login.");
        } else {
            response.sendRedirect("register.jsp?error=Registration failed! Email might already exist.");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("register.jsp");
    }
}
