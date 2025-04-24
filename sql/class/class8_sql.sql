SELECT *
FROM student LEFT OUTER JOIN takes
ON student.id = takes.id;

SELECT *
FROM student INNER JOIN takes
ON student.id = takes.id;

-- on换成where
SELECT *
FROM student LEFT OUTER JOIN takes
WHERE student.id = takes.id; --报错

SELECT *
FROM student LEFT OUTER JOIN takes
ON TRUE
WHERE student.id = takes.id;

SELECT *
FROM student INNER JOIN takes
ON student.id = takes.id
WHERE student.id = takes.id; -- 只有 INNER JOIN 才能把 on 换成 where

-- a LEFT OUTER JOIN b
-- 返回 a

-- 让尚未选课的学生出现在列表中
SELECT *
FROM student LEFT JOIN takes
ON student.id = takes.id;
-- 使用 NATURAL JOIN 改写上述语句
SELECT *
FROM student
NATURAL LEFT JOIN takes;