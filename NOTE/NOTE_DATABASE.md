# NOTE_DATABASE

> 杨馥蔓 | 42233047 | 数据科学与大数据技术

---

## WEEK 02 | Relational model

### - 核心内容 | CLASS 02 | 2025/3/6

- 关系- 元组(tuple) & 属性(attribute)   ~~ 表- 行&列
- schema
- **key：** super key、candidate key、<u>primary key</u>、foreign key
- **关系代数：**
	- `select` $\sigma$  （对**行**截取，水平）
	- `project` $\Pi$  （对**列**截取，垂直，可以在属性上进行简单计算）
	- `join` $\Join$ , `natural join`（相同名称的属性值相等）
	- 笛卡尔积，谓词(><=≥≤≠)，逻辑词($\land\vee\neg$)
### - 作业总结 | HW 01 | 2025/3/9

- 写关系代数的小tip： 先看题目要求的句子成分，定语为select的内容，宾语为project的对象。

## WEEK 03 | Basic SQL
### - 核心内容 | CLASS 03 | 2025/3/13
- **定义关系**：

	```sql
	CREATE TABLE r
	--- 包含属性名、数据类型、完整性约束(如 `not null`, `primary key`等)
	DROP TABLE r --- 删除表
	DELETE FROM r --- 删除表数据
	```

- **数据类型：** `int`、`numeric(p,d)`、`float(n)`... | `char(n)`、`varchar(n)` | `null`
	- `numeric(p,d)`： 最多有p位数字，小数点右边d位。即整数位有(p-d)位。`e.g. numeric(3,1) 可以表示31.4，不能表示314.0`
	- **`null`：** 1)可能存在但未知(unknown)；2)可能不存在
