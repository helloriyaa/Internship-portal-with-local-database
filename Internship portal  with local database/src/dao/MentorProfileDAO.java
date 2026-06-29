package dao;

import model.MentorProfile;
import utility.DBConnection;

import java.sql.*;

public class MentorProfileDAO {
    public boolean createProfile(MentorProfile profile) {
        String sql = "INSERT INTO mentor_profiles (user_id, name, phone, department, skills, bio, profile_photo) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, profile.getUserId());
            pstmt.setString(2, profile.getName());
            pstmt.setString(3, profile.getPhone());
            pstmt.setString(4, profile.getDepartment());
            pstmt.setString(5, profile.getSkills());
            pstmt.setString(6, profile.getBio());
            pstmt.setString(7, profile.getProfilePhoto());
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public MentorProfile getProfileByUserId(int userId) {
        String sql = "SELECT * FROM mentor_profiles WHERE user_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, userId);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                MentorProfile profile = new MentorProfile();
                profile.setId(rs.getInt("id"));
                profile.setUserId(rs.getInt("user_id"));
                profile.setName(rs.getString("name"));
                profile.setPhone(rs.getString("phone"));
                profile.setDepartment(rs.getString("department"));
                profile.setSkills(rs.getString("skills"));
                profile.setBio(rs.getString("bio"));
                profile.setProfilePhoto(rs.getString("profile_photo"));
                return profile;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updateProfile(MentorProfile profile) {
        String sql = "UPDATE mentor_profiles SET name=?, phone=?, department=?, skills=?, bio=?, profile_photo=? WHERE user_id=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, profile.getName());
            pstmt.setString(2, profile.getPhone());
            pstmt.setString(3, profile.getDepartment());
            pstmt.setString(4, profile.getSkills());
            pstmt.setString(5, profile.getBio());
            pstmt.setString(6, profile.getProfilePhoto());
            pstmt.setInt(7, profile.getUserId());
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
