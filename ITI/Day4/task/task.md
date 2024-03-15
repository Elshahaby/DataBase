# [link To Task Lab4](https://docs.google.com/document/d/17rF6dSZzezsupAitzA3w52_d0X6L1Mws/edit)

<br>

---

<br>

DQL

    1. Display (Using Union Function)
      a. The name and the gender of the dependence that's gender is Female and depending on Female Employee.
      b. And the male dependence that depends on Male Employee.
    2. For each project, list the project name and the total hours per week (for all employees) spent on that project.
    3. Display the data of the department which has the smallest employee ID over all employees' ID.
    4. For each department, retrieve the department name and the maximum, minimum and average salary of its employees.
    5. List the last name of all managers who have no dependents.
    6. For each department-- if its average salary is less than the average salary of all employees-- display its number, name and number of its employees.
    7. Retrieve a list of employees and the projects they are working on ordered by department and within each department,
       ordered alphabetically by last name , first name.
    8. Try to get the max 2 salaries using subquery
    9. Get the full name of employees that is similar to any dependent name
    10. Try to update all salaries of employees who work in Project ‘Al Rabwah’ by 30%
    11. Display the employee number and name if at least one of them have dependents (use exists keyword) self-study.

DML

    1. In the department table insert new department called "DEPT IT" , with id 100, employee with SSN = 112233 as a manager for this department.
       The start date for this manager is '1-11-2006'

    2. Do what is required if you know that : Mrs.Noha Mohamed(SSN=968574) moved to be the manager of the new department (id = 100), 
       and they give you(your SSN =102672) her position (Dept. 20 manager)

        a. First try to update her record in the department table
        b. Update your record to be department 20 manager.
        c. Update the data of employee number=102660 to be in your teamwork (he will be supervised by you) (your SSN =102672)

    3. Unfortunately the company ended the contract with Mr. Kamel Mohamed (SSN=223344) so try to delete his data from your database 
       in case you know that you will be temporarily in his position.
       Hint: (Check if Mr. Kamel has dependents, works as a department manager, supervises any employees or works in any projects and handle these cases).


<br>

---

<br>

```sql

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


```