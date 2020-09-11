#如果database裡面已經有book的資料庫則刪除
drop database if exists book;
#重新創建新的database book
create database book;

use book;
#在book資料庫創建欄位
create table t_user(
	`id` int primary key auto_increment,
	`username` varchar(20) not null unique,
	`password` varchar(32) not null,
	`email` varchar(200)
);
#插入使用者資料
insert into t_user(`username`,`password`,`email`) values('admin','admin','boy123@gmail.com');

select * from t_user;


#創造t_book欄位並設定欄位的值
create table t_book(
	`id` int primary key auto_increment,
	`name` varchar(100),
	`price` decimal(11,2),
	`author` varchar(100),
	`sales` int,
	`stock` int,
	`img_path` varchar(200)
);


## 插入初始化測試的數據
insert into t_book(`id` , `name` , `author` , `price` , `sales` , `stock` , `img_path`)
values(null , '三國志' , '陳大名' , 80 , 9999 , 9 , 'static/img/book.jpg');

insert into t_book(`id` , `name` , `author` , `price` , `sales` , `stock` , `img_path`)
values(null , '小丁噹' , '木村' , 78.5 , 6 , 13 , 'static/img/book.jpg');

insert into t_book(`id` , `name` , `author` , `price` , `sales` , `stock` , `img_path`)
values(null , '灌籃高手' , '有村' , 68, 99999 , 52 , 'static/img/book.jpg');

insert into t_book(`id` , `name` , `author` , `price` , `sales` , `stock` , `img_path`)
values(null , '西遊記' , '王曉明' , 16, 1000 , 50 , 'static/img/book.jpg');

insert into t_book(`id` , `name` , `author` , `price` , `sales` , `stock` , `img_path`)
values(null , '東京自由行' , '剛哥' , 45.5 , 14 , 95 , 'static/img/book.jpg');

insert into t_book(`id` , `name` , `author` , `price` , `sales` , `stock` , `img_path`)
values(null , '韓國自由行' , '周星星' , 9.9, 12 , 53 , 'static/img/book.jpg');

insert into t_book(`id` , `name` , `author` , `price` , `sales` , `stock` , `img_path`)
values(null , '俄羅斯咖啡廳' , '蔡倫' , 66.5, 125 , 535 , 'static/img/book.jpg');

#insert into t_book(`id` , `name` , `author` , `price` , `sales` , `stock` , `img_path`)
#values(null , 'Java编程思想' , '阳哥' , 99.5 , 47 , 36 , 'static/img/default.jpg');

#insert into t_book(`id` , `name` , `author` , `price` , `sales` , `stock` , `img_path`)
#values(null , 'JavaScript从入门到精通' , '婷姐' , 9.9 , 85 , 95 , 'static/img/default.jpg');

#insert into t_book(`id` , `name` , `author` , `price` , `sales` , `stock` , `img_path`)
#values(null , 'cocos2d-x游戏编程入门' , '国哥' , 49, 52 , 62 , 'static/img/default.jpg');

#insert into t_book(`id` , `name` , `author` , `price` , `sales` , `stock` , `img_path`)
#values(null , 'C语言程序设计' , '谭浩强' , 28 , 52 , 74 , 'static/img/default.jpg');

#insert into t_book(`id` , `name` , `author` , `price` , `sales` , `stock` , `img_path`)
#values(null , 'Lua语言程序设计' , '雷丰阳' , 51.5 , 48 , 82 , 'static/img/default.jpg');

#insert into t_book(`id` , `name` , `author` , `price` , `sales` , `stock` , `img_path`)
#values(null , '西游记' , '罗贯中' , 12, 19 , 9999 , 'static/img/default.jpg');

#insert into t_book(`id` , `name` , `author` , `price` , `sales` , `stock` , `img_path`)
#values(null , '水浒传' , '华仔' , 33.05 , 22 , 88 , 'static/img/default.jpg');

#insert into t_book(`id` , `name` , `author` , `price` , `sales` , `stock` , `img_path`)
#values(null , '操作系统原理' , '刘优' , 133.05 , 122 , 188 , 'static/img/default.jpg');

#insert into t_book(`id` , `name` , `author` , `price` , `sales` , `stock` , `img_path`)
#values(null , '数据结构 java版' , '封大神' , 173.15 , 21 , 81 , 'static/img/default.jpg');

#insert into t_book(`id` , `name` , `author` , `price` , `sales` , `stock` , `img_path`)
#values(null , 'UNIX高级环境编程' , '乐天' , 99.15 , 210 , 810 , 'static/img/default.jpg');

#insert into t_book(`id` , `name` , `author` , `price` , `sales` , `stock` , `img_path`)
#values(null , 'javaScript高级编程' , '国哥' , 69.15 , 210 , 810 , 'static/img/default.jpg');

#insert into t_book(`id` , `name` , `author` , `price` , `sales` , `stock` , `img_path`)
    #values(null , '大话设计模式' , '国哥' , 89.15 , 20 , 10 , 'static/img/default.jpg');

#insert into t_book(`id` , `name` , `author` , `price` , `sales` , `stock` , `img_path`)
    #values(null , '人月神话' , '刚哥' , 88.15 , 20 , 80 , 'static/img/default.jpg');


## 查看表内容
select id,name,author,price,sales,stock,img_path from t_book;



use book;
#創造訂單欄位並設定內容
create table t_order(
	`order_id` varchar(50) primary key,
	`create_time` datetime,
	`price` decimal(11,2),
	`status` int,
	`user_id` int
	#foreign key(`user_id`) references t_user(`id`)
);
#創造物品訂單欄位並設定內容
create table t_order_item(
	`id` int primary key auto_increment,
	`name` varchar(100),
	`count` int,
	`price` decimal(11,2),
	`total_price` decimal(11,2),
	`order_id` varchar(50)
	#foreign key(`order_id`) references t_order(`order_id`)
);

