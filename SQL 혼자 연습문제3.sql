#날짜 : 2025/01/19
#이름 : 한결
#내용 : SQL 혼자 연습문제3

#실습 3-1
create database `College`;
create user 'college'@'%' identified by '1234';
grant all privileges on College .* to 'college'@'%';
flush privileges;

use `College`;

#실습 3-2
create table `Student` (
	`stdNo`      char(8) primary key,
    `stdName`	 varchar(20) not null,
    `stdHp`      char(13) unique not null,
    `stdYear`    int,
    `stdAddress` varchar(100) default null
    );

create table `Lecture` (
	`lecNo`		int primary key,
    `lecName`   varchar(20) not null,
    `lecCredit` tinyint not null,
    `lecTime`   int not null,
    `lecClass`  varchar(10) default null
    );
    
create table `Register` (
	`regStdNO`  	 char(8) not null,
    `regLecNo`		 int not null,
    `regMidScore`	 tinyint default null,
    `regFinalScore`	 tinyint default null,
    `regTotalScore`  int default null,
    `regGrade`		 char(1) default null
    );    

#실습 3-3
insert into `Student` (`stdNo`, `stdName`, `stdHp`, `stdyear`, `stdAddress`) values
('20201016', '김유신', '010-1234-1001', 3, null),
('20201126', '김춘추', '010-1234-1002', 3, '경상남도 경주시'),
('20210216', '장보고', '010-1234-1003', 2, '전라남도 완도시'),
('20210326', '강감찬', '010-1234-1004', 2, '서울시 영등포구'),
('20220416', '이순신', '010-1234-1005', 1, '부산시 부산진구'),
('20220521', '송상현', '010-1234-1006', 1, '부산시 동래구');

insert into `Lecture` (`lecNo`, `lecName`, `lecCredit`, `lecTime`, `lecClass`) values
(159, '인지행동심리학', 3, 40, '본304'),
(167, '운영체제론', 3, 25, '본B05'),
(234, '중급 영문법', 3, 20, '본201'),
(239, '세법개론', 3, 40, '본204'),
(248, '빅데이터 개론', 3, 20, '본B01'),
(253, '컴퓨팅사고와 코딩', 2, 10, '본B02'),
(349, '사회복지 마케팅', 2, 50, '본301');

insert into `Register` (`regStdNo`, `regLecNo`) values
(20201126, 234),
(20201016, 248),
(20201016, 253),
(20201126, 239),
(20210216, 349),
(20210326, 349),
(20201016, 167),
(20220416, 349);

#실습 3-4
select * from `lecture`;

#실습 3-5
select * from `Student`;

#실습 3-6
select * from `register`;

#실습 3-7
select * from `student` where `stdyear`=3;

#실습 3-8
select * from `lecture` where `leccredit`=2;

#실습 3-9
update `register` set `regMidScore` = 36, `regFinalScore` = 42
where `regStdNo` = '20201126' and `regLecNo`=234;
update `register` set `regMidScore` = 24, `regFinalScore` = 62
where `regStdNo` = '20201016' and `regLecNo`=248;
update `register` set `regMidScore` = 28, `regFinalScore` = 40
where `regStdNo` = '20201016' and `regLecNo`=253;
update `register` set `regMidScore` = 37, `regFinalScore` = 57
where `regStdNo` = '20201126' and `regLecNo`=239;
update `register` set `regMidScore` = 28, `regFinalScore` = 68
where `regStdNo` = '20210216' and `regLecNo`=349;
update `register` set `regMidScore` = 16, `regFinalScore` = 65
where `regStdNo` = '20210326' and `regLecNo`=349;
update `register` set `regMidScore` = 18, `regFinalScore` = 38
where `regStdNo` = '20201016' and `regLecNo`=167;
update `register` set `regMidScore` = 25, `regFinalScore` = 58
where `regStdNo` = '20220416' and `regLecNo`=349;
select * from `register`;


