WITH skills_demand AS (
SELECT 
skills_dim.skill_id, 
skills_dim.skills,
COUNT (skills_job_dim.job_id) AS demand_count 
FROM job_postings_fact 
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id 
WHERE 
job_title_short = 'Data Analyst' 
AND salary_year_avg IS NOT NULL AND 
job_work_from_home = true 
GROUP BY 
skills_dim.skill_id 
), average_salary AS (
SELECT 
skills_job_dim.skill_id,
ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact 
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id 
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
job_title_short = 'Data Analyst'
AND salary_year_avg IS NOT NULL 
AND job_work_from_home = true 
GROUP BY 
skills_job_dim.skill_id 
)

SELECT 
skills_demand.skill_id,
skills_demand.skills,
demand_count, 
avg_salary
FROM skills_demand
INNER JOIN average_salary ON skills_demand.skill_id = average_salary.skill_id 
WHERE 
demand_count >10 
ORDER BY 
avg_salary DESC, 
demand_count DESC
LIMIT 25;


SELECT 
skills_dim.skill_id,
skills_dim.skills,
COUNT(skills_job_dim.job_id) AS demand_count,
ROUND(AVG(job_postings_fact.salary_year_avg),0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id 
WHERE 
job_title_short = 'Data Analyst'
AND salary_year_avg IS NOT NULL
AND job_work_from_home = true 
GROUP BY 
skills_dim.skill_id
HAVING 
COUNT (skills_job_dim.job_id) >10
ORDER BY 
avg_salary DESC, 
demand_count DESC 
LIMIT 25;

/*
[
  {
    "skill_id": 8,
    "skills": "go",
    "demand_count": "27",
    "avg_salary": "115320"
  },
  {
    "skill_id": 234,
    "skills": "confluence",
    "demand_count": "11",
    "avg_salary": "114210"
  },
  {
    "skill_id": 97,
    "skills": "hadoop",
    "demand_count": "22",
    "avg_salary": "113193"
  },
  {
    "skill_id": 80,
    "skills": "snowflake",
    "demand_count": "37",
    "avg_salary": "112948"
  },
  {
    "skill_id": 74,
    "skills": "azure",
    "demand_count": "34",
    "avg_salary": "111225"
  },
  {
    "skill_id": 77,
    "skills": "bigquery",
    "demand_count": "13",
    "avg_salary": "109654"
  },
  {
    "skill_id": 76,
    "skills": "aws",
    "demand_count": "32",
    "avg_salary": "108317"
  },
  {
    "skill_id": 4,
    "skills": "java",
    "demand_count": "17",
    "avg_salary": "106906"
  },
  {
    "skill_id": 194,
    "skills": "ssis",
    "demand_count": "12",
    "avg_salary": "106683"
  },
  {
    "skill_id": 233,
    "skills": "jira",
    "demand_count": "20",
    "avg_salary": "104918"
  },
  {
    "skill_id": 79,
    "skills": "oracle",
    "demand_count": "37",
    "avg_salary": "104534"
  },
  {
    "skill_id": 185,
    "skills": "looker",
    "demand_count": "49",
    "avg_salary": "103795"
  },
  {
    "skill_id": 2,
    "skills": "nosql",
    "demand_count": "13",
    "avg_salary": "101414"
  },
  {
    "skill_id": 1,
    "skills": "python",
    "demand_count": "236",
    "avg_salary": "101397"
  },
  {
    "skill_id": 5,
    "skills": "r",
    "demand_count": "148",
    "avg_salary": "100499"
  },
  {
    "skill_id": 78,
    "skills": "redshift",
    "demand_count": "16",
    "avg_salary": "99936"
  },
  {
    "skill_id": 187,
    "skills": "qlik",
    "demand_count": "13",
    "avg_salary": "99631"
  },
  {
    "skill_id": 182,
    "skills": "tableau",
    "demand_count": "230",
    "avg_salary": "99288"
  },
  {
    "skill_id": 197,
    "skills": "ssrs",
    "demand_count": "14",
    "avg_salary": "99171"
  },
  {
    "skill_id": 92,
    "skills": "spark",
    "demand_count": "13",
    "avg_salary": "99077"
  },
  {
    "skill_id": 13,
    "skills": "c++",
    "demand_count": "11",
    "avg_salary": "98958"
  },
  {
    "skill_id": 186,
    "skills": "sas",
    "demand_count": "63",
    "avg_salary": "98902"
  },
  {
    "skill_id": 7,
    "skills": "sas",
    "demand_count": "63",
    "avg_salary": "98902"
  },
  {
    "skill_id": 61,
    "skills": "sql server",
    "demand_count": "35",
    "avg_salary": "97786"
  },
  {
    "skill_id": 9,
    "skills": "javascript",
    "demand_count": "20",
    "avg_salary": "97587"
  }
]


    1. The High-Value "Sweet Spot"While many skills pay well, Python and
    Tableau are the undisputed heavyweights.Python: Boasts the highest demand
    in the top list (236 postings) with a six-figure average
    salary ($101,397).Tableau: Follows closely with 230 postings
     and a solid salary of $99,288.R: Also shows strong staying power
     with 148 postings at $100,499.Insight: If you are looking for job
     security plus a high salary, these three are your "must-haves.
  "2. Top Earners: Niche & Cloud SkillsThe highest 
  salaries aren't necessarily tied to the most common tools. The 
  top of your list is dominated by specialized programming and cloud
   infrastructure:Go (Golang): The #1 highest paying 
    skill ($115,320), though demand is relatively 
    niche (27 postings).Cloud Platforms: 
     Snowflake ($112,948), Azure ($111,225), and
     AWS ($108,317) all command premium salaries.Insight:
     Transitioning from a generalist to a "Cloud Data Analyst" is 
      the fastest way to break the $110k barrier.
      3. The Efficiency of Your SQLYou provided
     two versions of the query.Query 1 (CTEs): Highly readable
     and great for debugging individual parts of the logic.
     Query 2 (Aggregated): Much more performant. By performing
     the COUNT and AVG in a single pass and using HAVING, you reduce
     the computational overhead required by the joins in
     the CTE version.4. Summary Table 
     of InsightsCategorySkillAvg
     SalaryDemandHighest PayGo$115,320Low 
     (27)Highest DemandPython$101,397High 
    (236)Best VisualizationTableau$99,288High 
    (230)Top Cloud ToolSnowflake$112,948Moderate 
    (37)Project MgmtConfluence/Jira~$110kLow 
    (~15)5. Unexpected Finding: Collaboration ToolsIt
      is interesting to see Confluence ($114,210) 
     and Jira ($104,918) ranking so high. This suggests that for
    remote roles, the ability to manage documentation and agile
    workflows is highly valued—sometimes more so than technical tools like 
    SQL Server or SAS.Note: You have a duplicate entry for
     SAS (Skill IDs 186 and 7). This often happens in raw datasets
     where a skill is categorized under two different IDs.