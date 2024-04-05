use ITI

select count(St_id)
from Student
where St_Age is not null

select distinct Ins_Name
from Instructor

--- Display student with the following Format (use isNull function)
select St_Id , isNull(St_Fname+' '+St_Lname , 'NO Name') as [full Name], Dept_Name
from Student s , Department d
where d.Dept_Id = s.Dept_Id

--- Display instructor Name and Department Name 
select Ins_Name , Dept_Name
from Department d left outer join Instructor I
on d.Dept_Id = I.Dept_Id

--- Display student full name and the name of the course he is taking For only courses which have a grade 
select concat(St_Fname,' ',St_Lname) as [full Name] , Crs_Name
from Student S , Stud_Course sC , Course C
where s.St_Id = sC.St_Id and C.Crs_Id=sc.Crs_Id and grade is not null
order by [full Name]

--- Display number of courses for each topic name
select count(Crs_Id) as [number of courses]
from Course C 
group by Top_Id


--- Display max and min salary for instructors
select max(Salary) as mx , min(salary) as mn
from Instructor

--- Display instructors who have salaries less than the average salary of all instructors.
select Ins_Name
from Instructor I
where salary < (select avg(salary) from Instructor)

--- Display the Department name that contains the instructor who receives the minimum salary.
select dept_name
from Department D , Instructor I 
where d.Dept_Id = I.Dept_Id and Salary = (select min(salary) from Instructor)

---  Select max two salaries in instructor table. 
select top 2 salary 
from Instructor
order by salary desc

--- Select instructor name and his salary but if there is no salary display instructor bonus.
--- “use one of coalesce Function”
select Ins_Name , coalesce(convert(varchar(20) , Salary) , 'bouns') as sal
from Instructor I 


--- Select Average Salary for instructors 
select avg(salary)
from Instructor

--- Select Student first name and the data of his supervisor 
select s.St_Fname as sutdentName , v.*
from Student S , Student V
where s.St_super=v.St_Id

--- Write a query to select the highest two salaries in Each Department for instructors who have salaries.
--- “using one of Ranking Functions” 
select salary , Dept_Id
from(
	select * , ROW_NUMBER()  over(partition by dept_id order by salary desc) as RN
	from Instructor
)as newtabel
where Rn<=2 and salary is not null

--- Write a query to select a random  student from each department. 
--- “using one of Ranking Functions”
select St_Fname+' '+St_Lname as[Student Full Name] , Dept_Id
from(
	select *,ROW_NUMBER() over(partition by dept_id order by newid()) as RN
	from Student
)as newtabel
where rn=1

