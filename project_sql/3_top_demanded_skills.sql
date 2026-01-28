SELECT 
skills,
COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
job_title_short = 'Data Analyst' AND 
job_work_from_home = True
GROUP BY skills
ORDER BY demand_count DESC 
LIMIT 5;



 /*[] {
    "skills": "sql",
    "demand_count": "7291"
  },
  {
    "skills": "excel",
    "demand_count": "4611"
  },
  {
    "skills": "python",
    "demand_count": "4330"
  },
  {
    "skills": "tableau",
    "demand_count": "3745"
  },
  {
    "skills": "power bi",
    "demand_count": "2609"
  }
]

SQL is the dominant required skill by a wide margin, with demand
 far exceeding all others, confirming it as the foundational skill for data analyst roles.

Spreadsheet and BI tools remain highly relevant, as Excel, Tableau, and 
Power BI together show strong demand, highlighting the continued importance 
of reporting, dashboards, and business-facing analytics.

Python is in high demand but secondary to SQL, suggesting that while programming is 
important, most analyst roles prioritize data querying and analysis over advanced software development.

Visualization skills are a core expectation, with Tableau and Power BI ranking prominently, indicating
 that communicating insights visually is a critical part of the role.

The most in-demand skills are broadly accessible, reflecting that many data analyst
 roles focus on operational and business analytics rather than highly specialized or niche technical expertise.
*/