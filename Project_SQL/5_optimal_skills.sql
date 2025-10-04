/* 
What are the most optimal skills to learn?(High demand and High paying)
-Identify skills in high demand and associated with high average salaries for data analyst roles.
-Concentrates on remote positions with specified salaries.
-why? Target skills that offer job security(high demand) and finanacial benefits (high salaries), offering strategic insights for 
 career development in data analysis. */
 
with demand_skills AS (
    SELECT
        skills_dim.skill_id,
        skills_dim.skills,
        count(skills_job_dim.skill_id) as demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_postings_fact.job_title_short = 'Data Analyst' AND
        salary_year_avg IS NOT NULL AND
        job_work_from_home = True
    GROUP BY
        skills_dim.skill_id
), salary_skills AS (
    SELECT
        skills_job_dim.skill_id,       
        ROUND(avg(salary_year_avg),0) as avg_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_postings_fact.job_title_short = 'Data Analyst' AND
        salary_year_avg IS NOT NULL AND
        job_work_from_home = True
    GROUP BY
        skills_job_dim.skill_id
)
SELECT
    demand_skills.skill_id,
    demand_skills.skills,
    demand_count,
    avg_salary
FROM demand_skills
INNER JOIN salary_skills ON demand_skills.skill_id = salary_skills.skill_id
WHERE
    demand_count > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25

-- rewriting this same query as more concisely

SELECT
    skills_dim.skill_id, 
    skills_dim.Skills,
    COUNT(skills_job_dim.skill_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg),0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_postings_fact.job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL AND
    job_work_from_home = True
GROUP BY
    skills_dim.skill_id
HAVING 
    COUNT(skills_job_dim.skill_id) > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25
    