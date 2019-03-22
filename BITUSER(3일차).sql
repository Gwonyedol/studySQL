--3일차--
-----------------------------------------
--조인 실습 테이블 구성하기--
create table M (M1 char(6) , M2 char(10));
create table S (S1 char(6) , S2 char(10));
create table X (X1 char(6) , X2 char(10));

insert into M values('A','1');
insert into M values('B','1');
insert into M values('C','3');
insert into M values(null,'3');
commit;

--종류
--1.등가조인(equi join) 70%
--2.원테이블과 대응되는 테이블에 있는 컬럼의 데이터를 1:1로 매핑(하나를 가져가서 연결시킴)
--SQL JOIN 문법 -> 옆에 가져다 붙임
--ANSI 문법[inner] join on ~ 조건절

select*
from m,s




insert into S values('A','X');
insert into S values('B','Y');
insert into S values(null,'Z');
commit;

insert into X values('A','DATA');
commit;

select * from m;
select * from s;
select * from x;

--SQL JOIN 은 잘 안써용!
select*
from m,s
where m.m1 = s.s1;

select m.m1, m.m2, s.s2
from m,s
where m.m1 = s.s1;

--ANSI 문법
--where(from 절의 조건절)
--where join 조건절로 사용(어떤것이 join 조건이고 어떤것이 from절의 조건절인지 헷갈린..)
--ansi join의 조건절은 on입니다
select*
from m
inner join s
on m.m1 = s.s1

select m.m1,s.s1,s.s2
from m 
join s -- inner 생략 가능
on m.m1 = s.s1;

select*
from m 
join x
on m.m1 = x.x1;


--fr 참조를 하는쪽 pr 참조를 당하는 쪽
--테이블은 쪼개는것이 좋다

--사원번호, 사원이름, 사원부서번호, 사원부서명을 알고 싶어요
select*
from emp 
join dept
on emp.deptno = dept.deptno;

select emp.empno, emp.ename, emp.deptno, dept.dname
from emp
join dept
on emp.deptno = dept.deptno;

--join에서 테이블 별칭 부여..
select e.EMPNO, e.ENAME, d.deptno, d.DNAME
from emp e join dept d
on e.DEPTNO = d.DEPTNO;


select *
form m 
join s 
on m.m1 = s.s1
join x
on s.s1 = s.s1;

--SQL JOIN 문법 (3개 테이블 조인)
select *
from m,s,x
where m.m1 = s.s1 and x.x1 = s.s1;

--ANSI JOIN 문법
select m.m1, s.s2, x.x2
from m 
join s on m.m1 = s.s1
join x on x.x1 = s.s1;

--[HR 계정으로 점프!]--

select* from employees;
select* from DEPARTMENTS;
select* from LOCATIONS;

--1. 사번, 이름(last_name), 부서번호, 부서이름을 출력하세요
select e.employee_id, e.last_name, d.DEPARTMENT_ID, d.DEPARTMENT_NAME
from employees e
join departments d
on e.department_id = d.department_id;
order by e.employee_id;

--문제점:
select count(*) from employees; -- 107명
--위 join쿼리으 결과는 106명이다. 누군가는 누락..!
--등가조인으로 해결 안됨 ㅠ
--outer 조인 필요!

--2. 사번,이름(last_name),부서번호,부서명,지역코드,도시명 출력
select e.employee_id, e.DEPARTMENT_ID, d.DEPARTMENT_NAME, d.LOCATION_ID, l.street_address
from employees e
join DEPARTMENTS d
on e.DEPARTMENT_ID = d.DEPARTMENT_ID
join LOCATIONS l
on d.LOCATION_ID = l.LOCATION_ID;


-------------------------------------------------
-----[bituser전환]-----
----비등가조인(non-euqi join) => 의미만 존재 => 
--원테이블과 대응대는 테이블에 있는 컬럼이 1:1 매핑이 되지 않는 경우
--ex) emp, salgrade 급여동급 (emp:sal >> salgrade losal,hisal 2개비교)

select*from emp;
select*from salgrade;

select e.empno,e.ename,e.sal,s.grade
from emp e 
join salgrade s
on e.sal between s.losal and s.hisal; -- on 조건절

-----------------------------------------
--3. outer join(equi join + null)
--outer join(주 종관계의 파악) >> 주가되는 테이블의 데이터를 가져오는 방법 (euqi join 하고 남는 데이터)
--문법) left outer join (왼쪽이 주인) right outer join  (오른쪽이 주인) full outer join(left,right join>> union)

select* from m
join s
on m.m1 = s.s1;

select* from m
left join s
on m.m1 = s.s1;

