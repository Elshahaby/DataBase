# Task of Lab3_part1

# [Link To task](https://docs.google.com/document/d/1QIj5qQ4e3HsyW7Dc9u-mMRUi0b-Le4Kn/edit)

<br>

---

- ## Try to create the following Queries:

  1. Display the Department id, name and id and the name of its manager.
  2. Display the name of the departments and the name of the projects under its control.
  3. Display the full data about all the dependence associated with the name of the employee they depend on him/her.
  4. Display the Id, name and location of the projects in Cairo or Alex city.
  5. Display the Projects full data of the projects with a name starts with "a" letter.
  6. display all the employees in department 30 whose salary from 1000 to 2000 LE monthly
  7. Retrieve the names of all employees in department 10 who works more than or equal10 hours per week on "AL Rabwah" project.
  8. Find the names of the employees who directly supervised with Kamel Mohamed.
  9. Retrieve the names of all employees and the names of the projects they are working on, sorted by the project name.
  10. For each project located in Cairo City , find the project number, the controlling department name ,the department manager last name ,address and birthdate.
  11. Display All Data of the mangers
  12. Display All Employees data and the data of their dependents even if they have no dependents

- ## Data Manipulating Language:

  1. Insert your personal data to the employee table as a new employee in department number 30, SSN = 102672, Superssn = 112233, salary=3000.

  2. Insert another employee with personal data your friend as new employee in department number 30, SSN = 102660, but don’t enter any value for salary or manager number to him.

  3. Upgrade your salary by 20 % of its last value.

<br>

---

<br>

```sql

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


```
