#날짜 : 2025/01/13
#이름 : 한결
#내용 : SQL 연습문제1

#실습 1-1
create database `Shop`;
create user `Shop`@`%` identified by '1234';
grant all privileges on Shop.* to `shop`@`%`;
flush privileges;

#실습 1-2
create table `Customer` (
	`custId` varchar(10) primary key,
    `name`   varchar(10) not null,
    `hp`	 varchar(13) unique default null,
    `addr`	 varchar(100) default null,
    `rdate`  date not null
);

create table `Product` (
	`prodNo`    int primary key,
    `prodName`	varchar(10) not null,
    `stock`		int not null default 0,
    `price` 	int default null,
    `company`	varchar(10) not null
);
    
create table `Order` (
	`orderNo`      int auto_increment primary key,
    `orderId` 	   varchar(10) not null,
    `orderProduct` int,
    `orderCount`   int default 1,
    `orderDate`	   datetime not null
);

#실습 1-3
insert into `Customer` values ('c101', '김유신', '010-1234-1001', '김해시 봉황동', '2022-01-01');
insert into `Customer` values ('c102', '김춘추', '010-1234-1002', '경주시 보문동', '2022-01-02');
insert into `Customer` values ('c103', '장보고', '010-1234-1003', '완도군 청산면', '2022-01-03');
insert into `Customer` values ('c104', '강감찬', '010-1234-1004', '서울시 마포구', '2022-01-04');
insert into `Customer` values ('c105', '이성계', null, null, '2022-01-05');
insert into `Customer` values ('c106', '정철', '010-1234-1006', '경기도 용인시', '2022-01-06');
insert into `Customer` values ('c107', '허준', null, null, '2022-01-07');
insert into `Customer` values ('c108', '이순신', '010-1234-1008', '서울시 영등포구', '2022-01-08');
insert into `Customer` values ('c109', '송상현', '010-1234-1009', '부산시 동래구', '2022-01-09');
insert into `Customer` values ('c110', '정약용', '010-1234-1010', '경기도 광주시', '2022-01-10');

insert into `product` values ('1', '새우깡', 5000, 1500, '농심');
insert into `product` values ('2', '초코파이', 2500, 2500, '오리온');
insert into `product` values ('3', '포카칩', 3600, 1700, '오리온');
insert into `product` values ('4', '양파링', 1250, 1800, '농심');
insert into `product` values ('5', '죠리퐁', 2200, null, '크라운');
insert into `product` values ('6', '마가렛트', 3500, 3500, '롯데');
insert into `product` values ('7', '뿌셔뿌셔', 1650, 1200, '오뚜기');
    
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c102', 3, 2, now());
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c101', 4, 1, now());
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c108', 1, 1, now());
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c109', 6, 5, now());
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c102', 2, 1, now());
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c101', 7, 3, now());
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c110', 1, 2, now());
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c104', 2, 4, now());
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c102', 1, 3, now());
insert into `Order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) values ('c107', 6, 1, now());
  
#실습 1-4
select * from `Customer`;

#실습 1-25
select `orderProduct` as `주문 상품번호`, sum(`orderCount`) as `총 주문수량`
from `order`; 

select 
	`company` AS `제조업체`, COUNT(*) AS `제품수`, MAX(`price`) AS `최고가`
from 
	`Product` 
group by `company`
order by `제조업체`;
















    
    