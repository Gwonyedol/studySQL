select* from dmlemp;


create table trans_A(
  num number,
  name varchar2(20)
);

create table trans_B(
  num number constraint pk_tran_B_num primary key,
  name varchar2(20)
);


select*from trans_A;
select*from trans_B;



create table department(
    deptno number,
    dname varchar2(50)
);


insert into department(deptno, dname) values(1,'부서');
insert into department(deptno, dname) values(2,'권예지');
insert into department(deptno, dname) values(3,'권예돌');


select* from department;



commit;