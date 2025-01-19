#날짜 : 2025/01/06
#이름 : 한결
#내용 : 1장 데이터베이스 설치와 생성

#실습 1-1
create database `StudyDB`;
show databases;
drop database `StudyDB`;

#실습 1-2
create user 'gyeol00'@'%' identified by '1234';
grant all privileges on StudyDB.* to 'gyeol00'@'%';
flush privileges;

#실습 1-3
alter user 'gyeol00'@'%' identified by 'abc1234';
drop user 'gyeol00'@'%';
flush privileges;