#실습 3-10
update `register`
set `regTotalScore` = `regMidScore` + `regFinalScore`,
	`regGrade` = if(`regtotalScore` >= 90, 'A',
				 if(`regtotalScore` >= 80, 'B',
				 if(`regtotalScore` >= 70, 'C',
				 if(`regtotalScore` >= 60, 'D', 'F'))));
select * from `register`;

#실습 3-11
select * from `register` order by `regtotalscore` desc;

#실습 3-12
select * from `register` where `reglecNo` = 349 order by `regtotalscore` desc;

#실습 3-13
select * from `lecture` where `lectime` >= 30;

#실습 3-14
select
	`lecname`,
    `lecclass`
from `lecture`;

#실습 3-15
select
	`stdno`,
    `stdname`
from `student`;

#실습 3-16
select * from `student` where `stdAddress` is null;

#실습 3-17
select * from `student` where `stdAddress` like '%부산%';

#실습 3-18
select * from `student` as a
left join `register` as b on a.stdno=b.regstdno
order by a.`stdno`;

#실습 3-19
select
	`stdno`,
    `stdname`,
    `reglecno`,
    `regmidscore`,
    `regfinalscore`,
    `regtotalscore`,
    `reggrade`
from `student` as a
join `register` as b on a.`stdno`=b.`regstdno`
order by a.stdno;

#실습 3-20
select
	`stdname`,
	`stdno`,
    `reglecno`
from `student` as a
join `register` as b on a.`stdno`=b.`regstdno`
where b.`reglecno` = 349;

#실습 3-21
select
	a.stdno,
    a.stdname,
    count(a.stdno) as `수강신청 건수`,
    sum(`regtotalscore`) as `종합점수`,
    avg(`regtotalscore`) as `평균`
from `student` as a
join `register` as b on a.stdno=b.regstdno
group by a.stdNO order by `stdno`;

#실습 3-22
select * from `register` as a
join `lecture` as b on a.reglecno=b.lecno;

#실습 3-23
select
	a.regstdno,
    a.reglecno,
    b.lecname,
    a.regmidscore,
    a.regfinalscore,
    a.regtotalscore,
    a.reggrade
from `register` as a
join `lecture` as b on a.reglecno=b.lecno;

#실습 3-24
select
	count(*) as `사회복지 마케팅 수강 신청건수`,
    avg(`regtotalscore`) as `사회복지 마케팅 평균`
from `lecture` as a
join `register` as b on a.lecno=b.reglecno
where `lecname`='사회복지 마케팅';

#실습 3-25
select
	regstdno,
    lecname
from `register` as a
join `lecture` as b on a.reglecno=b.lecno
where `reggrade`='A';

#실습 3-26
select * from `student` as a
join `register` as b on a.stdno=b.regstdno
join `lecture` as c on c.lecno=b.reglecno;

#실습 3-27
select
	a.stdno,
    a.stdname,
    c.lecno,
    c.lecname,
    b.regmidscore,
    b.regfinalscore,
    b.regtotalscore,
    b.reggrade
from `student` as a
join `register` as b on a.stdno=b.regstdno
join `lecture` as c on c.lecno=b.reglecno
order by `reggrade`;

#실습 3-28
select
	a.stdno,
    a.stdname,
    c.lecname,
    b.regtotalscore,
    b.reggrade
from `student` as a
join `register` as b on a.stdno=b.regstdno
join `lecture` as c on c.lecno=b.reglecno
where `reggrade` = 'f';

#실습 3-29
select
	a.stdno,
    a.stdname,
    sum(leccredit) as `이수학점`
from `student` as a
join `register` as b on a.stdno=b.regstdno
join `lecture` as c on c.lecno=b.reglecno
where `reggrade` < 'F'
group by a.`stdno`
;

#실습 3-30
select
	a.stdno,
    a.stdname,
    group_concat(`lecname`) as `신청과목`,
    group_concat(if(`regtotalscore` >= 60, `lecname`, null)) as `이수과목`
from `student` as a
join `register` as b on a.stdno=b.regstdno
join `lecture` as c on c.lecno=b.reglecno
group by `stdno`;

