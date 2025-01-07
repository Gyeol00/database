# 날짜 : 2025/01/07
# 이름 : 한결
# 내용 : 3장 테이블 제약조건

#실습 3-1
create table `User2` (
	`uid`   varchar(10) primary key,
    `name`  varchar(10),
    `birth` char(10),
    `addr`  varchar(50)
	);

#실습 3-2
insert into `User2` values ('A101', '김유신', '1900-02-03', '김해');
insert into `User2` values ('A102', '김춘추', '1991-02-03', '경주');
insert into `User2` values ('A103', '장보고', '1902-02-03', '완도');
select * from `User2`;

#실습 3-3
create table `User3` (
	`uid`    varchar(10) primary key,
    `name`   varchar(10),
    `birth`  char(10),
    `hp`     char(13) unique,
    `addr`   varchar(50)
    );
   
   #실습 3-4
insert into `User3` values ('A101', '김유신', '1990-01-01', '010-1001-1001', '김해');
insert into `User3` values ('A102', '김춘추', '1991-01-01', '010-1001-1002', '경주');
insert into `User3` values ('A103', '장보고', '1992-01-01', '010-1002-1001', '완도');
insert into `User3` values ('A104', '강감찬', '1993-01-01', null, '서울');
insert into `User3` values ('A105', '이순신', '1994-01-01', null, '부산');
select * from `User3`;

#실습 3-5
create table `parent` (
	`pid`     varchar(10) primary key,
    `name`    varchar(10),
    `birth`   char(10),
    `addr`    varchar(100)
    );
    
    create table `chlid` (
		`cid`    varchar(10) primary key,
        `name`   varchar(10),
        `hp`     char(13) unique,
        `parent` varchar(10),
        foreign key(`parent`) references `parent` (`pid`)
        );
      
	#실습 3-6
	insert into `parent` values ('P101', '김유신', '1968-05-09', '경남 김해시');
    insert into `parent` values ('P102', '김춘추', '1972-11-23', '경남 경주시');
    insert into `parent` values ('P103', '장보고', '1978-03-01', '전남 완도시');
    insert into `parent` values ('P104', '강감찬', '1979-08-16', '서울시 관악구');
    insert into `parent` values ('P105', '이순신', '1981-05-23', '부산시 진구');
	select * from `parent`;
     
	insert into `chlid` values ('C101', '김철수', '010-1234-1001', 'P101');
	insert into `chlid` values ('C102', '김영희', '010-1234-1002', 'P101');
	insert into `chlid` values ('C103', '강철수', '010-1234-1003', 'P103');
	insert into `chlid` values ('C104', '이철수', '010-1234-1004', 'p105');
	select * from `child`;
        
	#실습 3-7
    create table `User4` (
		`uid`     varchar(10) primary key,
        `name`    varchar(10) not null,
        `gender`  char(1),
        `age`     int default 1,
        `hp`      char(13) unique,
        `addr`    varchar(20)
        );
        
        #실습 3-8
        insert into `User4` values ('A101', '김유신', 'M', 21, '010-1234-1001', '김해');
        insert into `User4` values ('A102', '김춘추', 'M', 20, '010-1234-1002', '경주');
        insert into `User4` values ('A103', '장보고', 'M', 30, '010-1234-1003', '완도');
        insert into `User4` set
							`uid` = 'A104',
                            `name` = '신사임당',
                            `gender` = 'F',      
                            `addr` = '강릉';
                            
                            
        select * from `User4`;
        #insert into `User4` values ('', '', '', 21, '', '');
        #insert into `User4` values ('', '', '', 21, '', '');
        #insert into `User4` values ('', '', '', 21, '', '');
        #insert into `User4` values ('', '', '', 21, '', '');
        
        #실습 3-9 컬럼을 지정해서 입력해야 함.
        create table `User5` (
			`seq` 	  int auto_increment primary key,	 
			`name`    varchar(10) not null,
            `gender`  char(1) check(`gender` in ('M','F')),
            `age`     int default 1 check(`age` > 0 and `age` < 100),
            `addr`    varchar(20)
            );
            
#실습 3-10
insert into `User5` (`name`, `gender`, `age`, `addr`) values ('김유신', 'M', '25', '김해');
insert into `User5` (`name`, `gender`, `age`, `addr`) values ('김춘추', 'M', '24', '경주');
insert into `User5` (`name`, `gender`, `age`, `addr`) values ('장보고', 'M', '35', '완도');
insert into `User5` (`name`, `gender`, `age`, `addr`) values ('허난설헌', 'F', '21', '광주');
insert into `User5` (`name`, `gender`, `age`, `addr`) values ('신사임당', 'F', '25', '강릉');
select * from `User5`

