#날짜 : 2025/01/13
#이름 : 한결
#내용 : SQL 연습문제1

#실습 1-1
create database `Shop`;
create user `Shop`@`%` identified by '1234';
grant all privileges on Shop.* to 'Shop'@'%';
flush privileges;

#실습 1-2
create table `Customer` (
	`custId` varchar(10) primary key,
    `name`   varchar(10) not null,
    `hp`	 varchar(13) unique default null,
    `addr`	 varchar(100) default null,
    `rdate`  datetime not null
);

create table `Product` (
	`prodNo`    int primary key,
    `prodName`	varchar(10) not null,
    `stock`		int not null default 0,
    `price` 	int default null,
    `company`	varchar(10) not null
);

alter table `product` modify `prodNo` int auto_increment;
    
create table `Order` (
	`orderNo`      int auto_increment primary key,
    `orderId` 	   varchar(10) not null,
    `orderProduct` int,
    `orderCount`   int default 1,
    `orderDate`	   datetime not null
);

#실습 1-3
insert into `Customer` values ('c101', '김유신', '010-1234-1001', '김해시 봉황동', '2022-01-01');
insert into `Customer` values ('c102', '김춘추', '010-1234-1002', '경주시 보문동', '2022-07-01 14:16:11');
insert into `Customer` values ('c103', '장보고', '010-1234-1003', '완도군 청산면', '2022-07-01 17:23:18');
insert into `Customer` values ('c104', '강감찬', '010-1234-1004', '서울시 마포구', '2022-07-02 10:46:36');
insert into `Customer` values ('c105', '이성계', null, null, '2022-07-03 09:15:37');
insert into `Customer` values ('c106', '정철', '010-1234-1006', '경기도 용인시', '2022-07-03 12:35:12');
insert into `Customer` values ('c107', '허준', null, null, '2022-07-03 16:55:36');
insert into `Customer` values ('c108', '이순신', '010-1234-1008', '서울시 영등포구', '2022-07-04 14:23:23');
insert into `Customer` values ('c109', '송상현', '010-1234-1009', '부산시 동래구', '2022-07-04 21:54:34');
insert into `Customer` values ('c110', '정약용', '010-1234-1010', '경기도 광주시', '2022-07-05 14:21:03');

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

#실습 1-5
select `custid`, `name`, `hp` from `Customer`;

#실습 1-6
select * from `Product`;

#실습 1-7
select `company` from `Product`;

#실습 1-8
select distinct `company` from `Product`;

#실습 1-9
select `prodName`, `price` from `Product`;

#실습 1-10
select `prodName`, `price` + 500 as `조정단가` from `Product`;

#실습 1-11
select `prodName`, `stock`, `price` from `Product` where `company`='오리온';

#실습 1-12
select `orderProduct`, `orderCount`, `orderDate` from `Order` where `orderId`='c102';

#실습 1-13
select `orderProduct`, `orderCount`, `orderDate` from `Order` where `orderId`='c102' and `orderCount` >= 2;

#실습 1-14
select * from `Product` where `price` >= 1000 and `price` <= 2000;
select * from `Product` where `price` between 1000 and 2000;

#실습 1-15
select `custId`, `name`, `hp`, `addr` from `Customer` where `name` like '김%';

#실습 1-16
select `custId`, `name`, `hp`, `addr` from `Customer` where `name` like '__';

#실습 1-17
select * from `Customer` where `hp` is null;

#실습 1-18
select * from `Customer` where `addr` is not null;

#실습 1-19
select * from `Customer` order by `rdate` desc;

#실습 1-20
select * from `Order` where `orderCount` >= 3 order by `orderCount` desc, `orderProduct` asc;

#실습 1-21
select avg(`price`) from `Product`;

#실습 1-22
select sum(`stock`) as `재고량 합계` from `Product` where `company`='농심';

#실습 1-23
select count(*) as `고객수` from `Customer`;

#실습 1-24
select count(distinct `company`) as `제조업체 수` from `product`;

#실습 1-25
select `orderProduct` as `주문 상품번호`, sum(`orderCount`) as `총 주문수량` from `Order` group by `주문 상품번호` order by `주문 상품번호`;

#실습 1-26
select `company` as `제조업체`, count(*) as `제품수`, max(`price`) as `최고가` from `Product` group by `제조업체` order by `제조업체`;

#실습 1-27
select `company` as `제조업체`, count(*) as `제품수`, max(`price`) as `최고가`
from `product` group by `제조업체`
having `제품수` >= 2;

#실습 1-28
select `orderProduct`, `orderId`, sum(`orderCount`) as `총 주문수량`
from `Order`
group by `orderProduct`, `orderId` order by `orderProduct`;

#실습 1-29
select a.orderId, b.prodName from `Order` as a
join `Product` as b
on a.orderProduct = b.prodNo
where `orderId`='c102';

#실습 1-30
select `orderid`, `name`, `prodName`, `orderDate` from `order` as a
join `customer` as b
on a.orderId = b.custId
join `Product` as c
on a.orderProduct = c.prodNo
where substr(`orderDate`, 1, 10) = '2022-07-03';














    
    