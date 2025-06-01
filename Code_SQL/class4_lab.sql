SELECT  DISTINCT dept_name
FROM instructor;

SELECT 'I''m good. "Good"?';

SELECT lower('CHINA');

SELECT * FROM department
WHERE dept_name LIKE '%His%';

SELECT 'abc' LIKE 'abc%';
SELECT 'abc' LIKE 'a%';
SELECT 'abc' LIKE '_b_';
SELECT 'abc' LIKE 'c';

CREATE TABLE users(
    name varchar(10),
    gender char(1)
);

SELECT *
FROM users
WHERE name LIKE 'abc%d%'; --\%

SELECT name || ' from ' || dept_name
FROM student
WHERE tot_cred > 50;

SELECT name || ' from ' || dept_name || ' ' ||50
FROM student
WHERE tot_cred > 50;

SELECT * FROM instructor
WHERE name ~~ 'Z%';

(SELECT course_id
 FROM section
 WHERE semester = 'Fall' AND year = 2017)
UNION
(SELECT course_id
 FROM section
 WHERE semester = 'Spring' AND year =2018);

(SELECT course_id
 FROM section
 WHERE semester = 'Fall' AND year = 2017)
INTERSECT
(SELECT course_id
 FROM section
 WHERE semester = 'Spring' AND year =2018);