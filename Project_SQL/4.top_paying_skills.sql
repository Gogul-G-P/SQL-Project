/*
Answer: What are the top skills based on salary?
-Look at the average salary associated with each skill for data analyst positions.
-Focuses on roles with specified salaries, regardless of location.
-Why? It reveals how different skills impact salary levels for data analyst and helps identify the most finanacially rewarding skills
 to acquire to improve */
 
SELECT
    skills,
    ROUND(avg(salary_year_avg),0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_postings_fact.job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL AND
    job_work_from_home = True
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25
 /*
Here’s a shortened 3-point version of the insights:Collaboration & Cloud tools drive the highest pay – Skills like Jira, Confluence, Visio, Power BI, and Azure are linked with salaries well above $115K, showing that top-paying roles value analysts who can work across teams and cloud ecosystems.
Core analytics skills are essential but baseline – SQL, Excel, Python, and R remain must-haves, but their average salaries (~$75K–$85K) show they’re foundational, not premium.
Communication boosts analyst value – Tools like PowerPoint and Word appear in high-paying roles, highlighting that presenting insights effectively is as valuable as technical analysis.
 [
  {
    "skills": "visio",
    "avg_salary": "119250"
  },
  {
    "skills": "jira",
    "avg_salary": "119250"
  },
  {
    "skills": "confluence",
    "avg_salary": "119250"
  },
  {
    "skills": "power bi",
    "avg_salary": "118140"
  },
  {
    "skills": "azure",
    "avg_salary": "118140"
  },
  {
    "skills": "powerpoint",
    "avg_salary": "104550"
  },
  {
    "skills": "flow",
    "avg_salary": "96604"
  },
  {
    "skills": "sheets",
    "avg_salary": "93600"
  },
  {
    "skills": "word",
    "avg_salary": "89579"
  },
  {
    "skills": "sql",
    "avg_salary": "85397"
  },
  {
    "skills": "excel",
    "avg_salary": "84366"
  },
  {
    "skills": "pytorch",
    "avg_salary": "79200"
  },
  {
    "skills": "unix",
    "avg_salary": "79200"
  },
  {
    "skills": "tensorflow",
    "avg_salary": "79200"
  },
  {
    "skills": "windows",
    "avg_salary": "79200"
  },
  {
    "skills": "python",
    "avg_salary": "77186"
  },
  {
    "skills": "r",
    "avg_salary": "76667"
  },
  {
    "skills": "outlook",
    "avg_salary": "75068"
  },
  {
    "skills": "oracle",
    "avg_salary": "75068"
  },
  {
    "skills": "tableau",
    "avg_salary": "74435"
  },
  {
    "skills": "t-sql",
    "avg_salary": "64600"
  },
  {
    "skills": "vba",
    "avg_salary": "64600"
  },
  {
    "skills": "ms access",
    "avg_salary": "64600"
  },
  {
    "skills": "looker",
    "avg_salary": "64600"
  },
  {
    "skills": "sql server",
    "avg_salary": "64600"
  }
]
*/