select* from m
right join s
on m.m1 = s.s1

select* from m
full join s
on m.m1 = s.s1;


--[hr계정으로 이동]
--1. 사번, 이름(last_name), 부서번호, 부서이름을 출력하세요
select e.employee_id, e.last_name, d.DEPARTMENT_ID, d.DEPARTMENT_NAME
from employees e
join departments d
on e.department_id = d.department_id;
order by e.employee_id;

select*from employees where department_id is null;
--grant>>department_id null가지고 있

select e.employee_id, e.last_name, d.DEPARTMENT_ID, d.DEPARTMENT_NAME
from employees e left outer --outer 생략 가능
join departments d
on e.department_id = d.department_id;

----------------------------------------------------------
-------------------bituser로 옮기세용-----------------------
--self join(자가참조) -> 문법 > 등가조인
--하나의 테이블에서 특정 컬럼이 다른 컬럼을 참조하는 경우
select* from emp;

--문제점 : 테이블이 하나뿐이다.....

select*
from emp e 
left join emp m --하나의 테이블을 두개처럼 쓴다
on e.mgr = m.empno;

--13명 : king 사장님은 mgr>> null

select*
from m,s;



-------------1차 테스트 -----------------
-- 1. 사원들의 이름, 부서번호, 부서이름을 출력하라. (O)

select e.ename, e.deptno, d.dname
from emp e
join dept d
on e.deptno = d.deptno;


-- 2. DALLAS에서 근무하는 사원의 이름, 직위, 부서번호, 부서이름을
-- 출력하라. (O)

select e.ename, e.job, d.deptno, d.dname
from emp e
join dept d
on e.deptno = d.DEPTNO and d.loc = 'DALLAS';


-- 3. 이름에 'A'가 들어가는 사원들의 이름과 부서이름을 출력하라. (O)

select e.ename, d.dname
from emp e
join dept d
on e.deptno = d.deptno 
where ename like '%A%';


-- 4. 사원이름과 그 사원이 속한 부서의 부서명, 그리고 월급을
--출력하는데 월급이 3000이상인 사원을 출력하라. (O)

select e.ename, d.dname, d.deptno, e.SAL
from emp e
join dept d
on e.deptno = d.deptno
where sal>=3000;

-- 5. 직위(직종)가 'SALESMAN'인 사원들의 직위와 그 사원이름, 그리고
-- 그 사원이 속한 부서 이름을 출력하라. (O)

select e.ename, e.job, d.dname
from emp e
join dept d
on e.deptno = d.deptno
where e.job = 'SALESMAN';

-- 6. 커미션이 책정된 사원들의 사원번호, 이름, 연봉, 연봉+커미션,
-- 급여등급을 출력하되, 각각의 컬럼명을 '사원번호', '사원이름',
-- '연봉','실급여', '급여등급'으로 하여 출력하라.
--(비등가 ) 1 : 1 매핑 대는 컬럼이 없다 (X)

select e.ename, e.sal, e.sal+nvl(e.comm,0) as "실수령액" , s.grade as "급여등급"
from emp e
join salgrade s
on e.sal between losal and hisal;
 
-- 7. 부서번호가 10번인 사원들의 부서번호, 부서이름, 사원이름,
-- 월급, 급여등급을 출력하라.

select e.ename, d.deptno, d.dname, e.SAL, s.grade as "급여등급"
from emp e
join dept d
on e.deptno = d.deptno
join salgrade s
on e.sal between losal and hisal;

 
-- 8. 부서번호가 10번, 20번인 사원들의 부서번호, 부서이름,
-- 사원이름, 월급, 급여등급을 출력하라. 그리고 그 출력된
-- 결과물을 부서번호가 낮은 순으로, 월급이 높은 순으로
-- 정렬하라.
 

 
 select e.ename, d.deptno, d.dname, e.sal, s.grade
 from emp e
 join dept d
 on e.deptno = d.deptno
 join salgrade s
 on e.sal between losal and s.HISAL
 where e.deptno = 10 or e.deptno = 20
 order by d.deptno asc ,e.sal desc;


-- 9. 사원번호와 사원이름, 그리고 그 사원을 관리하는 관리자의
-- 사원번호와 사원이름을 출력하되 각각의 컬럼명을 '사원번호',
-- '사원이름', '관리자번호', '관리자이름'으로 하여 출력하라.
--SELF JOIN (자기 자신테이블의 컬럼을 참조 하는 경우)

select e.ename as "사원이름", m.ename as "관지라이름",
e.empno as "사원번호", m.empno as "관리자번호"
from emp e
join emp m
on e.mgr = m.empno;

