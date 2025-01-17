# 날짜 : 2025/01/17
# 이름 : 한결
# 내용 : SQL 연습문제5

#실습 5-1
create database `BookStore`;
create user 'bookstore'@'%' identified by '1234';
grant all privileges on `BookStore`.* to 'bookstore'@'%';
flush privileges;

use `bookstore`;

#실습 5-2
create table `Customer` (
	`custId`    int auto_increment primary key,
    `name`      varchar(10) not null,
    `address`   varchar(20) default null,
    `phone`     varchar(13) default null
    );
    
    create table `Book` (
    `bookId`    int primary key,
    `bookName`  varchar(20) not null,
    `publisher` varchar(20) not null,
    `price`     int default null
    );
    
create table `Order` (
	`orderId`   int auto_increment primary key,
    `custId`    int,
    `bookId`    int,
    `salePrice` int,
    `orderDate` date
    );

#실습 5-3
insert into `Customer` (`name`, `address`, `phone`) values
('박지성', '영국 맨체스타', '000-5000-0001'),
('김연아', '대한민국 서울', '000-6000-0001'),
('장미란', '대한민국 강원도', '000-7000-0001'),
('추신수', '미국 클리블랜드', '000-8000-0001');
insert into `Customer` (`name`, `address`) values ('박세리', '대한민국 대전');

insert into `Book` (`bookid`, `bookname`, `publisher`, `price`) values
(1, '축구의 역사', '굿스포츠', '7000'),
(2, '축구아는 여자', '나무수', '13000'),
(3, '축구의 이해', '대한미디어', '22000'),
(4, '골프 바이블', '대한미디어', '35000'),
(5, '피겨 교본', '굿스포츠', '8000'),
(6, '역도 단계별기술', '굿스포츠', '6000'),
(7, '야구의 추억', '이상미디어', '20000'),
(8, '야구를 부탁해', '이상미디어', '13000'),
(9, '올림픽 이야기', '삼성당', '7500'),
(10, 'Olympic Champions', 'Pearson', '13000');

insert into `Order` (`custid`, `bookid`, `saleprice`, `orderdate`) values
(1, 1, '6000', '2014-07-01'),
(1, 3, '21000', '2014-07-03'),
(2, 5, '8000', '2014-07-03'),
(3, 6, '6000', '2014-07-04'),
(4, 7, '20000', '2014-07-05'),
(1, 2, '12000', '2014-07-07'),
(4, 8, '13000', '2014-07-07'),
(3, 10, '12000', '2014-07-08'),
(2, 10, '7000', '2014-07-09'),
(3, 8, '13000', '2014-07-10');

#실습 5-4
select `custid`, `name`, `address` from `Customer`;

#실습 5-5
select `bookname`, `price` from `Book`;

#실습 5-6
select `price`, `bookname` from `Book`;

#실습 5-7
select `bookid`, `bookname`, `publisher`, `price` from `Book`;

#실습 5-8
select `publisher` from `Book`;

#실습 5-9
select distinct `publisher` from `Book`;
select `publisher` from `Book` group by `publisher`;

#실습 5-10
select * from `Book` where `price` >= 20000;

#실습 5-11
select * from `Book` where `price` < 20000;

#실습 5-12
select * from `Book` where `price` >= 10000 and `price` <= 20000;
select * from `Book` where `price` between 10000 and 20000;

#실습 5-13
select `bookid`, `bookname`, `price` from `Book`
where `price` >= 15000 and `price` <= 30000;

#실습 5-14
select * from `Book` where `bookid` in(2, 3, 5);
select * from `Book` where `bookid`=2 or `bookid`=3 or `bookid`=5;

#실습 5-15
select * from `Book` where `bookid` % 2 = 0;
select * from `Book` where mod(`bookid`, 2) = 0;

#실습 5-16
select * from `Customer` where `name` like '박%';

#실습 5-17
select * from `Customer` where `address` like '대한민국%';

#실습 5-18
select * from `Customer` where `phone` is not null;

#실습 5-19
select * from `Book` where `publisher` in ('굿스포츠', '대한미디어');

#실습 5-20
select `publisher` from `Book` where `bookName`='축구의 역사';

#실습 5-21
select `publisher` from `Book` where `bookName` like '%축구%';

#실습 5-22
select * from `Book` where `bookName` like '_구%';

#실습 5-23
select * from `Book` where `bookName` like '%축구%' and `price` >= 20000;

#실습 5-24
select * from `Book` order by `bookName`;

#실습 5-25
select * from `Book` order by `price`, `bookName`;

#실습 5-26
select * from `Book` order by `price` desc, `publisher`;

#실습 5-27
select * from `Book` order by `price` desc limit 3;

#실습 5-28
select * from `Book` order by `price` limit 3;

#실습 5-29
select sum(`salePrice`) as `총판매액` from `order`;

#실습 5-30
select
	sum(`saleprice`) as `총판매액`,
    avg(`saleprice`) as `평균값`,
    min(`saleprice`) as `최저가`,
    max(`saleprice`) as `최고가`
from `customer` c
join `order` o on c.custid=o.custId;

#실습 5-31
select count(*) as `판매건수` from `Book`;

#실습 5-32
select
	`bookid`,
    replace(`bookname`, '야구', '농구') as `bookname`,
    `publisher`,
    `price`
from `Book`;

#실습 5-33
select
	`custid`,
    count(*) as `수량`
from `order`
where `saleprice` >= 8000
group by `custid`
having `수량` >= 2
order by `custid`;

#실습 5-34
select * from `customer` as c
join `order` as o on c.`custId`=o.`custId`
order by c.`custid`;

#실습 5-35
select * from `customer` c, `order` o where c.`custId`=o.`custId` order by c.`custid`;

#실습 5-36
select c.`name`, o.`salePrice` from `customer` c, `order` o
where c.`custId`=o.`custId`
order by c.`custid`;

#실습 5-37
select
	c.`name`,
    sum(`salePrice`)
from `customer` as c
join `order` as o on c.custId = o.custId
group by c.custid
order by c.`name`;

#실습 5-38
select
	c.`name`,
    b.`bookname`
from `customer` as c
join `order` as o on c.`custId`=o.`custId`
join `book` as b on b.`bookId`=o.`bookid`
order by c.`custId`;

#실습 5-39
select
	c.`name`,
    b.`bookname`
from `Book` as b
join `order` as o on b.`bookid`=o.`bookId`
join `customer` as c on c.`custId`=o.`custId`
where o.`salePrice` = 20000;

#실습 5-40
select
	c.`name`,
    o.`salePrice`
from `customer` as c
left join `order` as o on c.`custId`=o.`custId`;

#실습 5-41
select
	sum(o.`saleprice`) as `총매출`
from `customer` as c
join `order` as o on c.`custId`=o.`custId`
where c.`name` = '김연아';

#####실습 5-42
select * from `Book` as b
join `order` as o on b.`bookid`=o.`bookid`;


#실습 5-43
#실습 5-44
#실습 5-45
#실습 5-46




