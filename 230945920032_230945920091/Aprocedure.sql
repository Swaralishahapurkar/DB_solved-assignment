/* 
drop procedure if exists addUser;
delimiter $
create procedure addUser(username varchar(20),password VARCHAR(10),EmailID varchar(30))
Begin 
	
	insert into login values (username,password,EmailID);
end $
delimiter ;

------------------------------------------------------------------------------------------------------------------------------------------

drop procedure if exists cheakUser;
delimiter $
create procedure cheakUser(EID varchar(30))
Begin 
	declare flag bool;
	select true into flag from login where EmailID=EID;
	IF flag then 
	  select name,password from login where EmailID=EID ;
	else 	 
	insert into LOG (curr_date, curr_time, message) values (CURRENT_DATE(),CURRENT_TIME(),"Record not found");
	select ("Record not found");
	end if;
end $
delimiter ;

------------------------------------------------------------------------------------------------------------------------------------------

drop procedure if exists getQualification;
delimiter $
create procedure getQualification(studentID int)
Begin 
	declare flag bool;
	select true into flag from student where ID=studentID;
	IF flag then 
	  select * from student s join student_qualifications q on s.id=q.studentID where s.ID=studentID ;
	else 	 
	select ("student not found");
	end if;
end $
delimiter ;

------------------------------------------------------------------------------------------------------------------------------------------

drop procedure if exists addstudent;
delimiter $
create procedure addstudent(namefirst varchar(20),namelast varchar(20), DOB date, emailID varchar(128), number VARCHAR(20), address varchar(128))
Begin
	declare z int;
	declare y,x int;
	select max(ID)+1 into z from student;
	insert into student values (z,namefirst ,namelast , DOB, emailID);
	
	select max(ID)+1 into y from student_phone;
	insert into student_phone values(y,z,number,1);
	
	select max(ID)+1 into x from student_address;
	insert into student_address values(x,z,address);
end $
delimiter ;

------------------------------------------------------------------------------------------------------------------------------------------


drop procedure if exists addQualification;
delimiter $
create procedure addQualification(sid int, name varchar(128), college varchar(128), university varchar(128), marks varchar(45), year int )
Begin
	declare flag bool;
	declare z int;
	select true into flag from student where id=sid;
	if flag then
	select max(ID)+1 into z from student_qualifications;
	insert into student_qualifications values ( z, sid, name, college, university, marks, year);
	else 
	SELECT 'student not found';
	end if;
end $
delimiter ;

------------------------------------------------------------------------------------------------------------------------------------------
*/