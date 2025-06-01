-- 验证下面SQL语句是否合法
SELECT dept_name, min(salary)
FROM instructor;

SELECT dept_name, min(salary)
FROM instructor
GROUP BY dept_name
HAVING dept_name LIKE '%at%';

SELECT dept_name
FROM instructor
WHERE AVG(salary) > 20000;

-- 找到工资最高员工的名字，假设工资最高的员工只有一位
--- METHOD 1
SELECT name, salary
FROM instructor
WHERE salary = (SELECT max(salary)
                FROM instructor);
--- METHOD 2
SELECT name, salary
FROM instructor
WHERE salary >= ALL(SELECT salary
                   FROM instructor);
--- METHOD 3
SELECT name, salary
FROM instructor
ORDER BY salary DESC
LIMIT 1;

-- 找到工资最高员工的名字，假设工资最高的员工有多位
--- METHOD 1
SELECT name, salary
FROM instructor
WHERE salary = (SELECT max(salary)
                FROM instructor);
--- METHOD 2
SELECT name, salary
FROM instructor
WHERE salary >= ALL(SELECT salary
                   FROM instructor);
--- METHOD 3
SELECT name, salary
FROM (
  SELECT *,
         DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk
  FROM instructor
) AS ranked
WHERE rnk = 1;

