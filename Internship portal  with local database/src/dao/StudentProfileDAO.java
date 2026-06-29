package dao;

import model.StudentProfile;
import utility.DBConnection;

import java.sql.*;

public class StudentProfileDAO {
    public boolean createProfile(StudentProfile profile) {
        String sql = "INSERT INTO student_profiles (user_id, name, phone, address, department, skills, education, bio, profile_photo, resume, cv) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, profile.getUserId());
            pstmt.setString(2, profile.getName());
            pstmt.setString(3, profile.getPhone());
            pstmt.setString(4, profile.getAddress());
            pstmt.setString(5, profile.getDepartment());
            pstmt.setString(6, profile.getSkills());
            pstmt.setString(7, profile.getEducation());
            pstmt.setString(8, profile.getBio());
            pstmt.setString(9, profile.getProfilePhoto());
            pstmt.setString(10, profile.getResume());
            pstmt.setString(11, profile.getCv());
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public StudentProfile getProfileByUserId(int userId) {
        String sql = "SELECT * FROM student_profiles WHERE user_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, userId);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                StudentProfile profile = new StudentProfile();
                profile.setId(rs.getInt("id"));
                profile.setUserId(rs.getInt("user_id"));
                profile.setName(rs.getString("name"));
                profile.setPhone(rs.getString("phone"));
                profile.setAddress(rs.getString("address"));
                profile.setDepartment(rs.getString("department"));
                profile.setSkills(rs.getString("skills"));
                profile.setEducation(rs.getString("education"));
                profile.setBio(rs.getString("bio"));
                profile.setProfilePhoto(rs.getString("profile_photo"));
                profile.setResume(rs.getString("resume"));
                profile.setCv(rs.getString("cv"));
                return profile;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updateProfile(StudentProfile profile) {
        String sql = "UPDATE student_profiles SET name=?, phone=?, address=?, department=?, skills=?, education=?, bio=?, profile_photo=?, resume=?, cv=? WHERE user_id=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, profile.getName());
            pstmt.setString(2, profile.getPhone());
            pstmt.setString(3, profile.getAddress());
            pstmt.setString(4, profile.getDepartment());
            pstmt.setString(5, profile.getSkills());
            pstmt.setString(6, profile.getEducation());
            pstmt.setString(7, profile.getBio());
            pstmt.setString(8, profile.getProfilePhoto());
            pstmt.setString(9, profile.getResume());
            pstmt.setString(10, profile.getCv());
            pstmt.setInt(11, profile.getUserId());
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
