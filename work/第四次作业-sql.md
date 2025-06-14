## 题目一

>请问下面的SQL语句是否合法？用实验验证你的想法。你从实验结果能得到什么结论？

```sql
SELECT dept_name, min(salary)
FROM instructor;

SELECT dept_name, min(salary)
FROM instructor
GROUP BY dept_name
HAVING name LIKE '%at%';

SELECT dept_name
FROM instructor
WHERE AVG(salary) > 20000;
```

**回答：** 以上SQL语句均不合法。

**实验验证结果：** 
1.

![](attachments/第四次作业-sql/4-img-20250402145446.png)

2.

![](attachments/第四次作业-sql/4-img-20250402145553.png)

3.

![](attachments/第四次作业-sql/4-img-20250402145643.png)

**结论：**

1. 使用聚合函数（如`min()`）时，如果同时选取了非聚合列（如`dept_name`），就必须用`GROUP BY`子句对非聚合列进行分组。
2. `HAVING`子句只能用来筛选分组结果，其筛选条件里的列必须是`GROUP BY`子句中的列或者聚合函数的结果。
3. `WHERE`子句不能直接使用聚合函数。聚合函数要在分组后使用，一般是和`GROUP BY`子句以及`HAVING`子句搭配。

## 题目二
> 1. 找到工资最高员工的名字，假设工资最高的员工只有一位（至少两种写法）。
> 2. 找到工资最高员工的名字，假设工资最高的员工有多位（试试多种写法）。
> 3. 解释下面四句。

```sql
SELECT 1 IN (1);

SELECT 1 = (1);

SELECT (1, 2) = (1, 2);

SELECT (1) IN (1, 2);
```

**解答：**
1.找到工资最高员工的名字，假设工资最高的员工只有一位

```sql
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
```

2.找到工资最高员工的名字，假设工资最高的员工有多位（试试多种写法）。

```sql
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
```

3.解释下面四句。

```sql
SELECT 1 IN (1);
```

**含义：** 判断 `1` 是否存在于集合 `(1)` 之中。`(1)` 是单元素集合，等价于 `(1,)`。
**结果：** 返回 `1`，即`TRUE`。

```sql
SELECT 1 = (1);
```

**含义：** 判断 `1` 和 `(1)` 是否相等。`(1)` 在这里仅表示运算优先级，不影响实际值， 等价于 `1 = 1`。
**结果：** 返回 `1`，即`TRUE`。

```sql
SELECT (1, 2) = (1, 2);
```

**含义：** 判断元组 `(1, 2)` 与元组 `(1, 2)` 是否相等。逐元素对比，要求顺序和值完全一致。
**结果：** 返回 `1`，即`TRUE`。

```sql
SELECT (1) IN (1, 2);
```

**含义：** 判断 `(1)` 是否存在于集合 `(1, 2)` 中。左侧的 `(1)`实际被解析为标量值 `1`，即执行`1 IN (1,2)`
**结果：** 返回 `1`，即`TRUE`。