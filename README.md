## 🐬 MySQL Practice

MySQL을 활용한 데이터베이스 기초 실습 프로젝트입니다. 데이터베이스 설치부터 테이블 생성, 제약조건 적용까지 실제 환경에서의 사용을 염두에 두고 단계별로 실습을 진행했습니다.

---

## 1️⃣장 - MySQL 설치 및 사용자 관리

MySQL 서버를 설치하고 데이터베이스와 사용자를 생성하는 실습입니다.

* 새로운 사용자 계정을 생성하고, 권한을 부여
* 데이터베이스 생성 및 삭제 명령을 실습하며 기본 명령어 사용법을 익힘
* CLI를 활용한 접속 및 관리 흐름을 이해하는 데 중점을 둠

---

## 2️⃣장 - 기본 SQL 및 테이블 생성

기본적인 SQL 문법을 사용하여 테이블을 생성하고 데이터를 삽입하는 실습입니다.

* `CREATE TABLE`, `INSERT INTO`, `SELECT`, `DESC`, `SHOW CREATE TABLE` 등을 실습함
* 테이블 구조를 복사하거나 데이터를 선택적으로 복사하는 명령어(`LIKE`, `AS SELECT`)를 연습함
* SQL 기본 흐름에 익숙해지는 데 목적이 있음

---

## 3️⃣장 - 테이블 제약조건 적용

테이블에 다양한 제약조건을 부여하여 데이터의 무결성을 보장하는 실습입니다.

* `PRIMARY KEY`, `UNIQUE`, `NOT NULL`, `DEFAULT`, `CHECK`, `FOREIGN KEY` 등을 적용함
* 외래 키 관계 설정을 통해 테이블 간 연결을 실습함
* 각 제약조건의 역할과 동작 방식을 확인하고 오류 상황을 테스트함

---

## 4️⃣장 - SQL 고급
### 1. 테이블 생성 및 제약조건

* **Member**, **Department**, **Sales** 3개 테이블 생성
* 기본키(PK), 유니크(UNIQUE), NOT NULL, DEFAULT 값 지정 가능
* AUTO\_INCREMENT를 통한 자동 증가 컬럼 생성
* 날짜 및 시간 타입(DATETIME, YEAR 등) 사용

### 2. 데이터 삽입 (INSERT)

* 각 테이블에 회원, 부서, 매출 데이터 입력
* `NOW()` 함수를 활용해 현재 날짜/시간 자동 입력 가능

### 3. 기본 조회와 조건 검색 (SELECT ... WHERE)

* WHERE 절에서 다양한 조건 사용: `=`, `<>` (또는 `!=`), `>`, `<`, `>=`, `<=`
* AND, OR, NOT 연산자로 복합 조건 처리
* `IN (값 목록)`으로 여러 값 조건 지정
* `BETWEEN ... AND ...` / `NOT BETWEEN ... AND ...` 범위 조건
* `LIKE`로 문자열 패턴 검색 (`%`, `_` 와일드카드 활용)

### 4. 정렬 (ORDER BY)

* 컬럼을 기준으로 오름차순(ASC), 내림차순(DESC) 정렬
* 다중 컬럼 정렬 가능 (예: `ORDER BY year DESC, month ASC`)

### 5. 데이터 일부 조회 (LIMIT)

* 조회 결과 중 원하는 범위 지정 (시작 인덱스, 개수)
* 정렬과 함께 사용해 특정 구간 데이터 추출 가능

### 6. 집계 함수 및 함수 활용

* 집계 함수: `SUM()`, `AVG()`, `MAX()`, `MIN()`, `COUNT()`
* 수학 함수: `CEILING()`, `FLOOR()`, `ROUND()`, `RAND()`
* 문자열 함수: `LEFT()`, `RIGHT()`, `SUBSTRING()`, `CONCAT()`
* 날짜 함수: `CURDATE()`, `CURTIME()`, `NOW()`
* 집계 결과나 함수 활용해 다양한 계산 및 문자열/날짜 조작 가능

### 7. 조건별 집계 및 그룹핑

* 특정 조건(예: 연도, 월)으로 매출 합계, 평균, 최대/최소 구하기
* `GROUP BY`절로 특정 컬럼 기준 그룹핑 (ex. uid, year)
* 그룹별 집계 결과에 정렬 가능

