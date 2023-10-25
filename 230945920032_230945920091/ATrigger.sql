/*
1.
DROP TRIGGER IF EXISTS insertStudent;
delimiter $
create trigger insertStudent AFTER insert on LOg for each row 

BEGIN
	insert into d1 values(new.deptno, new.dname, new.loc, CURRENT_DATE(), user());
end $
delimiter ;	

2.
DROP TRIGGER IF EXISTS insertduplicate;
delimiter $
create trigger insertduplicate AFTER insert on student for each row 

BEGIN
	insert into student_log values(new.id, new.namefirst, new.namelast, new.DOb, new.emailID);
end $
delimiter ;


3.
DROP TRIGGER IF EXISTS updateinfo;
delimiter $
create trigger updateinfo AFTER update on student for each row 

BEGIN
	insert into student_log values(new.namefirst);
end $
delimiter ;


4.
drop trigger if exists deleteinfo;
delimiter $
create trigger deleteinto after delete on student for each ROW

BEGIN
	
	insert into student_log values (old.id, old.namefirst, old.namelast, old.DOB, old.emailID);
	
end $
delimiter ;	


5.

DROP TRIGGER IF EXISTS tr1;
delimiter $
create trigger tr1 before INSERT on student for each row 
BEGIN
	if dayname(now())= 'saturday' 
	THEN
	signal sqlstate '42000' set message_text = 'invalid TRANSACTION , because today is saturday';
	else 
	insert into student_log values (new.id, new.namefirst, new.namelast, new.DOB, new.emailID);
	end if;
end $
delimiter ; 



DROP TRIGGER IF EXISTS checkAge;
delimiter $
create trigger checkAge before INSERT on r for each row 
BEGIN
	if(new.age<18) THEN 
	signal sqlstate '42000' set message_text = 'Person not eligible for voting';
	end if;
end $
delimiter ; 

*/

