-----------------------------------------
--DML(오라클.pdf / 168page)
/*
INSERT INTO table_name [(column1[, column2, . . . . . ])]
VALUES (value1[, value2, . . . . . . ]);
*/

create table temp(
id number primary key, -- id칼럼에는 null(x), 중복데이터(x), 유일한 데이터 1건 보장, where id =10
name varchar2(20)
);

--1.가장 일반적인 insert
insert into temp(id,name)
values(100,'홍길동');

select*
from temp;

commit;

--2.컬럼목록 생략(...) 컬럼리스트 생략
insert into temp values(200,'김유신');
commit;

select*
from temp;

--Quiz 1(id 칼럼에 pk 제약 정보)
insert into temp(id,name)
values(100,'아무개');--중복값 줄 수없다.


insert into temp(name)
values('아무개');

-------------------------------------------
--일반 SQL 은 프로그램적인 요소(X)
--PL-SQL(변수,제어문)
--PL-SQL

create table temp2(
id varchar2(20)
);

--pl-sql 사용
--BEGIN
-- FOR i in 1..1000 LOOP
--  insert into temp2(id) values('a'||to_char(i));
-- END LOOP;
--END;


select*from temp2;
select*from temp2 order by id desc;

--------------------------------------------

create table temp3(
 memberid number(3) not null,
 name varchar2(10),
 regdate date default sysdate -- 기본값 설정하기
 );
 
select sysdate
from dual;
alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';
 
insert into temp3(memberid, name, regdate)
values(100,'홍길동','2019-03-21');

select*from temp3;
commit;

insert into temp3(memberid,name)
values(200,'아무개'); --default

select *from temp3;
commit;

insert into temp3(memberid)
values(300);
commit;
select* from temp3;
commit;

insert into temp3(name)
values('아무개');

--------------------------------------------
--insert(TIP)
--1.대량 데이터 insert 하기
create table temp4(id number);
create table temp5(num number);

insert into temp4(id) values(1);
insert into temp4(id) values(2);
insert into temp4(id) values(3);
insert into temp4(id) values(4);
insert into temp4(id) values(5);
insert into temp4(id) values(6);
insert into temp4(id) values(7);
insert into temp4(id) values(8);
insert into temp4(id) values(9);
insert into temp4(id) values(10);


commit;

select*from temp4;

--요구사항 : temp4 에 있는 모든 데이터를 temp5에 넣고싶어요
--insert into 테이블명(컬럼리스트) values(값리스트)
--insert into 테이블명(컬럼리스트) select 구문.. (단, 컬럼의 개수와 타입이 동일)

insert into temp5(num)
select id from temp4; --대량 데이터 삽입하기 values 구문 대신에 select문

commit;
--2.insert
--테이블이 없는 상황에서(테이블을 생성)+(대량 데이터 삽입)
--단 복사의 개념(제약정보는 복사가 안돼요! PK, FK)
--순수한 구조정보(컬럼이름 , 타입) 복사

--create table 테이블명(컬럼명타입정보)

create table copyemp
as select * 
from emp;

select*from copyemp;

create table copyemp2
as select empno,ename,sal
from emp
where deptno =30;

--Q)  구조(틀)만 복사하고 데이터는 복사하고싶지 않아요
create table copyemp3
as select *
from emp
where 1=2; --거짓조건들만 복사 -> 데이터가 복사가 안됨

select * from copyemp3;

--tip)
--오라클 시스템 테이블(다양한 정보)
--제약 정보(PK, FK ...)
select *
from user_constraints;

select*
from user_constraints where table_name = 'EMP';

create table pktest (
id number primary key); -- not null하고 unique

insert into pktest(id) values(100);
commit;

select*
from user_constraints
where table_name = 'PKTEST';


--제약정보는 복사되지 않아요 검증
create table pktest2
as select*
from pktest;

select*
from pktest2;
--PK제약정보는 복사 되지 않았다(검증)
select*
from user_constraints
where table_name = 'PKTEST2';

---------------------insert end------------------
--update
/*
update table_name
set column1 = value1, column2 = value2...
where 조건

*/

select*from copyemp;

update copyemp
set sal = 0;

select*from copyemp;
rollback;

update copyemp
set sal = 0
where deptno=20;

select*
from copyemp
where deptno=20;
commit;

--update(set구문에 subquery사용)
update copyemp
set sal = (select sum(sal) from emp);

select*from copyemp;
rollback;

--여러개 컬럼  update
update copyemp
set ename = 'AAA', job = 'BBB', hiredate= sysdate, sal = (select sum(sal) from emp)
where deptno =10;

select*
from copyemp
where deptno=10;
commit;

----------------update END-----------------
--delete

delete from copyemp;
select*
from copyemp;

