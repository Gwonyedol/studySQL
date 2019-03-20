/*
1일차 수업
1. 오라클 소프트웨어 다운로드
2. 오라클 다운로드 경로
3. Oracle 설치(SYS, SYSTEM 계정에 대한 암호 : 1004)
4. sql 프로그램 제공(CMD) :  GUI환경 일반 사용자 사용 불편
5. 별도의 Tool 설치 무료 (sqlDeveloper), 유료(토드, 오렌지, SQLGATE)
6. SqlDeveloper 툴을 통해서 Oracle Server 접속....
  >> HR 계정 : 암호 1004, UnLock 2가지 사용가능 .... (사원관리 실습 테이블)ㅂ
  >> 새로운 계정 bit user

7. 현재 접속 계정 확인 : show user;

select * from

CREATE TABLE EMP
(EMPNO number not null,
ENAME VARCHAR2(10),
JOB VARCHAR2(9),
MGR number ,
HIREDATE date,
SAL number ,
COMM number ,
DEPTNO number );
--alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';

INSERT INTO EMP VALUES
(7369,'SMITH','CLERK',7902,'1980-12-17',800,null,20);
INSERT INTO EMP VALUES
(7499,'ALLEN','SALESMAN',7698,'1981-02-20',1600,300,30);
INSERT INTO EMP VALUES
(7521,'WARD','SALESMAN',7698,'1981-02-22',1250,200,30);
INSERT INTO EMP VALUES
(7566,'JONES','MANAGER',7839,'1981-04-02',2975,30,20);
INSERT INTO EMP VALUES
(7654,'MARTIN','SALESMAN',7698,'1981-09-28',1250,300,30);
INSERT INTO EMP VALUES
(7698,'BLAKE','MANAGER',7839,'1981-04-01',2850,null,30);
INSERT INTO EMP VALUES
(7782,'CLARK','MANAGER',7839,'1981-06-01',2450,null,10);
INSERT INTO EMP VALUES
(7788,'SCOTT','ANALYST',7566,'1982-10-09',3000,null,20);
INSERT INTO EMP VALUES
(7839,'KING','PRESIDENT',null,'1981-11-17',5000,3500,10);
INSERT INTO EMP VALUES
(7844,'TURNER','SALESMAN',7698,'1981-09-08',1500,0,30);
INSERT INTO EMP VALUES
(7876,'ADAMS','CLERK',7788,'1983-01-12',1100,null,20);
INSERT INTO EMP VALUES
(7900,'JAMES','CLERK',7698,'1981-10-03',950,null,30);
INSERT INTO EMP VALUES
(7902,'FORD','ANALYST',7566,'1981-10-3',3000,null,20);
INSERT INTO EMP VALUES
(7934,'MILLER','CLERK',7782,'1982-01-23',1300,null,10);

COMMIT;

CREATE TABLE DEPT
(DEPTNO number,
DNAME VARCHAR2(14),
LOC VARCHAR2(13) );

INSERT INTO DEPT VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES (30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES (40,'OPERATIONS','BOSTON');

COMMIT;



CREATE TABLE SALGRADE
( GRADE number,
LOSAL number,
HISAL number );

INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);
COMMIT;
INSERT INTO EMP VALUES
(7369,'SMITH','CLERK',7902,'1980-12-17',800,null,20);
INSERT INTO EMP VALUES
(7499,'ALLEN','SALESMAN',7698,'1981-02-20',1600,300,30);
INSERT INTO EMP VALUES
(7521,'WARD','SALESMAN',7698,'1981-02-22',1250,200,30);
INSERT INTO EMP VALUES
(7566,'JONES','MANAGER',7839,'1981-04-02',2975,30,20);
INSERT INTO EMP VALUES
(7654,'MARTIN','SALESMAN',7698,'1981-09-28',1250,300,30);
INSERT INTO EMP VALUES
(7698,'BLAKE','MANAGER',7839,'1981-04-01',2850,null,30);
INSERT INTO EMP VALUES
(7782,'CLARK','MANAGER',7839,'1981-06-01',2450,null,10);
INSERT INTO EMP VALUES
(7788,'SCOTT','ANALYST',7566,'1982-10-09',3000,null,20);
INSERT INTO EMP VALUES
(7839,'KING','PRESIDENT',null,'1981-11-17',5000,3500,10);
INSERT INTO EMP VALUES
(7844,'TURNER','SALESMAN',7698,'1981-09-08',1500,0,30);
INSERT INTO EMP VALUES
(7876,'ADAMS','CLERK',7788,'1983-01-12',1100,null,20);
INSERT INTO EMP VALUES
(7900,'JAMES','CLERK',7698,'1981-10-03',950,null,30);
INSERT INTO EMP VALUES
(7902,'FORD','ANALYST',7566,'1981-10-3',3000,null,20);
INSERT INTO EMP VALUES
(7934,'MILLER','CLERK',7782,'1982-01-23',1300,null,10);

COMMIT;

*/


