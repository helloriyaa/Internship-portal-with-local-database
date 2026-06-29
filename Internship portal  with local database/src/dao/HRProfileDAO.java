package dao;

import model.HRProfile;
import utility.DBConnection;

import java.sql.*;

public class HRProfileDAO {
    public boolean createProfile(HRProfile profile) {
        String sql = "INSERT INTO hr_profiles (user_id, company_name, phone, address, company_logo) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, profile.getUserId());
            pstmt.setString(2, profile.getCompanyName());
            pstmt.setString(3, profile.getPhone());
            pstmt.setString(4, profile.getAddress());
            pstmt.setString(5, profile.getCompanyLogo());
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public HRProfile getProfileByUserId(int userId) {
        String sql = "SELECT * FROM hr_profiles WHERE user_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, userId);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                HRProfile profile = new HRProfile();
                profile.setId(rs.getInt("id"));
                profile.setUserId(rs.getInt("user_id"));
                profile.setCompanyName(rs.getString("company_name"));
                profile.setPhone(rs.getString("phone"));
                profile.setAddress(rs.getString("address"));
                profile.setCompanyLogo(rs.getString("company_logo"));
                return profile;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updateProfile(HRProfile profile) {
        String sql = "UPDATE hr_profiles SET company_name=?, phone=?, address=?, company_logo=? WHERE user_id=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, profile.getCompanyName());
            pstmt.setString(2, profile.getPhone());
            pstmt.setString(3, profile.getAddress());
            pstmt.setString(4, profile.getCompanyLogo());
            pstmt.setInt(5, profile.getUserId());
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
