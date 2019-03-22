-----------------------------------------
--DML(����Ŭ.pdf / 168page)
/*
INSERT INTO table_name [(column1[, column2, . . . . . ])]
VALUES (value1[, value2, . . . . . . ]);
*/

create table temp(
id number primary key, -- idĮ������ null(x), �ߺ�������(x), ������ ������ 1�� ����, where id =10
name varchar2(20)
);

--1.���� �Ϲ����� insert
insert into temp(id,name)
values(100,'ȫ�浿');

select*
from temp;

commit;

--2.�÷���� ����(...) �÷�����Ʈ ����
insert into temp values(200,'������');
commit;

select*
from temp;

--Quiz 1(id Į���� pk ���� ����)
insert into temp(id,name)
values(100,'�ƹ���');--�ߺ��� �� ������.


insert into temp(name)
values('�ƹ���');

-------------------------------------------
--�Ϲ� SQL �� ���α׷����� ���(X)
--PL-SQL(����,���)
--PL-SQL

create table temp2(
id varchar2(20)
);

--pl-sql ���
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
 regdate date default sysdate -- �⺻�� �����ϱ�
 );
 
select sysdate
from dual;
alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';
 
insert into temp3(memberid, name, regdate)
values(100,'ȫ�浿','2019-03-21');

select*from temp3;
commit;

insert into temp3(memberid,name)
values(200,'�ƹ���'); --default

select *from temp3;
commit;

insert into temp3(memberid)
values(300);
commit;
select* from temp3;
commit;

insert into temp3(name)
values('�ƹ���');

--------------------------------------------
--insert(TIP)
--1.�뷮 ������ insert �ϱ�
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

--�䱸���� : temp4 �� �ִ� ��� �����͸� temp5�� �ְ�;��
--insert into ���̺��(�÷�����Ʈ) values(������Ʈ)
--insert into ���̺��(�÷�����Ʈ) select ����.. (��, �÷��� ������ Ÿ���� ����)

insert into temp5(num)
select id from temp4; --�뷮 ������ �����ϱ� values ���� ��ſ� select��

commit;
--2.insert
--���̺��� ���� ��Ȳ����(���̺��� ����)+(�뷮 ������ ����)
--�� ������ ����(���������� ���簡 �ȵſ�! PK, FK)
--������ ��������(�÷��̸� , Ÿ��) ����

--create table ���̺��(�÷���Ÿ������)

create table copyemp
as select * 
from emp;

select*from copyemp;

create table copyemp2
as select empno,ename,sal
from emp
where deptno =30;

--Q)  ����(Ʋ)�� �����ϰ� �����ʹ� �����ϰ���� �ʾƿ�
create table copyemp3
as select *
from emp
where 1=2; --�������ǵ鸸 ���� -> �����Ͱ� ���簡 �ȵ�

select * from copyemp3;

--tip)
--����Ŭ �ý��� ���̺�(�پ��� ����)
--���� ����(PK, FK ...)
select *
from user_constraints;

select*
from user_constraints where table_name = 'EMP';

create table pktest (
id number primary key); -- not null�ϰ� unique

insert into pktest(id) values(100);
commit;

select*
from user_constraints
where table_name = 'PKTEST';


--���������� ������� �ʾƿ� ����
create table pktest2
as select*
from pktest;

select*
from pktest2;
--PK���������� ���� ���� �ʾҴ�(����)
select*
from user_constraints
where table_name = 'PKTEST2';

---------------------insert end------------------
--update
/*
update table_name
set column1 = value1, column2 = value2...
where ����

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

--update(set������ subquery���)
update copyemp
set sal = (select sum(sal) from emp);

select*from copyemp;
rollback;

--������ �÷�  update
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

--��Ģ: delete -> commit -> ������ �ȵ�! -> ��������Ͱ� �ִٸ�..? ��������!

select*from copyemp;

delete from copyemp where deptno in (10,20);

select*from copyemp;
rollback;


--------------------delete END----------------------

--����
/*
APP(JAVA) -> JDBC API -> DB�۾�(Oracle)
CRUD
create : insert�۾�..
read : select* from... (��ü, ����)
update : update
delete : delete

(DML : create, update, delete) Ʈ����� : commit, rollback ����)
JDBC -> Oracle
--��ü��ȸ(�Լ�), ������ȸ(�Լ�), ����(�Լ�), ����(�Լ�), ����(�Լ�) =>> ������
--public List(Emp > getEmpAllList(select*from emp...))
--public Emp getEmpListByEmpno(int empno)(select*from where empno=7788)
--public int insertEmp(Emp emp){insert into emp...values...}
*/

