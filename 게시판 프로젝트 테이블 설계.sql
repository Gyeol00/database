#날짜 : 2025/02/17
#이름 : 한결
#내용 : 게시판 프로젝트 테이블 설계

-- 데이터베이스 생성
DROP DATABASE IF EXISTS `board`;
CREATE DATABASE `board`;
USE `board`;

-- 사용자 생성 및 권한 부여
DROP USER IF EXISTS 'board'@'%';
CREATE USER 'board'@'%' IDENTIFIED BY '1q2w3e';
GRANT ALL PRIVILEGES ON `board`.* TO 'board'@'%';
FLUSH PRIVILEGES;

-- User 테이블
CREATE TABLE `User` (
	`uid`			VARCHAR(20) PRIMARY KEY, -- varchar의 최대 길이는 255 정도
	`pass`		VARCHAR(100), -- 암호화 된 문자열로 만들기 위해 넉넉히 줌
	`name`		VARCHAR(20),
	`nick`		VARCHAR(20) UNIQUE,
	`email`		VARCHAR(50) UNIQUE,
	`hp`			CHAR(13) UNIQUE,
	`role`		VARCHAR(20) DEFAULT 'USER', -- 사용자 권한
	`zip`			CHAR(5),
	`addr1`		VARCHAR(100),
	`addr2`		VARCHAR(100),
	`regip`		VARCHAR(100),
	`regDate`	DATETIME,
	`leaveDate`	DATETIME
);

-- terms 테이블
CREATE TABLE `Terms` (
	`no`	INT PRIMARY KEY AUTO_INCREMENT,
	`terms`		TEXT, -- 대용량
	`privacy`	TEXT
);

-- article 테이블
CREATE TABLE `Article` (
	`no`			INT AUTO_INCREMENT PRIMARY KEY,
	`cate`		VARCHAR(20) DEFAULT 'free',
	`title`		VARCHAR(100) NOT NULL,
	`content`	TEXT NOT NULL,
	`comment`	INT DEFAULT 0, -- 댓글 갯수
	`file`		TINYINT DEFAULT 0, -- 파일 첨부 갯수, int는 너무 크니 tinyint
	`hit`			INT DEFAULT 0,
	`writer`		VARCHAR(20) NOT NULL,
	`regip`		VARCHAR(100) NOT NULL,
	`wdate`		DATETIME, -- 작성일
	FOREIGN KEY (`writer`) REFERENCES `User` (`uid`)
);

-- comment 테이블
CREATE TABLE `Comment` (
	`cno`			INT AUTO_INCREMENT PRIMARY key,
	`parent` 	INT NOT NULL, -- 부모 글 번호
	`content`	TEXT NOT NULL,
	`writer`		VARCHAR(20) NOT NULL,
	`regip`		VARCHAR(100) NOT NULL,
	`wdate`		DATETIME,
	FOREIGN KEY (`writer`) REFERENCES `User` (`uid`),
	FOREIGN KEY (`parent`) REFERENCES `Article` (`no`)
);

-- file 테이블
CREATE TABLE `File` (
	`fno`			INT AUTO_INCREMENT PRIMARY KEY,
	`ano` 		INT NOT NULL, -- 글 번호
	`oName` 		VARCHAR(100) NOT NULL, -- 원본 파일명
	`sName` 		VARCHAR(100) NOT NULL, -- 저장 파일명
	`download`	INT DEFAULT 0,
	`rdate` 		DATETIME, -- 파일 등록일
	FOREIGN KEY (`ano`) REFERENCES `Article` (`no`)
);
