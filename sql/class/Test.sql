--- 1.1
SELECT id, COUNT(sec_id)
FROM teaches
GROUP BY id ;

--- 1.2
SELECT instructor.id, COUNT(sec_id)
FROM instructor
LEFT JOIN teaches
ON instructor.id = teaches.id
GROUP BY instructor.id ;

--- 1.3
SELECT instructor.ID ,
    (SELECT COUNT(sec_id)
     FROM teaches
     WHERE teaches.ID = instructor.ID)
FROM instructor;

--- 1.5
select *
from section natural join classroom;
--- 使用using
select *
from section inner join classroom
using(building, room_number);


--- 2.1
--- 创建关系
CREATE TABLE emp_bonus(
    emp_no INT,
    received DATE,
    type INT
);

CREATE TABLE emp(
    emp_no INT PRIMARY KEY ,
    ename VARCHAR(50),
    sal DECIMAL(10,2),
    dept_no INT
);

--- 导入数据
--- emp_bonus
INSERT INTO emp_bonus (emp_no, received, type) VALUES
(7934, TO_DATE('17-MAR-2005', 'DD-MON-YYYY'), 1),
(7934, TO_DATE('15-FEB-2005', 'DD-MON-YYYY'), 2),
(7839, TO_DATE('15-FEB-2005', 'DD-MON-YYYY'), 3),
(7782, TO_DATE('15-FEB-2005', 'DD-MON-YYYY'), 1);

--- emp
INSERT INTO emp (emp_no, ename, sal, dept_no) VALUES
(7934, 'ALICE', 4000.00, 42),
(7839, 'BOD', 7000.00, 42),
(7782, 'CINDY', 10000.00, 42);

--- 2.2
SELECT
    (SELECT SUM(sal)
     FROM emp
     WHERE dept_no = 42) AS total_salary, --- 计算总工资
    (SELECT SUM(emp.sal *
           CASE emp_bonus.type
               WHEN 1 THEN 0.10
               WHEN 2 THEN 0.20
               WHEN 3 THEN 0.30
           END)
     FROM emp
     JOIN emp_bonus
     USING(emp_no)
     WHERE emp.dept_no = 42) AS total_bonus; --- 计算总奖金


