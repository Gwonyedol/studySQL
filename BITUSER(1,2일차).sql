/*
1���� ����
1. ����Ŭ ����Ʈ���� �ٿ�ε�
2. ����Ŭ �ٿ�ε� ���
3. Oracle ��ġ(SYS, SYSTEM ������ ���� ��ȣ : 1004)
4. sql ���α׷� ����(CMD) :  GUIȯ�� �Ϲ� ����� ��� ����
5. ������ Tool ��ġ ���� (sqlDeveloper), ����(���, ������, SQLGATE)
6. SqlDeveloper ���� ���ؼ� Oracle Server ����....
  >> HR ���� : ��ȣ 1004, UnLock 2���� ��밡�� .... (������� �ǽ� ���̺�)��
  >> ���ο� ���� bit user

7. ���� ���� ���� Ȯ�� : show user;

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

--1.������̺��� ��� �����͸� ����ϼ���.

select*from emp; --���������� ��ҹ��ڸ� �������� �ʽ��ϴ�.
SELECT*FROM DEPT;
select*from salgrade;

--2.Ư�� �÷� ������ ����ϱ�
select empno, ename, sal from emp;

--3.�÷��� ����Ī(��Īalias) �ο��ϱ�
select empno ���, ename �̸�
from emp;

select empno as "���", ename as "�̸�"
from emp;
--����(ansi����)

--Oracle ������ ���ڿ�(���ڿ� �����ʹ� ��ҹ��� ����)
--���ڿ� ǥ�� '���ڿ�'�� ��
--�ҹ��� a �빮�� A �ٸ����� ���
select empno, ename from emp where enmae='king';
select empno, ename from emp where enmae='King';

--Oracle SQL : ������(���տ�����(||)�� ���������(+) ����)
--JAVA : + (����+���� ����)
--JAVA : + (���ڿ�+���ڿ� ����)
--TIP ms-sql +(����,����)


select '����� �̸���'||ename||'�Դϴ�' as "�������"
from emp;


--���̺� �÷��� �⺻ Ÿ��
--�÷��� Ÿ�� ����, ����, ��¥..

desc emp; -- ���̺��� Ÿ�� �⺻ ���� ��ȸ
select empno || ename -- number ||varchar ���������� ����ȯ(����Ÿ���� ����Ÿ������ �ٲ�)
from emp;

select empno + ename
from emp;

-- ����� �츮 ȸ�翡 ������ ��� �ֳ�
--distinct :  �ߺ������� ����
--distinct ���� : grouping
--��̻�Ƽ�...(group�� group�� ������)
select distinct job, deptno from emp order by job;
select distinct deptno, job from emp order by deptno;


--Oracle(SQL ���)
--JAVA ���(������)
--JAVA ���� ����(+,*,-....) % �������� ���ߴ���.. >> ����Ŭ�� % �˻��� �������� ���� >> ���������ϴ°� �����.. ��� Mod() �Լ� �̿� 
--�������(+,*,-,/..) 
--������̺��� ����� �޿��� 100�޷� �λ��� ����� �������
desc emp;
select sal, sal+100 as "�λ�޿�" from emp;

select 100 + 100 from dual;
select 100 || 100 from dual;
select '100' + 100 from dual; -- ����Ŭ���� +�� ������ ���! (���ڸ� ���ڷ�)
select 'A100' + 100 from dual; -- Error

--JAVA ���� (==) �Ҵ�(=)
--Oracle ���� (=) �����ʴ�(!=)
--And,or,not
--������(���ϴ� row ������ ���ڴ�)
select* from emp
where sal >=3000;

select empno,ename, sal
from emp
where sal >= 3000;

--�̻�, ����(= ����)
--�ʰ�, �̸�

--����� 77788���� ����� ���, �̸� ���� �Ի����� ����ϼ���
select empno, ename, job, hiredate --3
from emp --1
where empno= 7788; --2

--����� �̸��� king ����� ���,�̸�,�޿� ������ ����ϼ���

select empno , ename, sal
from emp
where ename = 'KING';

--�޿��� 2000�޷� �̻��̸鼭 ������ manager �� ����Ǹ�� ������ ����ϼ���
--Hint) �� (AND, OR)
--AND �ΰ��� ��� �� --> ��

select *
from emp
where job = 'MANAGER' or sal>=2000;
--�޿��� 2000�޷� �̻��̸鼭 ������ manager �� ����Ǹ�� ������ ����ϼ���
--�ΰ��� ������ �ƴϸ� ���̿��� ���

-----------------------------------------------

--����Ŭ ��¥ (DB ������ ��¥)
--����Ŭ ��¥(sysdate)
--��� �ý��� ��¥ ����
--�Խ��� �۾���
--insert into board(writer,titler,content,regdate)
--values("ȫ�浿","�氡","����Ŀ�",sysdate)
--TIP) ms-sql : select getdate()
select sysdate from dual;
alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';

select hiredate from emp;

--����Ŭ �ý��� ���̺� ...
select*from SYS.NLS_SESSION_PARAMETERS; -�ý��� ȯ�� ���̺� ��ȸ Ȯ��
--NLS_DATE_FORMAT YYYY-MM-DD HH24:MI:SS
--NLS_DATE_LANGUAGE KOREAN
--NLS_DATE_FORMAT HH24:MI:SSXFF
--����Ŭ ��¥ ��ȸ : '2019-12-12'
select * from emp
where hiredate = '1980-12-17';

select * from emp
where hiredate = '1980/12/17'; -- (/)

select * from emp
where hiredate = '80/12/17'; --������ ������ �ȵ�!
--���� : RR-MM-DD >> YYYY-MM-DD
--����� �޿��� 2000�޶� �̻��̰� 4000�޶� ������ ��� ����� ������ ����ϼ���

select *
from emp
where SAL >= 2000 and SAL<=4000 ;

--������ : between A and B (= ����)
--���ǻ��� : �̸� �ʰ��� ������

select*
from emp
where between 2000 and 4000;

--����� �޿��� 2000�̻��̰� 4000������ ��� ����� ������ ����ϼ���

select*
from emp
where sal >2000 and sal<4000;

--�μ� ��ȣ�� 10�� �Ǵ� 20�� �Ǵ� 30���� ����� ���, �̸�, �޿�, �μ���ȣ�� ����غ�����

select empno,ename, sal,deptno
from emp
where deptno = 10 or deptno = 20 or deptno = 30;

--IN������(���� or ���� or...)

select empno,ename, sal,deptno
from emp
where deptno in (10,20,30);

--�μ���ȣ�� 10�� �Ǵ� 20���� �ƴ� ����� ���, �̸�, �޿�, �μ���ȣ�� ����ϼ���

select*
from emp
where dptno != 10 and deptno !=20 ;

--not in ������(������ and ������ and..)
select*
from emp
where deptno not in (10,20); --not in (deptno != 10 and deprno != 20)

--POINT : Oracle ���� ���� (������ ����) >>null
--null �ʿ��

create table member(
  userid varchar2(20) not null, --�ʼ�
  name varchar2(20) not null, --�ʼ�
  hobby varchar2(50)         -- default(null)���� ����ϰڴ�
  
);

desc member;
insert into member(userid,hobby) values('hong','��');
insert into member(userid,name) values('hong','ȫ�浿'); -- hobby�� null�� ��

select *from member;

insert into member(userid,name,hobby) values('kim','�达','����');
select *from member;

--�����ݿ�
commit;


--����(comm)�� �����ʴ� ��� ����� ������ ����ϼ���
-- 0�� ������ ���( �޴����� ����)
--comm�÷��� �����Ͱ� null �ΰ͸� ����ϼ���
select*from emp where comm = null; --(x)

--null�� �񱳴� (is null, is not null)
select*from emp where comm is null;

--��� ���̺��� ���, �̸�, �޿�, ����, �ѱ޿��� ����ϼ���
--�ѱ޿�(�޿�+����)

select empno, ename, sal, comm, sal+comm as "�ѱ޿�"
from emp;

select empno, ename, sal, comm, sal+nvl(comm,0) as "�ѱ޿�"
--nvl(a,b) a���� null���� ���ٸ� b�� �ٲ��
from emp;

--point null
--1.null���� ��� ������ �� ����� null�Դϴ�.
--2.�� ���� �ذ�: �Լ� nvl(),nvl2() >> TIP my-sql:convert(), my-sql:IFNULL():null�� ��ü

select 1000 + null from dual;
select 1000 + nvl(null,0)from dual;
select comm, nvt(comm,1111)from emp;

--����Ǳ޿��� 1000�̻��̰� ������ �����ʴ� ����� ���, �̸�, ����, �޿�, ������ �����ϼ���
select empno,ename,job,sal,comm
from emp
where sal > 1000 and comm is null
;


---------------------------
--DQL (data query language) : SELECT
--DDL(������ ���Ǿ�) create , alter, drop..(��ü����,����,����)

--create Board (boardno number)
--JAVA : class Board(private boardno int)

create table Board(
boardid number not null, --����,�ʼ��Է�
title varchar2(20) not null, -- �ʼ��Է�
content varchar2(2000) not null,
hp varchar2(20)
);

desc Board;

insert into board(boardid, title, content)
values(100,'����Ŭ','�Ҹ�');
select*from board;

rollback;
commit;

insert into board(boardid,title,content)
values(200,'�ڹ�','�׸���');

insert into board(boardid,title,content)
values(300,'����Ŭ��','����');


select*from board;
commit;

select boardid , nvl(hp,'EMPTY') as "hp" from board;
--nvl �Լ��� ���� ��¥ ���ڿ� ��� ���� �����ϴ�..

------------------------------------------
--���ڿ� �˻�
--�ּҰ˻� : �˻��� : '����' -> ���� �ܾ �ִ� ��� ������ �� ����.. (like �˻�)
--���ڿ� ���� �˻� (LIKE ������)
--like ������(���ϵ� ī�� ���� (% ���� _: �ѹ���) ����...
select ename
 from emp
 where ename like '%A%'; --ename �÷��� �����Ϳ� A����ִ� ��� �̸� �˻�

 select ename
 from emp
 where ename like '%a%'; --���ڿ� ������ ��ҹ��� �����ϰ� ����

 select ename
 from emp
 where ename like 'A%';

 select ename
 from emp
 where ename like '%S';
 
 select ename
from emp
where ename like '%LL%';            --LL���޾� ������ �˻�

select ename
from emp
where ename like '%A%A%';         --A�� �ΰ��� ������ �˻�

select ename
from emp
where ename like '_A%';               --ù���ڴ� ����̶� ������� �ι�° ��¥�� A....



--����Ŭ ����(regexp_like) �� �˻�
select * from emp where REGEXP_LIKE(ename,'[A-C]');
--����ǥ����(java -> oracle -> javascript)
--���� : ���� ǥ�� ���� 5�� �����(ī�� �ø���)

-----------------------------------------------------------------------------------------------
--������ �����ϱ�
--order by �÷��� : ����, ����, ��¥
--�������� : asc ������ (default)
--�������� : desc������


select * from emp order by sal;             --default asc
select * from emp order by sal asc;

--�޿��� ���� �޴� ������ �����ؼ� ����ϼ���
select * from emp order by sal desc;

select ename from emp order by ename asc;     --���� ����



--�Ի����� ���� ���� ������ �����ؼ� ���,�̸�, �޿�, �Ի��� �����͸� ����ϼ���
--���� �ֱٿ� �Ի��� ������
select empno, ename, sal, hiredate
from emp
order by hiredate desc;

/*
SELECT           3
FROM            1
WHERE           2
ORDER BY       4          (select�� ����� ����)

*/

