use Company_SD

select * from Employee

select Fname , Lname , Salary , Dno
from Employee

select Pname,Plocation,Dnum
from Project

select Fname+' '+Lname as FullName ,
       salary*0.1 as [ANNUAL COMM] 
from Employee

select Fname,SSN
from Employee
where salary>=1000

select Fname,SSN
from Employee
where salary*12>=10000

select Fname+' '+Lname as FullName ,
       salary 
from Employee
where sex='F'

select Dnum,Dname
from Departments
where MGRSSN=968574

select Pnumber,Pname,Plocation
from Project
where Dnum=10