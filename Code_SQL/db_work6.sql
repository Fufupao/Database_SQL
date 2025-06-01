---1.1 使用join得到每个学院的名字（dept_name）及每个学院的老师总数。
SELECT department.dept_name, COUNT(id) as total_instructor
FROM department
LEFT JOIN instructor
ON department.dept_name = instructor.dept_name
GROUP BY department.dept_name ;