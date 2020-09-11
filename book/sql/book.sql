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

