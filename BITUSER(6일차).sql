create table dmlemp
as
  select*from emp;
select*from dmlemp;

alter table dmlemp
add constraint pk_dmlemp_empno primary key(empno);

select*from SYS.USER_CONSTRAINTS where TABLE_NAME = 'DMLEMP';


-----------------------

create table sdept
as 
  select *from dept;
  
  --����
  update sdept
  set loc='seoul';

select*from sdept;

  --����
  update sdept
  set loc='busan';