#날짜 : 2025/02/27
#이름 : 한결
#내용 : 8장 트랜잭션

#실습 8-1
START TRANSACTION; -- 작업시작
SELECT * FROM `bank_account`;
UPDATE `bank_account` SET
								`a_balance` = `a_balance` - 10000
							where
								`a_no`='101-11-1001';
								
UPDATE `bank_account` SET
								`a_balance` = `a_balance` + 10000
							where
								`a_no`='101-11-1003';
								
COMMIT; -- 작업 확정

#실습 8-2
START TRANSACTION;
UPDATE `bank_account` SET
								`a_balance` = `a_balance` - 10000
							where
								`a_no`='101-11-1001';
								
UPDATE `bank_account` SET
								`a_balance` = `a_balance` + 10000
							where
								`a_no`='101-11-1003';
								
ROLLBACK; -- 작업 취소

#실습 8-3
SELECT @@autocommit;
SET autocommit = 0; -- 오토커밋을 비활성화
UPDATE `bank_account` SET
								`a_balance` = `a_balance` - 10000
							where
								`a_no`='101-11-1001';
								
SELECT * FROM `bank_account`;

ROLLBACK;














