-- 运行第2次作业的题目三代码。注意：把原题目中的`会计`改成`History`
SELECT DISTINCT T.name
FROM instructor AS T, instructor AS S
WHERE T.salary > S.salary AND S.dept_name = 'History';

-- 在PG中使用至少三种方法实现找到所有以`S`开头教师的名字。
-- 方法1 ~ LIKE
SELECT name
FROM instructor
WHERE name LIKE 'S%';
-- 方法2 ~ SIMILAR TO Regular Expressions
SELECT name
FROM instructor
where name SIMILAR TO 'S%';
-- 方法3 ~ POSIX Regular Expressions
SELECT name
FROM instructor
where name ~ 'S.*';