--�ؼ�
select empno, ename, sal, job, hiredate
from emp
where job = 'MANAGER'
order by hiredate desc;


--order by �÷��� desc, �÷��� asc, �÷��� desc
select job, sal
from emp
order by job asc, sal desc;

-----------------------------------------------------------
--������
--������ (union) : table�� table�� �����͸� ��ġ�� ��(�ߺ����� ����)
--������ (union all) : �ߺ��� ���


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
union   --�ߺ�����
select * from uta;


select * from ut
union  all
select * from uta;


--union ��Ģ
--1. �����Ǵ� �÷��� Ÿ���� �����ؾ��Ѵ�
select empno, ename from emp
union
select dname, deptno from dept;     --�����Ǵ� Ÿ���� �ٸ���

select empno, ename from emp
union
select deptno, dname from dept;


--�ǹ� > subquery (in line view)
select empno, ename
from (
      select empno, ename from emp
      union
      select deptno, dname from dept
) order by empno desc;


--2. �����Ǵ� �÷��� ������ �����ؾ��Ѵ� (null ������)
select empno, ename, job, sal from emp
union
select deptno, dname, loc,null from dept;

--��������� �ʺ������ڰ� �ǹ������� �ؾ��ϴ� (���� ���̺�) ������� �� �� �ִ� ����...
-------------------------------------------------------------------------------------------------------------