---------------------------------------------------
---DDL
--create, alter, drop (���̺� ����)

select*from user_tables where lower(table_name)='board';
drop table board;

create table board(
boardid number,
title varchar2(50),
conctent varchar2(4000),
regdate date
);

----------------------------------
--������ ���ϰ� ��� ���ؼ���...

select*from user_tables where lower(table_name)='board';
select*from user_constraints where lower(table_name) = 'board';

----------------------------------
--Oracle 11g �����÷�(�����÷�)
--�л����� ���̺� : ����,����,����.�����÷�!
--����, ����, ���� �����͸� insert�ϸ� �ڵ����� ������ ����������!

create table vtable(
no1 number,
no2 number,
no3 number GENERATED ALWAYS as (no1 + no2) VIRTUAL
);

insert into vtable(no1,no2) values(100,50);
select*from vtable;

insert into vtable(no1,no2,no3) values(100,50,120);

--�÷��� ���� ����(default value �� Ȯ���ϱ�)
select column_name, data_type, data_default
from user_tab_columns where table_name = 'VTABLE';

--�ǹ����� Ȱ���ϴ� �ڵ�
--��ǰ����(�԰��� ����) �б⺰ ������ (4�б�)
--�԰��� : 2019-03-01 >> 1�б�
create table vtable2(
no number, --���� ������
p_code char(4), --��ǰ �ڵ�(A001,B002...)
p_date char(8), --�԰���(20190303)
p_qty number, --����
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
--DDL ���̺� �ٷ��(����Ŭ.pdf 138page)
--1.���̺� �����ϱ�
create table temp6(id number);
--2.���̺� �����ߴµ� �÷� �߰��ϱ�
--�������̺� �÷� �߰��ϱ�
desc temp6;

alter table temp6
add ename varchar2(20);

--3.�������̺� �ִ� �÷��� �̸��� �߸�ǥ����.(ename ->username)
--���� ���̺� �ִ� ���� �÷��� �̸� �ٲٱ�(rename)
alter table temp6
rename column ename to username;

desc temp6;

--4.�������̺� �ִ� ���� �÷��� Ÿ������ �����ϱ�
--modify
alter table temp6
modify(username char(200));

desc temp6;

--5.���� ���̺� �ִ� �÷� ����
alter table temp6
drop column username;

desc temp6;


--6.���̺� ����
--6.1 �����͸� ���� : delete
--���̺� ó�� ����� ó�� ũ��>>�����͸� ������ >> ������ ũ�� ����
--ex) ó�� 1M >> 10���� >> 100M >> delete 10���� ���� >> ������ ���̺��� ũ��� 100M��

--���̺� ������ ����
--(������ ũ�⸦ ���ϼ� ������)
--truncate(where���� ������)
--ex) ó�� 1M >> 10���� >> 100M >> delete 10���� ���� >> ũ��� 1M���� ���ƿ�

--7. ���̺� ����(drop)
drop table temp6;


---------------------------------
--���̺� ���� �����ϱ�
--����Ŭ pdf(144)
-- ������ ���Ἲ Ȯ��
--���� (constraint) : insert, update �ַ� ����
/*
PRIMARY KEY(PK) �����ϰ� ���̺��� ������ �ĺ�(NOT NULL �� UNIQUE ������ ����) ���������� index�� �ڵ�����
FOREIGN KEY(FK) ���� ������ �� ������ �ܷ�Ű ���踦 �����ϰ� �����մϴ�.(��������) ���̺�� ���̺��� ���� ����
UNIQUE key(UK) ���̺��� ��� ���� �����ϰ� �ϴ� ���� ���� ��(NULL �� ���)
unique�� null�� ������ ���� -> null�� �������� �Ϸ��� not null
NOT NULL(NN) ���� NULL ���� ������ �� �����ϴ�.
CHECK(CK) ���̾�� �ϴ� ������ ������(��κ� ���� ��Ģ�� ����)
�������� ���� ���� �Է¹ްڴ�(gender: ��,�� �����͸� �÷���..)
ex) where gender in('��','��')

- NOT NULL : NULL�� �Է� ����
- UNIQUE : �ߺ��� �Է� ���� (NULL���� �ߺ��Է� ����)
- PRIMARY KEY : NOT NULL + UNIQUE
- FOREIGN KEY : �ٸ� ���̺��� �÷��� ��ȸ�ؼ� ���Ἲ �˻�
- CHECK : �������� ������ ���� �Է� ���

������ ����� ����
1. ���̺� ����鼭 �ٷ� ���� (create tabel..)
2.���̺� ���� ����(alter table.. add constraint..) >>�ڵ�������(exerd)
*/


