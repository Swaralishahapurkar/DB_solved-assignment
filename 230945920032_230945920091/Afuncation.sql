8i/*

Function

1.	Pass DEPTNO to the function (named sumSalary) and calculate the sum of salary.(Use: EMP table)

DROP function if exists sumSalary ;
delimiter $
create function sumSalary(_deptno int) returns int
deterministic 
BEGIN
	declare z int;
	set z := (select sum(sal) from emp where deptno=_deptno);
	return z;
end $
delimiter ;
------------------------------------------------------------------------------------------------------------------------------

2.	Create a new table called STUDENT_NEW having following columns (studentID, namefirst, namelast, DOB, and emailID).
 Write a function names autoNumber to return auto generate studentID and return the new value (Use: STUDENT_NEW table).



drop function if exists autoNumber;
delimiter $
create function autoNumber() returns INT
deterministic
BEGIN
    declare X int;
	set X :=(select max(studentID)+1 from STUDENT_NEW );
	return X;
end $
delimiter ;	

------------------------------------------------------------------------------------------------------------------------------
3.	Write a function which will accept email-ID from the user, if the email-ID is present return his username and password or else `Return “Employee not exists”. 
(Use: LOGIN table)


drop function if exists cheak;
delimiter $
create function cheak(_email varchar(100)) returns varchar(400)
deterministic
BEGIN
	declare flag bool;
	select true into flag from login where EmailID=_email;
	IF flag then 
	 RETURN(select concat("Username:",(select name from login where emailID=_email)," Password:",(select password from login where emailID=_email)));
	else 
	return ("Record not found");
	end if;
end $
delimiter ;	

------------------------------------------------------------------------------------------------------------------------------
4.	Write a function which will accept studentID from the user and calculate the sum of (10th, 12th, and BE) marks.

drop function if exists summ ;
delimiter $
create function summ(_studentID int) returns int
deterministic 
BEGIN 
	
	declare z int;
	set z := (select sum(marks) from student_qualifications where studentid=_studentID);
	
	return z;

end $
delimiter ;	

------------------------------------------------------------------------------------------------------------------------------
5.	Write a function that returns random OTP number of 6 digits.
*/ 

drop function if exists OTP;
delimiter $
create function OTP() returns int 
deterministic
BEGIN
	
	declare z int;
	set z := (select floor(rand()*1000000));
	return z;
	
END $
delimiter ;
	