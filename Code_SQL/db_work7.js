use test // 创建数据库 test
db.createCollection('users') //创建集合 users

// 增
db.users.insertMany([
  {name: "张三", age: 25, email: "zhang@example.com", hobbies: ["阅读", "游泳"]},
  {name: "李四", age: 30, email: "li@example.com"},
  {name: "王五", age: 28, email: "wang@example.com", status: "active"}
])

// 删
db.users.deleteOne({name: "王五"})

// 改
db.users.updateOne(
  {name: "张三"},
  {$set: {age: 100, status: "active"}}
)

// 查询所有文档
db.users.find()
// 排序查询
db.users.find().sort({age: 1})