### 8. 그룹 조건 필터링 (HAVING)

* `HAVING` 절로 그룹별 결과에 조건 지정 (ex. 합계 20만 이상인 그룹만 출력)

### 9. 테이블 복사 및 UNION

* `CREATE TABLE new_table LIKE old_table`로 테이블 구조 복사
* `INSERT INTO new_table SELECT * FROM old_table` 로 데이터 복사
* `UNION`으로 두 테이블 결과 합집합 (중복 제거)
* `UNION ALL`은 중복 포함
* 정렬과 결합 가능 (`ORDER BY`)

### 10. JOIN 조회

* 여러 테이블을 조인하여 데이터 결합
* `INNER JOIN ... ON ...` 또는 `USING` 구문 사용
* 다중 테이블 조인 가능 (예: Sales JOIN Member JOIN Department)
* 조인으로 한 번에 연관 데이터 조회 가능

---

## 5️⃣장 - 데이터베이스 개체 실습 정리

### 1. 인덱스 조회  
- `show index from User1;`  
- `show index from User2;`  
- `show index from User3;`  
테이블별 인덱스 정보 확인

### 2. 인덱스 생성 및 분석  
- `create index idx_user_uid on User1 (uid);`  
- `analyze table User1;`  
인덱스 생성 후 테이블 통계 정보 갱신

### 3. 인덱스 삭제  
- `drop index idx_user_uid on User1;`  
생성한 인덱스 삭제

### 4. 뷰(View) 생성  
- 단순 뷰: 이름, 전화번호, 나이만 조회하는 `vw_user1`  
- 조건 뷰: 나이가 30 미만인 `User4`를 위한 `vw_user4_age_under30`  
- 조인 뷰: 직원, 부서, 매출 정보를 결합한 `vw_member_with_sales`

### 7. 프로시저 작성 및 호출  
- `proc_test1`: Member와 Department 테이블 데이터 조회  
- `proc_test2`: 입력한 이름으로 Member 검색 (입력 파라미터)  
- `proc_test3`: 직급과 부서 조건으로 Member 검색 (입력 파라미터)  
- `proc_test4`: 특정 직급에 해당하는 회원 수 반환 (입력, 출력 파라미터)  
- `proc_test5`: 이름으로 직원 UID 조회 후 해당 매출 내역 조회 (변수 선언 및 활용)  
- `proc_test6`: IF 조건문 사용 예제 (num1, num2 비교 후 결과 출력)

### 주요 SQL 문법 및 기능
- **인덱스 관리**: 인덱스 생성, 삭제, 테이블 분석으로 성능 개선  
- **뷰(View)**: 복잡한 쿼리를 단순화하고 재사용성 향상  
- **스토어드 프로시저**: 반복 쿼리, 조건 처리, 변수 사용, 입력/출력 파라미터 지원  
- **제어문**: IF 조건문으로 로직 제어 가능

---

## 6️⃣장 - 데이터모델링 실습 정리

데이터모델링은 현실 세계의 데이터를 구조화하여 데이터베이스에 적합한 형태로 설계하는 과정입니다.
주요 목표는 데이터 간의 관계를 명확히 하고, 효율적이고 일관성 있는 데이터 관리가 가능하도록 하는 것입니다.

### 1. ERD 작성
고객(Customer), 상품(Product), 주문(Order) 테이블을 설계

각 테이블은 기본 키와 관련된 속성들을 포함하며, 주문 테이블은 고객과 상품을 참조하는 외래키 관계를 가짐

### 2. 데이터 입력
고객, 상품, 주문 테이블에 실제 예시 데이터를 삽입하여 기본적인 데이터 흐름을 이해함
고객별 주문 내역과 상품 정보를 관리하는 구조를 확인함

### 3. 데이터 조회
고객, 주문, 상품 테이블을 JOIN하여 주문 내역과 고객 정보, 상품 정보를 함께 조회하는 쿼리를 작성

특정 고객의 주문 내역 조회와 전체 주문 금액 합계 계산 쿼리를 실습함

### 4, 5, 6. 은행 모델링 실습
은행 고객(bank_customer), 계좌(bank_account), 거래(bank_transaction) 테이블 설계를 통해 고객과 계좌, 거래 관계를 모델링함

