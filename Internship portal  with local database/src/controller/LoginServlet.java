package controller;

import dao.UserDAO;
import model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private UserDAO userDAO = new UserDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = userDAO.loginUser(email, password);
        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            session.setAttribute("userId", user.getId());
            session.setAttribute("role", user.getRole());

            switch (user.getRole()) {
                case "student":
                    response.sendRedirect("student/dashboard.jsp");
                    break;
                case "hr":
                    response.sendRedirect("hr/dashboard.jsp");
                    break;
                case "mentor":
                    response.sendRedirect("mentor/dashboard.jsp");
                    break;
                case "admin":
                    response.sendRedirect("admin/dashboard.jsp");
                    break;
                default:
                    response.sendRedirect("login.jsp?error=Invalid role!");
            }
        } else {
            response.sendRedirect("login.jsp?error=Invalid email or password!");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("login.jsp");
    }
}