--03/21/pm8:11 복습완료 집가서 채점하면서 해설보기
--문제풀이1번

-------------------------------------------------------
--[subquery] 오라클 pdf (100 page)
--sql 의 꽃이다 >> sql 만능 해결사
--함수 >> 조인 >> subquery

--사원테이블에서 사원들의 평균 월급보다 더 많은 급여를 받는 사원의 사번,
--이름, 급여를 출력하세용

select avg(sal) from emp; --2073

select*
from emp where sal > 2073;

select
from emp where sal > (select avg(sal) from emp); --subquery...
--subquery
--1. single row subquery : subquery의 결과가 1개의 row를 가질때(단일값) : 한개의 값 /단일컬럼
--2. multi row subquery : subquery의 결과가 1개 이상의 row를 가질때(여러개의 값) /단일컬럼
--구분하는 이유 : 사용되는 연산자의 차이
--multi row (IN , NOT IN) (ANY , ALL)
--ALL : sal > 1000 and sal > 2000 and ...
--ANY : sal > 1000 or sal > 2000 or ...
--정의(subquery)
--1.괄호안에 있어야한다 (select avg(sal) from emp)
--2.담일컬럼으로 구성 >> select sal, deptno from emp, >> (X) 단일컬럼이 아니다
--3.단독으로 실행 가능해야 한다!

--실행순서
--1.subquery 먼저 실행
--2.subquery의 결과를 가지고 main query 실행


--사원테이블에서 jones의 급여보다 더 많은 급여를 받는 사원의 사번, 이름, 급여를 출력하세요
select sal from emp where ename = 'JONES'; - 2975

select*
from emp
where sal>(select sal from emp where ename= 'JONES');

--급여가 2000이상만..
select sal 
from emp 
where sal > 2000;

select*
from emp
--where sal = (select sal from emp where sal>2000); (X)
where sal in (select sal from emp where sal>2000);
--sal = 2001 or sal = 3000 or...

select*
from emp
where sal not in (select sal from emp where sal>2000);
--sal != 2001 and sal != 3000 and..

--부하직원이 있는 사원의 사번과 이름을 출력하세요
--(내 사번이 mgr 컬럼에 있다..)

select mgr
from emp;

select *
from emp
where empno in (select mgr from emp);

--empno = 7902 or empno = 7698 or empno = 7839 or empno is null

select *
from emp
where empno not in (select nvl(mgr,0) from emp);

--empno != 7902 and empno != 7698 and empno !=7839 and empno is not null

--king 에게 보고하는 즉 직속상관이 king인 사원의 사번,이름,직종,관리자 사번을 출력하세요
select empno
from emp
where ename = 'KING';

select *
from emp
where mgr = (select empno from emp where ename = 'KING');

--20번 부서의 사원중에서 가장 많은 급여를 받는 사원보다 더 많은 급여를 받는 사원의 사번, 이름, 급여
--부서번호를 출력하세요

select max(sal)
from emp
where deptno = 20;

select *
from emp
where sal > (select max(sal) from emp where deptno = 20);

-----------
select*
from emp
where deptno in (select deptno from emp where job='SALESMAN')
and sal in (select sal from emp where job = 'SALESMAN');

-----------QUIZ)
--자기 부서의 평균 월급보다 더 많은 월급을 받는 사원의 사번,이름,부서번호,부서별 평균 월급 구해라


select e.deptno
from emp e
join dept d
on e.deptno = d.deptno;

select deptno,sal
from emp
where deptno in (select avg(sal) from emp);

--조별스터디 과제문제03.21--
--1. 부서별 평균 급여를 구하세요 (제가 이걸 못풀어서 올렸습니다 풀어볼게요..)
select e.job, round(avg(e.sal),0)
from emp e
group by job;
--2.급여가 10번부서의 최저급여보다 적고, 20번부서에서 일하지
--않는 모든 사원의 사원번호, 이름, 부서명을 출력하라.

select e.ename, e.empno, d.dname 
from emp e
join dept d
on e.deptno = d.deptno
where e.sal<( select min(sal) from emp where deptno = 10) and
e.deptno != 20;

--3. 급여가 평균 급여보다 많고, 이름에 'S'가 들어가는
--사원들의 부서이름,사원이름, 월급, 급여등급을 출력하라.
--그리고 그 출력된 결과물을 월급이 낮은 순으로정렬하라. -->이거 답이 안나와 ㅠㅠㅠㅠ
select avg(sal)
from emp;

