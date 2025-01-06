#날짜 : 2025/01/06
#이름 : 한결
#내용 : 2장 SQL 기초

#실습 2-1
use StudyDB;
CREATE TABLE `User1` (
	`uid`    VARCHAR(10),
    `name`   VARCHAR(10),
    `hp`     CHAR(13),
    `age`    INT
);

DROP TABLE `User1`;

#실습 2-2
INSERT INTO `User1` VALUES (
	'A101', '김유신', '010-1234-1111', 25
    );
INSERT INTO `User1` VALUES (
	'A102', '김춘추', '010-1234-2222', 23
    );
INSERT INTO `User1` VALUES (
	'A103', '장보고', '010-1234-3333', 32
    );
INSERT INTO `User1` (`uid`, `name`, `age`) VALUES ('A104', '강감찬', 45);
INSERT INTO `User1` SET `uid`='A105', `name`='이순신', `hp`='010-1234-5555';

#실습 2-3
SELECT*FROM `User1`;
SELECT*FROM `User1` WHERE `uid`='A101';
#실습 2-4
#실습 2-5

#실습 2-6
alter table `User1` add `gender` tinyint;
alter table `User1` add `birth` char(10) after `name`;
alter table `User1` modify `gender` char(1);
alter table `User1` modify `age` tinyint;
alter table `User1` drop `gender`;

#실습 2-7
CREATE TABLE `User1Copy` LIKE `User1`;
INSERT INTO `User1Copy` SELECT * FROM `User1`;

#실습 2-8
drop table Tb1User;

CREATE TABLE Tb1User (
	`user_id`   char(10),
    `user_name` varchar(5),
    `user_hp`   char(13),
    `user_age`  varchar(5),
    `user_addr` char(20)
    );
    
	insert into `Tb1User` values ('p101', '김유신', '010-1234-1001', 25, '경남 김해시');
    insert into `Tb1User` values ('p102', '김춘추', '010-1234-1002', 23, '경남 경주시');
    insert into `Tb1User` (`user_id`, `user_name`, `user_age`, `user_addr`) values ('p103', '장보고', 31, '전남 완도군');
    insert into `Tb1User` values ('p104', '강감찬', null, null, '서울시 중구');
    insert into `Tb1User` values ('p105', '이순신', '010-1234-1005', 50, null);
    
    create table Tb1Product (
		`prod_no`      char(5),
        `prod_name`    varchar(5),
        `prod_price`   int,
        `prod_stock`   int,
        `prod_company` varchar(10),
        `prod_date`    date
        );
        
		insert into `Tb1Product` values (1001, '냉장고', 800000, 25, 'LG전자', '2022-01-06');
		insert into `Tb1Product` values (1002, '노트북', 1200000, 120, '삼성전자', '2022-01-07');
        insert into `Tb1Product` values (1003, '모니터', 350000, 35, 'LG전자', '2023-01-13');
        insert into `Tb1Product` values (1004, '세탁기', 1000000, 80, '삼성전자', '2021-01-01');
        insert into `Tb1Product` values (1005, '컴퓨터', 1500000, 20, '삼성전자', '2023-10-01');
        insert into `Tb1Product` values (1006, '휴대폰', 950000, 102, null, null);
        
        #실습 2-9
        select * from `Tb1User`;
        select `user_name` from `Tb1User`;
        select `User_name`, `User_hp` from `Tb1user`;
        select * from `Tb1User` where `user_id` = 'p102';
        select * from `Tb1User` where `user_id`='p104' or `user_id`='p105';
        select * from `Tb1User` where `user_addr`='부산시 금정구';
        