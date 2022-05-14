
DROP TABLE DataTable CASCADE CONSTRAINTS;

CREATE TABLE DataTable(	
	JobId varchar2(30),
	EmployeeId int,	
	hire_date int,
	salary int
);

insert into DataTable(JobId,EmployeeId,hire_date,salary) values ('SA_MAN',145,1,14000);
insert into DataTable(JobId,EmployeeId,hire_date,salary) values ('SA_MAN',146,2,13500);
insert into DataTable(JobId,EmployeeId,hire_date,salary) values ('SA_MAN',147,3,12000);
insert into DataTable(JobId,EmployeeId,hire_date,salary) values ('SA_MAN',148,4,11000);
insert into DataTable(JobId,EmployeeId,hire_date,salary) values ('SA_REP',149,5,10000);
insert into DataTable(JobId,EmployeeId,hire_date,salary) values ('SA_REP',150,6,9500);
insert into DataTable(JobId,EmployeeId,hire_date,salary) values ('SA_REP',151,7,9000);
insert into DataTable(JobId,EmployeeId,hire_date,salary) values ('SA_REP',152,8,8500);

commit;



SELECT JobId,
REGR_SLOPE(hire_date, salary) slope,
REGR_INTERCEPT(hire_date, salary) intercept
   FROM DataTable
   --WHERE department_id in (50,80)
   GROUP BY JobId
   ORDER BY JobId;  