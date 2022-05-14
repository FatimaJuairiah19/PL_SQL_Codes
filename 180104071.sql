/*employee table*/

drop table Employee;
drop table Project;
drop table Department;
drop table WorksOn;

create table Employee(
eid integer, 
ename varchar2(50), 
age integer, 
gender varchar2(50), 
salary integer, 
dID integer
);

insert into Employee values(01,'Maisha',30,'Female',70000,101);   
insert into Employee values(02,'Maira',35,'Female',50000,107);  
insert into Employee values(03,'Shuvo',25,'male',80000,105);     
insert into Employee values(04,'Tuhin',35,'male',90000,103);     
insert into Employee values(05,'Sakib',34,'male',60000,105);
insert into Employee values(06,'Omi',26,'male',80000,101);

/*
  --101 -> devOps --
  -- 107 -> QA
 --105 -> Human resource
 -- 103 -> Data Engineer
*/

select * from Employee;

/*Project table*/


create table Project(
pid integer, 
title varchar2(50), 
estimatedDuration integer
);

insert into Project values(10,'Android',3);
insert into Project values(11,'E-commerce',6);
insert into Project values(12,'Web Application',4);
insert into Project values(13,'Real Estate',2);
insert into Project values(15,'Tourist App',2);

select * from Project;

/*Department table*/


create table Department
(
dID integer, 
dname varchar2(50), 
supervisorID integer
);

insert into Department values(101,'devOps',01);
insert into Department values(101,'devOps',06);
insert into Department values(105,'Human Resources',03);
insert into Department values(103,'Data Engineer',02);
insert into Department values(107,'QA',04);
insert into Department values(105,'Human Resources',05);


select * from Department;



/*WorksOn table*/



create table WorksOn
(
pid integer,
eid integer
);

insert into WorksOn values(10,01);
insert into WorksOn values(11,05);
insert into WorksOn values(12,06);
insert into WorksOn values(13,05);
insert into WorksOn values(10,03);
insert into WorksOn values(11,02);
insert into WorksOn values(15,04);

select * from WorksOn;
--1--

select eName from Employee where 
age=(SELECT min (age) from Employee where dID=(select DISTINCT(dID) from Department where Department.dName = 'Human Resources'));

--2--

select avg(salary) from Employee inner join Department on Employee.eid=Department.supervisorID group by dname;



--3--
SELECT Employee.ename
FROM Employee
INNER JOIN WorksOn ON Employee.eid=WorksOn.eid inner join Project on WorksOn.pid= Project.pid 
where estimatedDuration=(select min(estimatedDuration) from Project);

commit;

