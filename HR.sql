--			 On HR_DB

--  1
select *
from Employees;
--  2
select *
from Employees
where CountryID=1 ;
--  3
select *
from Employees
where DepartmentID=3 ;

--  4
select *
from Employees
where MonthlySalary > 2500 ;

--  5
select *
from Employees
where HireDate >'2020-12-30';

--  6
select *
from Employees
where ExitDate IS NOT NULL ;

--  7
select *
from Employees
where BonusPerc >.1 ;


