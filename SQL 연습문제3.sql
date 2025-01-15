#날짜 : 2025/01/15
#이름 : 한결
#내용 : SQL 연습문제3

#실습 3-1
CREATE DATABASE `College`;
CREATE USER 'college'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON College.* TO 'college'@'%';
FLUSH PRIVILEGES;

#실습 3-2
create table `Student` (
 `stdNo`      char(8) primary key,
 `stdName`    varchar(20) not null,
 `stdHp`	  char(13) unique not null,
 `stdYear`	  int not null,
 `stdAddress` varchar(100) default null
 );

 create table `Lecture` (
	`lecNo`     int primary key,
    `lecName`   varchar(20) not null,
    `lecCredit` tinyint not null,
    `lecTime`   tinyint not null,
    `lecClass`  varchar(10) default null
    );
    
create table `Register` (
	`regStdNo`      char(8),
    `regLecNo`      int not null,
    `regMidScore`   tinyint default null,
    `regFinalScore` tinyint default null,
    `regTotalScore` tinyint default null,
    `regGrade`      char(1) default null
    );
    
#실습 3-3
insert into `Student` values ('20201016', '김유신', '010-1234-1001', 3, null);
insert into `Student` values ('20201126', '김춘추', '010-1234-1002', 3, '경상남도 경주시');
insert into `Student` values ('20210216', '장보고', '010-1234-1003', 2, '전라남도 완도시');
insert into `Student` values ('20210326', '강감찬', '010-1234-1004', 2, '서울시 영등포구');
insert into `Student` values ('20220416', '이순신', '010-1234-1005', 1, '부산시 부산진구');
insert into `Student` values ('20220521', '송상현', '010-1234-1006', 1, '부산시 동래구');

insert into `Lecture` values (159, '인지행동심리학',   3, 40, '본304');
insert into `Lecture` values (167, '운영체제론',      3, 25, '본B05');
insert into `Lecture` values (234, '중급 영문법',     3, 20, '본201');
insert into `Lecture` values (239, '세법개론',       3, 40, '본204');
insert into `Lecture` values (248, '빅데이터개론',     3, 20, '본B01');
insert into `Lecture` values (253, '컴퓨팅사고와 코딩', 2, 10, '본B02');
insert into `Lecture` values (349, '사회복지 마케팅',   2, 50, '본301');
 
insert into `Register` values ('20201126', 234, null, null, null, null);
insert into `Register` values ('20201016', 248, null, null, null, null);
insert into `Register` values ('20201016', 253, null, null, null, null);
insert into `Register` values ('20201126', 239, null, null, null, null);
insert into `Register` values ('20210216', 349, null, null, null, null);
insert into `Register` values ('20210326', 349, null, null, null, null);
insert into `Register` values ('20201016', 167, null, null, null, null);
insert into `Register` values ('20220416', 349, null, null, null, null);

#실습 3-4
select * from `lecture`;
 
#실습 3-5
select * from `student`;
 
#실습 3-6
select * from `register`;

#실습 3-7
select * from `student` where `stdYear`=3;

#실습 3-8
select * from `lecture` where `lecCredit`=2;

#실습 3-9
update `register` set `regmidscore`=36, `regfinalscore`=42 where `regstdno`='20201126' and `reglecno`=234;
update `register` set `regmidscore`=24, `regfinalscore`=62 where `regstdno`='20201016' and `reglecno`=248;
update `register` set `regmidscore`=28, `regfinalscore`=40 where `regstdno`='20201016' and `reglecno`=253;
update `register` set `regmidscore`=37, `regfinalscore`=57 where `regstdno`='20201126' and `reglecno`=239;
update `register` set `regmidscore`=28, `regfinalscore`=68 where `regstdno`='20210216' and `reglecno`=349;
update `register` set `regmidscore`=16, `regfinalscore`=65 where `regstdno`='20210326' and `reglecno`=349;
update `register` set `regmidscore`=18, `regfinalscore`=38 where `regstdno`='20201016' and `reglecno`=167;
update `register` set `regmidscore`=25, `regfinalscore`=58 where `regstdno`='20220416' and `reglecno`=349;
select * from `register`;

