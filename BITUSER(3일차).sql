--3����--
-----------------------------------------
--���� �ǽ� ���̺� �����ϱ�--
create table M (M1 char(6) , M2 char(10));
create table S (S1 char(6) , S2 char(10));
create table X (X1 char(6) , X2 char(10));

insert into M values('A','1');
insert into M values('B','1');
insert into M values('C','3');
insert into M values(null,'3');
commit;

--����
--1.�����(equi join) 70%
--2.�����̺�� �����Ǵ� ���̺� �ִ� �÷��� �����͸� 1:1�� ����(�ϳ��� �������� �����Ŵ)
--SQL JOIN ���� -> ���� ������ ����
--ANSI ����[inner] join on ~ ������

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

--SQL JOIN �� �� �Ƚ��!
select*
from m,s
where m.m1 = s.s1;

select m.m1, m.m2, s.s2
from m,s
where m.m1 = s.s1;

--ANSI ����
--where(from ���� ������)
--where join �������� ���(����� join �����̰� ����� from���� ���������� �򰥸�..)
--ansi join�� �������� on�Դϴ�
select*
from m
inner join s
on m.m1 = s.s1

select m.m1,s.s1,s.s2
from m 
join s -- inner ���� ����
on m.m1 = s.s1;

select*
from m 
join x
on m.m1 = x.x1;


--fr ������ �ϴ��� pr ������ ���ϴ� ��
--���̺��� �ɰ��°��� ����

--�����ȣ, ����̸�, ����μ���ȣ, ����μ����� �˰� �;��
select*
from emp 
join dept
on emp.deptno = dept.deptno;

select emp.empno, emp.ename, emp.deptno, dept.dname
from emp
join dept
on emp.deptno = dept.deptno;

--join���� ���̺� ��Ī �ο�..
select e.EMPNO, e.ENAME, d.deptno, d.DNAME
from emp e join dept d
on e.DEPTNO = d.DEPTNO;


select *
form m 
join s 
on m.m1 = s.s1
join x
on s.s1 = s.s1;

--SQL JOIN ���� (3�� ���̺� ����)
select *
from m,s,x
where m.m1 = s.s1 and x.x1 = s.s1;

--ANSI JOIN ����
select m.m1, s.s2, x.x2
from m 
join s on m.m1 = s.s1
join x on x.x1 = s.s1;

--[HR �������� ����!]--

select* from employees;
select* from DEPARTMENTS;
select* from LOCATIONS;

--1. ���, �̸�(last_name), �μ���ȣ, �μ��̸��� ����ϼ���
select e.employee_id, e.last_name, d.DEPARTMENT_ID, d.DEPARTMENT_NAME
from employees e
join departments d
on e.department_id = d.department_id;
order by e.employee_id;

--������:
select count(*) from employees; -- 107��
--�� join������ ����� 106���̴�. �������� ����..!
--��������� �ذ� �ȵ� ��
--outer ���� �ʿ�!

--2. ���,�̸�(last_name),�μ���ȣ,�μ���,�����ڵ�,���ø� ���
select e.employee_id, e.DEPARTMENT_ID, d.DEPARTMENT_NAME, d.LOCATION_ID, l.street_address
from employees e
join DEPARTMENTS d
on e.DEPARTMENT_ID = d.DEPARTMENT_ID
join LOCATIONS l
on d.LOCATION_ID = l.LOCATION_ID;


-------------------------------------------------
-----[bituser��ȯ]-----
----������(non-euqi join) => �ǹ̸� ���� => 
--�����̺�� ������� ���̺� �ִ� �÷��� 1:1 ������ ���� �ʴ� ���
--ex) emp, salgrade �޿����� (emp:sal >> salgrade losal,hisal 2����)

select*from emp;
select*from salgrade;

select e.empno,e.ename,e.sal,s.grade
from emp e 
join salgrade s
on e.sal between s.losal and s.hisal; -- on ������

-----------------------------------------
--3. outer join(equi join + null)
--outer join(�� �������� �ľ�) >> �ְ��Ǵ� ���̺��� �����͸� �������� ��� (euqi join �ϰ� ���� ������)
--����) left outer join (������ ����) right outer join  (�������� ����) full outer join(left,right join>> union)

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


