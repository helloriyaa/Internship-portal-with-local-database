package dao;

import model.Application;
import utility.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ApplicationDAO {
    public boolean createApplication(Application application) {
        String sql = "INSERT INTO applications (internship_id, student_id, college, branch, semester, cgpa, why_hire, resume_file, cv_file, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, application.getInternshipId());
            pstmt.setInt(2, application.getStudentId());
            pstmt.setString(3, application.getCollege());
            pstmt.setString(4, application.getBranch());
            pstmt.setString(5, application.getSemester());
            pstmt.setBigDecimal(6, application.getCgpa());
            pstmt.setString(7, application.getWhyHire());
            pstmt.setString(8, application.getResumeFile());
            pstmt.setString(9, application.getCvFile());
            pstmt.setString(10, application.getStatus());
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Application> getApplicationsByStudent(int studentId) {
        List<Application> list = new ArrayList<>();
        String sql = "SELECT * FROM applications WHERE student_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, studentId);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Application app = new Application();
                app.setId(rs.getInt("id"));
                app.setInternshipId(rs.getInt("internship_id"));
                app.setStudentId(rs.getInt("student_id"));
                app.setCollege(rs.getString("college"));
                app.setBranch(rs.getString("branch"));
                app.setSemester(rs.getString("semester"));
                app.setCgpa(rs.getBigDecimal("cgpa"));
                app.setWhyHire(rs.getString("why_hire"));
                app.setResumeFile(rs.getString("resume_file"));
                app.setCvFile(rs.getString("cv_file"));
                app.setStatus(rs.getString("status"));
                app.setAppliedAt(rs.getTimestamp("applied_at"));
                list.add(app);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Application> getApplicationsByInternship(int internshipId) {
        List<Application> list = new ArrayList<>();
        String sql = "SELECT * FROM applications WHERE internship_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, internshipId);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Application app = new Application();
                app.setId(rs.getInt("id"));
                app.setInternshipId(rs.getInt("internship_id"));
                app.setStudentId(rs.getInt("student_id"));
                app.setCollege(rs.getString("college"));
                app.setBranch(rs.getString("branch"));
                app.setSemester(rs.getString("semester"));
                app.setCgpa(rs.getBigDecimal("cgpa"));
                app.setWhyHire(rs.getString("why_hire"));
                app.setResumeFile(rs.getString("resume_file"));
                app.setCvFile(rs.getString("cv_file"));
                app.setStatus(rs.getString("status"));
                app.setAppliedAt(rs.getTimestamp("applied_at"));
                list.add(app);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean updateApplicationStatus(int id, String status) {
        String sql = "UPDATE applications SET status = ? WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, status);
            pstmt.setInt(2, id);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