--����Ŭ �Լ�--[2����]
--����Ŭ �Լ�
/* ���� �� �Լ��� ����
1) ������ �Լ� : ���ڸ� �Է� �ް� ���ڿ� ���� �� ��θ� RETURN �� �� �ִ�.
2) ������ �Լ� : ���ڸ� �Է� �ް� ���ڸ� RETURN �Ѵ�.
3) ��¥�� �Լ� : ��¥���� ���� �����ϰ� ���ڸ� RETURN �ϴ� MONTHS_BETWEEN �Լ���
�����ϰ� ��� ��¥ ���������� �� RETURN �Ѵ�.
4) ��ȯ�� �Լ� : � ���������� ���� �ٸ� ������������ ��ȯ�Ѵ�.
5) �Ϲ����� �Լ� : NVL, DECODE
*/

select ubutcao('the super man') from dual;

select lower('AAA'), upper('aaaa') from dual;

select name, lower(ename) as "ename" from emp;

select * from emp where enmae = 'king';

select * from emp where lower(ename) = 'king';

--���ڿ� ����
select length('abcd') from dual; --4
select length('ȫ�浿') from dual; --3

select length('ȫ �� �� a ') from dual; -- ���鵵 ���ڿ� ������ ����


-- ���տ�����
--concat()

