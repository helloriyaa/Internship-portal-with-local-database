package model;

import java.math.BigDecimal;
import java.sql.Timestamp;

public class Application {
    private int id;
    private int internshipId;
    private int studentId;
    private String college;
    private String branch;
    private String semester;
    private BigDecimal cgpa;
    private String whyHire;
    private String resumeFile;
    private String cvFile;
    private String status;
    private Timestamp appliedAt;

    public Application() {}

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getInternshipId() { return internshipId; }
    public void setInternshipId(int internshipId) { this.internshipId = internshipId; }

    public int getStudentId() { return studentId; }
    public void setStudentId(int studentId) { this.studentId = studentId; }

    public String getCollege() { return college; }
    public void setCollege(String college) { this.college = college; }

    public String getBranch() { return branch; }
    public void setBranch(String branch) { this.branch = branch; }

    public String getSemester() { return semester; }
    public void setSemester(String semester) { this.semester = semester; }

    public BigDecimal getCgpa() { return cgpa; }
    public void setCgpa(BigDecimal cgpa) { this.cgpa = cgpa; }

    public String getWhyHire() { return whyHire; }
    public void setWhyHire(String whyHire) { this.whyHire = whyHire; }

    public String getResumeFile() { return resumeFile; }
    public void setResumeFile(String resumeFile) { this.resumeFile = resumeFile; }

    public String getCvFile() { return cvFile; }
    public void setCvFile(String cvFile) { this.cvFile = cvFile; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public Timestamp getAppliedAt() { return appliedAt; }
    public void setAppliedAt(Timestamp appliedAt) { this.appliedAt = appliedAt; }
}
