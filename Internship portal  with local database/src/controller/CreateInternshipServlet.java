package controller;

import dao.InternshipDAO;
import model.Internship;
import model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/createInternship")
public class CreateInternshipServlet extends HttpServlet {
    private InternshipDAO internshipDAO = new InternshipDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        if (user == null || !"hr".equals(user.getRole())) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            Internship internship = new Internship();
            internship.setHrId(user.getId());
            internship.setTitle(request.getParameter("title"));
            internship.setDepartment(request.getParameter("department"));
            internship.setLocation(request.getParameter("location"));
            internship.setDuration(request.getParameter("duration"));
            internship.setStipend(new BigDecimal(request.getParameter("stipend")));
            internship.setVacancies(Integer.parseInt(request.getParameter("vacancies")));
            internship.setDescription(request.getParameter("description"));
            internship.setEligibility(request.getParameter("eligibility"));
            internship.setRequiredSkills(request.getParameter("requiredSkills"));
            
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date deadline = sdf.parse(request.getParameter("deadline"));
            internship.setDeadline(deadline);
            internship.setStatus("active");

            if (internshipDAO.createInternship(internship)) {
                response.sendRedirect("hr/dashboard.jsp?success=Internship created successfully!");
            } else {
                response.sendRedirect("hr/createInternship.jsp?error=Failed to create internship!");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("hr/createInternship.jsp?error=Error creating internship!");
        }
    }
}