select * from emp;
select * from dept;
select * from salgrade;

--1.사원테이블에서 모든 데이터를 출력하세요.

select*from emp; --쿼리문장은 대소문자를 구분하지 않습니다.
SELECT*FROM DEPT;
select*from salgrade;

--2.특정 컬럼 데이터 출력하기
select empno, ename, sal from emp;

--3.컬럼에 가명칭(별칭alias) 부여하기
select empno 사번, ename 이름
from emp;

select empno as "사번", ename as "이름"
from emp;
--정식(ansi문법)

--Oracle 데이터 문자열(문자열 데이터는 대소문자 구문)
--문자열 표기 '문자열'로 함
--소문자 a 대문자 A 다른문자 취급
select empno, ename from emp where enmae='king';
select empno, ename from emp where enmae='King';

--Oracle SQL : 연산자(결합연산자(||)와 산술연산자(+) 구분)
--JAVA : + (숫자+숫자 연산)
--JAVA : + (문자열+문자열 결합)
--TIP ms-sql +(연산,결합)


select '사원의 이름은'||ename||'입니다' as "사원정보"
from emp;


--테이블 컬럼은 기본 타입
--컬럼의 타입 숫자, 문자, 날짜..

desc emp; -- 테이블의 타입 기본 정보 조회
select empno || ename -- number ||varchar 내부적으로 형변환(숫자타입을 문자타입으로 바꿈)
from emp;

select empno + ename
from emp;

-- 사장님 우리 회사에 직종이 몇개나 있나
--distinct :  중복데이터 제거
--distinct 원리 : grouping
--재미삼아서...(group에 group의 데이터)
select distinct job, deptno from emp order by job;
select distinct deptno, job from emp order by deptno;


--Oracle(SQL 언어)
--JAVA 언어(연산자)
--JAVA 거의 동일(+,*,-....) % 나머지를 구했던것.. >> 오라클은 % 검색의 패턴으로 쓰임 >> 나머지구하는게 없어요.. 대신 Mod() 함수 이용 
--산술연산(+,*,-,/..) 
--사원테이블에서 사원의 급여를 100달러 인상한 결과를 출력하자
desc emp;
select sal, sal+100 as "인상급여" from emp;

select 100 + 100 from dual;
select 100 || 100 from dual;
select '100' + 100 from dual; -- 오라클에서 +는 무조건 산술! (문자를 숫자로)
select 'A100' + 100 from dual; -- Error

--JAVA 같다 (==) 할당(=)
--Oracle 같다 (=) 같지않다(!=)
--And,or,not
--조건절(원하는 row 가지고 오겠다)
select* from emp
where sal >=3000;

select empno,ename, sal
from emp
where sal >= 3000;

--이상, 이하(= 포함)
--초과, 미만

--사번이 77788번인 사번의 사번, 이름 직종 입사일을 출력하세요
select empno, ename, job, hiredate --3
from emp --1
where empno= 7788; --2

--사원의 이름이 king 사원의 사번,이름,급여 정보를 출력하세요

select empno , ename, sal
from emp
where ename = 'KING';

--급여가 2000달러 이상이면서 직종이 manager 인 사원의모든 정보를 출력하세요
--Hint) 논리 (AND, OR)
--AND 두개의 모든 참 --> 참

select *
from emp
where job = 'MANAGER' or sal>=2000;
--급여가 2000달러 이상이면서 직종이 manager 인 사원의모든 정보를 출력하세요
--두개의 조건중 아니면 참이여도 출력

-----------------------------------------------

--오라클 날짜 (DB 서버의 날짜)
--오라클 날짜(sysdate)
--모든 시스템 날짜 정보
--게시판 글쓰기
--insert into board(writer,titler,content,regdate)
--values("홍길동","방가","배고파요",sysdate)
--TIP) ms-sql : select getdate()
select sysdate from dual;
alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';

select hiredate from emp;

