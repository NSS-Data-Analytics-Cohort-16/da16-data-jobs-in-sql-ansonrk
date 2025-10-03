--1)How many rows are in the data_analyst_jobs table?

Select count(*) AS total_rows
from data_analyst_jobs

--2. Write a query to look at just the first 10 rows. 
--What company is associated with the job posting on the 10th row?

Select company, days_since_posting
from data_analyst_jobs
limit 10


--3. How many postings are in Tennessee? 
--How many are there in either Tennessee or Kentucky?

select count(*) AS tn_posting
from data_analyst_jobs
where location = 'TN'

select count(*) tn_or_ky_posting
from data_analyst_jobs
where location IN ('TN', 'KY')

--4). How many postings in Tennessee have a star rating above 4?

select count(*) AS tn_posting
from data_analyst_jobs
where star_rating > 4 
and location = 'TN'

--5. How many postings in the dataset have a review count between 500 and 1000?

select count(*) AS rev_count
from data_analyst_jobs
where review_count between 500 and 1000

--6. Show the average star rating for companies in each state.
--The output should show the state as `state` and the average rating for the state as `avg_rating`.
--Which state shows the highest average rating?

select location AS state, round(avg(star_rating),2) AS avg_rating
from data_analyst_jobs
where star_rating is not null
group by location
order by avg_rating DESC

--7. Select unique job titles from the data_analyst_jobs table. How many are there?

select Distinct(title) AS num_title
from data_analyst_jobs

select count(distinct title)
from data_analyst_jobs

--8. How many unique job titles are there for California companies?

select location, count(distinct title)
from data_analyst_jobs
where location = 'CA'
group by location

--9. Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. 
--How many companies are there with more that 5000 reviews across all locations?

select company, round(avg(star_rating),2)
from data_analyst_jobs
where review_count > 5000
and company is not null
group by company


Select count(company) AS Num_Comp
from data_analyst_jobs
where review_count > 5000
group by company


--10. Add the code to order the query in #9 from highest to lowest average star rating.
--Which company with more than 5000 reviews across all locations in the dataset has the highest star rating?
--What is that rating?

select company, round(avg(star_rating),2)
from data_analyst_jobs
where review_count > 5000
and company is not null
group by star_rating, company
order by star_rating DESC

--11. Find all the job titles that contain the word ‘Analyst’. How many different job titles are there? 

Select Distinct(title) AS job_title
from data_analyst_jobs
where title ILIKE '%Analyst%'

select count(distinct title)
from data_analyst_jobs
where title ilike '%Analyst%'

--12. How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’?
--What word do these positions have in common?

select distinct (title) AS job_title
from data_analyst_jobs
where title NOT ILIKE '%Analyst%'
and title NOT ILIKE '%Analytics%'

--**BONUS:**
--You want to understand which jobs requiring SQL are hard to fill. Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks. 
-- - Disregard any postings where the domain is NULL. 
-- - Order your results so that the domain with the greatest number of `hard to fill` jobs is at the top. 
--  - Which three industries are in the top 3 on this list? How many jobs have been listed for more than 3 weeks for each of the top 3?

Select count(*) AS hard_to_fill_jobs, company
from data_analyst_jobs
where domain IS NOT NULL
AND skill LIKE '%SQL%'
AND days_since_posting > 21
group by domain, company
order by hard_to_fill_jobs DESC

Select count(*) AS hard_to_fill_jobs, company
from data_analyst_jobs
where domain IS NOT NULL
AND skill LIKE '%SQL%'
AND days_since_posting > 21
group by domain, company
order by hard_to_fill_jobs DESC
limit 3