#실습 3-10
update `register`
set
	`regtotalscore` = `regmidscore` + `regfinalscore`,
    `reggrade` = if(`regtotalscore` >= 90, 'A',
			     if(`regtotalscore` >= 80, 'B',
                 if(`regtotalscore` >= 70, 'C',
                 if(`regtotalscore` >= 60, 'D', 'F'))));
select * from `register`;

#실습 3-11
select * from `register` order by `regtotalscore` desc ;

#실습 3-12
select * from `register` where `reglecno`=349 order by `regtotalscore` desc;

#실습 3-13
select * from `lecture` where `lectime` >= 30;

#실습 3-14
select `lecname`, `lecclass` from `lecture`;

#실습 3-15
select `stdno`, `stdname` from `student`;

#실습 3-16
select * from `student` where `stdAddress` is null;

#실습 3-17
select * from `student` where `stdAddress` like '부산%';

###실습 3-18###
select * from `student` as a
left join `register` as b
on a.stdno = b.regStdNo;

#실습 3-19
select 
	a.`stdNo`,
    a.`stdName`,
    b.`regLecNo`,
    b.`regFinalScore`,
    b.`regTotalScore`,
    b.`regGrade`
from `student` as a
join `register` as b
on a.`stdno` = b.`regStdNo`
order by `stdno`;

#실습 3-20
select `stdname`, `stdno`, `reglecno`
from `student` as a
join `register` as b
on a.stdno = b.regstdNo
where b.reglecno=349;

#실습 3-21
select 
	`stdno`,
    `stdname`,
    count(`stdno`) as `수강신청 건수`,
    sum(`regTotalScore`) as `종합점수`,
    sum(`regTotalScore`) / count(`stdno`) as `평균`
from `student` as a
join `register` as b
on a.stdno = b.regStdNo
group by `stdno`
order by `stdno`;

#실습 3-22
select * from `register` as a
join `lecture` as b
on a.regLecNo = b.lecNo
;

#실습 3-23
select
	`regStdNo`,
    `regLecNo`,
    `lecname`,
    `regMidScore`,
    `regFinalScore`,
    `regTotalScore`,
    `regGrade`
from `register` as a
join `lecture` as b
on a.regLecNo = b.lecNo;

###실습 3-24###
select
	count(*) as `사회복지 마케팅 수강 신청건수`,
    avg(`regtotalscore`) as `사회복지 마케팅 평균`
from `register` as a
join `lecture` as b
on a.regLecNo = b.lecNo
where `lecname` = '사회복지 마케팅';

###실습 3-25###
select
	`regstdno`,
    `lecname`
from `register` as a
join `lecture` as b
on a.reglecno = b.lecno
where `regGrade` = 'A';

#실습 3-26
select * from `student` as a
join `register` as b on a.stdno = b.regstdno
join `lecture` as c on b.reglecno = c.lecno
order by `stdyear` desc;

#실습 3-27
select
	`stdNo`,
    `stdName`,
    `lecNo`,
    `lecName`,
    `regMidScore`,
    `regFinalScore`,
    `regTotalScore`,
    `regGrade`
from `student` as a
join `register` as b on a.stdno = b.regstdno
join `lecture` as c on b.regLecNo = c.lecNo
order by `regTotalScore` desc;

#실습 3-28
select
	`stdNo`,
	`stdName`,
	`lecName`,
	`regTotalScore`,
	`regGrade`
from `student` as a
join `register` as b on a.stdno = b.regstdno
join `lecture` as c on b.regLecNo = c.lecNo
where `reggrade`='F';

#실습 3-29
select
	`stdno`,    
	`stdname`,
    sum(`lecCredit`) as `이수학점`
from `student` as a
join `register` as b on a.stdno = b.regstdno
join `lecture` as c on b.regLecNo = c.lecNo
where `regGrade` < 'F'
group by `stdno`
order by `stdno`;

#실습 3-30
select
	`stdno`,
	`stdname`,
    group_concat(`lecname`) as `신청과목`,
    group_concat(if(`regtotalscore` >= 60, `lecname`, null)) as `이수과목`
from `student` as a
join `register` as b on a.stdno = b.regstdno
join `lecture` as c on b.regLecNo = c.lecNo
group by `stdno`;



 
 
 
 