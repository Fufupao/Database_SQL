--- 中期测试
--- (1)
SELECT SUM(S#)
FROM S
GROUP BY S#;

SELECT COUNT(*)
FROM S;

--- (2)
SELECT SN, C#, GRADE
FROM S
LEFT JOIN SC
ON S.S# = SC.S#;

--- (3)
SELECT C.*
FROM C
JOIN (
    SELECT C#, COUNT(*) AS 选修人数
    FROM SC
    GROUP BY C#
    HAVING COUNT(*) BETWEEN 5 AND 10
) AS CourseCount ON C.C# = CourseCount.C#;

--- （4）
SELECT S#
FROM SC
GROUP BY S#
HAVING COUNT(*) >= 2;