각 테이블에 데이터를 입력하고, 고객별 계좌 정보와 거래 내역을 조회하는 쿼리를 실습함

고객 구분(개인/기업)에 따른 계좌 잔액 정렬 조회 등 다양한 조건 쿼리도 연습함

### 7, 8, 9. 대학 모델링 실습
학생(Student), 강의(Lecture), 수강(Register) 테이블을 설계하여 대학 수강 시스템을 모델링함

학생과 수강, 강의 테이블 간 관계를 기반으로 다양한 조회 쿼리를 작성함

수강하지 않은 학생 조회, 점수 합산에 따른 학점 산정, 특정 학년 학생들의 수강 정보 조회 등을 실습함

---

## 7️⃣장 - 정규화

### 비정규형 테이블 설계

* 한 테이블에 주문 정보(orderNo, orderDate), 고객 정보(custId, custName, custAddr), 그리고 책 정보(bookNo, bookName, bookCount, bookPrice)가 모두 포함되어 있음
* 중복 데이터가 많고, 수정/삭제 시 이상현상 발생 가능성이 있음
* 예) 동일 고객이 여러 주문을 할 경우 고객 정보가 여러 행에 반복 저장됨

### 1차 정규화 (1NF)

* 테이블을 분리하여 중복 데이터를 최소화함
* `UserOrder` 테이블에는 주문번호, 주문일자, 고객 정보만 저장
* `Order` 테이블에는 주문번호와 책 번호, 수량, 가격 정보를 분리하여 저장
* `Book` 테이블에는 책 번호와 책 이름 정보를 저장
* 테이블 간 외래키 관계를 통해 데이터 무결성 유지

### 2차 정규화 (2NF)

* 고객 정보를 별도의 `User` 테이블로 분리
* `UserOrder` 테이블은 주문 번호, 주문일자, 고객 ID만 보유하며, 고객 ID는 `User` 테이블과 외래키로 연결됨
* 중복된 고객 정보가 완전히 제거되고, 고객 정보 변경 시 한 군데만 수정하면 됨

### 정규화의 의의

* 데이터 중복 최소화와 이상현상 방지를 위해 데이터를 단계별로 분리하여 구조화
* 데이터베이스 설계의 효율성과 무결성을 높이는 중요한 과정임
* 1NF, 2NF 등 정규화 단계를 통해 테이블 구조를 점진적으로 개선할 수 있음

---

## 8️⃣장 - 트랜잭션

### 트랜잭션 개념

* 데이터베이스에서 하나의 작업 단위로 실행되는 일련의 작업들을 트랜잭션이라 함
* 트랜잭션은 원자성(Atomicity), 일관성(Consistency), 독립성(Isolation), 지속성(Durability) 이 네 가지 특성(ACID)을 보장해야 함

### 1. 트랜잭션의 시작과 커밋

* `START TRANSACTION` 명령으로 트랜잭션 시작
* 은행 계좌 간 금액 이체 작업 수행 (출금 계좌에서 차감, 입금 계좌에 더함)
* 모든 작업이 성공적으로 완료되면 `COMMIT` 으로 변경사항을 확정
* 트랜잭션 완료 후 변경 내용이 DB에 반영됨

### 2. 트랜잭션의 롤백

* 트랜잭션 시작 후 작업 도중 문제가 생기거나 작업 취소 시 `ROLLBACK` 명령을 사용
* 이체 작업을 모두 취소하고 원래 상태로 되돌림
* 데이터의 무결성과 일관성을 유지하는 데 유용함

### 3. 오토커밋 비활성화 상태에서 트랜잭션 제어

* 기본적으로 MySQL은 각 SQL문 실행 후 자동으로 커밋하는 오토커밋 모드가 켜져 있음
* `SET autocommit = 0` 명령으로 오토커밋 비활성화
* 이후 여러 작업을 수행한 후 `ROLLBACK` 을 호출하면 모든 변경사항이 취소됨
* 수동으로 트랜잭션을 관리할 때 사용

### 정리

* 트랜잭션을 사용하면 여러 작업을 하나의 논리 단위로 묶어 데이터 일관성 유지 가능
* 실패 시 전체 작업을 원자적으로 취소할 수 있어 안전한 데이터 처리 보장
* 오토커밋 기능을 제어하여 트랜잭션 관리 방식을 선택할 수 있음
