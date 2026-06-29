package dao;

import model.Internship;
import utility.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class InternshipDAO {
    public boolean createInternship(Internship internship) {
        String sql = "INSERT INTO internships (hr_id, title, department, location, duration, stipend, vacancies, description, eligibility, required_skills, deadline, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, internship.getHrId());
            pstmt.setString(2, internship.getTitle());
            pstmt.setString(3, internship.getDepartment());
            pstmt.setString(4, internship.getLocation());
            pstmt.setString(5, internship.getDuration());
            pstmt.setBigDecimal(6, internship.getStipend());
            pstmt.setInt(7, internship.getVacancies());
            pstmt.setString(8, internship.getDescription());
            pstmt.setString(9, internship.getEligibility());
            pstmt.setString(10, internship.getRequiredSkills());
            pstmt.setDate(11, new java.sql.Date(internship.getDeadline().getTime()));
            pstmt.setString(12, internship.getStatus());
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Internship> getAllInternships() {
        List<Internship> list = new ArrayList<>();
        String sql = "SELECT * FROM internships WHERE status = 'active'";
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Internship internship = new Internship();
                internship.setId(rs.getInt("id"));
                internship.setHrId(rs.getInt("hr_id"));
                internship.setTitle(rs.getString("title"));
                internship.setDepartment(rs.getString("department"));
                internship.setLocation(rs.getString("location"));
                internship.setDuration(rs.getString("duration"));
                internship.setStipend(rs.getBigDecimal("stipend"));
                internship.setVacancies(rs.getInt("vacancies"));
                internship.setDescription(rs.getString("description"));
                internship.setEligibility(rs.getString("eligibility"));
                internship.setRequiredSkills(rs.getString("required_skills"));
                internship.setDeadline(rs.getDate("deadline"));
                internship.setPostedDate(rs.getTimestamp("posted_date"));
                internship.setStatus(rs.getString("status"));
                list.add(internship);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public Internship getInternshipById(int id) {
        String sql = "SELECT * FROM internships WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                Internship internship = new Internship();
                internship.setId(rs.getInt("id"));
                internship.setHrId(rs.getInt("hr_id"));
                internship.setTitle(rs.getString("title"));
                internship.setDepartment(rs.getString("department"));
                internship.setLocation(rs.getString("location"));
                internship.setDuration(rs.getString("duration"));
                internship.setStipend(rs.getBigDecimal("stipend"));
                internship.setVacancies(rs.getInt("vacancies"));
                internship.setDescription(rs.getString("description"));
                internship.setEligibility(rs.getString("eligibility"));
                internship.setRequiredSkills(rs.getString("required_skills"));
                internship.setDeadline(rs.getDate("deadline"));
                internship.setPostedDate(rs.getTimestamp("posted_date"));
                internship.setStatus(rs.getString("status"));
                return internship;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Internship> getInternshipsByHR(int hrId) {
        List<Internship> list = new ArrayList<>();
        String sql = "SELECT * FROM internships WHERE hr_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, hrId);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Internship internship = new Internship();
                internship.setId(rs.getInt("id"));
                internship.setHrId(rs.getInt("hr_id"));
                internship.setTitle(rs.getString("title"));
                internship.setDepartment(rs.getString("department"));
                internship.setLocation(rs.getString("location"));
                internship.setDuration(rs.getString("duration"));
                internship.setStipend(rs.getBigDecimal("stipend"));
                internship.setVacancies(rs.getInt("vacancies"));
                internship.setDescription(rs.getString("description"));
                internship.setEligibility(rs.getString("eligibility"));
                internship.setRequiredSkills(rs.getString("required_skills"));
                internship.setDeadline(rs.getDate("deadline"));
                internship.setPostedDate(rs.getTimestamp("posted_date"));
                internship.setStatus(rs.getString("status"));
                list.add(internship);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
