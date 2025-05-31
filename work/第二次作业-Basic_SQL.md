## 题目一

>假设拟在数据库添加一个关系，其关系模式是 users(name, pswd, gender)，并让`name`作为主码。请使用`CREATE TABLE`命令添加该关系.  

```sql
CREATE TABLE users(
    name varchar(10) primary key,
    pswd varchar(12),
    gender char(1)
);
```

## 题目二

> 考虑课堂中使用的大学数据库，包括如下关系：
> - course(course_id, title, dept_name, credits)
> - instructor(ID, name, dept_name, salary)
> - teaches(ID, course_id, sec_id, semester, year)
> - student(ID, name, dept_name, tot_cred)
> - takes(ID, course_id, sec_id, semester, year, grade)
> 
> 使用SQL语句完成下面的查询：
> 1. 找到在`计算机`学院开设的不少于`3`个`学分`的课程，并按`学分`进行升序排序。
> 2. 找到所有被名叫`图灵`的老师教过的学生的学号（`ID`），并确保结果没有重复。

```sql
# 1.
SELECT title, credits
FROM course
WHERE dept_name = '计算机' 
	AND credits >= 3
ORDER BY credits ASC;


# 2.a
SELECT DISTINCT takes.ID
FROM instructor, teaches, takes
WHERE instructor.ID = teaches.ID
	AND instructor.name = '图灵' 
	AND teaches.course_id = takes.course_id;
# 2.b
SELECT DISTINCT takes.ID
FROM instructor
JOIN teaches ON instructor.ID = teaches.ID
JOIN takes ON teaches.course_id = takes.course_id
WHERE instructor.name = '图灵'；
```

## 题目三
> 考虑题目二提到的关系模式，请问下面的SQL语句的含义是什么？
> 
> ```sql
> SELECT DISTINCT T.name
> FROM instructor AS T, instructor AS S
> WHERE T.salary > S.salary AND S.dept_name = '会计';
> ```

**含义：** 找到所有薪资大于至少一名`会计`学院教师薪资的教师的名字，并确保结果没有重复。