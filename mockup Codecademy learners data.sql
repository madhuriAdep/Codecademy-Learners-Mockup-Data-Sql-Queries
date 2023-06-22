SELECT *
FROM users
LIMIT 20;

SELECT *
FROM progress
LIMIT 20;


/* What are the top 25 schools (.edu domains) */
SELECT email_domain, COUNT(email_domain)
FROM users
WHERE email_domain LIKE '%.edu'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 25;


/* How many .edu learners are located in New York */
SELECT email_domain, city, COUNT(city)
FROM users
WHERE email_domain LIKE '%.edu'
	AND city LIKE 'New York'
GROUP BY 2
ORDER BY 3 DESC
LIMIT 25;

/* How many of Codecademy learners are using the mobile app */
SELECT mobile_app, COUNT(mobile_app)
FROM users
GROUP BY 1;


/* Using strftime to see do different schools prefer different courser? */
SELECT sign_up_at,
   strftime('%H', sign_up_at)
FROM users
GROUP BY 1
LIMIT 20;




/* Join renamed tables users as u and progress as p
Do different schools (.edu domains) prefer different courses? 
*/
SELECT
  city,
  country,
  u.email_domain,
  p.learn_cpp,
  p.learn_sql,
  p.learn_html,
  p.learn_javascript,
  p.learn_java 
FROM
  users u 
  LEFT JOIN
    progress p 
    ON u.user_id = p.user_id 		
WHERE
  p.learn_cpp != '' 
  OR p.learn_sql != '' 
  OR p.learn_html != '' 
  OR p.learn_javascript != '' 
  OR p.learn_java != '' 
GROUP BY
  3 
ORDER BY
  1 ASC;



/* What courses are the New Yorkers students taking?*/
SELECT
  city,
  country,
  u.email_domain,
  p.learn_cpp,
  p.learn_sql,
  p.learn_html,
  p.learn_javascript,
  p.learn_java 
FROM
  users u 
  LEFT JOIN
    progress p 
    ON u.user_id = p.user_id 	
WHERE
  city = 'New York' 
  AND 
  (
    p.learn_cpp != '' 
    OR p.learn_sql != '' 
    OR p.learn_html != '' 
    OR p.learn_javascript != '' 
    OR p.learn_java != '' 
  )
GROUP BY 
  3;


/* What courses are the Chicago students taking */
SELECT
  city,
  country,
  u.email_domain,
  p.learn_cpp,
  p.learn_sql,
  p.learn_html,
  p.learn_javascript,
  p.learn_java 
FROM
  users u 
  LEFT JOIN
    progress p 
    ON u.user_id = p.user_id 		
WHERE
  city = 'Chicago' 
  AND 
  (
    p.learn_cpp != '' 
    OR p.learn_sql != '' 
    OR p.learn_html != '' 
    OR p.learn_javascript != '' 
    OR p.learn_java != '' 
  )
GROUP BY 
  3;
