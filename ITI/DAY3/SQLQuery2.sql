use Company_SD

select dnum , dname , fname
from departments D, employee E
where mgrssn=ssn

select Dname, Pname
from Departments D, Project P
where D.Dnum=P.Dnum

select concat(fname,' ',lname) as [Name of Employee] , DE.*
from Employee E , Dependent DE
where E.SSN = Essn

select Pnumber,Pname,Plocation
from Project
where City in('cairo','alex')

select *
from Project
where pname like 'a%'

select E.*
from Employee E
where E.Dno=30 and Salary between 1000 and 2000

select concat(fname,' ',lname) as fullname 
from Employee E, Works_for W, Project P
where Dno=10 and 
	  E.SSN=W.ESSn and
	  W.Pno=p.Pnumber and 
	  Hours>=10 and Pname='AL Rabwah'


select concat(X.fname,' ' ,X.lname) as fullName
from Employee X , Employee Y
where X.Superssn = Y.SSN and
	  Y.Fname = 'Kamel' and Y.Lname = 'Mohamed'

select concat(fname,' ',lname) as fullname , Pname
from Employee E, Works_for W, Project P
where E.SSN=W.ESSn and
	  W.Pno=p.Pnumber
order by pname

select Pnumber, Dname,fname, lname , E.Address , E.Bdate
from Employee E, project P, Departments D
where E.SSN=D.MGRSSN and D.Dnum=P.Dnum 
	and City='Cairo'

select E.*
from Employee E, Departments D
where ssn=mgrssn
	 
select E.* , DE.*
from Employee E left outer join Dependent DE
on ssn=essn


/*DML*/

insert into Employee
values('Mohamed','Elshahaby',102672,03-03-2004,'30elemamElshafeyStreet,MitGamr','M',3000,112233,30)

insert into Employee
values('Ahmed','Elkwawy',102660,16-4-2003,'22PorsaedStreet,MitGamr','M',NUll,Null,30)

update Employee
	set salary += 0.2*salary
where lname='Elshahaby'