--오라클 시스템 테이블 ...
select*from SYS.NLS_SESSION_PARAMETERS; -시스템 환경 테이블 조회 확인
--NLS_DATE_FORMAT YYYY-MM-DD HH24:MI:SS
--NLS_DATE_LANGUAGE KOREAN
--NLS_DATE_FORMAT HH24:MI:SSXFF
--오라클 날짜 조회 : '2019-12-12'
select * from emp
where hiredate = '1980-12-17';

select * from emp
where hiredate = '1980/12/17'; -- (/)

select * from emp
where hiredate = '80/12/17'; --형식은 인정이 안됨!
--형식 : RR-MM-DD >> YYYY-MM-DD
--사원의 급여가 2000달라 이상이고 4000달라 이하인 모든 사원의 접오를 출력하세요

select *
from emp
where SAL >= 2000 and SAL<=4000 ;

--연산자 : between A and B (= 포함)
--주의사항 : 미만 초과의 사용금지

select*
from emp
where between 2000 and 4000;

--사원의 급여가 2000이상이고 4000이하인 모든 사원의 정보를 출력하세요

select*
from emp
where sal >2000 and sal<4000;

--부선 번호가 10번 또는 20번 또는 30번인 사원의 사번, 이름, 급여, 부서번호를 출력해보세요

select empno,ename, sal,deptno
from emp
where deptno = 10 or deptno = 20 or deptno = 30;

--IN연산자(조건 or 조건 or...)

select empno,ename, sal,deptno
from emp
where deptno in (10,20,30);

--부선번호가 10번 또는 20번이 아닌 사원의 사번, 이름, 급여, 부서번호를 출력하세요

select*
from emp
where dptno != 10 and deptno !=20 ;

--not in 연산자(부정값 and 부정값 and..)
select*
from emp
where deptno not in (10,20); --not in (deptno != 10 and deprno != 20)

--POINT : Oracle 값이 없다 (데이터 없다) >>null
--null 필요악

create table member(
  userid varchar2(20) not null, --필수
  name varchar2(20) not null, --필수
  hobby varchar2(50)         -- default(null)값을 허용하겠다
  
);

desc member;
insert into member(userid,hobby) values('hong','농구');
insert into member(userid,name) values('hong','홍길동'); -- hobby에 null값 들어감

select *from member;

insert into member(userid,name,hobby) values('kim','김씨','게임');
select *from member;

--실제반영
commit;


--수당(comm)을 받지않는 모든 사원의 정보를 출력하세요
-- 0도 데이터 취급( 받는조건 포함)
--comm컬럼에 데이터가 null 인것만 출력하세요
select*from emp where comm = null; --(x)

--null의 비교는 (is null, is not null)
select*from emp where comm is null;

--사원 테이블에서 사번, 이름, 급여, 수당, 총급여를 출력하세요
--총급여(급여+수당)

select empno, ename, sal, comm, sal+comm as "총급여"
from emp;

select empno, ename, sal, comm, sal+nvl(comm,0) as "총급여"
--nvl(a,b) a에서 null값을 만다면 b로 바꿔라
from emp;

--point null
--1.null과의 모든 연산은 그 결과가 null입니다.
--2.위 문제 해결: 함수 nvl(),nvl2() >> TIP my-sql:convert(), my-sql:IFNULL():null값 대체

select 1000 + null from dual;
select 1000 + nvl(null,0)from dual;
select comm, nvt(comm,1111)from emp;

--사원의급여가 1000이상이고 수당을 받지않는 사원의 사번, 이름, 직종, 급여, 수당을 츨력하세요
select empno,ename,job,sal,comm
from emp
where sal > 1000 and comm is null
;


---------------------------
--DQL (data query language) : SELECT
--DDL(데이터 정의어) create , alter, drop..(객체생성,수정,삭제)

--create Board (boardno number)
--JAVA : class Board(private boardno int)

create table Board(
boardid number not null, --숫자,필수입력
title varchar2(20) not null, -- 필수입력
content varchar2(2000) not null,
hp varchar2(20)
);

desc Board;

insert into board(boardid, title, content)
values(100,'오라클','할만');
select*from board;

rollback;
commit;

insert into board(boardid,title,content)
values(200,'자바','그립다');

insert into board(boardid,title,content)
values(300,'오라클은','하하');


select*from board;
commit;

select boardid , nvl(hp,'EMPTY') as "hp" from board;
--nvl 함수는 숫자 날짜 문자열 모두 적용 가능하다..

