create database Project1;
use Project1;
select * from `hr analyst final dataset`;
alter table `hr analyst final dataset` change column ï»¿EmployeeId Employee_Id int ;
select Employee_Id,Department from `hr analyst final dataset`where Department = "Sales" ;
describe `hr analyst final dataset`;

# KPI-1 Average Attrition rate for all Departments
select concat(round(avg(AttritionFlag)*100,2),'%') as 'Attrition Rate', Department from `hr analyst final dataset` group by Department;

# KPI- 2 Average Hourly rate of Male Research Scientist
select round(avg(HourlyRate),2) as 'Avg Hourly Rate of Male Research Scientist'from  `hr analyst final dataset` 
where JobRole= 'Research Scientist' and Gender= 'Male' group by JobRole;

# KPI-3 Attrition rate Vs Monthly income stats
select count(Attrition) as 'Attrition', New_Income_Band as 'Income Band'from  `hr analyst final dataset` group by New_Income_Band order by New_Income_Band;

#KPI- 4 Average working years for each Department
select round(avg(TotalWorkingYears),2) as 'Avg Working Years' , Department from `hr analyst final dataset` group by Department;

# KPI- 5 Job Role Vs Work life balance
select JobRole, round(avg(WorkLifeBalance),2) as 'Work Life Balance' from `hr analyst final dataset` group by JobRole;

# KPI- 6 Attrition rate Vs Year since last promotion relation
select concat(round(avg(AttritionFlag)*100,2),'%') as 'Attrition Rate', YearsSinceLastPromotion as 'Years Since Last Promotion' from `hr analyst final dataset` group by YearsSinceLastPromotion order by YearsSinceLastPromotion;


#KPI-7 HIGH-RISK PROMOTION GROUP 
select Promotion_Risk,count(Employee_Id) as Employee_Count,concat(round(avg(AttritionFlag)*100,2),"%") as 'Attrition Rate'
from 
(select AttritionFlag, Employee_Id,
case 
when YearsSinceLastPromotion  <=5 then "Low Risk"
when  YearsSinceLastPromotion  <=10 then "Medium Risk"
else "High Risk"
end as Promotion_Risk  from `hr analyst final dataset`) as promotion group by Promotion_Risk order by Employee_Count;


select * from `hr analyst final dataset` ;

# KPI-8 job satisfaction vs Attritionselect
select JobSatisfaction, concat(round(avg( AttritionFlag)*100,2),"%") as 'Attrition Rate' , count(Employee_Id) as "Total Employees" from `hr analyst final dataset` group by JobSatisfaction;