rollback;

--원칙: delete -> commit -> 복원이 안됨! -> 백업데이터가 있다면..? 복원가능!

select*from copyemp;

delete from copyemp where deptno in (10,20);

select*from copyemp;
rollback;


--------------------delete END----------------------

--정리
/*
APP(JAVA) -> JDBC API -> DB작업(Oracle)
CRUD
create : insert작업..
read : select* from... (전체, 조건)
update : update
delete : delete

(DML : create, update, delete) 트랜잭션 : commit, rollback 강제)
JDBC -> Oracle
--전체조회(함수), 조건조회(함수), 삭제(함수), 수정(함수), 삽입(함수) =>> 개발자
--public List(Emp > getEmpAllList(select*from emp...))
--public Emp getEmpListByEmpno(int empno)(select*from where empno=7788)
--public int insertEmp(Emp emp){insert into emp...values...}
*/

---------------------------------------------------
---DDL
--create, alter, drop (테이블 기준)

select*from user_tables where lower(table_name)='board';
drop table board;

create table board(
boardid number,
title varchar2(50),
conctent varchar2(4000),
regdate date
);

----------------------------------
--개발자 편하게 살기 위해서는...

select*from user_tables where lower(table_name)='board';
select*from user_constraints where lower(table_name) = 'board';

----------------------------------
--Oracle 11g 가상컬럼(조합컬럼)
--학생성적 테이블 : 국어,영어,수학.총점컬럼!
--국어, 영어, 수학 데이터만 insert하면 자동으로 총점이 구해졌으면!

create table vtable(
no1 number,
no2 number,
no3 number GENERATED ALWAYS as (no1 + no2) VIRTUAL
);

insert into vtable(no1,no2) values(100,50);
select*from vtable;

insert into vtable(no1,no2,no3) values(100,50,120);

--컬럼의 정보 보기(default value 값 확인하기)
select column_name, data_type, data_default
from user_tab_columns where table_name = 'VTABLE';

--실무에서 활용하는 코드
--제품정보(입고일 기준) 분기별 데이터 (4분기)
--입고일 : 2019-03-01 >> 1분기
create table vtable2(
no number, --순번 데이터
p_code char(4), --제품 코드(A001,B002...)
p_date char(8), --입고일(20190303)
p_qty number, --수량
p_bungi number(1) GENERATED ALWAYS as (
CASE WHEN substr(p_date,5,2) IN ('01','02','03') THEN 1
     WHEN substr(p_date,5,2) IN ('04','05','06') THEN 2
     WHEN substr(p_date,5,2) IN ('07','08','09') THEN 3
     ELSE 4
END
)VIRTUAL 
);


select column_name, data_type, data_default
from user_tab_columns where table_name = 'VTABLE2';


insert into vtable2(p_date)values('20180101');
insert into vtable2(p_date)values('20180126');
insert into vtable2(p_date)values('20190301');
insert into vtable2(p_date)values('20160807');
insert into vtable2(p_date)values('20121201');
insert into vtable2(p_date)values('20180626');

select*from vtable2;

commit;

-----------------------
--DDL 테이블 다루기(오라클.pdf 138page)
--1.테이블 생성하기
create table temp6(id number);
--2.테이블 생성했는데 컬럼 추가하기
--기존테이블에 컬럼 추가하기
desc temp6;

alter table temp6
add ename varchar2(20);

--3.기존테이블에 있는 컬럼의 이름을 잘못표기함.(ename ->username)
--기존 테이블에 있는 기존 컬럼의 이름 바꾸기(rename)
alter table temp6
rename column ename to username;

desc temp6;

--4.기존테이블에 있는 기존 컬럼의 타입정보 수정하기
--modify
alter table temp6
modify(username char(200));

desc temp6;

--5.기존 테이블에 있는 컬럼 삭제
alter table temp6
drop column username;

desc temp6;


--6.테이블 삭제
--6.1 데이터만 삭제 : delete
--테이블 처음 만들면 처음 크기>>데이터를 넣으면 >> 데이터 크기 증가
--ex) 처음 1M >> 10만건 >> 100M >> delete 10만건 삭제 >> 여전히 테이블의 크기는 100M다

--테이블 데이터 삭제
--(공간의 크기를 줄일수 있을까)
--truncate(where절을 못쓴다)
--ex) 처음 1M >> 10만건 >> 100M >> delete 10만건 삭제 >> 크기는 1M으로 돌아옴

--7. 테이블 삭제(drop)
drop table temp6;


