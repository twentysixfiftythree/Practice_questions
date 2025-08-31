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