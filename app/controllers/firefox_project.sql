-- How many of the total users completed the survey?
SELECT count(*)
FROM survey
WHERE (q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12,q13,q14) IS NOT NULL
;

-- of completed surveys, how many are new? New being a user for less than 1 year
SELECT COUNT(user_id)
FROM
(
  SELECT *
  FROM survey
  WHERE (q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12,q13,q14) IS NOT NULL
) a
WHERE q1 = '0' or q1 = '1' or q1 = '2'
;

-- of completed surveys, how many are long time users? longtime being a user for more than 1 year
SELECT COUNT(user_id)
FROM
(
  SELECT *
  FROM survey
  WHERE (q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12,q13,q14) IS NOT NULL
) a
WHERE  q1 = '3' or q1 = '4' or q1 = '5' or q1 = '6'
;

-- avg number of tabs
select avg(tabs)
from 
(
  select event_code,
          trim(TRAILING 'tabs' from data2)::int as tabs
  from events
  where event_code = 26 
  ) a
  ;



--What fraction of user have ever had more than five tabs open?
SELECT 
     AVG(tabs_over_5) AS pct_over_5
FROM    
    (
  SELECT user_id,
         --a.tabs,
  MAX(CASE 
      WHEN tabs > 5 THEN 1
      ELSE 0 END)  AS tabs_over_5
  FROM 
     (
    SELECT  user_id,
            event_code,
            TRIM (TRAILING ' tabs' from data2)::integer AS tabs
    FROM events
    WHERE event_code = 26
    )a
    GROUP BY 1
    )b
;

--What fraction of user have ever had more than ten tabs open?
SELECT 
     AVG(tabs_over_10) AS pct_over_10
FROM    
    (
  SELECT user_id,
         --a.tabs,
  MAX(CASE 
      WHEN tabs > 10 THEN 1
      ELSE 0 END)  AS tabs_over_10
  FROM 
     (
    SELECT  user_id,
            event_code,
            TRIM (TRAILING ' tabs' from data2)::integer AS tabs
    FROM events
    WHERE event_code = 26
    )a
    GROUP BY 1
    )b
;

--What fraction of user have ever had more than fifteen tabs open?
SELECT 
     AVG(tabs_over_15) AS pct_over_15
FROM    
    (
  SELECT user_id,
         --a.tabs,
  MAX(CASE 
      WHEN tabs > 15 THEN 1
      ELSE 0 END)  AS tabs_over_15
  FROM 
     (
    SELECT  user_id,
            event_code,
            TRIM (TRAILING ' tabs' from data2)::integer AS tabs
    FROM events
    WHERE event_code = 26
    )a
    GROUP BY 1
    )b
;


--AVG of user_avg_bookmarks
SELECT AVG(sub2.user_avg_bookmarks)
FROM
   (
  SELECT sub.user_id,
         AVG(sub.bookmarks) AS user_avg_bookmarks
  FROM 
     (
    SELECT user_id,
           event_code,
           TRIM (TRAILING ' total bookmarks' from data1)::integer bookmarks
    FROM events
    WHERE event_code = 8
      )sub
  GROUP BY 1
  ORDER BY 1
  )sub2
;


select avg(New_Bookmark_Added)
FROM
  (
  SELECT distinct(user_id),
         event_code,
         data1,
  CASE 
      WHEN data1 = 'New Bookmark Added' THEN 1
      ELSE 0 
  END AS New_Bookmark_Added
  FROM events
  WHERE event_code = 9
  ) a
;

---What is the % of users who use bookmarks? ( as comparison to tabs)
--Total users who use bookmarks = 10595
SELECT COUNT(distinct(user_id))
FROM events
WHERE event_code = 8
;

--Total users = 2400491
SELECT DISTINCT (COUNT(user_id))
FROM events
;

---What is the % of users who use bookmarks? ( as comparison to tabs)
--Total users who use bookmarks = 10595
SELECT COUNT(DISTINCT(user_id))
FROM events
WHERE event_code = 8
;

--Total users = 14718
SELECT COUNT(DISTINCT (user_id))
FROM events
;

--USER AVG BOOK MARKS
SELECT event_code,
       AVG(sub.bookmarks) AS user_avg_bookmarks
FROM 
   (
  SELECT user_id,
         event_code,
         TRIM (TRAILING ' total bookmarks' from data1)::integer bookmarks
  FROM events
  WHERE event_code = 8
    )sub
GROUP BY 1
ORDER BY 1
;

select distinct(user_id), event_code,
              trim(TRAILING 'tabs' from data2)::int as tabs,
              trim(TRAILING 'windows' from data1)::int as windows
      from events
      where event_code = 26
;