select 'a' || 'b' || 'c' as  "data" from dual; -- ���ڿ� ����

select concat('a','b') from dual; -- �Ķ���� ���� ��������
select ename ||'  '|| job as "name" from emp; 

--�κ� ���ڿ� ����
--java (substring)
--oracle(substr)
select substr('ABCDE',2,3) from dual;
select substr('ABCDE',1,1) from dual; -- �ڱ��ڽ� : A
select substr('ABCDE',3,1) from dual; --C

select substr('ABCDE',3) from dual; --3--

select substr('ABCDE',-2,1) from dual;


/*
������̺��� ename �÷� �����Ϳ� ���ؼ� ù���ڴ� �ҹ��ڷ� ������ ���ڴ� �빮�ڷ� ����ϵ�
�ϳ��� �÷����� ����ϼ���
--�÷��� ����Ī�� : fullname
--ù���ڿ� ������ ���� ���̿� �����ϳ��� ��������
ex) SMITH >> s MITH
*/ 

select lower(substr(ename,1,1)) from emp; -- s �ҹ���
select upper(substr(ename,2) from emp; -- MITH �빮��

select lower(substr(ename,1,1)) || ' ' || upper(substr(ename,2)) as "fullname" from emp;

--lpad, rpad (ä���)
select lpad('ABC',10,'*') from dual; -- ***********ABC
select rpad('ABC',10,'%') from dual; -- ***********ABC

--Quiz
--����� ��� : hong1006
--ȭ�� : ho********* ����ϰ� �;�� (��� : 1004 > 10**) 

select rpad(substr('hong1006',1,2),length('hong1006'),'*') from dual;

--emp ���̺��� ename �÷��� �����͸� ����ϴµ� ù���ڸ� ����ϰ� �������� *

select rpad(substr(ename,1,1),length(ename),'*')as "ename" from emp;

create table member2(
  id number, jumin varchar2(14));
  
insert into member2(id, jumin) values(100,'123456-1234567');
insert into member2(id, jumin) values(200,'234567-1234567');

commit;

select * from member2;

--quiz
--��°��
--�ϳ��� �÷����� ���:
--100 : 123456 - *******
--200 : 234567 - *******
--�÷��� ����Ī 'juminnumber'

select id || ' : ' || rpad(substr(jumin,1,7),length(jumin),'*') as "juminnumber"  from member2

--rtrim �Լ�
--[������ ����] ������
select rtrim('MILLER' ,'ER') from dual;
select rtrim('MiLLLLLLLLLLLLLLLR' , 'ER') from dual;
select '>' || rtrim('MILLER' ,'') || '<' from dual;


--ġȯ�Լ� (replace)
select ename, replace(enmae,'A','�Ϳ�') from emp;

----------------------���ڿ��Լ� (END)-------------------------

--[ �����Լ� ]
--round (�ݿø��Լ�)
--trunc (�����Լ�)
--������ ���ϴ� �Լ� (mod)


--trunc (�ݿø� ���� �ʰ� ������)
select trunc(12.345,0) as "r" from dual; --12, ���� �κи� ���ܶ�
select trunc(12.567,0) as "r" from dual; --13

select trunc(12.345,1) as "r" from dual; --12.3
select trunc(12.567,1) as "r" from dual; --12.6

select trunc(12.345,-1) as "r" from dual; --10
select trunc(15.345,-1) as "r" from dual; --20

--������
select 12/10 from dual; --12
select mod(12,10) from dual; --������ (2)
select mod(0,0) from dual; --0

--��¥ �Լ�
select sysdate from dual;
--��¥ ���� (POINT)
--Date + Number >> Date
--Date - Number >> Date
--Date - Date >> Number(�ϼ�)

select * from SYS.NLS_SESSION_PARAMETERS

SELECT hiredate from emp;

select MONTHS_BETWEEN('2018-02-27','2010-02-27') from dual; 

select round(MONTHS_BETWEEN(sysdate,'2010-01-01'),1) from dual;
select trunc(MONTHS_BETWEEN(sysdate,'2010-01-01'),1) from dual;

select to_date('2019-03-20') + 100 from dual; --2019-06-28 00:00:00

select to_date('2019-03-20') + 1000 from dual;

select sysdate + 1000 from dual;

--Quiz
--1.��� ���̺��� ������� �Ի��Ͽ��� ���� ��¥���� �ټӿ����� ���ϼ���
--  �� �ټӿ����� �����κи� ����ϼ���

select trunc(MONTHS_BETWEEN(sysdate,hiredate))as "�ټӿ���" from emp;

--2. �Ѵ��� 31�� �̶�� ���ؿ��� �ټӿ����� ���ϼ���
select ename, hiredate, trunc((sysdate-hiredate)/31) "�ټӿ��� " from emp;

--------------------------[��¥ �Լ� END]--------------------------------------
--����_
--����_
--��¥_ ����
------------------------------------------------------------------------------
--[��ȯ�Լ�] Today POINT
--Oracle : ����, ����, ��¥
--to, char(): ���� -> answk (1000 -> S1000), ��¥ -> ���� (2019-03-03 -> 2019�� 03�� 03��) ����(format)

--to_date(),���� -> 2019-03-03' + 1000 >> select to_date('2019-03-03') + 1000

--to_number() : ���� -> ���� (�ڵ� ����ȯ)

select '100' + 100 from dual;

select to_number('100') + 100 from dual;

/*
����Ŭ �⺻ ������ Ÿ��
create table ���̺�� (�÷��� Ÿ��)
create table member (age number) >> 1�� insert _ 1000��

java : class person.. >> person p = new person();  1��
       List(Person) personlist = new ArrayList();
       personlist.add(new person);
oracle : create person.. > person p = new person(); 1�� 

���� Ÿ��
--char(20) >> 20Byte >> �ѱ� 10��, ������, Ư������, ���� 20�� : �������̹��ڿ�
--varchar2(20) >> 20Byte >> �ѱ� 10��, ������, Ư������, ���� 20�� :  �������� ���ڿ�

char(20) >> 'ȫ�浿' >> 6byte >> ȫ�浿 20Byte �ȿ� ����
varchar2(20) >> 'ȫ�浿' >> ������ ũ�� ��ŭ ���� Ȯ�� >> 6Byte

�������� ������ : ��, ��
char(2) >>

���ɻ��ǹ���)
char() �� varchar() ���� �˻� �켱

�ᱹ ������ �ѱ�....
unicode(2byte) : �ѱ�, ������, Ư������, ����>>2byte

nchar(20) >> 20���� >> 2,20 40Byte
nvarchar2(30) >> 30����...
*/

--1. to_number : ���ڸ� ���ڷ�
select '1'+1 FROM dual;

select TO_NUMBER('1') + 1 FROM dual;

--2. to_char() : ���� -> ���Ĺ���, ��¥ -> ���Ĺ���
SELECT TO_CHAR(SYSDATE) || '��' from dual;

SELECT SYSDATE, to_CHAR(Sysdate,'YYYY') || '��' as "YYYY",
To_CHAR(sysdate,'YEAR'),
To_CHAR(sysdate,'MM'),
To_CHAR(sysdate,'DD'),
To_CHAR(sysdate,'DAY'),
To_CHAR(sysdate,'DY') from dual;

/*
�Ի����� 12���� ������� ���, �̸�, �Ի���, �Ի�⵵, �Ի���� ����ϼ���
*/

select empno as "���" , ename as "�̸�", to_char(hiredate,'day')as "����",to_char(hiredate,'yyyy') as "����" ,to_char(hiredate,'mm') as "��"
from emp where substr(hiredate, 6,2) = 12;

select to_char(hiredate, 'yyyy"��",mm"��",DD"��"')from emp;

--1000000 -> $1,000,000,000 (�������·�)
-- ǥ ����Ŭ.pdf 71 page

select '>' || to_char(12345,'9999999999999') || '<' from dual; --9�� �ڸ� ���� �ǹ� (��� ���� ����)
select '>' || to_char(12345,'$9,999,999,999') || '<' from dual;
-- > $12,345< �����  ���� ������

SELECT sal, to_char(sal,'$999,999') from emp;

--�ٽ� bituser �������� ��ȯ -----------------
--to_date() ���ڸ� -> ��¥��
select '2019-03-03' + 100 from dual;
select to_date('2019-03-03') + 100 from dual;
-----------------------------------------------------
--��ȯ�Լ� (to_char(), to_date(), to_number()--------------------------------

--�Ϲ��Լ�(���α׷����� ������ ���� �Լ�)
--nv(), nvl2() >> null ó�� �Լ�
--decode() �Լ� >> java if ��
--case() �Լ� >> java switch ��

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
--2. nvl2 >> null�ΰ��, null�� �ƴ� ���
select id, job, nvl2(job, job ||'�Դϴ�','empty')from t_emp;

select id, job, nvl2(job, 'AAA', 'BBB')FROM t_emp;

--3. decode POINT(��� ����Ÿ : if, switch)
--decode(ǥ����, ����1, ���1, ����2, ���2, ����3, ���3 ....)
select id, job, decode(id, 100, 'it...', 200, 'saels...', 300, 'MGR...','ETC...') from t_emp;

select job , decode (job,'IT',1,'SALES',2,'MGR',3) from t_emp;

select count(decode(job,'IT',1)) as "IT",          --���ǿ� �´� ��찡 ������� Ȯ��
       count(decode(job,'SALES',1)) as "SALES",
       count(decode(job,'MGR',1)) as "MGR"
from t_emp;

/*
emp ���̺��� �μ���ȣ�� 10�̸� '�λ��' , 20�̸� '������', 30�̸� 'ȸ���' ������ �μ��� '��Ÿ�μ�' ��µǴ� ������ ���弼��
*/

select deptno, ename, decode(deptno,10 ,'�λ��', 20 ,'������' , 30 ,'ȸ���', '��Ÿ�μ�') from emp;

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
t_emp2 ���̺��� id,jumin �����͸� ����ϵ� jumin �÷��� ���ڸ��� 1�̸� '����' ��� 2�̸� '����' 3�̸� '�漺'
�׿ܴ� '��Ÿ' ��� ����ϼ��� (�÷����� ����)
*/

select decode(substr(jumin, 1,1),1 ,'����', 2 ,'����' , 3 ,'�漺', '��Ÿ')as "����" from t_emp2;

/*
�μ���ȣ�� 20���� ����߿��� SMITH ��� �̸��� ���� ����̶�� HELLO ���� ����ϰ�
�μ���ȣ�� 20���� ����߿��� SMITH ��� �̸��� ���� ����� �ƴ϶�� WORLD ���� ����ϰ�
�μ���ȣ�� 20���� ����� �ƴ϶�� ETC ��� ���ڸ� ����ϼ���
*/

select empno, ename, decode(deptno,20, decode(ename,'SMITH','HELLO','WORLD') ,'etc') from emp;

--case �� 
--java : switch

/*
case ���ǽ� when ��� 1 then ��� 1
           when ��� 2 then ��� 2
           when ��� 3 then ��� 3
           else ��� 4
    end '�÷���'
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
  
  select case zipcode when 2 then '����'
                      when 31 then '���'
                      when 32 then '����'
                      when 41 then '����'
                      else '��Ÿ����'
          end "regionname"
    from t_zip;
    
  /*
  ������̺��� ����޿��� 1000�޷� ���ϸ� '4��'
  1001�޷� 2000�޷� ���ϸ� '3��'
  2001�޷� 3000�޷� ���ϸ� '2��'
  3001�޷� 4000�޷� ���ϸ� '1��'
  4001�޷� �̻��̸� Ư��' �̶�� �����͸� ����ϼ���
  */
  
--1.case �÷��� when ��� then ��� (=)����
--2.case when �÷��� ���� �񱳽� then
--       when �÷��� ���� �񱳽� then
desc emp;
select case when sal <= 1000 then'4��'
            when sal between 1001 and 2000 then '3��'
            when sal between 2001 and 2000 then '2��'
            when sal between 3001 and 2000 then '1��'
            else 'Ư��' end "�޿����" from emp;
            
-------------------------------------------------------------------------------------------------------
--�����Լ�
--�����Լ�
--��¥�Լ�
--��ȯ�Լ�(to_char(), to_date, to_number()
--�Ϲ��Լ� (nvl(), decode(), case(), ...)
-------------------------------------------------------------------------------------------------------
--����Ŭ pef (75 page)

--�����Լ�--
-- 1. count (*) > row ��, count(�÷���) >> ������ ���� (null �� �������� �ʴ´�)
-- 2. sum()
-- 3. avg()
-- 4. max()
-- 5. min()
--���  

/*
1. �����Լ��� �ݵ�� group by ���� ���� ���
2. ��� �����Լ��� null ���� ����
3. select ���� �����Լ� �̿ܿ� �ٸ� �ø��� ���� �ݵ�� �� �÷��� group by ���� ���õǾ�� �Ѵ�
*/

select count(*) from emp;

select count(comm) from emp; -- 6�� (null ���� ����)

select comm from emp;

select count(nvl(comm,0)) from emp;

-----------------------------------------------------------------------------
--�޿��� ��

select sum(sal) as "�޿��� ��" from emp; 29025

--��ձ޿�
select trunc(avg(comm),0) from emp; --721 (�ΰ��� ��������)
select trunc(sum(comm)/count(EMPNO)) from emp; --309 (�ΰ��� ��������

--������� ȸ�� �� ������ �󸶳� ���޵ǳ� ,,,(������ ���)
select trunc(avg(comm)) from emp;

select sum(comm) from emp;
select trunc(sum(comm)/14.0) from emp;

select trunc(avg(nvl(comm,0)),0 ) from emp; --309

--ȸ���� ������ ��ü ��� ���� ������ 309
--ȸ���� ������ �޴� ��� �� ������ 721

select count(*) from emp where comm is null; -- ������ ó�� null ���� ó��

desc emp;

select max(sal) from emp;

select min(sal) from emp;


--point �����Լ� ����� 1�� (1�� �÷��ϳ� row�ϳ�)

select aempno, count(empno()) from emp;

--Point �����Լ� ����� 1��(1�� �÷��ϳ� row �ϳ�)
select empno, count(empno) from emp; --(x) empno 14��, ���� 1��
select sum(sal), avg(sal), max(sal), min(sal), count(sal), count(*) from emp;

------------------------------------------
--�μ��� ��� �޿��� ���ϼ���
select deptno, avg(sal)
from emp
group by deptno;

select job, avg(sal)
from emp
group by job;

--������ ��ձ޿�, �޿���, �ִ�޿�, �ּұ޿�, �Ǽ��� ����ϼ���
select job, sum(sal), max(sal), min(sal), count(*)
from emp
group by job;

/*
grouping ����

distinct �÷���1, �÷���2
order by �÷���1, �÷���2
group by �÷���1, �÷���2

*/

--�μ���, ������ �޿��� ���� ���ϼ���
select deptno, job, sum(sal), count(sal)
from emp
group by deptno, job
order by deptno;

/*
--����--
select --5
from  --1
where    --2
group by --3
order by --6
having�� >> group by�� ������ --4
*/

/*
������ ��ձ޿��� 3000�޷� �̻��� ����� ������ ��ձ޿��� ����ϼ���
*/

select  job, avg(sal) as "avgsal"
from emp
group by job
having avg(sal) > = 3000;

/*
from�� ������ where
group by ������ having
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
1. ������̺��� ������ �޿����� ����ϵ� ������ ���ϰ� �޿��� ���� 5000�̻��� ������� ����� ����ϼ���
--�޿��� ���� ���� ������ ����ϼ���
*/
select job, sum(sal)
from emp
group by job
having sum(sal) + sum(comm) >=5000
order by sum(sal) asc;
/*
2. ������̺��� �μ� �ο��� 4���� ���� �μ��� �μ���ȣ, �ο���, �޿��� ���� ����ϼ���
*/
select deptno, count(deptno), sum(sal)
from emp
group by deptno
having count(deptno) > 4;


/*
3. ������̺��� ������ �޿��� ���� 5000�� �ʰ��ϴ� ������ �޿��� ���� ����ϼ���
�� �Ǹ������� �����ϰ� �޿������� �������� �����ϼ���
*/
select job ,sum(sal)
from emp
where job !='salesman'
group by job
having sum(sal) > 5000
order by sum(sal) desc;