--[hr�������� �̵�]
--1. ���, �̸�(last_name), �μ���ȣ, �μ��̸��� ����ϼ���
select e.employee_id, e.last_name, d.DEPARTMENT_ID, d.DEPARTMENT_NAME
from employees e
join departments d
on e.department_id = d.department_id;
order by e.employee_id;

select*from employees where department_id is null;
--grant>>department_id null������ ��

select e.employee_id, e.last_name, d.DEPARTMENT_ID, d.DEPARTMENT_NAME
from employees e left outer --outer ���� ����
join departments d
on e.department_id = d.department_id;

----------------------------------------------------------
-------------------bituser�� �ű⼼��-----------------------
--self join(�ڰ�����) -> ���� > �����
--�ϳ��� ���̺��� Ư�� �÷��� �ٸ� �÷��� �����ϴ� ���
select* from emp;

--������ : ���̺��� �ϳ����̴�.....

select*
from emp e 
left join emp m --�ϳ��� ���̺��� �ΰ�ó�� ����
on e.mgr = m.empno;

--13�� : king ������� mgr>> null

select*
from m,s;



-------------1�� �׽�Ʈ -----------------
-- 1. ������� �̸�, �μ���ȣ, �μ��̸��� ����϶�. (O)

select e.ename, e.deptno, d.dname
from emp e
join dept d
on e.deptno = d.deptno;


-- 2. DALLAS���� �ٹ��ϴ� ����� �̸�, ����, �μ���ȣ, �μ��̸���
-- ����϶�. (O)

select e.ename, e.job, d.deptno, d.dname
from emp e
join dept d
on e.deptno = d.DEPTNO and d.loc = 'DALLAS';


-- 3. �̸��� 'A'�� ���� ������� �̸��� �μ��̸��� ����϶�. (O)

select e.ename, d.dname
from emp e
join dept d
on e.deptno = d.deptno 
where ename like '%A%';


-- 4. ����̸��� �� ����� ���� �μ��� �μ���, �׸��� ������
--����ϴµ� ������ 3000�̻��� ����� ����϶�. (O)

select e.ename, d.dname, d.deptno, e.SAL
from emp e
join dept d
on e.deptno = d.deptno
where sal>=3000;

-- 5. ����(����)�� 'SALESMAN'�� ������� ������ �� ����̸�, �׸���
-- �� ����� ���� �μ� �̸��� ����϶�. (O)

select e.ename, e.job, d.dname
from emp e
join dept d
on e.deptno = d.deptno
where e.job = 'SALESMAN';

-- 6. Ŀ�̼��� å���� ������� �����ȣ, �̸�, ����, ����+Ŀ�̼�,
-- �޿������ ����ϵ�, ������ �÷����� '�����ȣ', '����̸�',
-- '����','�Ǳ޿�', '�޿����'���� �Ͽ� ����϶�.
--(�� ) 1 : 1 ���� ��� �÷��� ���� (X)

select e.ename, e.sal, e.sal+nvl(e.comm,0) as "�Ǽ��ɾ�" , s.grade as "�޿����"
from emp e
join salgrade s
on e.sal between losal and hisal;
 
-- 7. �μ���ȣ�� 10���� ������� �μ���ȣ, �μ��̸�, ����̸�,
-- ����, �޿������ ����϶�.

select e.ename, d.deptno, d.dname, e.SAL, s.grade as "�޿����"
from emp e
join dept d
on e.deptno = d.deptno
join salgrade s
on e.sal between losal and hisal;

 
-- 8. �μ���ȣ�� 10��, 20���� ������� �μ���ȣ, �μ��̸�,
-- ����̸�, ����, �޿������ ����϶�. �׸��� �� ��µ�
-- ������� �μ���ȣ�� ���� ������, ������ ���� ������
-- �����϶�.
 

 
 select e.ename, d.deptno, d.dname, e.sal, s.grade
 from emp e
 join dept d
 on e.deptno = d.deptno
 join salgrade s
 on e.sal between losal and s.HISAL
 where e.deptno = 10 or e.deptno = 20
 order by d.deptno asc ,e.sal desc;


-- 9. �����ȣ�� ����̸�, �׸��� �� ����� �����ϴ� ��������
-- �����ȣ�� ����̸��� ����ϵ� ������ �÷����� '�����ȣ',
-- '����̸�', '�����ڹ�ȣ', '�������̸�'���� �Ͽ� ����϶�.
--SELF JOIN (�ڱ� �ڽ����̺��� �÷��� ���� �ϴ� ���)

