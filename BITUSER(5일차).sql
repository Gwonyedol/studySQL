-- View 객체 .....(가상테이블)
-- 오라클.pdf PAGE 192
-- view 객체 (create .....)
-- create view viewname as [ select 구문 ] (view를 통해서 볼 수 있는 데이터 목록)
-- view 는 테이블처럼 사용 가능 (가상테이블) -> emp , dept 같은 논리로 접근해서 사용
-- view 메모리 상에만 존재하는 가상테이블 (subquery -> in line view - > from (select deptno , avg(sal) .....)
-- view 가상 테이블
-- 사용법 : 일반 테이블과 사용법이 동일하다. (select ,,,, where ,,,, )
-- DML(insert , update , delete) -> View를 통해서 DML 가능 -> View가 가지고 있는 (볼 수 있는) 실 테이블 데이터를 변경
--view 는 별도의 권한 필요(ORA-01031: insufficient privileges)
-- SYSTEM PRIVILEGES
-- GRANT CREATE VIEW TO "BITUSER" WITH ADMIN OPTION;
create view v_001
as
    select empno , ename from emp;
select * from v_001; -- SQL문장 덩어리이다. > view가 가지고 있는 sql 문장을 실행한다.
    
--View 사용 목적
-- 1. 개발자의 편리성 (JOIN M SUBQUERY) >> 가상 테이블 개념 ....
-- 2. 편리성 (쿼리 단순화) -> 복잡한 쿼리 미리 만들어 두고 사용
-- 3. 보안(권한 처리) -> 노출하고 싶은 데이터만 모아서 view 생성 -> view 권한 부여
create view v_emp
as
    select empno, ename, job, hiredate from emp;
select * from v_emp;
select empno, ename from v_emp;
select * from v_emp where empno = 7788;
-- 편리성 (쿼리 단순화)
create view v_002
as
    select e.empno, e.ename , d.deptno , d.dname
    from emp e join dept d 
    on e.deptno = d.deptno;
select * from v_002;
select * from v_002 where deptno=30;
create view v_003 --view 는 가상 테이블 (나름 자존심 : 나 컬럼명 만들어줘야지)
as
    select deptno, avg(sal) as avgsal
    from emp
    group by deptno;
select *
from emp e join v_003 s
on e.deptno = s.deptno
where e.sal > s.avgsal;
-- 테이블 1개 이상 ..... JOIN ,,,, 안되면 ,,,, subquery ,,,, 가상테이블 (view)
/*
CREATE  [OR  REPLACE]  [FORCE | NOFORCE]  VIEW view_name [(alias[,alias,...])] 
AS Subquery 
[WITH  CHECK  OPTION  [CONSTRAINT  constraint ]] 
[WITH  READ  ONLY
OR  REPLACE  이미 존재한다면 다시 생성한다. 
FORCE   Base Table 유무에 관계없이 VIEW 을 만든다. 
NOFORCE  기본 테이블이 존재할 경우에만 VIEW 를 생성한다. 
view_name  VIEW 의 이름 
Alias   Subquery 를 통해 선택된 값에 대한 Column 명이 된다. 
Subquery  SELECT 문장을 기술한다. 
WITH CHECK OPTION VIEW 에 의해 액세스 될 수 있는 행만이 입력,갱신될 수 있다.  
Constraint  CHECK OPTON 제약 조건에 대해 지정된 이름이다. 
WITH READ ONLY  이 VIEW 에서 DML 이 수행될 수 없게 한다. 
 */
 
 drop view v_0076;
 
 create or replace view v_007
 as
    select avg(sal) as avgsal from emp; -- 함수
    
    select* from v_007;
 
 create or replace view v_007
 as
    select round(avg(sal),0) as avgsal from emp;
 
 -- VIEW를 통한 DML 가능( insert , update , delete)
 -- 단 view 테이블이 아니기 때문에 view를 통해서 볼 수 있는 데이터에 대해서만
 -- 복합 view(하나 이상의 테이블로 구성) -> DML(불가)
 -- 단순 view (테이블 1개로) 만든 view
 
 select * from v_emp; -- view통해서 볼 수 있는 데이터 (empno , ename, job , hiredate)
 
 update v_emp -- view 를 통해서 sal 데이터 볼 수 없다.
 set sal = 0; --(x)
 
 update v_emp -- 원본 테이블 가서 .... 데이터를 update -- 결국 emp 테이블 데이터 ....변경
 set job = 'IT';
  
create or replace view v_emp2
as
    select * from emp where deptno = 20;
 
 select * from v_emp2;
 
-- 1. 
update v_emp2 --자기가 볼 수 있는 데이터만 update .....
set sal =0;
 
 select * from emp;
 rollback;
 
 -- view 목록 보기
 select * from user_views;
 --------------------------------------------------------------------------------------------
 -- 1. 30번 부서 사원들의 직위 , 이름 , 월급을 담는 view를 만들어라
 create view v_emp_001
 as
  select ename, job , sal from emp;
  select * from v_emp_001;
  
  --2. 30번 부서 사원들의  직위, 이름, 월급을 담는 VIEW를 만드는데,
-- 각각의 컬럼명을 직위, 사원이름, 월급으로 ALIAS를 주고 월급이
-- 300보다 많은 사원들만 추출하도록 하라.
-- create or replace view view001 (컬럼명, 컬럼명, .....)  
create view v_emp_002
as
  select job as "직위" , ename as "사원이름" , sal as "월급"
  from emp
  where sal > 300;
 select * from v_emp_002;
--3. 부서별 최대월급, 최소월급, 평균월급을 담는 VIEW를 만들어라.
create view v_emp_003
as
    select max(sal) as "최대월급" , min(sal) as "최소월급"  , avg(sal) as "평균월급"
    from emp;
       
--4. 부서별 평균월급을 담는 VIEW를 만들되, 평균월급이 2000 이상인
-- 부서만 출력하도록 하라.
 create view v_emp_004 
 as
  select avg(sal) as "평균월급"
  from emp
  where 평균월급>2000
  group by deptno;
 
 select deptno , avg(sal) as "평균월급"
 from emp
  group by deptno
  having  avg(sal)>2000;
--5. 직위별 총월급을 담는 VIEW를 만들되, 직위가 MANAGER인
-- 사원들은 제외하고 총월급이 3000이상인 직위만 출력하도록 하라.
create view v_emp_005
as
  select job , sum(sal) as "총월급"
  from emp
  where job != 'MANAGER'
  group by job
  having sum(sal) >=3000;
  
--------------------------------------------------------------------------------------------------------------------------
-- 시퀀스
-- 오라클.pdf (185 PAGE)
-- 순번 추출하기(번호)
-- 자동으로 번호를 생성하는 객체
/*
CREATE  SEQUENCE  sequence_name  
[INCREMENT  BY  n]  
[START  WITH  n]  
[{MAXVALUE n | NOMAXVALUE}]  
[{MINVALUE n | NOMINVALUE}] 
[{CYCLE | NOCYCLE}] 
[{CACHE | NOCACHE}]; 
sequence_name  SEQUENCE 의 이름입니다. 
INCREMENT  BY  n 정수 값인 n 으로 SEQUENCE 번호 사이의 간격을 지정. 
이 절이 생략되면 SEQUENCE 는 1 씩 증가. 
START  WITH  n  생성하기 위해 첫번째 SEQUENCE 를 지정. 
이 절이 생략되면 SEQUENCE 는 1 로 시작. 
MAXVALUE n  SEQUENCE 를 생성할 수 있는 최대 값을 지정. 
NOMAXVALUE   오름차순용 10^27 최대값과 내림차순용-1 의 최소값을 지정. 
MINVALUE n  최소 SEQUENCE 값을 지정. 
NOMINVALUE  오름차순용 1 과 내림차순용-(10^26)의 최소값을 지정. 
CYCLE | NOCYCLE  최대 또는 최소값에 도달한 후에 계속 값을 생성할 지의 여부를 
지정. NOCYCLE 이 디폴트. 
CACHE | NOCACHE  얼마나 많은 값이 메모리에 오라클 서버가 미리 할당하고 유지 
하는가를 지정. 디폴트로 오라클 서버는 20 을 CACHE. 
*/
select * from board;
create table board(
  boardid number constraint pk_board_id primary key,
  title varchar2(100) not null
);
-- boardid 컬럼은 (not null , unique, index 구성된다.) 
-- 개발자 : boardid 데이터는 .....
-- 개발자 : where boaerdid = ? 무조건 1건의 데이터 ..... return
-- insert into board(boardid , title) values (.....
-- 그러면 중복되지 않고 , null 값이 아니다 라는 보장 .....
/*
create table board(
  boardid number constraint pk_board_id primary key,
  title varchar2(100) not null
);
*/
-- 조건 : 처음 글을 쓰면 1이라는 값을 insert ,,,, 그 다음 글 부터는 2,3,4 순차적인 값을 insert
insert into board(boardid, title) values(1,'aaaaa');
insert into board(boardid, title) values((select count(boardid) +1 from board), '제목1');
--delete .... 후 insert 시 중복값 (PK값)
--다른 방법
insert into board(boardid, title)
values ( (select nvl(max(boardid),0)+1  from board) , '처음');
insert into board(boardid, title)
values ( (select nvl(max(boardid),0)+1  from board) , '두번째');
insert into board(boardid, title)
values ( (select nvl(max(boardid),0)+1  from board) , '세번째');
select * from board;
delete from board where boardid=1;
select * from board;
------------------------------------------------------------------------------------------------------------
-- sequence 번호 추출 (규칙) : 중복값이 없고 , 순차적인 값 (공유 객체)
------------------------------------------------------------------------------------------------------------
create sequence board_num;
select * from board;
select * from user_sequences;
/*
NEXTVAL 과 CURRVAL 의사열
1) NEXTVAL 는 다음 사용 가능한 SEQUENCE 값을 반환 한다.  
2) SEQUENCE 가 참조될 때 마다, 다른 사용자에게 조차도 유일한 값을 반환한다. 
3) CURRVAL 은 현재 SEQUENCE 값을 얻는다. 
4) CURRVAL 이 참조되기 전에 NEXTVAL 이 사용되어야 한다. 
*/
--실채번
select board_num.nextval from dual; -- 1 return
-- 몇번까지 했지 ....?
select board_num.currval from dual; -- 니가 마지막으로 추출한 번호는 2
----------------------------------------
create sequence kboard_num;
create table kboard(
  num number constraint pk_kboard_id primary key,
  title varchar2(100) not null
);
insert into kboard(num, title) 
values(kboard_num.nextval , '처음 글');
select * from kboard;
select kboard_num.currval from dual;
insert into kboard(num, title) 
values(kboard_num.nextval , '두번째 글');
insert into kboard(num, title) 
values(kboard_num.nextval , '세번째 글');
select * from kboard;
--------------------------------------------------------------------------------------------------------------
-- 1. sequence 객체 하나(테이블간 공유 객체) >> 여러개의 테이블에서 사용가능 (가능하다)
-- A(1)(4) , B(2) , C(3)
-- 사이트 (게시판) 10개
-- 상품 게시판 , 관리자 게시판 , 회원 게시판 
-- sequence 따로 만들어서 사용 ....... 하나의 sequence 를 공유해도 된다.
-- TIP)
-- ms-sql 
-- ms-sql : create table board(boardnum int identity(1,1) , title varchar(20))
-- insert into board(title) values('방가'); --> boardnum : 1 값이 자동 insert
-- ms-sql 2012 version부터 (sequence)
-- my-sql : create table board(boardnum int auto_increment , title varchar(20));
-- insert into board(title) values('방가');
-- https://mariadb.com/kb/en/library/create-sequence/  maria db   sequence 객체 존재
----------------------------------------------------------------------------------------
-- sequence 객체 옵션
create sequence seq_num
start with 10
increment by 2;
select seq_num.nextval from dual;
select seq_num.currval from dual;
--게시판 글을 insert
--게시판 최신글 순으로 보이기
-- select * from board order by boardnum desc;
-----------------------------------------------------------------------------------
--개발자 필수 2
--rownum  의사컬럼 : 실제 물리적으로 존재하는 컬럼은 아니고 논리적인 존재
--ROWNUM : 실제로 테이블에 컬럼으로 존재하지 않지만 내부적으로 행 번호 부여할 수 있는 의사컬럼
--ROWD : 주소값 (행이 실제로 저장되는 내부 주소값) -> 인덱스 안될때 사용
select * from emp;
select rownum as 순번, empno, ename from emp;  --select한 결과를 가지고 순번을 붙인다..
--Top-n 쿼리
--테이블에서 조건에 맞는 상위 (TOP) 레코드(row) n개 추출
--MS-SQL 서버
--select top 10, * from emp order by sql desc
--oracle
--rownum (인사컬럼) : 기준을 정의
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--rownum 사용 
--1. 정렬의 기준을 정의하는 작업(선행)
--2. 정렬이 된 상황에서 앞에 순번  > 조건절 제시 > 데이터 추출
-- 1단계
select*
from(           
          select *
          from emp order by sal desc
          ) e;
          
-- 2단계
select rownum as "num", e.*
from(           
          select *
          from emp order by sal desc
          ) e;
          
-- 3단계
select rownum as "num", e.*
from(           
          select *
          from emp order by sal desc
          ) e
  where rownum >= 1 and rownum <= 5;
  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
select * from (
select rownum as "num" , e.*
from(
select *
from emp order by sal desc
) e
) n
where "num"<10;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--게시판 (페이징 처리)
--100건 데이터
--10건씩 나누어서 보여주기
--총 100건
--pagesze = 10 (한 화면에 [페이지] 보여줄 데이터 건수 row 수)
--page 개수 > 10
-- 1~ 10  1page  DB에서 1 ~ 10번글까지 select  가지고 APP출력
--10~20  2page
-- ~
--91~100 10page
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--HR 계정으로 이동
select * from employees;
--41~50 사원데이터 출력하세요 (조건 사원은 낮은 순으로)
--pagesize = 10
--1~10, 11~20, 21~30
select * from employees order by employee_id asc;
select rownum as "num", e.*
from(           
select * from employees order by employee_id asc
        ) e where rownum <=10
   s where num >0 ;
   
   --------------------------------------------------------------------------------------------------------------------------------------------------------------------------
   
   --SQL 기본과정 END
   --SQL 고급과정 (3차 프로젝트 전에)]
   --고급쿼리 (순위)
   --PL - SQL
   --(변수, 제어문, 커서, 함수 ,프로시져 ,트리거, 스케쥴,,)
   --------------------------------------------------------------------------------------------------------------------------------------------------------------------------
   --1차 종합 TEST 50문제