---------------------------------
--테이블 제약 설정하기
--오라클 pdf(144)
-- 데이터 무결성 확보
--제약 (constraint) : insert, update 주로 적용
/*
PRIMARY KEY(PK) 유일하게 테이블의 각행을 식별(NOT NULL 과 UNIQUE 조건을 만족) 내부적으로 index가 자동실행
FOREIGN KEY(FK) 열과 참조된 열 사이의 외래키 관계를 적용하고 설정합니다.(참조제약) 테이블과 테이블간의 관계 설정
UNIQUE key(UK) 테이블의 모든 행을 유일하게 하는 값을 가진 열(NULL 을 허용)
unique는 null값 가질수 있음 -> null값 못가지게 하려면 not null
NOT NULL(NN) 열은 NULL 값을 포함할 수 없습니다.
CHECK(CK) 참이어야 하는 조건을 지정함(대부분 업무 규칙을 설정)
설정범위 내의 값만 입력받겠다(gender: 남,여 데이터만 컬럼에..)
ex) where gender in('남','여')

- NOT NULL : NULL값 입력 금지
- UNIQUE : 중복값 입력 금지 (NULL값은 중복입력 가능)
- PRIMARY KEY : NOT NULL + UNIQUE
- FOREIGN KEY : 다른 테이블의 컬럼을 조회해서 무결성 검사
- CHECK : 조건으로 설정된 값만 입력 허용

제약을 만드는 시점
1. 테이블 만들면서 바로 생성 (create tabel..)
2.테이블 생성 이후(alter table.. add constraint..) >>자동생성툴(exerd)
*/


--1.
select* from user_constraints where table_name ='EMP'; --제약정보 보는법
--오라클은 notnull을 제약으로 본다
--empno는 not null
-------------------------------------------------------------
create table temp7
(
id number primary key --권장하지 않아요 (줄입표현) SYS_C007019제약이름 (나중에 제약 수정,삭제)
);

drop table temp7;

create table temp7
(
id number constraint pk_temp7_id primary key, --관용적인 표현 :PK_테이블명_컬럼명
name varchar2(20) not null,
addr varchar2(50)
);


select*from user_constraints where table_name ='TEMP7';


--insert into temp7 (name, addr) values('홍길동','서울시 강남구'); --실패
insert into temp7 (id,name, addr) values(1,'홍길동','서울시 강남구');
insert into temp7 (id,name, addr) values(2,'홍길동','서울시 강남구');
insert into temp7 (id,name, addr) values(3,'김유신','경기도 시흥');
commit;

select*
from temp7;

--1. primary key는 테이블에 몇개까지 걸 수 있을까요? 1개
--여러개의 컬럼을 묶어서 1개로 가능(enmae,age)=>복합키..

create table temp8(
id number constraint pk_temp8_id primary key,
name varchar2(20) not null,
jumin char(6) constraint uk_temp8_jumin unique, --중복 ㄴ
addr varchar2(20)
);


select*from user_constraints where table_name='TEMP8';

insert into temp8(id,name,jumin,addr) 
values(10,'홍길동','123456','경기도');

insert into temp8(id,name,jumin,addr) 
values(20,'김유신','123456','경기도'); --unique constraint(%s%s) violated

--null값 허용할까
insert into temp8(id,name,addr) 
values(30,'강아지','경기도'); -- null data 허용! 근데 또하면 중복체크가 될까?

insert into temp8(id,name,addr) 
values(40,'고양이','경기도 고양시'); --null에대한 허용이 되고있다..;;
--not null과 uniqie 두개의 제약을 같이 사용..

select* from temp8;

------------------------------------------------------------
--테이블 생성 후에 제약 걸기!

create table temp9 (id number);

--기존 테이블에 제약 추가하기
--주의)기존의 데이터가 제약을 위반한다면 제약은 추가되지 않아요 >> 중복된 데이터를 삭제 >> 제약걸기
--제약을 걸기전에 데이터 검사(중복..)작업을 수행해야함

alter table temp9
add constraint pk_temp9_id primary key(id);
--add constraint pk_temp9_id primary key(id,name)
--2개 컬럼의 값을 합쳐서   
select*from user_constraints where table_name='TEMP9';

alter table temp9
add ename varchar2(20);

desc temp9;

--not null 제약 추가하기
alter table temp9
modify (ename not null);

desc temp9;


----------------------------------------------------------------------------------
--[Check]  제약
--where 조건과 동일한 형태의 제약 >> where gender in ("남","여")
create table temp10 (
 id number constraint pk_temp10_id primary key,
 name varchar2(20) not null,
 jumin char(6) constraint uk_temp10_jumin unique,
 addr varchar2(20),
 age number constraint ck_temp10_age check(age >=19) --where age >= 19
 );

 select * from user_constraints where table_name = 'TEMPO';

 insert into temp10(id, name, jumin, addr, age)
 values(100,'홍길동','123456','서울시',25);

select*from temp10;

