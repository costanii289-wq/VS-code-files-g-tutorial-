# Introduction
Connect with the trends from the job market in 2023 by exploring high demands and salaries in this project.
# background 
This project is the frutification of my passion for turning raw numbers into
real meaning. Compelled by the desire of understanding how analyzing data really works in a real scenario, I decided to dive into the Lukebarousse's course to learn the ropes of analyzing the data, from learning basic queries to work in my first experience with a guided project. 

 Data hails from my [SQL Course] (https://lukebarousse.com/sql) Where I had my first experience applying concepts to a project. 

### The questions I wanted to answer through my SQL queries were: 
1. What are the top_paying data analyst jobs? 
2. What skills are required for these top-paying jobs? 
3. What skills are most in demand for data analysts? 
4. Which skills are associated with higher salaries? 
5. What are the most optimal skills to learn? 

# Tools that were used
The essential tools for this project listed by Luke Barousse were 
Visual Studio, SQL, posgres and I personally used Excel for the charts depicted in this project

# The Analysis 
The following shows the analysis I made following along the Luke barousse course trying to reach my own findings throughout the data. 

### 1. Top Paying Data Analyst Jobs:  
In this first query, we tried to find the 10 most paying roles for data analysts remotely focusing in the job postings including salaries only.
The goal was to get an insight of what were the optimal roles and skills as 
a data analyst.

```sql
 SELECT 
 job_id,
 job_title,
 job_location,
 job_schedule_type, 
 salary_year_avg, 
 job_posted_date,
 name AS company_name
 FROM 
 job_postings_fact
 LEFT JOIN company_dim ON 
 job_postings_fact.company_id = company_dim.company_id
 WHERE 
 job_title_short LIKE '%Data Analyst%' AND
 job_location = 'Anywhere' AND
 salary_year_avg IS NOT NULL
 ORDER BY 
 salary_year_avg DESC 
 LIMIT 10
 ``` 
We wanted to identify analyst roles that were available remotely, so we used the WHERE keyword, to retrieve the role of data analysts and the location "anywhere" or if you will "remote" from our query and, to pull salaries from the data where the figures weren't NULL. 
We used a ORDER BY to sort the salaries from the highest to the lowest, and the LIMIT to filter the 10 top paying job postings in Data Analysis.
Later on, we added a LEFT JOIN to connect the job_postings_fact table with company_dim, and we added in SELECT the column name AS company_name for the thorough visualization of the company names in the data

**The results from our query**
![alt text](<Table and chart from query 1-3.png>)

| Job ID  | Job Title                                           | Location | Schedule  | Avg Salary ($) | Posted Date           | Company                     |
|--------:|-----------------------------------------------------|----------|-----------|---------------:|-----------------------|-----------------------------|
| 226942  | Data Analyst                                        | Anywhere | Full-time | 650,000        | 2023-02-20            | Mantys                      |
| 547382  | Director of Analytics                               | Anywhere | Full-time | 336,500        | 2023-08-23            | Meta                        |
| 552322  | Associate Director – Data Insights                  | Anywhere | Full-time | 255,829.5      | 2023-06-18            | AT&T                        |
| 99305   | Data Analyst, Marketing                              | Anywhere | Full-time | 232,423        | 2023-12-05            | Pinterest                   |
| 1021647 | Data Analyst (Hybrid/Remote)                         | Anywhere | Full-time | 217,000        | 2023-01-17            | UCLA Health                 |
| 168310  | Principal Data Analyst (Remote)                     | Anywhere | Full-time | 205,000        | 2023-08-09            | SmartAsset                  |
| 731368  | Director, Data Analyst – Hybrid                     | Anywhere | Full-time | 189,309        | 2023-12-07            | Inclusively                 |
| 310660  | Principal Data Analyst, AV Performance Analysis     | Anywhere | Full-time | 189,000        | 2023-01-05            | Motional                    |
| 1749593 | Principal Data Analyst                               | Anywhere | Full-time | 186,000        | 2023-07-11            | SmartAsset                  |
| 1638595 | Senior Data Analyst                                  | Anywhere | Full-time | 185,000        | 2023-08-15            | Patterned Learning AI       |


**We found what are the top paying roles for a data analyst in this first query showing us the the top paying roles are:**
- Data Analyst
- Director of Analytics 
- Associate Director - Data Insights 
- Data Analyst, Marketing 
- Data Analyst (Hybrid/Remote)
- Director, Data Analyst (remote)
- Director, Data Analyst - HYBRID 
- Principal Data Analyst - AV Performance Analysis 
- Principal Data Analyst 
- Senior Data Analyst 

### 2. Top paying job skills
We needed to find out within these roles the top paying skills which were the main reason why the average salaries depicted in the first query were so high. 
Then, we created a new file named 2_top_paying_job_skills.sql for our second query.

```SQL
WITH top_paying_jobs AS (
 
    SELECT 
    job_id,
    job_title,
    salary_year_avg,
    name AS company_name
    FROM 
    job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE 
    job_title_short LIKE '%Data Analyst%' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
    ORDER BY 
    salary_year_avg DESC 
    LIMIT 10
)

SELECT 
top_paying_jobs.*,
skills 
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY 
salary_year_avg DESC;
```

What we did right after was copying the first query and pasting it on the second one. We needed to combine the top paying roles with the top paying skills and join one another. Therefore, we made a CTE within the query adding the key word WITH to include all the statement lines from the previous pasted query to our second one. To add the column containing the skill names, we used an INNER JOIN to connect to the skills_job_dim were it contained the skill names we were looking for. 
To select all the columns from the table top_paying jobs, we added a .* and Skills fom the dim table in the SELECT. 
To sort the rows from the table by the salary, we used the ORDER BY key word and added salary_year_avg in the next line, and we added DESC key word to sort the rows by the highest to the lowest salary. 

**These are the results we retrieved with our query** 

| Job ID | Job Title | Salary (Avg) | Company | Skill |
| :--- | :--- | :--- | :--- | :--- |
| 552322 | Associate Director- Data Insights | $255,830 | AT&T | SQL |
| 552322 | Associate Director- Data Insights | $255,830 | AT&T | Python |
| 552322 | Associate Director- Data Insights | $255,830 | AT&T | R |
| 552322 | Associate Director- Data Insights | $255,830 | AT&T | Azure |
| 552322 | Associate Director- Data Insights | $255,830 | AT&T | Databricks |
| 552322 | Associate Director- Data Insights | $255,830 | AT&T | AWS |
| 552322 | Associate Director- Data Insights | $255,830 | AT&T | Pandas |
| 552322 | Associate Director- Data Insights | $255,830 | AT&T | Pyspark |
| 552322 | Associate Director- Data Insights | $255,830 | AT&T | Jupyter |
| 552322 | Associate Director- Data Insights | $255,830 | AT&T | Excel |
| 552322 | Associate Director- Data Insights | $255,830 | AT&T | Tableau |
| 552322 | Associate Director- Data Insights | $255,830 | AT&T | Power Bi |
| 552322 | Associate Director- Data Insights | $255,830 | AT&T | Powerpoint |
| 99305 | Data Analyst, Marketing | $232,423 | Pinterest Job Advertisements | SQL |
| 99305 | Data Analyst, Marketing | $232,423 | Pinterest Job Advertisements | Python |
| 99305 | Data Analyst, Marketing | $232,423 | Pinterest Job Advertisements | R |
| 99305 | Data Analyst, Marketing | $232,423 | Pinterest Job Advertisements | Hadoop |
| 99305 | Data Analyst, Marketing | $232,423 | Pinterest Job Advertisements | Tableau |
| 1021647 | Data Analyst (Hybrid/Remote) | $217,000 | Uclahealthcareers | SQL |
| 1021647 | Data Analyst (Hybrid/Remote) | $217,000 | Uclahealthcareers | Crystal |
| 1021647 | Data Analyst (Hybrid/Remote) | $217,000 | Uclahealthcareers | Oracle |
| 1021647 | Data Analyst (Hybrid/Remote) | $217,000 | Uclahealthcareers | Tableau |
| 1021647 | Data Analyst (Hybrid/Remote) | $217,000 | Uclahealthcareers | Flow |
| 168310 | Principal Data Analyst (Remote) | $205,000 | SmartAsset | SQL |
| 168310 | Principal Data Analyst (Remote) | $205,000 | SmartAsset | Python |
| 168310 | Principal Data Analyst (Remote) | $205,000 | SmartAsset | GO |
| 168310 | Principal Data Analyst (Remote) | $205,000 | SmartAsset | Snowflake |
| 168310 | Principal Data Analyst (Remote) | $205,000 | SmartAsset | Pandas |
| 168310 | Principal Data Analyst (Remote) | $205,000 | SmartAsset | Numpy |
| 168310 | Principal Data Analyst (Remote) | $205,000 | SmartAsset | Excel |
| 168310 | Principal Data Analyst (Remote) | $205,000 | SmartAsset | Tableau |
| 168310 | Principal Data Analyst (Remote) | $205,000 | SmartAsset | Gitlab |
| 731368 | Director, Data Analyst - HYBRID | $189,309 | Inclusively | SQL |
| 731368 | Director, Data Analyst - HYBRID | $189,309 | Inclusively | Python |
| 731368 | Director, Data Analyst - HYBRID | $189,309 | Inclusively | Azure |
| 731368 | Director, Data Analyst - HYBRID | $189,309 | Inclusively | AWS |
| 731368 | Director, Data Analyst - HYBRID | $189,309 | Inclusively | Oracle |
| 731368 | Director, Data Analyst - HYBRID | $189,309 | Inclusively | Snowflake |
| 731368 | Director, Data Analyst - HYBRID | $189,309 | Inclusively | Tableau |
| 731368 | Director, Data Analyst - HYBRID | $189,309 | Inclusively | Power Bi |
| 731368 | Director, Data Analyst - HYBRID | $189,309 | Inclusively | SAP |
| 731368 | Director, Data Analyst - HYBRID | $189,309 | Inclusively | Jenkins |
| 731368 | Director, Data Analyst - HYBRID | $189,309 | Inclusively | Bitbucket |
| 731368 | Director, Data Analyst - HYBRID | $189,309 | Inclusively | Atlassian |
| 731368 | Director, Data Analyst - HYBRID | $189,309 | Inclusively | Jira |
| 731368 | Director, Data Analyst - HYBRID | $189,309 | Inclusively | Confluence |
| 310660 | Principal Data Analyst, AV Performance Analysis | $189,000 | Motional | SQL |
| 310660 | Principal Data Analyst, AV Performance Analysis | $189,000 | Motional | Python |
| 310660 | Principal Data Analyst, AV Performance Analysis | $189,000 | Motional | R |
| 310660 | Principal Data Analyst, AV Performance Analysis | $189,000 | Motional | Git |
| 310660 | Principal Data Analyst, AV Performance Analysis | $189,000 | Motional | Bitbucket |
| 310660 | Principal Data Analyst, AV Performance Analysis | $189,000 | Motional | Atlassian |
| 310660 | Principal Data Analyst, AV Performance Analysis | $189,000 | Motional | Jira |
| 310660 | Principal Data Analyst, AV Performance Analysis | $189,000 | Motional | Confluence |
| 1749593 | Principal Data Analyst | $186,000 | SmartAsset | SQL |
| 1749593 | Principal Data Analyst | $186,000 | SmartAsset | Python |
| 1749593 | Principal Data Analyst | $186,000 | SmartAsset | GO |
| 1749593 | Principal Data Analyst | $186,000 | SmartAsset | Snowflake |
| 1749593 | Principal Data Analyst | $186,000 | SmartAsset | Pandas |
| 1749593 | Principal Data Analyst | $186,000 | SmartAsset | Numpy |
| 1749593 | Principal Data Analyst | $186,000 | SmartAsset | Excel |
| 1749593 | Principal Data Analyst | $186,000 | SmartAsset | Tableau |
| 1749593 | Principal Data Analyst | $186,000 | SmartAsset | Gitlab |
| 1638595 | Senior Data Analyst | $185,000 | Patterned Learning AI | SQL |
| 1638595 | Senior Data Analyst | $185,000 | Patterned Learning AI | Python |
| 1638595 | Senior Data Analyst | $185,000 | Patterned Learning AI | HTML |
| 1638595 | Senior Data Analyst | $185,000 | Patterned Learning AI | CSS |
| 1638595 | Senior Data Analyst | $185,000 | Patterned Learning AI | AWS |
| 1638595 | Senior Data Analyst | $185,000 | Patterned Learning AI | Keras |
| 1638595 | Senior Data Analyst | $185,000 | Patterned Learning AI | Angular |
| 1638595 | Senior Data Analyst | $185,000 | Patterned Learning AI | Flask |
| 1638595 | Senior Data Analyst | $185,000 | Patterned Learning AI | Fastapi |
| 1638595 | Senior Data Analyst | $185,000 | Patterned Learning AI | Windows |

 What we found is that the high paying roles are leading in the principal-level positions, such as Director, Associated Director and 
 Principal Daata Analysts, Salaries ranging from $185K to $255K, indicating that seniority strongly correlates with compensation

### 3. Most demanded skills 
In this section, We decided to write the query a bit different because the previous one was quite long and it would take ages to load the data we needed for.   


```SQL
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
```
We created the file 3_top_demanded_skills, giving focus in the most advanced skills, we used INNER JOIN to join the tables Job_postings_fact with job_skills table reusing some codes we made previously for this new one. We limited to top 5 skills focusing in all job postings. From the previous query we copied the statements from the keywords FROM, and the double INNER JOIN and pasted in our third query making small adjustments like renaminng the table being selected. We made an aggregation sum of all demanding skills, using the COUNT key word to count all the agregated values and we did GROUP BY for the skills, and we ORDER BY the demand_count to sort by the order of the top skills. We added a WHERE key word to make sure that all the skills are related to the Data Analyst Role

| Skill     | Demand Count |
|-----------|--------------|
| SQL       | 7291         |
| Excel     | 4611         |
| Python    | 4330         |
| Tableau   | 3745         |
| Power BI  | 2609         |

![alt text](<Chart Query 3-1.png>)
**The chart gives us a better view of the importance of SQL for the Data Analyst role, a skill that can't be missing**


### 4. Top paying skills 
Here we tried to answer the question about what is the high paying skill, finding the average salary associated with a skill, specific for Data Analyst roles and making sure that all salaries are included without any NULL values.


```SQL 
SELECT 
skills,
ROUND (AVG (salary_year_avg) , 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
job_title_short = 'Data Analyst' AND 
salary_year_avg IS NOT NULL AND
job_work_from_home = True
GROUP BY skills
ORDER BY avg_salary DESC
LIMIT 25;
```
We created a new document called 4_top_paying_skills for our new query. 
As we did in our previous query, we retrieved the Skills_dim table for we needed the names on it, and we also retrieved the salary data from the Job Postings Fact table, and then, we did an average aggregation. 
We copied the previous query making some slightly changes to fit our purposes on looking for the average salary aggregation.
We updated the GROUP BY for skills, and replace the LIMIT from 5 to 25. Therefore we made the statement salary_year_avg IN NOT NULL for retriving values with figures only, we add an alias AS avg_salary then, ORDER BY sorting by avg_salary in descendent order with the key word DESC. To round up the numbers in our query we used the ROUND key word.

These are the results we got running the Query: 

| Skill           | Average Salary ($) |  
|-----------------|--------------------|
| pyspark         | 208,172            |
| bitbucket       | 189,155            |
| couchbase       | 160,515            |
| watson          | 160,515            |
| datarobot       | 155,486            |
| gitlab          | 154,500            |
| swift           | 153,750            |
| jupyter         | 152,777            |
| pandas          | 151,821            |
| elasticsearch   | 145,000            |
| golang          | 145,000            |
| numpy           | 143,513            |
| databricks     | 141,907            |
| linux           | 136,508            |
| kubernetes      | 132,500            |
| atlassian       | 131,162            |
| twilio          | 127,000            |
| airflow         | 126,103            |
| scikit-learn    | 125,781            |
| jenkins         | 125,436            |
| notion          | 125,000            |
| scala           | 124,903            |
| postgresql      | 123,879            |
| gcp             | 122,500            |
| microstrategy   | 121,619            |

From this data we can tell that a lot of special skills are required, so with that being said, the highest salaries are not driven by the classic data analyst skills alone. The top-paying skills are heavily skewed toward data engineering, big data processing, and machine-learning platforms. Tools like PySpark, Databricks, and enterprise ML systems sit at the top of the salary range, which strongly suggests that companies are willing to pay a premium for people who can build, scale, and productionize data systems, not just analyze outputs.


### 5. Optimal skills
Here we needed to find out what were the most optimal skills to learn for a data analyst, calculating high demand and salaries. 


```SQL
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
```
We decided to combine the two results from the Query 3 and 4 in the skill ID in the query 5, so we created a new file called 5_optimal_skills.sql.  
Then, we made a CTE using WITH skills_demand and alias AS and creating a parentheses and adding both query 3 and within it.
Right after, we added another CTE using Average salary.
Then we combined both skills_id from both CTE. 
 We sorted in both CTEs ORDER BY skill_id, and also making sure that both salary_year_avg IS NOT NULL, we copied the salary_year_avg IS NOT NULL from the CTE average_salary to skills_demand, But we ran into a serie of errors throught the process of trying to retrieve the data. Thus, we changed removing the skills because the SQL demands it to be GROUP BY, but we kept running into errors, but these were caused by a few typos in the query. 
 After many trials, we got the results, but out of order we with low demand counts, so we needed to organized it by from the highest to the lowest keeping the high salaries in mind. We added the WHERE key word to make sure the demand were greater than 10. 
 But we decided to do a more conscise query by rewriting it again by combining all the select statements from the previous version whose were spread out among those two CTEs into one. 

```sql
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
```
We couldn't put an aggregation method inside of a WHERE statement, so we used the HAVING key word, and these are the results we got.  

| skill_id | skills     | demand_count | avg_salary |
|---------:|------------|-------------:|-----------:|
| 8        | go         | 27           | 115320     |
| 234      | confluence | 11           | 114210     |
| 97       | hadoop     | 22           | 113193     |
| 80       | snowflake  | 37           | 112948     |
| 74       | azure      | 34           | 111225     |
| 77       | bigquery   | 13           | 109654     |
| 76       | aws        | 32           | 108317     |
| 4        | java       | 17           | 106906     |
| 194      | ssis       | 12           | 106683     |
| 233      | jira       | 20           | 104918     |
| 79       | oracle     | 37           | 104534     |
| 185      | looker     | 49           | 103795     |
| 2        | nosql      | 13           | 101414     |
| 1        | python     | 236          | 101397     |
| 5        | r          | 148          | 100499     |
| 78       | redshift   | 16           | 99936      |
| 187      | qlik       | 13           | 99631      |
| 182      | tableau    | 230          | 99288      |
| 197      | ssrs       | 14           | 99171      |
| 92       | spark      | 13           | 99077      |
| 13       | c++        | 11           | 98958      |
| 186      | sas        | 63           | 98902      |
| 7        | sas        | 63           | 98902      |
| 61       | sql server | 35           | 97786      |
| 9        | javascript | 20           | 97587      |

 **The High-Value "Sweet Spot"** While many skills pay well, Python and
    Tableau are the undisputed heavyweights.Python: Boasts the highest demand
    in the top list (236 postings) with a six-figure average
    salary ($101,397).Tableau: Follows closely with 230 postings
     and a solid salary of $99,288.R: Also shows strong staying power
     with 148 postings at $100,499.Insight: If you are looking for job
     security plus a high salary, these three are your "must-haves.

# What I learned  
It was an introductory project for my journey as data analyst, I learned how to query data, analyze it, using tools and figuring out through my mistakes. I'm glad for making this first project a reality although guided by LukeBarousse Sql course. This journey was really important because I could highlight my weak spots, the things that I need to work on are my understanding of abstract concepts, soft skills and in_depth analysis

# Conclusions 

- 1 - There is a variety of salaries offered to remote job seekers for data analyst roles. The highest salary for a data analyst role is around $650,000.
- 2 - On every high paying roles, SQL and Excel and a mix of hybrid skills like Python, R are a must. 
- 3 - SQL by far is the most important skill set to learn for a data analyst, following by Excel, Python, Tableau and Power BI. 
- 4 - Machine learning, cloud, skills related to production environments are highly paid
- 5 - Python and Tableau are the heavyweight of optimal skills. 


What we found in this data is that, data analyst roles offer high paying jobs for those willing to learn and dive into learning the most important tools for day-to-day work. Nevertheless, it's important to keep up with the new trends of the job market for data analyst roles as it evolves time to time. 

# Acknowledgements 
My special thanks to my Tutor Marius for the help and guidance through my learning process in this project, also my special thanks to LukeBarousse for providing this complete course that is completely accessible even for the less fortunate to gain one of the most important skills for a data analyst. And my thanks to Coursera for teaching the abstract part of data analysis, bringing analysis into a human enviroment outside of the technical prospective. 



