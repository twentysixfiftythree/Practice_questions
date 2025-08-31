-- https://datalemur.com/questions/sql-histogram-tweets
WITH tweetperuser AS (
SELECT COUNT(tweet_id) as count_per_user, user_id FROM tweets 
WHERE tweet_date BETWEEN '2022-01-01' AND '2022-12-31'
GROUP BY user_id

)
SELECT COUNT(user_id) AS users_num, count_per_user AS tweet_bucket FROM tweetperuser
GROUP BY count_per_user


-- https://datalemur.com/questions/matching-skills

WITH ThreeSkills AS (
SELECT * FROM candidates WHERE skill = 'Python' OR skill = 'Tableau' OR skill = 'PostgreSQL'
)
SELECT candidate_id  FROM ThreeSkills
GROUP BY candidate_id
HAVING COUNT(*) = 3;

-- https://datalemur.com/questions/sql-page-with-no-likes
SELECT p.page_id
FROM pages p
LEFT JOIN page_likes l ON p.page_id = l.page_id
WHERE l.page_id IS NULL;


-- https://datalemur.com/questions/tesla-unfinished-parts
SELECT part, assembly_step FROM parts_assembly WHERE finish_date IS NULL;

-- https://datalemur.com/questions/laptop-mobile-viewership

SELECT (SELECT COUNT(user_id) FROM viewership WHERE device_type = 'phone' OR device_type = 'tablet') as mobile_views,
(SELECT COUNT(user_id) FROM viewership WHERE device_type = 'laptop') as laptop_views