select e.ename as "����̸�", m.ename as "�������̸�",
e.empno as "�����ȣ", m.empno as "�����ڹ�ȣ"
from emp e
join emp m
on e.mgr = m.empno;

--03/21/pm8:11 �����Ϸ� ������ ä���ϸ鼭 �ؼ�����
--����Ǯ��1��

-------------------------------------------------------
--[subquery] ����Ŭ pdf (100 page)
--sql �� ���̴� >> sql ���� �ذ��
--�Լ� >> ���� >> subquery

--������̺��� ������� ��� ���޺��� �� ���� �޿��� �޴� ����� ���,
--�̸�, �޿��� ����ϼ���

select avg(sal) from emp; --2073

select*
from emp where sal > 2073;

select
from emp where sal > (select avg(sal) from emp); --subquery...
--subquery
--1. single row subquery : subquery�� ����� 1���� row�� ������(���ϰ�) : �Ѱ��� �� /�����÷�
--2. multi row subquery : subquery�� ����� 1�� �̻��� row�� ������(�������� ��) /�����÷�
--�����ϴ� ���� : ���Ǵ� �������� ����
--multi row (IN , NOT IN) (ANY , ALL)
--ALL : sal > 1000 and sal > 2000 and ...
--ANY : sal > 1000 or sal > 2000 or ...
--����(subquery)
--1.��ȣ�ȿ� �־���Ѵ� (select avg(sal) from emp)
--2.�����÷����� ���� >> select sal, deptno from emp, >> (X) �����÷��� �ƴϴ�
--3.�ܵ����� ���� �����ؾ� �Ѵ�!

--�������
--1.subquery ���� ����
--2.subquery�� ����� ������ main query ����


--������̺��� jones�� �޿����� �� ���� �޿��� �޴� ����� ���, �̸�, �޿��� ����ϼ���
select sal from emp where ename = 'JONES'; - 2975

select*
from emp
where sal>(select sal from emp where ename= 'JONES');

--�޿��� 2000�̻�..
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

--���������� �ִ� ����� ����� �̸��� ����ϼ���
--(�� ����� mgr �÷��� �ִ�..)

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

--king ���� �����ϴ� �� ���ӻ���� king�� ����� ���,�̸�,����,������ ����� ����ϼ���
select empno
from emp
where ename = 'KING';

select *
from emp
where mgr = (select empno from emp where ename = 'KING');

--20�� �μ��� ����߿��� ���� ���� �޿��� �޴� ������� �� ���� �޿��� �޴� ����� ���, �̸�, �޿�
--�μ���ȣ�� ����ϼ���

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
--�ڱ� �μ��� ��� ���޺��� �� ���� ������ �޴� ����� ���,�̸�,�μ���ȣ,�μ��� ��� ���� ���ض�


select e.deptno
from emp e
join dept d
on e.deptno = d.deptno;

select deptno,sal
from emp
where deptno in (select avg(sal) from emp);

--�������͵� ��������03.21--
--1. �μ��� ��� �޿��� ���ϼ��� (���� �̰� ��Ǯ� �÷Ƚ��ϴ� Ǯ��Կ�..)
select e.job, round(avg(e.sal),0)
from emp e
group by job;
--2.�޿��� 10���μ��� �����޿����� ����, 20���μ����� ������
--�ʴ� ��� ����� �����ȣ, �̸�, �μ����� ����϶�.

select e.ename, e.empno, d.dname 
from emp e
join dept d
on e.deptno = d.deptno
where e.sal<( select min(sal) from emp where deptno = 10) and
e.deptno != 20;

--3. �޿��� ��� �޿����� ����, �̸��� 'S'�� ����
--������� �μ��̸�,����̸�, ����, �޿������ ����϶�.
--�׸��� �� ��µ� ������� ������ ���� �����������϶�. -->�̰� ���� �ȳ��� �ФФФ�
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

--4.����������̺�(Employees table)���� ��� �޿����� ����, 
--�ִ� �޿����� ���� ������ �޴� ����� ����Ʈ�� ����϶�.
--������� �޿��� �������� ������������ �����ϼ��� (edited) 
--(���� HR�� �����ؾ���)