drop table `User2`;
drop table `User3`;
drop table `User4`;
drop table `User5`;

#3-1
create table `User2` (
	`uid`   varchar(10) primary key,
    `name`  varchar(10),
    `birth` char(10),
    `hp`    char(13),
    `addr`  varchar(50)
    );

#3-2
insert into `User2` values ('A101', '김유신', '1968-05-09', '010-1234-1001', '경남 김해시');
insert into `User2` values ('A102', '김춘추', '1972-11-23', '010-1234-1002', '경남 경주시');
insert into `User2` values ('A103', '장보고', '1978-03-01', '010-1234-1003', '전남 완도군');
insert into `User2` values ('A104', '강감찬', '1979-08-16', '010-1234-1004', '서울시 관악구');
insert into `User2` values ('A105', '이순신', '1981-05-23', '010-1234-1005', '부산시 진구');
select * from `User2`;

#3-3
create table `User3` (
	`uid`   varchar(10) primary key,
    `name`  varchar(10),
    `birth` char(10),
    `hp`    char(13) unique,
    `addr`  varchar(50)
    );

#3-4
insert into `User3` values ('A101', '김유신', '1968-05-09', '010-1234-1001', '경남 김해시');
insert into `User3` values ('A102', '김춘추', '1972-11-23', '010-1234-1002', '경남 경주시');
insert into `User3` values ('A103', '장보고', '1978-03-01', '010-1234-1003', '전남 완도군');
insert into `User3` values ('A104', '강감찬', '1979-08-16', '010-1234-1004', '서울시 관악구');
insert into `User3` values ('A105', '이순신', '1981-05-23', '010-1234-1005', '부산시 진구');
select * from `User3`;

#3-5
create table `Parent` (
	`pid`   varchar(10) primary key,
    `name`  varchar(10),
    `birth` char(10),
    `addr`  varchar(100)
    );

create table `child` (
	`cid`   varchar(10) primary key,
    `name`  varchar(10),
    `hp`    char(13) unique,
    `parent` varchar(10),
    foreign key (`parent`) references `parent` (`pid`)
    );
    
#3-6
insert into `Parent` values ('P101', '김유신', '1968-05-09', '경남 김해시');
insert into `Parent` values ('P102', '김춘추', '1972-11-23', '경남 경주시');
insert into `Parent` values ('P103', '장보고', '1978-03-01', '전남 완도시');
insert into `Parent` values ('P104', '강감찬', '1979-08-16', '서울시 관악구');
insert into `Parent` values ('P105', '이순신', '1981-05-23', '부산시 진구');

insert into `child` values ('C101', '김철수', '010-1234-1001', 'P101');
insert into `child` values ('C102', '김영희', '010-1234-1002', 'P101');
insert into `child` values ('C103', '강철수', '010-1234-1003', 'P103');
insert into `child` values ('C104', '이철수', '010-1234-1004', 'P105');

#3-7
create table `User4` (
	`uid`    varchar(10) primary key,
    `name`   varchar(10) not null,
    `gender` char(1),
    `age`    int default 1,
    `hp`     char(13) unique,
    `addr`   varchar(20)
    );
    
#3-8
insert into `User4` values ('A101', '김유신', 'M', 25, '010-1234-1111', '경남 김해시');
insert into `User4` values ('A101', '김춘추', 'M', 25, '010-1234-2222', '경남 경주시');
insert into `User4` values ('A101', '장보고', 'M', 25, '010-1234-3333', '전남 완도시');
insert into `User4` values ('A101', '강감찬', 'M', 25, '010-1234-4444', '서울시 관악구');

#3-9
create table `User5` (
	`seq`     int primary key auto_increment,
    `name`    varchar(10) not null,
    `gender`  char(1) check (`gender` in ('M', 'F')),
    `age`     int default 1 check (`age` > 0 and `age` < 100),
    `addr`    varchar(20)
    );

#3-10
insert into `User5` (`name`, `gender`, `age`, `addr`) values ('김유신', 'M', '25', '경남 김해시');
insert into `User5` (`name`, `gender`, `age`, `addr`) values ('김춘추', 'M', '23', '경남 경주시');
insert into `User5` (`name`, `gender`, `age`, `addr`) values ('장보고', 'M', '35', '전남 완도시');
insert into `User5` (`name`, `gender`, `age`, `addr`) values ('강감찬', 'M', '42', '서울시 관악구');
sle


            
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        