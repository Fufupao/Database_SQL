---创建关系
CREATE TABLE product(
    product_no INT PRIMARY KEY,
    name VARCHAR(255),
    price DECIMAL(10,2)
);
---使用COPY命令导入数据库
COPY product FROM 'D:\Zfufupaofile\DDatagrip\Class_database\product_work5.txt' DELIMITER E'\t' HEADER;
-- 将 product 表数据导出为 CSV 文件
COPY product TO 'D:\Zfufupaofile\DDatagrip\Class_database\product_work5.csv' WITH (FORMAT CSV, HEADER);


---添加一个新的商品，编号为666，名字为cake，价格不详。
INSERT INTO product(product_no, name, price)
VALUES (666, 'cake', NULL);
---使用一条SQL语句同时添加3个商品，内容自拟。
INSERT INTO product (product_no, name, price)
VALUES (667, 'Milk', 3.5), (668, 'Bread', 4.0), (669, 'Eggs', 5.2);
---将商品价格统一打8折。
UPDATE product
SET price = price * 0.8;
---将价格大于100的商品上涨2%，其余上涨4%。
UPDATE product
SET price = price *
    CASE
        WHEN price > 100 THEN 1.02
        ELSE 1.04
    END;
---将名字包含cake的商品删除。
DELETE FROM product
WHERE name LIKE '%cake%';
---将价格高于平均价格的商品删除。
DELETE FROM product
WHERE price > (SELECT AVG(price) FROM product);


DROP TABLE IF EXISTS product;

--- 比较`DELETE`和`TRUNCATE`的性能差异。
--- 创建关系 product(name, price)
CREATE TABLE product(
    name VARCHAR(10000000),
    price DECIMAL(10,2)
);

--- 插入100000条数据
INSERT INTO product (name, price)
SELECT
    'Product' || generate_series, -- 生成名称 Product1, Product2, ...
    ROUND((random() * 1000)::numeric, 2) -- 生成0到1000之间的随机价格，保留2位小数
FROM generate_series(1, 100000);

--- `DELETE`
DELETE FROM product;
--- `TRUNCATE`
TRUNCATE TABLE product;