select ename, sal
from emp
where sal>(select avg(sal) from emp) 
and sal<(select max(sal) from emp)
order by sal desc;


-------------------------------------------------------
--subquery TEST (3�� 45�б���)
--����Ǯ��2��
--1. 'SMITH'���� ������ ���� �޴� ������� �̸��� ������ ����϶�s


select ename, sal
from emp
where sal > ( select sal from emp where ename = 'SMITH');

--2. 10�� �μ��� ������ ���� ������ �޴� ������� �̸�, ����
--�μ���ȣ�� ����϶�
select ename, empno, sal
from emp
where sal in (
select sal
from emp
where deptno = 10)
;

--3. 'BLAKE'�� ���� �μ��� �ִ� ������� �̸��� ������� �̴µ�
-- 'BLAKE'�� ���� ����϶�.



select ename, hiredate
from emp
where deptno = (select deptno
from emp
where ename = 'BLAKE') and ename != 'BLAKE';

--4. ��ձ޿����� ���� �޿��� �޴� ������� �����ȣ, �̸�, ������
-- ����ϵ�, ������ ���� ��� ������ ����϶�.(�ٽ�Ǯ�ͤ���������������)

select empno, ename , sal
from emp
where sal>(select avg(sal)
from emp)
order by sal desc;

--5. �̸��� 'T'�� �����ϰ� �ִ� ������ ���� �μ����� �ٹ��ϰ�
-- �ִ� ����� �����ȣ�� �̸��� ����϶�.

select ename , empno
from emp
where deptno in (select deptno
from emp
where ename like '%T%');

--6. 30�� �μ��� �ִ� ����� �߿��� ���� ���� ������ �޴� �������
-- ���� ������ �޴� ������� �̸�, �μ���ȣ, ������ ����϶�.
--(��, ALL(and) �Ǵ� ANY(or) �����ڸ� ����� ��)


select ename
from emp
where sal >(
select max(sal)
from emp
where deptno = 30
);

--7. 'DALLAS'���� �ٹ��ϰ� �ִ� ����� ���� �μ����� ���ϴ� �����
-- �̸�, �μ���ȣ, ������ ����϶�.

select ename, empno, job
from emp
where deptno in(select deptno
from dept
where loc = 'DALLAS');



--8. SALES �μ����� ���ϴ� ������� �μ���ȣ, �̸�, ������ ����϶�.


select e.ename, e.empno, e.job, d.dname
from emp e
join dept d
on e.deptno = d.DEPTNO
where d.dname = 'SALES';

--9. 'KING'���� �����ϴ� ��� ����� �̸��� �޿��� ����϶�
--king �� ����� ��� (mgr �����Ͱ� king ���)



select ename, sal
from emp
where mgr = (
select empno
from emp
where ename = 'KING'
);




--10. �ڽ��� �޿��� ��� �޿����� ����, �̸��� 'S'�� ����
-- ����� ������ �μ����� �ٹ��ϴ� ��� ����� �����ȣ, �̸�,
-- �޿��� ����϶�.


--11. Ŀ�̼��� �޴� ����� �μ���ȣ, ������ ���� �����
-- �̸�, ����, �μ���ȣ�� ����϶�.


--12. 30�� �μ� ������ ���ް� Ŀ�̼��� ���� ����
-- ������� �̸�, ����, Ŀ�̼��� ����϶�.


----------------------------
--[INSERT], [UPDATE],[DELETE]
/*
����Ŭ ����
DDL(������ ���Ǿ�) :create, alter, drop, trunccate(rename, modify)
DML(������ ���۾�) :insert, update, delete
DQL(������ ���Ǿ�) :select
DCL(������ �����) :����(grant, revoke)
TCL(Ʈ�����) : commit, rollback, savepoint
*/

--DML(Ʈ����� : �ϳ��� ������ �۾� ����)
--A���࿡�� ��� B��� ���� �Ա�(�ϳ��� ������ ����)
--A��� ����(100) ��� : update...
--B��� ����(100) �Ա� : update...
--...

--�Ѵ� | ���� :commit
--���߿� �ϳ��� ���� : rollback

--���̺� ��������(TIP)
desc emp;
select*from tab;
select*from tab where tname='BOARD';
select*from col;
select*from col where tname ='EMP';
select*from user_tables;

select *from user_tables where table_name = 'DEPT';

