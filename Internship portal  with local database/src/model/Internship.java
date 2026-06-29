package model;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Date;

public class Internship {
    private int id;
    private int hrId;
    private String title;
    private String department;
    private String location;
    private String duration;
    private BigDecimal stipend;
    private int vacancies;
    private String description;
    private String eligibility;
    private String requiredSkills;
    private Date deadline;
    private Timestamp postedDate;
    private String status;

    public Internship() {}

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getHrId() { return hrId; }
    public void setHrId(int hrId) { this.hrId = hrId; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getDepartment() { return department; }
    public void setDepartment(String department) { this.department = department; }

    public String getLocation() { return location; }
    public void setLocation(String location) { this.location = location; }

    public String getDuration() { return duration; }
    public void setDuration(String duration) { this.duration = duration; }

    public BigDecimal getStipend() { return stipend; }
    public void setStipend(BigDecimal stipend) { this.stipend = stipend; }

    public int getVacancies() { return vacancies; }
    public void setVacancies(int vacancies) { this.vacancies = vacancies; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getEligibility() { return eligibility; }
    public void setEligibility(String eligibility) { this.eligibility = eligibility; }

    public String getRequiredSkills() { return requiredSkills; }
    public void setRequiredSkills(String requiredSkills) { this.requiredSkills = requiredSkills; }

    public Date getDeadline() { return deadline; }
    public void setDeadline(Date deadline) { this.deadline = deadline; }

    public Timestamp getPostedDate() { return postedDate; }
    public void setPostedDate(Timestamp postedDate) { this.postedDate = postedDate; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}
