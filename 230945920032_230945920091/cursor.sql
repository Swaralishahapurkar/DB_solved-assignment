/*
drop procedure if exists pro20;
delimiter $
create procedure pro20()
BEGIN 
	declare _deptno int;
	declare _dname,_loc,_pwd,_startedon varchar(40);
	declare C1 cursor for select * from dept;
	DECLARE exit handler for 1329 SELECT "EOF..." as " Message ";
open c1;
lbl:LOOP
	fetch c1 into _deptno,_dname,_loc,_pwd,_startedon;
	select _deptno,_dname,_loc,_pwd,_startedon;
	end loop lbl;
close c1;
end $
delimiter ;
------------------------------------------------------------------------------------------------

drop procedure if exists pro21;
delimiter $
create procedure pro21(x int)
BEGIN 
	declare _deptno, _sal int;
	declare _ename, _job varchar(40);
	declare C1 cursor for select  ename,job,sal,deptno from emp where deptno = x;
	DECLARE exit handler for 1329 SELECT "EOF..." as " Message ";
open c1;
lbl:LOOP
	fetch c1 into _ename, _job, _sal,  _deptno ;
	select _ename, _job, _sal,  _deptno;
	end loop lbl;
close c1;
end $
delimiter ;
------------------------------------------------------------------------------------------------


drop procedure if exists pro21;
delimiter $
create procedure pro21(x int)
b1: BEGIN 
	declare flag bool;
	select distinct true into flag from emp where deptno=x;
	if flag THEN
	B2: Begin 
	declare _deptno, _sal int;
	declare _ename, _job varchar(40);
	declare C1 cursor for select  ename,job,sal,deptno from emp where deptno = x;
	DECLARE exit handler for 1329 SELECT "EOF..." as " Message ";	
	open c1;
lbl:LOOP
	fetch c1 into _ename, _job, _sal,  _deptno ;
	select _ename, _job, _sal,  _deptno;
	end loop lbl;
close c1;
	end B2;
	
	ELSE
	SELECT " INVALID DEPARTMENT NUMBER " ;
	END IF ;
end B1 $
delimiter ;

------------------------------------------------------------------------------------------------


drop procedure if exists pro21;
delimiter $
create procedure pro21(x int)
b1: BEGIN 
	declare flag bool;
	select distinct true into flag from emp where deptno=x;
	if flag THEN
	B2: Begin 
	declare _deptno, _sal int;
	declare _ename, _job , _dname,_loc varchar(40);
	declare C1 cursor for select  ename, job, sal, emp.deptno, dept.dname, dept.loc from emp,dept where emp.deptno = dept.deptno and emp.deptno= x;
	DECLARE exit handler for 1329 SELECT "EOF..." as " Message ";	
	open c1;
lbl:LOOP
	fetch c1 into _ename, _job, _sal,  _deptno, _dname, _loc ;
	select _ename, _job, _sal,  _deptno, _dname, _loc;
	end loop lbl;
close c1;
	end B2;
	
	ELSE
	SELECT " INVALID DEPARTMENT NUMBER " ;
	END IF ;
end B1 $
delimiter ;

------------------------------------------------------------------------------------------------
*/

drop procedure if exists pro21;
delimiter $
create procedure pro21()
b1: BEGIN 
	declare _deptno1 int;
	declare _dname,_loc, _pwd,_startedon varchar(40);
	declare c1 cursor for  select deptno, dname, loc, pwd, startedon from dept;
	DECLARE exit handler for 1329 SELECT "EOF..." as " Message ";	
	open c1;
		lbl1:LOOP
		fetch c1 into _deptno1, _dname, _loc, _pwd, _startedon ;
		select _deptno1, _dname, _loc, _pwd, _startedon ;
		b2:BEGIN
		declare _empno, _deptno2,  _sal,_mgr, _comm int;
		declare _ename, _job varchar(40);
		declare _hiredate date;
		declare c2 cursor for select  empno, ename, job, mgr, hiredate, sal, comm, deptno from emp where deptno= _deptno1;
		DECLARE exit handler for 1329 SELECT "EOF..." as " Message ";	
		open c2;
			lbl2:LOOP
			fetch c2 into _empno, _ename, _job, _mgr, _hiredate, _sal, _comm, _deptno2 ;
			select _empno, _ename, _job, _mgr, _hiredate, _sal, _comm, _deptno2 ;
			end loop lbl2;
		close c2;
		end B2;
		end loop lbl1;
	close c1;
end B1 $
delimiter ;

