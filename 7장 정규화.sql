#날짜 : 2025/02/27
#이름 : 한결
#내용 : 7장 정규화

#비정규형 테이블 생성
CREATE TABLE `bookOrder` (
	`orderNo`	INT,
	`orderDate`	DATE,
	`custId`		VARCHAR(10),
	`custName`	VARCHAR(10),
	`custAddr`	VARCHAR(10),
	`bookNo`		INT,
	`bookName`	VARCHAR(20),
	`bookCount` INT,
	`bookPrice`	INT
);

INSERT INTO `bookOrder` VALUES (10001, NOW(), 'a101', '김유신', '김해', 101, '프로그래밍', 1, 28000);
INSERT INTO `bookOrder` VALUES (10002, NOW(), 'a102', '김춘추', '경주', 101, '프로그래밍', 1, 28000);
INSERT INTO `bookOrder` VALUES (10002, NOW(), 'a102', '김춘추', '경주', 102, '자료구조', 2, 32000);
INSERT INTO `bookOrder` VALUES (10003, NOW(), 'a103', '장보고', '완도', 102, '자료구조', 2, 32000);
INSERT INTO `bookOrder` VALUES (10004, NOW(), 'a104', '강감찬', '서울', 110, '데이터베이스', 1, 25000);
INSERT INTO `bookOrder` VALUES (10005, NOW(), 'a105', '이순신', '서울', 110, '데이터베이스', 1, 25000);
INSERT INTO `bookOrder` VALUES (10005, NOW(), 'a105', '이순신', '서울', 102, '자료구조', 1, 32000);

#실습 7-2
CREATE TABLE `UserOrder` (
	`orderNo`	INT PRIMARY KEY,
	`orderDate`	DATE,
	`custId`		VARCHAR(10),
	`custName`	VARCHAR(10),
	`custAddr`	VARCHAR(20)
);
CREATE TABLE `Order` (
	`orderNo`	INT,
	`bookNo`		INT,
	`bookCount`	INT,
	`bookPrice`	INT,
	FOREIGN KEY (`orderNo`) REFERENCES `UserOrder` (`orderNo`),
	FOREIGN KEY (`bookNo`) REFERENCES `Book` (`bookNo`)
);
CREATE TABLE `Book` (
	`bookNo`		INT PRIMARY KEY,
	`bookName`	VARCHAR(10)
);

#실습 7-3
DROP table if EXISTS `UserOrder`;
CREATE TABLE `UserOrder` (
	`orderNo`	INT PRIMARY KEY,
	`orderDate`	DATE,
	`custId`		VARCHAR(10),
	FOREIGN KEY (`custId`) REFERENCES `User` (`custId`)
);

CREATE TABLE `User` (
	`custId`		VARCHAR(10) PRIMARY KEY,
	`custName`	VARCHAR(10),
	`custAddr`	VARCHAR(20)
);
















