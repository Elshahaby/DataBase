use Company_SD
/*1*/
select d.Dependent_name , d.sex
from Dependent D , Employee E
where E.SSN = D.ESSN and D.Sex = 'F' and E.Sex = 'F'

union

select d.Dependent_name , d.sex
from Dependent D , Employee E
where E.SSN = D.ESSN and D.Sex = 'M' and E.Sex = 'M'

/*2*/
select sum(Hours) as [hours per week],Pname
from Project P , Works_for W
where p.Pnumber = w.Pno
group by pname

/*3*/

select D.*
from Departments D
WHERE D.Dnum  
in(
  SELECT dno 
  FROM employee E
  where E.dno is not null
  GROUP BY E.dno
  HAVING COUNT(E.ssn) in 
  (
    SELECT MIN(xxxxxxx)
    FROM (
      SELECT COUNT(EE.ssn) AS xxxxxxx
      FROM employee EE
	  where EE.dno is not null
      GROUP BY EE.dno
		 ) AS department_counts
  )
) 


/*4*/
select Dname , min(salary) as mn_salary,max(salary) as mx_salary,AVG(salary) avg_salary
from(
select *
from Employee , Departments
where dno=dnum
) as my_table
group by Dname

/*5*/
select  Fname,Lname
from Employee , Departments 
	where ssn=MGRSSN and MGRSSN not in (select Essn from Dependent)

/*6*/
select E.Dno, D.Dname ,count(E.SSN) as Employee_count
from Employee E , Departments D
where Dno=Dnum
group by E.Dno,D.Dname
having avg(E.salary) < (select avg(EE.salary) from Employee EE)

/*7*/
select fname,lname, w.Pno , D.Dnum
from Employee E, Works_for W ,Departments D
where E.SSN=W.ESSn and E.dno=D.Dnum
order by  Dnum,lname,fname 

/*8*/
select salary 
from Employee
where salary in
(
	Select distinct top 2 salary 
	from Employee
	order by Salary Desc
	
)

/*9*/
select concat(fname,' ',lname) as [Full Name]
from Employee E, Dependent D
where SSN=ESSN and concat(Fname,' ',lname) in 
(
	select Dependent_name
	from Dependent
)

/*10*/
update Employee 
	set Salary += Salary*0.3
where ssn in 
(
	select ssn
	from Employee E,Works_for W,Project P
	where E.SSN=W.ESSn and W.Pno=p.Pnumber and p.Pname='Al Rabwah'
)


/*11*/