- 基本查询结构： **select，from，where**
- **SQL附加操作 1：** 

	```sql
	SELECT DISTINCT 
	!=
	BETWEEN a AND b  --- ~~~ `[a,b]`
	old_name AS new_name --- 更名 
	SELECT *
	ORDER BY x ASC, y DESC`
	```

- **注意事项：**
	- 字符串使用**单引号`''`**
	- 用分号`;`结尾，全部使用英文半角字符

## WEEK 04 | Lab

### - 核心内容 | 实验课 01 | 2025/3/20

- 新建数据库：psql中输入：`CREATE DATABASE your_dbname;`
- **SQL附加操作 2：**
	- 引号：单引号用两个单引号表示，双引号不变
	- 字符串函数：lower, upper, trim, length
	- **模糊查询：** `LIKE 'a%'`  / `LIKE 'ab_'` (%匹配字符串，_ 匹配字符)
	- 值拼接： pg使用`||`   `e.g. SELECT col1 || 'txt' || col2`  -->`{col1} txt {col2}`
- SQL集合操作： 并\交\差 `() INTERSECT\UNION\EXCEPT ()`
- **CASE表达式：** 

	```sql
	CASE 
		WHEN condition1 THEN result1 
		WHEN condition2 THEN result2 
		ELSE result 
	END;
	
	--- e.g.
	SELECT ID, ---> *这里有一个逗号 ,
		CASE 
			WHEN score < 60 THEN'C' 
			WHEN score >= 80 THEN'A' 
			ELSE'B' 
		END 
	FROM marks;
	```

### - 作业总结 | HW 03 | 2025/3/9

## WEEK 05

## WEEK 06

### - CLASS 06 | 2025/4/3  

1.`order by random()` 用法

## WEEK 07

## WEEK 08

### - 实验课 | 2025/4/17

test

## WEEK 09

## WEEK 11

### - 实验课 | 2025/5/8

## WEEK 12 - FastAPI/ER

### - CLASS 12 | 2025/5/15



## WEEK 13&14 - ER/NORM
这里开始听不懂。。。在chatgpt的帮助下学会了怎么进行BCNF分解，但是还不是很理解理论。

 **- 核心内容 | CLASS 13&14 | 2025/5/22-2025/5/29**
- **第一范式（1NF）**

	- 数据库的`范式设计越高阶，冗余度就越低`，同时高阶的范式一定符合低阶范式的要求，满足最低要求的范式是第一范式（1NF）。在第一范式的基础上进一步满足更多规范要求的称为第二范式（2NF），其余范式以次类推。
	- 不满足第一范式 （1NF）的数据库就不是关系数据库。
	- 对于一般数据库设 计，都是在3NF和BCNF之间选择。

- **Boyce-Codd范式（BCNF）**

	- 具有函数依赖集$F$的关系模式$R$属于BCNF的条件是，对 $F^+$  中所有形如$α→β$的函数依赖，下面至少一个成立：
		- $α→β$是平凡的函数依赖 
		- $α$是$R$的一个超码
	- BCNF消除所有基于函数依赖能够发现的冗余。
	
	> **函数依赖：** 考虑一个关系模式$r(R)$，令$α∈R$且$β∈R$。 给定$r(R)$的一个实例，我们说这个实例满足（satisfy）函数依 赖$α→β$的条件是：对实例中的所有元组对$t1$和$t2$，若 $t1[α]=t2[α]$，那么$t1[β]=t2[β]$。
	> 
	> **平凡依赖：**  如果 $β⊆α$ ，那么函数依赖 $α→β$就是平凡的（trivial）

- **检查非平凡依赖是否违反BCNF**
	- 对于每个非平凡依赖$α→β$，计算属性集$α$的闭包，验证它 是否包含所有$R$的属性；如果是，表明它就是超码。
	- *思路：*找到R的某个非平凡函数依赖$α→β$，$α$的闭包没有包含所有的属性，那么可以初步分解为： 
		- $R−β$ 
		- $(α,β)$

**- 作业总结 | HW 08 | 2025/5/30** 
- **E-R图绘制**  
	- **实体集：** 矩形框表示，实体名在头部，属性名在下面。
	- **联系集：** 连接一对相关实体集的菱形，联系名放在菱形内部。
- **BCNF分解** 
	 1) 分析候选码（能推出所有属性）
	 2) 检查给出的函数依赖是否满足BCNF（即左边是超码）
	 3) 利用违反BCNF的函数依赖对R进行分解，直到所有分解均满足BCNF



## WEEK 15 - THEORY
### - CLASS 15 | 2025/6/5

- [测试题-存储/索引](https://github.com/ChenZhongPu/db-swufe/tree/master/12_theory)
> 考虑一个数据库有单个关系`E(play_id, games_played, room_id, total_points)`，其中`play_id`是主码，所有属性均是固定宽度。假设`E`有20,000个元组，并存储在100个pages中。忽略关系的其他额外存储空间，如_page header_和_tuple header_，并有如下假设：
> - DMBS没有任何meta-data。
> - `E`没有任何索引。
> - `E`没有任何页面在内存，并且DBMS能够在内存中存储无限数量的pages。
> - `E`中元组的顺序是随机的（即堆存储）。

 - 1. Q1

	![](attachments/NOTE_DATABASE/NOTE_DATABASE-20250605185632535.png)

	<u> D. 81-100</u>
	 
	关系E没有任何索引，DBMS无法通过索引快速定位到满足条件的元组。因此，DBMS必须对整个表进行**全表扫描**。在行式存储中，全表扫描意味着DBMS需要读取包含关系E所有数据的每一个数据页，以便逐个检查每个元组是否满足 `WHERE` 子句的条件。<br>
	而关系E存储在**100个pages**中。因此，为了执行全表扫描，DBMS需要从磁盘读取所有这100个pages。

<br>

- 2. Q2

	![](attachments/NOTE_DATABASE/NOTE_DATABASE-20250605185856965.png)

	<u>A. 1</u>
	
	行式存储：访问一条记录就可以同时拿到 `total_points`, `games_played`, `room_id` ，不需要额外读取其它页。<br>
	最理想的情况：这3行数据都恰好存储在同一个页面中，那么最少读取 1 个 page即可满足查询

<br>

- 思考题
	> 稀疏索引能否为非聚集索引？
	```
		不能。
		非聚集索引的数据是无序的，要根据索引值直接定位对应的具体行，而稀疏索引不能精确定位每条记录。
	```