insert into temp10(id, name, jumin, addr, age)
 values(200,'김유신','123456','부산시',18);
 
 commit;
 
 ---------------------------------------------------------
 --참조제약 : 테이블과 테이블과의 제약 >>
 --EMP(detpno)컬럼은 EDPT(deptno)컬럼을 참조한다
 
 
 create table c_emp
 as
  select empno,ename,deptno from emp where 1=2;


create table c_dept
as
  select deptno, dname from dept where 1=2;
  

  
select*from c_emp;
select*from c_dept;

--1.참조제약(c_emp 테이블에 있는 deptno컬럼에 ....deptno 컬럼 insert 되는 데이터는 c_dept테이블
--deptno가지는 데이터중에 하나가 insert 되도록 update 강제

alter table c_emp
add constraint fk_emp_deptno foreign key(deptno) REFERENCES c_dept(deptno);
--위 코드 실행시 error 발생
--c_dept >> deptno 에서 데이터를 빌료쓸거야..(저 신용있어여 빌려가 주세요...)
--deptno 가지는 데이터는 중복데이터 없고 null값 없성!! Primary Key

--c_dept>>deptno>>primary key 선행

--1)
alter table c_dept
add constraint pk_dept_deptno primary key(deptno);

--2)
alter table c_emp
add constraint fk_emp_deptno foreign key(deptno) references c_dept(deptno);

insert into c_dept(deptno, dname) values(100,'인사팀');
insert into c_dept(deptno, dname) values(200,'관리팀');
insert into c_dept(deptno, dname) values(300,'회계팀');
commit;

select* from c_dept;

--신입사원 입사
insert into c_emp(empno,ename)
values(100,'홍길동'); --FK는 not null하지 않아요(null허용)
--신입사원은 부서를 갖지 않을 수 있다

--규칙 : 신입사원은 무조건 부서를 가져야 한다(deptno not null constaint,,FK)
-------------------------

insert into c_emp(empno, ename, deptno)
values(200,'아무개',500);

-----------------------
--테이블 (부모,자식 테이블)
--테이블 (master, detail)

--두개의 테이블..deptno관계에서 부모는 c_dept(PK)이고 master이기도 하당
--자식 c_emp(FK), detail
--c_emp 테이블
--c_dept 테이블

--주의점
select*from c_emp;
select*from c_dept;
--이때 c_dept 테이블에서 300데이터 삭제 가능 누군가 빌려쓰는 데이터는 삭제 못함
delete from c_dept where deptno = 300;
delete from c_dept where deptno = 300;

commit;


--학생 성적 테이블
--학번의 데이터는 중복되거나 NULL 값을 허용하면 안된다
--이름 NULL 값을 허용하지 않는다
--국어
--영어
--수학 점수 컬럼은 숫자 타입이고 NULL 값을 허용
--는 값을 입력하지 않으면  default로 0값을 갖는다
--총점 ,평균 컬럼은 가상컬럼으로(조합컬럼) 생성한다
--학과코드는 학과 테이블에 학과코드를 참조한다
--학번 , 이름 , 국어 , 영어 , 수학 , 총점 , 평균 , 학과코드
create table grade (
 name varchar2(10)not null,
 num number constraint pk_grade_num PRIMARY key,
 korean number default 0,
 english number default 0,
 math number constraint uk_grade_math UNIQUE,
 gradesum number GENERATED ALWAYS as (korean+english+math)VIRTUAL,
 gradeavg number GENERATED ALWAYS as ((korean+english+math)/3) VIRTUAL,
 majornum number
);
--학과 테이블
--학과코드 데이터는 중복되거나 NULL 값을 허용하면 안된다,
--학과명 은 null값을 허락하지 않는다
--학과코드 , 학과명
create table major (
 majorname varchar(20) not null,
 majornum number constraint pk_table_majornum PRIMARY key
);

alter table grade
add constraint fk_grade_deptno foreign key(majornum) REFERENCES major(majornum);

insert INTO major(majorname,majornum) VALUES ('국문학과',1);
insert INTO major(majorname,majornum) VALUES ('경영학과',2);
insert INTO major(majorname,majornum) VALUES ('컴퓨터공학과',3);
insert INTO major(majorname,majornum) VALUES ('신문방송학과',4);

insert INTO grade(name,num,korean,english,math,majornum)
VALUES ('권예지',0916,95,90,60,2);
insert INTO grade(name,num,korean,english,math,majornum)
VALUES ('고양이',0312,60,100,50,4);

--그리고 select 결과는
--학번 , 이름  총점, 평균 , 학과코드 , 학과명 을 출력하세요
select g.name, g.num, g.korean, g.english, g.math, g.gradesum, g.gradeavg, m.majorname, g.majornum
from grade g
join major m
on g.majornum = m.majornum;