--1.
select* from user_constraints where table_name ='EMP'; --�������� ���¹�
--����Ŭ�� notnull�� �������� ����
--empno�� not null
-------------------------------------------------------------
create table temp7
(
id number primary key --�������� �ʾƿ� (����ǥ��) SYS_C007019�����̸� (���߿� ���� ����,����)
);

drop table temp7;

create table temp7
(
id number constraint pk_temp7_id primary key, --�������� ǥ�� :PK_���̺��_�÷���
name varchar2(20) not null,
addr varchar2(50)
);


select*from user_constraints where table_name ='TEMP7';


--insert into temp7 (name, addr) values('ȫ�浿','����� ������'); --����
insert into temp7 (id,name, addr) values(1,'ȫ�浿','����� ������');
insert into temp7 (id,name, addr) values(2,'ȫ�浿','����� ������');
insert into temp7 (id,name, addr) values(3,'������','��⵵ ����');
commit;

select*
from temp7;

--1. primary key�� ���̺� ����� �� �� �������? 1��
--�������� �÷��� ��� 1���� ����(enmae,age)=>����Ű..

create table temp8(
id number constraint pk_temp8_id primary key,
name varchar2(20) not null,
jumin char(6) constraint uk_temp8_jumin unique, --�ߺ� ��
addr varchar2(20)
);


select*from user_constraints where table_name='TEMP8';

insert into temp8(id,name,jumin,addr) 
values(10,'ȫ�浿','123456','��⵵');

insert into temp8(id,name,jumin,addr) 
values(20,'������','123456','��⵵'); --unique constraint(%s%s) violated

--null�� ����ұ�
insert into temp8(id,name,addr) 
values(30,'������','��⵵'); -- null data ���! �ٵ� ���ϸ� �ߺ�üũ�� �ɱ�?

insert into temp8(id,name,addr) 
values(40,'�����','��⵵ ����'); --null������ ����� �ǰ��ִ�..;;
--not null�� uniqie �ΰ��� ������ ���� ���..

select* from temp8;

------------------------------------------------------------
--���̺� ���� �Ŀ� ���� �ɱ�!

create table temp9 (id number);

--���� ���̺� ���� �߰��ϱ�
--����)������ �����Ͱ� ������ �����Ѵٸ� ������ �߰����� �ʾƿ� >> �ߺ��� �����͸� ���� >> ����ɱ�
--������ �ɱ����� ������ �˻�(�ߺ�..)�۾��� �����ؾ���

alter table temp9
add constraint pk_temp9_id primary key(id);
--add constraint pk_temp9_id primary key(id,name)
--2�� �÷��� ���� ���ļ�   
select*from user_constraints where table_name='TEMP9';

alter table temp9
add ename varchar2(20);

desc temp9;

--not null ���� �߰��ϱ�
alter table temp9
modify (ename not null);

desc temp9;


----------------------------------------------------------------------------------
--[Check]  ����
--where ���ǰ� ������ ������ ���� >> where gender in ("��","��")
create table temp10 (
 id number constraint pk_temp10_id primary key,
 name varchar2(20) not null,
 jumin char(6) constraint uk_temp10_jumin unique,
 addr varchar2(20),
 age number constraint ck_temp10_age check(age >=19) --where age >= 19
 );

 select * from user_constraints where table_name = 'TEMPO';

 insert into temp10(id, name, jumin, addr, age)
 values(100,'ȫ�浿','123456','�����',25);

select*from temp10;

insert into temp10(id, name, jumin, addr, age)
 values(200,'������','123456','�λ��',18);
 
 commit;
 
 ---------------------------------------------------------
 --�������� : ���̺�� ���̺���� ���� >>
 --EMP(detpno)�÷��� EDPT(deptno)�÷��� �����Ѵ�
 
 
 create table c_emp
 as
  select empno,ename,deptno from emp where 1=2;


