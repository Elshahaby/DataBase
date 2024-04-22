## [Task link lab6](https://docs.google.com/document/d/1inqB0MJaxEB1sl4NepLqiSTzmeOlZjyT/edit)

<br>

---

<br>

```sql


-- create data type loc (char(2)  values in('KW','NY','DS')   default 'NY')
create default def1 as 'NY'
create rule r1 as @x in('KW','NY','DS')

sp_addtype loc, 'nchar(2)'

sp_bindrule r1,loc
sp_bindefault def1,loc

-- table Department
create table Department(

DeptNo nchar(2) primary key,
DeptName nvarchar(25),
Location loc

)


-- insert data at table
insert into Department
values('d1' , 'Research' , 'NY')
insert into Department
values('d2' , 'Accounting' , 'DS')
insert into Department
values('d3' , 'Markiting' , 'KW')



-- create table Employee
create table Employee(

EmpNo int ,
EmpFname nvarchar(15) not null,
EmpLname nvarchar(15) not null,
DeptNo nchar(2),
Salary money

constraint c1 primary key(EmpNo),
constraint c2 foreign key(DeptNo) references Department(DeptNo)
		on delete set Null on update cascade ,
constraint c3 unique(Salary),

)

-- create rule for salary column
create rule r2 as @x<6000
sp_bindrule r2, 'Employee.Salary'

-- insert data in Employee table
insert into Employee
values(25348 , 'Mathew' ,'Smith' , 'd3' , 2500)
insert into Employee
values(10102 , 'Ann' ,'Jones' , 'd3' , 3000)
insert into Employee
values(18316 , 'John' ,'Barrimore' , 'd1' , 2400)
insert into hr.Employee
values(29346 , 'James' ,'James' , 'd2' , 2800)


create table Project(

ProjectNo nchar(2) primary key,
ProjectName nvarchar(30) not null ,
Budget money

)

-- insert data in Project table
insert into Project
values('p1','Apollo',120000)
insert into Project
values('p2','Gemini',95000)
insert into Project
values('p3','Mercury',185600)


create table Works_on(

EmpNo int not null,
ProjectNo nchar(2) not null,
Job nvarchar(15) ,
Enter_Date date not null default getdate() ,

constraint c4 primary key(EmpNo,ProjectNo)

)


insert into Works_on
values(10102,'p1','Analyst', '2006.10.1')
insert into Works_on
values(10102 ,'p2' ,'','')
insert into Works_on
values(25348 ,'p3' , '' , '')
insert into Works_on
values(18316 ,'p2' ,'', '2007.6.1')

-----------------------------------------------------------

insert into works_on
values(11111,'','','')
--- can't be added

update works_on
set EmpNo=11111
where EmpNo=10102

--- can't be updated because this column is not matches in the parent table


update employee
set EmpNo=22222
where EmpNo=10102
--- can't be updated because on update not cascade , has a child


delete employee
where EmpNo=10102
--- can't be deleted because on delete not cascade , has a child


----------------------------------------------------------------------------

alter table employee add TelephoneNumber varchar(18)
alter table employee drop column TelephoneNumber

----------------------------------------------------------------------------
-- (2) --
create schema Company
alter schema company transfer Department
alter schema company transfer project

create schema hr
alter schema hr transfer Employee

------------------------------------------------------------------------------

-- (3) Write query to display the constraints for the Employee table.

----------------------------------------------------------------------------

---Create Synonym for table Employee as Emp and then run the following queries and describe the results
create Synonym Emp
for hr.Employee

---Select * from Employee
select *
from employee
-- will not executed

---Select * from [Human Resource].Employee
select *
from hr.employee

---Select * from Emp
select *
from emp

---Select * from [Human Resource].Emp
select *
from hr.emp
-- will not executed

----------------------------------------------------------------------------

--(5) Increase the budget of the project where the manager number is 10102 by 10%.

update Company.project
	set Budget=1.1*Budget
from Company.project p , Works_on w
where p.ProjectNo=w.ProjectNo and Job='Manager'and EmpNo=10102

-----------------------------------------------------------------------------

-- (6) Change the name of the department for which the employee named James works.
--      The new department name is Sales.

create synonym CD
for company.department

update CD
	set DeptName = 'Sales'
from CD X , hr.Employee E
where X.DeptNo = E.DeptNo and E.EmpFname = 'James'


-------------------------------------------------------------------------------------
-- (7) Change the enter date for the projects for those employees who work in project p1 and belong to department ‘Sales’.
--     The new date is 12.12.2007.

update Works_on
	set Enter_Date = '12.12.2007'
from Works_on W , Company.Department D, hr.Employee E
where W.EmpNo = E.EmpNo and D.DeptNo = E.DeptNo and ProjectNo = 'p1' and D.Deptname = 'Sales'

-------------------------------------------------------------------------------------

-- (8) Delete the information in the works_on table for all employees who work for the department located in KW.
--


delete
from Company.Department D, hr.Employee E , Works_on W
where W.EmpNo = E.EmpNo and D.DeptNo = E.DeptNo and D.Location = 'KW'

```
