create database `BookStore`;
create user 'bookstore'@'%' identified by '1234';
grant all privileges on `BookStore`.* to 'bookstore'@'%';
flush privileges;
use `bookstore`;

create table `Customer` (
	`custId` int auto_increment primary key,
    `name`   varchar(10) not null,
    `address`varchar(20) default null,
    `phone`  varchar(13) default null
    );
drop table `customer`;
alter table customer auto_increment = 1;
    
create table `Book` (
	`bookId`    int primary key,
    `bookName`  varchar(20) not null,
    `publisher` varchar(20) not null,
    `price`   	int default null
    );

create table `Order` (
	`orderId`    int auto_increment primary key,
    `custId`	 int not null,
    `bookId`	 int not null,
    `salePrice` int not null,
    `orderDate`  date not null
    );
    drop table `Order`;
    
insert into `Customer` (`name`, `address`, `phone`) values
('박지성', '영국 맨체스타', '000-5000-0001'),
('김연아', '대한민국 서울', '000-6000-0001'),
('장미란', '대한민국 강원도', '000-7000-0001'),
('추신수', '미국 클리블랜드', '000-8000-0001');
insert into `Customer` (`name`, `address`) values ('박세리', '대한민국 대전');

insert into `Book` (`bookid`, `bookname`, `publisher`, `price`) values
(1, '축구의 역사', '굿스포츠', 7000),
(2, '축구아는 여자', '나무수', 13000),
(3, '축구의 이해', '대한미디어', 22000),
(4, '골프 바이블', '대한미디어', 35000),
(5, '피겨 교본', '굿스포츠', 8000),
(6, '역도 단계별기술', '굿스포츠', 6000),
(7, '야구의 추억', '이상미디어', 20000),
(8, '야구를 부탁해', '이상미디어', 13000),
(9, '올림픽 이야기', '삼성당', 7500),
(10, 'Olympic Champions', 'Pearson', 13000);

insert into `Order` (`custid`, `bookid`, `saleprice`, `orderdate`) values
(1, 1, 6000, '2014-07-01'),
(1, 3, 21000, '2014-07-03'),
(2, 5, 8000, '2014-07-03'),
(3, 6, 6000, '2014-07-04'),
(4, 7, 20000, '2014-07-05'),
(1, 2, 12000, '2014-07-07'),
(4, 8, 13000, '2014-07-07'),
(3, 10, 12000, '2014-07-08'),
(2, 10, 7000, '2014-07-09'),
(3, 8, 13000, '2014-07-10');

#5-4
select `custid`, `name`, `address` from `customer`;

#5-5
select `bookname`, `price` from `Book`;

#5-6
select `price`, `bookname` from `Book`;

#5-7
select `bookid`, `bookname`, `publisher`, `price` from `Book`;

#5-8
select `publisher` from `Book`;

#5-9
select distinct `publisher` from `Book`;

#5-10
select `bookid`, `bookname`, `publisher`, `price` from `Book` where `price` >= 20000;

#5-11
select `bookid`, `bookname`, `publisher`, `price` from `Book` where `price` < 20000;

#5-12
select `bookid`, `bookname`, `publisher`, `price` from `Book` where `price` between 10000 and 20000;

#5-13
select `bookid`, `bookname`, `price` from `Book` where `price` between 15000 and 30000;

#5-14
select `Bookid`, `bookname`, `publisher`, `price` from `Book` where `bookid` in (2, 3, 5);

#5-15
select * from `book` where `bookid` %2=0;

#5-16
select * from `customer` where `name` like '박%';

#5-17
select * from `customer` where `address` like '%대한민국%';

#5-18
select * from `customer` where `phone` is not null;

#5-19
select * from `Book` where `publisher` in ('굿스포츠', '대한미디어');

#5-20
select `publisher` from `Book` where `bookname` = '축구의 역사';

#5-21
select `publisher` from `book` where `bookname` like '%축구%';

#5-22
select * from `book` where `bookname` like '_구%';

#5-23
select * from `book` where `bookname` like '%축구%' and `price` >= 20000;

#5-24
select * from `book` order by `bookname`;

#5-25
select * from `Book` order by `price`, `bookname`;

#5-26
select * from `book` order by `price` desc, `publisher`;

#5-27
select * from `book` order by `price` desc limit 3;

#5-28
select * from `book` order by `price` limit 3;

#5-29
select sum(`saleprice`) as `총판매액` from `order`;

#5-30
select
	sum(`saleprice`) as `총판매액`,
    avg(saleprice) as `평균값`,
    min(`saleprice`) as `최저가`,
    max(`saleprice`) as `최고가`
from `order`;

#5-31
select count(*) as `판매건수` from `order`;

#5-32
select
	`bookid`,
	replace(`bookname`, '야구', '농구') as `bookname`,
    `publisher`,
    `price`
from `book`;

#5-33
select
	custid,
    count(*) as `수량`
from `Order`
where `saleprice` >= 8000
group by `custid`
having `수량` >= 2;

#5-34
select * from `customer` c, `order` o where c.custid=o.custid
order by c.`custid`;

#5-35
select * from `customer` c, `order` o where c.custid=o.custid
order by c.`custid`;

#5-36
select
	c.name,
    o.saleprice
from `customer` c
join `order` o on c.custid=o.custid order by c.custid;

#5-37
select
	c.name,
    sum(o.`saleprice`)
from `customer` as c
join `order` as o on c.custid=o.custid
group by `name`
order by `name`;

#5-38
select
	c.name,
    b.bookname
from `customer` as c
join `order` as o on c.custid=o.custid
join `book` as b on b.bookid=o.bookid
order by c.custid;

#5-39
select
	c.name,
    b.bookname
from `customer` as c
join `order` as o on c.custid=o.custid
join `book` as b on b.bookid=o.bookid
where `price` = 20000;

#5-40
select
	c.name,
    o.saleprice
from `customer` as c
left join `order` as o on c.custid=o.custid;

#5-41
select
	sum(o.`saleprice`) as `총매출`
from `customer` as c
join `order` as o on c.custid=o.custid
where c.name = '김연아';

#5-42
select
	`bookname`
from `book`
order by price desc limit 1;

#5-43
select
	c.name
from `order` as o
right join `customer` as c on o.custid=c.custid
where o.`custid` is null;

#5-44
insert into `Book` (`bookid`, `bookname`, `publisher`) values (11, '스포츠의학', '한솔의학서적');
select * from book;

#5-45
update `customer` set `address` = '대한민국 부산' where `custid` = 5;
select * from `customer`;

#5-46
delete from `customer` where `custid` = 5;