create table c_dept
as
  select deptno, dname from dept where 1=2;
  

  
select*from c_emp;
select*from c_dept;

--1.��������(c_emp ���̺� �ִ� deptno�÷��� ....deptno �÷� insert �Ǵ� �����ʹ� c_dept���̺�
--deptno������ �������߿� �ϳ��� insert �ǵ��� update ����

alter table c_emp
add constraint fk_emp_deptno foreign key(deptno) REFERENCES c_dept(deptno);
--�� �ڵ� ����� error �߻�
--c_dept >> deptno ���� �����͸� ���᾵�ž�..(�� �ſ��־ ������ �ּ���...)
--deptno ������ �����ʹ� �ߺ������� ���� null�� ����!! Primary Key

--c_dept>>deptno>>primary key ����

--1)
alter table c_dept
add constraint pk_dept_deptno primary key(deptno);

--2)
alter table c_emp
add constraint fk_emp_deptno foreign key(deptno) references c_dept(deptno);

insert into c_dept(deptno, dname) values(100,'�λ���');
insert into c_dept(deptno, dname) values(200,'������');
insert into c_dept(deptno, dname) values(300,'ȸ����');
commit;

select* from c_dept;

--���Ի�� �Ի�
insert into c_emp(empno,ename)
values(100,'ȫ�浿'); --FK�� not null���� �ʾƿ�(null���)
--���Ի���� �μ��� ���� ���� �� �ִ�

--��Ģ : ���Ի���� ������ �μ��� ������ �Ѵ�(deptno not null constaint,,FK)
-------------------------

insert into c_emp(empno, ename, deptno)
values(200,'�ƹ���',500);

-----------------------
--���̺� (�θ�,�ڽ� ���̺�)
--���̺� (master, detail)

--�ΰ��� ���̺�..deptno���迡�� �θ�� c_dept(PK)�̰� master�̱⵵ �ϴ�
--�ڽ� c_emp(FK), detail
--c_emp ���̺�
--c_dept ���̺�

--������
select*from c_emp;
select*from c_dept;
--�̶� c_dept ���̺��� 300������ ���� ���� ������ �������� �����ʹ� ���� ����
delete from c_dept where deptno = 300;
delete from c_dept where deptno = 300;

commit;


--�л� ���� ���̺�
--�й��� �����ʹ� �ߺ��ǰų� NULL ���� ����ϸ� �ȵȴ�
--�̸� NULL ���� ������� �ʴ´�
--����
--����
--���� ���� �÷��� ���� Ÿ���̰� NULL ���� ���
--�� ���� �Է����� ������  default�� 0���� ���´�
--���� ,��� �÷��� �����÷�����(�����÷�) �����Ѵ�
--�а��ڵ�� �а� ���̺� �а��ڵ带 �����Ѵ�
--�й� , �̸� , ���� , ���� , ���� , ���� , ��� , �а��ڵ�
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
--�а� ���̺�
--�а��ڵ� �����ʹ� �ߺ��ǰų� NULL ���� ����ϸ� �ȵȴ�,
--�а��� �� null���� ������� �ʴ´�
--�а��ڵ� , �а���
create table major (
 majorname varchar(20) not null,
 majornum number constraint pk_table_majornum PRIMARY key
);

alter table grade
add constraint fk_grade_deptno foreign key(majornum) REFERENCES major(majornum);

insert INTO major(majorname,majornum) VALUES ('�����а�',1);
insert INTO major(majorname,majornum) VALUES ('�濵�а�',2);
insert INTO major(majorname,majornum) VALUES ('��ǻ�Ͱ��а�',3);
insert INTO major(majorname,majornum) VALUES ('�Ź�����а�',4);

insert INTO grade(name,num,korean,english,math,majornum)
VALUES ('�ǿ���',0916,95,90,60,2);
insert INTO grade(name,num,korean,english,math,majornum)
VALUES ('�����',0312,60,100,50,4);

--�׸��� select �����
--�й� , �̸�  ����, ��� , �а��ڵ� , �а��� �� ����ϼ���
select g.name, g.num, g.korean, g.english, g.math, g.gradesum, g.gradeavg, m.majorname, g.majornum
from grade g
join major m
on g.majornum = m.majornum;