select e.ename, d.dname, e.sal , s.grade 
from emp e
join dept d
on e.deptno = d.deptno
join salgrade s
on e.sal between s.losal and s.hisal
where sal>(select avg(sal) from emp) and ename like '%S%'
order by e.sal asc;

--4.사원정보테이블(Employees table)에서 평균 급여보다 높고, 
--최대 급여보다 낮은 월급을 받는 사원의 리스트를 출력하라.
--결과값은 급여를 기준으로 내림차순으로 정렬하세요 (edited) 
--(참고 HR로 접속해야함)

select ename, sal
from emp
where sal>(select avg(sal) from emp) 
and sal<(select max(sal) from emp)
order by sal desc;


-------------------------------------------------------
--subquery TEST (3시 45분까지)
--문제풀이2번
--1. 'SMITH'보다 월급을 많이 받는 사원들의 이름과 월급을 출력하라s


select ename, sal
from emp
where sal > ( select sal from emp where ename = 'SMITH');

--2. 10번 부서의 사원들과 같은 월급을 받는 사원들의 이름, 월급
--부서번호를 출력하라
select ename, empno, sal
from emp
where sal in (
select sal
from emp
where deptno = 10)
;

--3. 'BLAKE'와 같은 부서에 있는 사원들의 이름과 고용일을 뽑는데
-- 'BLAKE'는 빼고 출력하라.



select ename, hiredate
from emp
where deptno = (select deptno
from emp
where ename = 'BLAKE') and ename != 'BLAKE';

--4. 평균급여보다 많은 급여를 받는 사원들의 사원번호, 이름, 월급을
-- 출력하되, 월급이 높은 사람 순으로 출력하라.(다시풀것ㅇㅇㅇㅇㅇㅇㅇㅇ)

select empno, ename , sal
from emp
where sal>(select avg(sal)
from emp)
order by sal desc;

--5. 이름에 'T'를 포함하고 있는 사원들과 같은 부서에서 근무하고
-- 있는 사원의 사원번호와 이름을 출력하라.

select ename , empno
from emp
where deptno in (select deptno
from emp
where ename like '%T%');

--6. 30번 부서에 있는 사원들 중에서 가장 많은 월급을 받는 사원보다
-- 많은 월급을 받는 사원들의 이름, 부서번호, 월급을 출력하라.
--(단, ALL(and) 또는 ANY(or) 연산자를 사용할 것)


select ename
from emp
where sal >(
select max(sal)
from emp
where deptno = 30
);

--7. 'DALLAS'에서 근무하고 있는 사원과 같은 부서에서 일하는 사원의
-- 이름, 부서번호, 직업을 출력하라.

select ename, empno, job
from emp
where deptno in(select deptno
from dept
where loc = 'DALLAS');



--8. SALES 부서에서 일하는 사원들의 부서번호, 이름, 직업을 출력하라.


select e.ename, e.empno, e.job, d.dname
from emp e
join dept d
on e.deptno = d.DEPTNO
where d.dname = 'SALES';

--9. 'KING'에게 보고하는 모든 사원의 이름과 급여를 출력하라
--king 이 사수인 사람 (mgr 데이터가 king 사번)



select ename, sal
from emp
where mgr = (
select empno
from emp
where ename = 'KING'
);




--10. 자신의 급여가 평균 급여보다 많고, 이름에 'S'가 들어가는
-- 사원과 동일한 부서에서 근무하는 모든 사원의 사원번호, 이름,
-- 급여를 출력하라.


--11. 커미션을 받는 사원과 부서번호, 월급이 같은 사원의
-- 이름, 월급, 부서번호를 출력하라.


--12. 30번 부서 사원들과 월급과 커미션이 같지 않은
-- 사원들의 이름, 월급, 커미션을 출력하라.


----------------------------
--[INSERT], [UPDATE],[DELETE]
/*
오라클 기준
DDL(데이터 정의어) :create, alter, drop, trunccate(rename, modify)
DML(데이터 조작어) :insert, update, delete
DQL(데이터 질의어) :select
DCL(데이터 제어어) :권한(grant, revoke)
TCL(트렌잭션) : commit, rollback, savepoint
*/

--DML(트랜잭션 : 하나의 논리적인 작업 단위)
--A은행에서 출금 B라는 은행 입금(하나의 논리적인 단위)
--A라는 계좌(100) 출금 : update...
--B라는 계좌(100) 입금 : update...
--...

--둘다 | 성공 :commit
--둘중에 하나라도 실패 : rollback

--테이블 정보보기(TIP)
desc emp;
select*from tab;
select*from tab where tname='BOARD';
select*from col;
select*from col where tname ='EMP';
select*from user_tables;

select *from user_tables where table_name = 'DEPT';

