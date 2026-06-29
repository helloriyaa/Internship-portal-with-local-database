package controller;

import dao.ApplicationDAO;
import model.Application;
import model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;

@WebServlet("/applyInternship")
public class ApplyInternshipServlet extends HttpServlet {
    private ApplicationDAO applicationDAO = new ApplicationDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        if (user == null || !"student".equals(user.getRole())) {
            response.sendRedirect("login.jsp");
            return;
        }

        int internshipId = Integer.parseInt(request.getParameter("internshipId"));
        String college = request.getParameter("college");
        String branch = request.getParameter("branch");
        String semester = request.getParameter("semester");
        BigDecimal cgpa = new BigDecimal(request.getParameter("cgpa"));
        String whyHire = request.getParameter("whyHire");

        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();

        String resumeFileName = null;
        String cvFileName = null;

        try {
            Part resumePart = request.getPart("resume");
            if (resumePart != null && resumePart.getSize() > 0) {
                resumeFileName = System.currentTimeMillis() + "_" + resumePart.getSubmittedFileName();
                resumePart.write(uploadPath + File.separator + resumeFileName);
            }

            Part cvPart = request.getPart("cv");
            if (cvPart != null && cvPart.getSize() > 0) {
                cvFileName = System.currentTimeMillis() + "_" + cvPart.getSubmittedFileName();
                cvPart.write(uploadPath + File.separator + cvFileName);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        Application application = new Application();
        application.setInternshipId(internshipId);
        application.setStudentId(user.getId());
        application.setCollege(college);
        application.setBranch(branch);
        application.setSemester(semester);
        application.setCgpa(cgpa);
        application.setWhyHire(whyHire);
        application.setResumeFile(resumeFileName);
        application.setCvFile(cvFileName);
        application.setStatus("pending");

        if (applicationDAO.createApplication(application)) {
            response.sendRedirect("student/dashboard.jsp?success=Application submitted successfully!");
        } else {
            response.sendRedirect("student/apply.jsp?id=" + internshipId + "&error=Failed to submit application!");
        }
    }
}
