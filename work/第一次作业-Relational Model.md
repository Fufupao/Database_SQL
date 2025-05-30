## 题目1
>考虑一个`银行`数据库，其关系模式如下所示：
>- branch (branch_name, branch_city, assets)
>- customer (ID, customer_name, customer_street, customer_city)
>- loan (loan_number, branch_name, amount)
>- borrower (ID, loan_number)
>- account (account_number, branch_name, balance)
>- depositor (ID, account_number)
#### 1. 找到位于`成都`市的支行的名字。

$$
\Pi_{branch\_name}\left(\sigma_{branch\_city="成都"}(branch)\right)  
$$
#### 2. 找到在`杨柳`支行有贷款（`loan`）的借款人（`borrower`）的ID。

$$
\Pi_{ID} \left(\sigma_{branch\_name="杨柳"}(loan)\Join borrower\right)
$$


## 题目2
>假设数据库中存储用户名和密码的关系模式是 users(name, pswd, gender)，请结合关系代数简述实现`用户登录`逻辑的思路。

- 1.**输入：** 输入用户提供的用户名(input_name)和登录密码(input_pswd)
- 2.**选择($\sigma$)：** 利用关系代数的选择操作，从`user`表中选出与用户输入的用户名和密码都匹配的记录。关系代数表达式如下：

$$
\sigma_{name="input\_name"\wedge pswd="input\_pswd"}(users)
$$
- 3.**检查结果：** 如果上述操作非空，说明找到了与输入相匹配的用户名和密码组合，允许用户登录。如果选择操作返回空集，说明未找到匹配的用户名或密码，应拒绝登录。