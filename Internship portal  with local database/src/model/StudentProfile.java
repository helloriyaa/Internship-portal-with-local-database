package model;

public class StudentProfile {
    private int id;
    private int userId;
    private String name;
    private String phone;
    private String address;
    private String department;
    private String skills;
    private String education;
    private String bio;
    private String profilePhoto;
    private String resume;
    private String cv;

    public StudentProfile() {}

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public String getDepartment() { return department; }
    public void setDepartment(String department) { this.department = department; }

    public String getSkills() { return skills; }
    public void setSkills(String skills) { this.skills = skills; }

    public String getEducation() { return education; }
    public void setEducation(String education) { this.education = education; }

    public String getBio() { return bio; }
    public void setBio(String bio) { this.bio = bio; }

    public String getProfilePhoto() { return profilePhoto; }
    public void setProfilePhoto(String profilePhoto) { this.profilePhoto = profilePhoto; }

    public String getResume() { return resume; }
    public void setResume(String resume) { this.resume = resume; }

    public String getCv() { return cv; }
    public void setCv(String cv) { this.cv = cv; }
}