------------------------------------------
--문자열 검색
--주소검색 : 검색어 : '역삼' -> 역삼 단어가 있는 모든 문장이 다 나옴.. (like 검색)
--문자열 패턴 검색 (LIKE 연산자)
--like 연산자(와일드 카드 문자 (% 모든것 _: 한문자) 결합...
select ename
 from emp
 where ename like '%A%'; --ename 컬럼에 데이터에 A들어있는 모든 이름 검색

 select ename
 from emp
 where ename like '%a%'; --문자열 데이터 대소문자 엄격하게 구분

 select ename
 from emp
 where ename like 'A%';

 select ename
 from emp
 where ename like '%S';
 
 select ename
from emp
where ename like '%LL%';            --LL연달아 있으면 검색

select ename
from emp
where ename like '%A%A%';         --A가 두개만 있으면 검색

select ename
from emp
where ename like '_A%';               --첫글자는 어떤것이라도 상관없고 두번째 글짜는 A....



--오라클 과제(regexp_like) 상세 검색
select * from emp where REGEXP_LIKE(ename,'[A-C]');
--정규표현식(java -> oracle -> javascript)
--과제 : 정규 표현 예제 5개 만들기(카페 올리면)

-----------------------------------------------------------------------------------------------
--데이터 정렬하기
--order by 컬럼명 : 문자, 숫자, 날짜
--오름차순 : asc 낮은순 (default)
--내림차순 : desc높은순


select * from emp order by sal;             --default asc
select * from emp order by sal asc;

--급여를 많이 받는 순으로 정렬해서 출력하세요
select * from emp order by sal desc;

select ename from emp order by ename asc;     --정렬 가능



--입사일이 가장 늦은 순으로 정렬해서 사번,이름, 급여, 입사일 데이터를 출력하세요
--가장 최근에 입사한 순으로
select empno, ename, sal, hiredate
from emp
order by hiredate desc;

/*
SELECT           3
FROM            1
WHERE           2
ORDER BY       4          (select한 결과를 정렬)

*/

--해석
select empno, ename, sal, job, hiredate
from emp
where job = 'MANAGER'
order by hiredate desc;


--order by 컬럼명 desc, 컬럼명 asc, 컬럼명 desc
select job, sal
from emp
order by job asc, sal desc;

-----------------------------------------------------------
--연산자
--합집합 (union) : table과 table의 데이터를 합치는 것(중복값은 배제)
--합집합 (union all) : 중복값 허용


CREATE TABLE uta (name varchar2(20));

INSERT INTO uta(name) values('AAA');
INSERT INTO uta(name) values('BBB');
INSERT INTO uta(name) values('CCC');
INSERT INTO uta(name) values('DDD');
commit;

select * from uta;



CREATE table ut(name varchar2(20));

INSERT into ut(name) values('AAA');
INSERT into ut(name) values('BBB');
INSERT into ut(name) values('CCC');
commit;

select * from ut;


--union
select * from ut
union   --중복제거
select * from uta;


select * from ut
union  all
select * from uta;


--union 규칙
--1. 대응되는 컬럼의 타입이 동일해야한다
select empno, ename from emp
union
select dname, deptno from dept;     --대응되는 타입이 다르다

select empno, ename from emp
union
select deptno, dname from dept;


--실무 > subquery (in line view)
select empno, ename
from (
      select empno, ename from emp
      union
      select deptno, dname from dept
) order by empno desc;


--2. 대응되는 컬럼의 개수가 동일해야한다 (null 착한일)
select empno, ename, job, sal from emp
union
select deptno, dname, loc,null from dept;

--여기까지가 초보개발자가 의무적으로 해야하는 (단일 테이블) 대상으로 할 수 있는 쿼리...
-------------------------------------------------------------------------------------------------------------


--오라클 함수--[2일차]
--오라클 함수
/* 단일 행 함수의 종류
1) 문자형 함수 : 문자를 입력 받고 문자와 숫자 값 모두를 RETURN 할 수 있다.
2) 숫자형 함수 : 숫자를 입력 받고 숫자를 RETURN 한다.
3) 날짜형 함수 : 날짜형에 대해 수행하고 숫자를 RETURN 하는 MONTHS_BETWEEN 함수를
제외하고 모두 날짜 데이터형의 값 RETURN 한다.
4) 변환형 함수 : 어떤 데이터형의 값을 다른 데이터형으로 변환한다.
5) 일반적인 함수 : NVL, DECODE
*/

select ubutcao('the super man') from dual;

select lower('AAA'), upper('aaaa') from dual;

select name, lower(ename) as "ename" from emp;

select * from emp where enmae = 'king';

select * from emp where lower(ename) = 'king';

--문자열 개수
select length('abcd') from dual; --4
select length('홍길동') from dual; --3

select length('홍 길 동 a ') from dual; -- 공백도 문자열 개수에 포함


-- 결합연산자
--concat()

select 'a' || 'b' || 'c' as  "data" from dual; -- 문자열 결합

select concat('a','b') from dual; -- 파라미터 제한 있음ㄴㄴ
select ename ||'  '|| job as "name" from emp; 

--부분 문자열 추출
--java (substring)
--oracle(substr)
select substr('ABCDE',2,3) from dual;
select substr('ABCDE',1,1) from dual; -- 자기자신 : A
select substr('ABCDE',3,1) from dual; --C

select substr('ABCDE',3) from dual; --3--

select substr('ABCDE',-2,1) from dual;


/*
사원테이블에서 ename 컬럼 데이터에 대해서 첫글자는 소문자로 나머지 문자는 대문자로 출력하되
하나의 컬럼으로 출력하세요
--컬럼은 가명칭은 : fullname
--첫글자와 나머지 문자 사이에 공백하나를 넣으세요
ex) SMITH >> s MITH
*/ 

select lower(substr(ename,1,1)) from emp; -- s 소문자
select upper(substr(ename,2) from emp; -- MITH 대문자

select lower(substr(ename,1,1)) || ' ' || upper(substr(ename,2)) as "fullname" from emp;

--lpad, rpad (채우기)
select lpad('ABC',10,'*') from dual; -- ***********ABC
select rpad('ABC',10,'%') from dual; -- ***********ABC

--Quiz
--사용자 비번 : hong1006
--화면 : ho********* 출력하고 싶어요 (비번 : 1004 > 10**) 

select rpad(substr('hong1006',1,2),length('hong1006'),'*') from dual;

--emp 테이블에서 ename 컬럼으 데이터를 출력하는데 첫글자만 출력하고 나머지는 *

select rpad(substr(ename,1,1),length(ename),'*')as "ename" from emp;

create table member2(
  id number, jumin varchar2(14));
  
insert into member2(id, jumin) values(100,'123456-1234567');
insert into member2(id, jumin) values(200,'234567-1234567');

commit;

select * from member2;

--quiz
--출력결과
--하나의 컬럼으로 출력:
--100 : 123456 - *******
--200 : 234567 - *******
--컬럼의 가명칭 'juminnumber'

select id || ' : ' || rpad(substr(jumin,1,7),length(jumin),'*') as "juminnumber"  from member2

--rtrim 함수
--[오른쪽 문자] 지워라
select rtrim('MILLER' ,'ER') from dual;
select rtrim('MiLLLLLLLLLLLLLLLR' , 'ER') from dual;
select '>' || rtrim('MILLER' ,'') || '<' from dual;


--치환함수 (replace)
select ename, replace(enmae,'A','와우') from emp;

----------------------문자열함수 (END)-------------------------

--[ 숫자함수 ]
--round (반올림함수)
--trunc (절삭함수)
--나머지 구하는 함수 (mod)


--trunc (반올림 하지 않고 버려요)
select trunc(12.345,0) as "r" from dual; --12, 정수 부분만 남겨라
select trunc(12.567,0) as "r" from dual; --13

select trunc(12.345,1) as "r" from dual; --12.3
select trunc(12.567,1) as "r" from dual; --12.6

select trunc(12.345,-1) as "r" from dual; --10
select trunc(15.345,-1) as "r" from dual; --20

--나머지
select 12/10 from dual; --12
select mod(12,10) from dual; --나머지 (2)
select mod(0,0) from dual; --0

--날짜 함수
select sysdate from dual;
--날짜 연수 (POINT)
--Date + Number >> Date
--Date - Number >> Date
--Date - Date >> Number(일수)

select * from SYS.NLS_SESSION_PARAMETERS

SELECT hiredate from emp;

select MONTHS_BETWEEN('2018-02-27','2010-02-27') from dual; 

select round(MONTHS_BETWEEN(sysdate,'2010-01-01'),1) from dual;
select trunc(MONTHS_BETWEEN(sysdate,'2010-01-01'),1) from dual;

select to_date('2019-03-20') + 100 from dual; --2019-06-28 00:00:00

select to_date('2019-03-20') + 1000 from dual;

select sysdate + 1000 from dual;

--Quiz
--1.사원 테이블에서 사원들의 입사일에서 현재 날짜까지 근속월수를 구하세요
--  단 근속월수는 정수부분만 출력하세요

select trunc(MONTHS_BETWEEN(sysdate,hiredate))as "근속월수" from emp;

--2. 한달이 31일 이라는 기준에서 근속월수를 구하세요
select ename, hiredate, trunc((sysdate-hiredate)/31) "근속월수 " from emp;

--------------------------[날짜 함수 END]--------------------------------------
--문자_
--숫자_
--날짜_ 연산
------------------------------------------------------------------------------
--[변환함수] Today POINT
--Oracle : 문자, 숫자, 날짜
--to, char(): 숫자 -> answk (1000 -> S1000), 날짜 -> 문자 (2019-03-03 -> 2019년 03월 03일) 형식(format)

--to_date(),문자 -> 2019-03-03' + 1000 >> select to_date('2019-03-03') + 1000

--to_number() : 문자 -> 숫자 (자동 형변환)

select '100' + 100 from dual;

select to_number('100') + 100 from dual;

/*
오라클 기본 데이터 타입
create table 테이블명 (컬러명 타입)
create table member (age number) >> 1건 insert _ 1000건

java : class person.. >> person p = new person();  1건
       List(Person) personlist = new ArrayList();
       personlist.add(new person);
oracle : create person.. > person p = new person(); 1건 

문자 타입
--char(20) >> 20Byte >> 한글 10자, 영문자, 특수문자, 공백 20자 : 고정길이문자열
--varchar2(20) >> 20Byte >> 한글 10자, 영문자, 특수문자, 공백 20자 :  가변길이 문자열

char(20) >> '홍길동' >> 6byte >> 홍길동 20Byte 안에 저장
varchar2(20) >> '홍길동' >> 데이터 크기 만큼 공간 확보 >> 6Byte

고정길이 데이터 : 남, 여
char(2) >>

성능상의문제)
char() 이 varchar() 보다 검색 우선

결국 문제는 한글....
unicode(2byte) : 한글, 영문자, 특수문자, 공백>>2byte

nchar(20) >> 20글자 >> 2,20 40Byte
nvarchar2(30) >> 30글자...
*/

--1. to_number : 문자를 숫자로
select '1'+1 FROM dual;

select TO_NUMBER('1') + 1 FROM dual;

--2. to_char() : 숫자 -> 형식문자, 날짜 -> 형식문자
SELECT TO_CHAR(SYSDATE) || '일' from dual;

SELECT SYSDATE, to_CHAR(Sysdate,'YYYY') || '년' as "YYYY",
To_CHAR(sysdate,'YEAR'),
To_CHAR(sysdate,'MM'),
To_CHAR(sysdate,'DD'),
To_CHAR(sysdate,'DAY'),
To_CHAR(sysdate,'DY') from dual;

/*
입사일이 12월인 사원들의 사번, 이름, 입사일, 입사년도, 입사월을 출력하세요
*/

select empno as "사번" , ename as "이름", to_char(hiredate,'day')as "요일",to_char(hiredate,'yyyy') as "연도" ,to_char(hiredate,'mm') as "월"
from emp where substr(hiredate, 6,2) = 12;

select to_char(hiredate, 'yyyy"년",mm"월",DD"일"')from emp;

--1000000 -> $1,000,000,000 (문자형태로)
-- 표 오라클.pdf 71 page

select '>' || to_char(12345,'9999999999999') || '<' from dual; --9는 자릿 수를 의미 (출력 폭을 지정)
select '>' || to_char(12345,'$9,999,999,999') || '<' from dual;
-- > $12,345< 결과는  문자 데이터

SELECT sal, to_char(sal,'$999,999') from emp;

--다시 bituser 계정으로 전환 -----------------
--to_date() 문자를 -> 날짜로
select '2019-03-03' + 100 from dual;
select to_date('2019-03-03') + 100 from dual;
-----------------------------------------------------
--변환함수 (to_char(), to_date(), to_number()--------------------------------

--일반함수(프로그램적인 성격이 강한 함수)
--nv(), nvl2() >> null 처리 함수
--decode() 함수 >> java if 문
--case() 함수 >> java switch 문

select comm, NVL(comm,0) FROM emp;
create table t_emp(
id number(6),
job VARCHAR2(20)
);

select*from t_emp;
insert into t_emp(id,job) values(100,'it');
insert into t_emp(id,job) values(200,'sales');
insert into t_emp(id,job) values(300,'mgr');
insert into t_emp(id,job) values(400,null);
insert into t_emp(id,job) values(500,'mgr');

commit;

select*from t_emp;

--1. nvl
select id,job, NVL(job,'empty...') as "job" from t_emp;
--2. nvl2 >> null인경우, null이 아닌 경우
select id, job, nvl2(job, job ||'입니다','empty')from t_emp;

select id, job, nvl2(job, 'AAA', 'BBB')FROM t_emp;

--3. decode POINT(통계 데이타 : if, switch)
--decode(표현식, 조건1, 결과1, 조건2, 결과2, 조건3, 결과3 ....)
select id, job, decode(id, 100, 'it...', 200, 'saels...', 300, 'MGR...','ETC...') from t_emp;

select job , decode (job,'IT',1,'SALES',2,'MGR',3) from t_emp;

select count(decode(job,'IT',1)) as "IT",          --조건에 맞는 경우가 몇건인지 확인
       count(decode(job,'SALES',1)) as "SALES",
       count(decode(job,'MGR',1)) as "MGR"
from t_emp;

/*
emp 테이블에서 부서번호가 10이면 '인사부' , 20이면 '관리부', 30이면 '회계부' 나머지 부서는 '기타부서' 출력되는 구문을 만드세요
*/

select deptno, ename, decode(deptno,10 ,'인사부', 20 ,'관리부' , 30 ,'회계부', '기타부서') from emp;

--quiz
create table t_emp2(
id number(2),
jumin char(7)
);
insert into t_emp2(id,jumin)values(1,'1234567');
insert into t_emp2(id,jumin)values(1,'2234567');
insert into t_emp2(id,jumin)values(1,'3234567');
insert into t_emp2(id,jumin)values(1,'4234567');
insert into t_emp2(id,jumin)values(1,'5234567');
commit;

select * from t_emp2;

/*
t_emp2 테이블에서 id,jumin 데이터를 출력하되 jumin 컬럼의 앞자리가 1이면 '남성' 출력 2이면 '여성' 3이면 '충성'
그외는 '기타' 라고 출력하세요 (컬럼명은 성별)
*/

select decode(substr(jumin, 1,1),1 ,'남성', 2 ,'여성' , 3 ,'충성', '기타')as "성별" from t_emp2;

/*
부서번호가 20번인 사원중에서 SMITH 라는 이름을 가진 사원이라면 HELLO 문자 출력하고
부서번호가 20번인 사원중에서 SMITH 라는 이름을 가진 사원이 아니라면 WORLD 문자 출력하고
부서번호가 20번인 사원이 아니라면 ETC 라는 문자를 출력하세요
*/

select empno, ename, decode(deptno,20, decode(ename,'SMITH','HELLO','WORLD') ,'etc') from emp;

--case 문 
--java : switch

/*
case 조건식 when 결과 1 then 출력 1
           when 결과 2 then 출력 2
           when 결과 3 then 출력 3
           else 출력 4
    end '컬럼명'
*/

create table t_zip(
  zipcode number(10)
  );
  
  insert into t_zip(zipcode) values(2);
  insert into t_zip(zipcode) values(31);
  insert into t_zip(zipcode) values(32);
  insert into t_zip(zipcode) values(33);
  insert into t_zip(zipcode) values(41);
  commit;
  
  select * from t_zip;
  
  select case zipcode when 2 then '서울'
                      when 31 then '경기'
                      when 32 then '강원'
                      when 41 then '제주'
                      else '기타지역'
          end "regionname"
    from t_zip;
    
  /*
  사원테이블에서 사원급여가 1000달러 이하면 '4급'
  1001달러 2000달러 이하면 '3급'
  2001달러 3000달러 이하면 '2급'
  3001달러 4000달러 이하면 '1급'
  4001달러 이상이면 특급' 이라는 데이터를 출력하세요
  */
  
--1.case 컬럼명 when 결과 then 출력 (=)조건
--2.case when 컬럼명 조건 비교식 then
--       when 컬럼명 조건 비교식 then
desc emp;
select case when sal <= 1000 then'4급'
            when sal between 1001 and 2000 then '3급'
            when sal between 2001 and 2000 then '2급'
            when sal between 3001 and 2000 then '1급'
            else '특급' end "급여등급" from emp;
            
-------------------------------------------------------------------------------------------------------
--문자함수
--숫자함수
--날짜함수
--변환함수(to_char(), to_date, to_number()
--일반함수 (nvl(), decode(), case(), ...)
-------------------------------------------------------------------------------------------------------
--오라클 pef (75 page)

--집계함수--
-- 1. count (*) > row 수, count(컬럼명) >> 데이터 간수 (null 을 포함하지 않는다)
-- 2. sum()
-- 3. avg()
-- 4. max()
-- 5. min()
--등등  

/*
1. 집계함수는 반드시 group by 절과 같이 사용
2. 모든 집계함수는 null 값을 무시
3. select 절에 집계함수 이외에 다른 컬림이 오면 반드시 그 컬럼은 group by 절에 형시되어야 한다
*/

select count(*) from emp;

select count(comm) from emp; -- 6건 (null 값을 무시)

select comm from emp;

select count(nvl(comm,0)) from emp;

-----------------------------------------------------------------------------
--급여의 합

select sum(sal) as "급여의 합" from emp; 29025

--평균급여
select trunc(avg(comm),0) from emp; --721 (널값을 제외했음)
select trunc(sum(comm)/count(EMPNO)) from emp; --309 (널값을 포함했음

--사장님이 회사 총 수당이 얼마나 지급되나 ,,,(수당의 평균)
select trunc(avg(comm)) from emp;

select sum(comm) from emp;
select trunc(sum(comm)/14.0) from emp;

select trunc(avg(nvl(comm,0)),0 ) from emp; --309

--회사의 규정이 전체 사원 수로 나눈다 309
--회사의 규정이 받는 사원 수 나눈다 721

select count(*) from emp where comm is null; -- 데이터 처리 null 검증 처리

desc emp;

select max(sal) from emp;

select min(sal) from emp;


--point 집계함수 결과는 1개 (1건 컬럼하나 row하나)

select aempno, count(empno()) from emp;

--Point 집계함수 결과는 1개(1건 컬럼하나 row 하나)
select empno, count(empno) from emp; --(x) empno 14건, 집계 1건
select sum(sal), avg(sal), max(sal), min(sal), count(sal), count(*) from emp;

------------------------------------------
--부서별 평균 급여를 구하세요
select deptno, avg(sal)
from emp
group by deptno;

select job, avg(sal)
from emp
group by job;

--직종별 평균급여, 급여합, 최대급여, 최소급여, 건수를 출력하세요
select job, sum(sal), max(sal), min(sal), count(*)
from emp
group by job;

/*
grouping 원리

distinct 컬럼명1, 컬럼명2
order by 컬럼명1, 컬럼명2
group by 컬럼명1, 컬럼명2

*/

--부서별, 직종별 급여의 합을 구하세요
select deptno, job, sum(sal), count(sal)
from emp
group by deptno, job
order by deptno;

/*
--순서--
select --5
from  --1
where    --2
group by --3
order by --6
having절 >> group by의 조건절 --4
*/

/*
직종별 평균급여가 3000달러 이상인 사원의 직종과 평균급여를 출력하세요
*/

select  job, avg(sal) as "avgsal"
from emp
group by job
having avg(sal) > = 3000;

/*
from의 조건절 where
group by 조건절 having
*/

/*
select
from
where 
group by
having
order by
*/

/*
1. 사원테이블에서 직종별 급여합을 출력하되 수당을 더하고 급여의 합이 5000이상인 사원들의 목록을 출력하세요
--급여의 합이 낮은 순으로 출력하세요
*/
select job, sum(sal)
from emp
group by job
having sum(sal) + sum(comm) >=5000
order by sum(sal) asc;
/*
2. 사원테이블에서 부서 인원이 4명보다 많은 부서의 부서번호, 인원수, 급여의 합을 출력하세요
*/
select deptno, count(deptno), sum(sal)
from emp
group by deptno
having count(deptno) > 4;


/*
3. 사원테이블에서 직종별 급여의 합이 5000을 초과하는 직종과 급여의 합을 출력하세요
단 판매직종은 제외하고 급여합으로 내림차순 정렬하세요
*/
select job ,sum(sal)
from emp
where job !='salesman'
group by job
having sum(sal) > 5000
order by sum(sal) desc;