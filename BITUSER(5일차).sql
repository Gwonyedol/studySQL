-- View ��ü .....(�������̺�)
-- ����Ŭ.pdf PAGE 192
-- view ��ü (create .....)
-- create view viewname as [ select ���� ] (view�� ���ؼ� �� �� �ִ� ������ ���)
-- view �� ���̺�ó�� ��� ���� (�������̺�) -> emp , dept ���� ���� �����ؼ� ���
-- view �޸� �󿡸� �����ϴ� �������̺� (subquery -> in line view - > from (select deptno , avg(sal) .....)
-- view ���� ���̺�
-- ���� : �Ϲ� ���̺�� ������ �����ϴ�. (select ,,,, where ,,,, )
-- DML(insert , update , delete) -> View�� ���ؼ� DML ���� -> View�� ������ �ִ� (�� �� �ִ�) �� ���̺� �����͸� ����
--view �� ������ ���� �ʿ�(ORA-01031: insufficient privileges)
-- SYSTEM PRIVILEGES
-- GRANT CREATE VIEW TO "BITUSER" WITH ADMIN OPTION;
create view v_001
as
    select empno , ename from emp;
select * from v_001; -- SQL���� ����̴�. > view�� ������ �ִ� sql ������ �����Ѵ�.
    
--View ��� ����
-- 1. �������� ���� (JOIN M SUBQUERY) >> ���� ���̺� ���� ....
-- 2. ���� (���� �ܼ�ȭ) -> ������ ���� �̸� ����� �ΰ� ���
-- 3. ����(���� ó��) -> �����ϰ� ���� �����͸� ��Ƽ� view ���� -> view ���� �ο�
create view v_emp
as
    select empno, ename, job, hiredate from emp;
select * from v_emp;
select empno, ename from v_emp;
select * from v_emp where empno = 7788;
-- ���� (���� �ܼ�ȭ)
create view v_002
as
    select e.empno, e.ename , d.deptno , d.dname
    from emp e join dept d 
    on e.deptno = d.deptno;
select * from v_002;
select * from v_002 where deptno=30;
create view v_003 --view �� ���� ���̺� (���� ������ : �� �÷��� ����������)
as
    select deptno, avg(sal) as avgsal
    from emp
    group by deptno;
select *
from emp e join v_003 s
on e.deptno = s.deptno
where e.sal > s.avgsal;
-- ���̺� 1�� �̻� ..... JOIN ,,,, �ȵǸ� ,,,, subquery ,,,, �������̺� (view)
/*
CREATE  [OR  REPLACE]  [FORCE | NOFORCE]  VIEW view_name [(alias[,alias,...])] 
AS Subquery 
[WITH  CHECK  OPTION  [CONSTRAINT  constraint ]] 
[WITH  READ  ONLY
OR  REPLACE  �̹� �����Ѵٸ� �ٽ� �����Ѵ�. 
FORCE   Base Table ������ ������� VIEW �� �����. 
NOFORCE  �⺻ ���̺��� ������ ��쿡�� VIEW �� �����Ѵ�. 
view_name  VIEW �� �̸� 
Alias   Subquery �� ���� ���õ� ���� ���� Column ���� �ȴ�. 
Subquery  SELECT ������ ����Ѵ�. 
WITH CHECK OPTION VIEW �� ���� �׼��� �� �� �ִ� �ุ�� �Է�,���ŵ� �� �ִ�.  
Constraint  CHECK OPTON ���� ���ǿ� ���� ������ �̸��̴�. 
WITH READ ONLY  �� VIEW ���� DML �� ����� �� ���� �Ѵ�. 
 */
 
 drop view v_0076;
 
 create or replace view v_007
 as
    select avg(sal) as avgsal from emp; -- �Լ�
    
    select* from v_007;
 
 create or replace view v_007
 as
    select round(avg(sal),0) as avgsal from emp;
 
 -- VIEW�� ���� DML ����( insert , update , delete)
 -- �� view ���̺��� �ƴϱ� ������ view�� ���ؼ� �� �� �ִ� �����Ϳ� ���ؼ���
 -- ���� view(�ϳ� �̻��� ���̺�� ����) -> DML(�Ұ�)
 -- �ܼ� view (���̺� 1����) ���� view
 
 select * from v_emp; -- view���ؼ� �� �� �ִ� ������ (empno , ename, job , hiredate)
 
 update v_emp -- view �� ���ؼ� sal ������ �� �� ����.
 set sal = 0; --(x)
 
 update v_emp -- ���� ���̺� ���� .... �����͸� update -- �ᱹ emp ���̺� ������ ....����
 set job = 'IT';
  
create or replace view v_emp2
as
    select * from emp where deptno = 20;
 
 select * from v_emp2;
 
-- 1. 
update v_emp2 --�ڱⰡ �� �� �ִ� �����͸� update .....
set sal =0;
 
 select * from emp;
 rollback;
 
 -- view ��� ����
 select * from user_views;
 --------------------------------------------------------------------------------------------
 -- 1. 30�� �μ� ������� ���� , �̸� , ������ ��� view�� ������
 create view v_emp_001
 as
  select ename, job , sal from emp;
  select * from v_emp_001;
  
  --2. 30�� �μ� �������  ����, �̸�, ������ ��� VIEW�� ����µ�,
-- ������ �÷����� ����, ����̸�, �������� ALIAS�� �ְ� ������
-- 300���� ���� ����鸸 �����ϵ��� �϶�.
-- create or replace view view001 (�÷���, �÷���, .....)  
create view v_emp_002
as
  select job as "����" , ename as "����̸�" , sal as "����"
  from emp
  where sal > 300;
 select * from v_emp_002;
--3. �μ��� �ִ����, �ּҿ���, ��տ����� ��� VIEW�� ������.
create view v_emp_003
as
    select max(sal) as "�ִ����" , min(sal) as "�ּҿ���"  , avg(sal) as "��տ���"
    from emp;
       
--4. �μ��� ��տ����� ��� VIEW�� �����, ��տ����� 2000 �̻���
-- �μ��� ����ϵ��� �϶�.
 create view v_emp_004 
 as
  select avg(sal) as "��տ���"
  from emp
  where ��տ���>2000
  group by deptno;
 
 select deptno , avg(sal) as "��տ���"
 from emp
  group by deptno
  having  avg(sal)>2000;
--5. ������ �ѿ����� ��� VIEW�� �����, ������ MANAGER��
-- ������� �����ϰ� �ѿ����� 3000�̻��� ������ ����ϵ��� �϶�.
create view v_emp_005
as
  select job , sum(sal) as "�ѿ���"
  from emp
  where job != 'MANAGER'
  group by job
  having sum(sal) >=3000;
  
--------------------------------------------------------------------------------------------------------------------------
-- ������
-- ����Ŭ.pdf (185 PAGE)
-- ���� �����ϱ�(��ȣ)
-- �ڵ����� ��ȣ�� �����ϴ� ��ü
/*
CREATE  SEQUENCE  sequence_name  
[INCREMENT  BY  n]  
[START  WITH  n]  
[{MAXVALUE n | NOMAXVALUE}]  
[{MINVALUE n | NOMINVALUE}] 
[{CYCLE | NOCYCLE}] 
[{CACHE | NOCACHE}]; 
sequence_name  SEQUENCE �� �̸��Դϴ�. 
INCREMENT  BY  n ���� ���� n ���� SEQUENCE ��ȣ ������ ������ ����. 
�� ���� �����Ǹ� SEQUENCE �� 1 �� ����. 
START  WITH  n  �����ϱ� ���� ù��° SEQUENCE �� ����. 
�� ���� �����Ǹ� SEQUENCE �� 1 �� ����. 
MAXVALUE n  SEQUENCE �� ������ �� �ִ� �ִ� ���� ����. 
NOMAXVALUE   ���������� 10^27 �ִ밪�� ����������-1 �� �ּҰ��� ����. 
MINVALUE n  �ּ� SEQUENCE ���� ����. 
NOMINVALUE  ���������� 1 �� ����������-(10^26)�� �ּҰ��� ����. 
CYCLE | NOCYCLE  �ִ� �Ǵ� �ּҰ��� ������ �Ŀ� ��� ���� ������ ���� ���θ� 
����. NOCYCLE �� ����Ʈ. 
CACHE | NOCACHE  �󸶳� ���� ���� �޸𸮿� ����Ŭ ������ �̸� �Ҵ��ϰ� ���� 
�ϴ°��� ����. ����Ʈ�� ����Ŭ ������ 20 �� CACHE. 
*/
select * from board;
create table board(
  boardid number constraint pk_board_id primary key,
  title varchar2(100) not null
);
-- boardid �÷��� (not null , unique, index �����ȴ�.) 
-- ������ : boardid �����ʹ� .....
-- ������ : where boaerdid = ? ������ 1���� ������ ..... return
-- insert into board(boardid , title) values (.....
-- �׷��� �ߺ����� �ʰ� , null ���� �ƴϴ� ��� ���� .....
/*
create table board(
  boardid number constraint pk_board_id primary key,
  title varchar2(100) not null
);
*/
-- ���� : ó�� ���� ���� 1�̶�� ���� insert ,,,, �� ���� �� ���ʹ� 2,3,4 �������� ���� insert
insert into board(boardid, title) values(1,'aaaaa');
insert into board(boardid, title) values((select count(boardid) +1 from board), '����1');
--delete .... �� insert �� �ߺ��� (PK��)
--�ٸ� ���
insert into board(boardid, title)
values ( (select nvl(max(boardid),0)+1  from board) , 'ó��');
insert into board(boardid, title)
values ( (select nvl(max(boardid),0)+1  from board) , '�ι�°');
insert into board(boardid, title)
values ( (select nvl(max(boardid),0)+1  from board) , '����°');
select * from board;
delete from board where boardid=1;
select * from board;
------------------------------------------------------------------------------------------------------------
-- sequence ��ȣ ���� (��Ģ) : �ߺ����� ���� , �������� �� (���� ��ü)
------------------------------------------------------------------------------------------------------------
create sequence board_num;
select * from board;
select * from user_sequences;
/*
NEXTVAL �� CURRVAL �ǻ翭
1) NEXTVAL �� ���� ��� ������ SEQUENCE ���� ��ȯ �Ѵ�.  
2) SEQUENCE �� ������ �� ����, �ٸ� ����ڿ��� ������ ������ ���� ��ȯ�Ѵ�. 
3) CURRVAL �� ���� SEQUENCE ���� ��´�. 
4) CURRVAL �� �����Ǳ� ���� NEXTVAL �� ���Ǿ�� �Ѵ�. 
*/
--��ä��
select board_num.nextval from dual; -- 1 return
-- ������� ���� ....?
select board_num.currval from dual; -- �ϰ� ���������� ������ ��ȣ�� 2
----------------------------------------
create sequence kboard_num;
create table kboard(
  num number constraint pk_kboard_id primary key,
  title varchar2(100) not null
);
insert into kboard(num, title) 
values(kboard_num.nextval , 'ó�� ��');
select * from kboard;
select kboard_num.currval from dual;
insert into kboard(num, title) 
values(kboard_num.nextval , '�ι�° ��');
insert into kboard(num, title) 
values(kboard_num.nextval , '����° ��');
select * from kboard;
--------------------------------------------------------------------------------------------------------------
-- 1. sequence ��ü �ϳ�(���̺� ���� ��ü) >> �������� ���̺��� ��밡�� (�����ϴ�)
-- A(1)(4) , B(2) , C(3)
-- ����Ʈ (�Խ���) 10��
-- ��ǰ �Խ��� , ������ �Խ��� , ȸ�� �Խ��� 
-- sequence ���� ���� ��� ....... �ϳ��� sequence �� �����ص� �ȴ�.
-- TIP)
-- ms-sql 
-- ms-sql : create table board(boardnum int identity(1,1) , title varchar(20))
-- insert into board(title) values('�氡'); --> boardnum : 1 ���� �ڵ� insert
-- ms-sql 2012 version���� (sequence)
-- my-sql : create table board(boardnum int auto_increment , title varchar(20));
-- insert into board(title) values('�氡');
-- https://mariadb.com/kb/en/library/create-sequence/  maria db   sequence ��ü ����
----------------------------------------------------------------------------------------
-- sequence ��ü �ɼ�
create sequence seq_num
start with 10
increment by 2;
select seq_num.nextval from dual;
select seq_num.currval from dual;
--�Խ��� ���� insert
--�Խ��� �ֽű� ������ ���̱�
-- select * from board order by boardnum desc;
-----------------------------------------------------------------------------------
--������ �ʼ� 2
--rownum  �ǻ��÷� : ���� ���������� �����ϴ� �÷��� �ƴϰ� ������ ����
--ROWNUM : ������ ���̺� �÷����� �������� ������ ���������� �� ��ȣ �ο��� �� �ִ� �ǻ��÷�
--ROWD : �ּҰ� (���� ������ ����Ǵ� ���� �ּҰ�) -> �ε��� �ȵɶ� ���
select * from emp;
select rownum as ����, empno, ename from emp;  --select�� ����� ������ ������ ���δ�..
--Top-n ����
--���̺��� ���ǿ� �´� ���� (TOP) ���ڵ�(row) n�� ����
--MS-SQL ����
--select top 10, * from emp order by sql desc
--oracle
--rownum (�λ��÷�) : ������ ����
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--rownum ��� 
--1. ������ ������ �����ϴ� �۾�(����)
--2. ������ �� ��Ȳ���� �տ� ����  > ������ ���� > ������ ����
-- 1�ܰ�
select*
from(           
          select *
          from emp order by sal desc
          ) e;
          
-- 2�ܰ�
select rownum as "num", e.*
from(           
          select *
          from emp order by sal desc
          ) e;
          
-- 3�ܰ�
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
--�Խ��� (����¡ ó��)
--100�� ������
--10�Ǿ� ����� �����ֱ�
--�� 100��
--pagesze = 10 (�� ȭ�鿡 [������] ������ ������ �Ǽ� row ��)
--page ���� > 10
-- 1~ 10  1page  DB���� 1 ~ 10���۱��� select  ������ APP���
--10~20  2page
-- ~
--91~100 10page
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--HR �������� �̵�
select * from employees;
--41~50 ��������� ����ϼ��� (���� ����� ���� ������)
--pagesize = 10
--1~10, 11~20, 21~30
select * from employees order by employee_id asc;
select rownum as "num", e.*
from(           
select * from employees order by employee_id asc
        ) e where rownum <=10
   s where num >0 ;
   
   --------------------------------------------------------------------------------------------------------------------------------------------------------------------------
   
   --SQL �⺻���� END
   --SQL ��ް��� (3�� ������Ʈ ����)]
   --������� (����)
   --PL - SQL
   --(����, ���, Ŀ��, �Լ� ,���ν��� ,Ʈ����, ������,,)
   --------------------------------------------------------------------------------------------------------------------------------------------------------------------------
   --1�� ���� TEST 50����