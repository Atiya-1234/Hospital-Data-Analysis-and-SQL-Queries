use company;
select * from hospita_data11;
show tables in company;

-- Rename table name
alter table hospita_data11
rename Hospital_data;
select * from Hospital_data;

-- 1. Total Number of Patients
select sum(Patients) as "Total_Patients" from hospital_data;

-- 2.Average Number of Doctors per Hospital
select distinct(Hospital) as Name_hospital from hospital_data;
select count(distinct(hospital)) as No_hospital from hospital_data;
select Hospital, avg(Doctors) as Avg_doctors_per_hospital from hospital_data group by Hospital;

-- 3.Top 3 Departments with the Highest Number of Patients
select hospital, department, patients as Top_3_petintes from Hospital_data order by Top_3_petintes  desc limit 3;

-- 4. Hospital with the Maximum Medical Expenses
select * from hospital_data where medical_expenses=(select
max(medical_expenses) from hospital_data);

-- Second Method
select * from hospital_data order by medical_expenses desc limit 1;

-- 5. Daily Average Medical Expenses
select hospital, Admission_date, avg(medical_expenses) as daily_avg_expenses
from hospital_data group by hospital, Admission_date order by Admission_date;

-- 6.	Longest Hospital Stay
select hospital, patients, admission_date, discharge_date,(admission_date-discharge_date) as Longest_stay
from hospital_data;
select hospital,patients, admission_date, discharge_date, datediff(admission_date, discharge_date)
as Longest_hospital_stay from hospital_data order by  Longest_hospital_stay desc limit 1;

-- 7.	Total Patients Treated Per City
select * from hospital_data;
select location, count(patients) as Total_patients from hospital_data group by location;


-- 8.Average Length of Stay Per Department
select department, avg(datediff(discharge_date, admission_date)) as Avg_length_of_stay
from hospital_data group by department;

-- 9.Identify the Department with the Lowest Number of Patients
select count(patients) from hospital_data;
select sum(patients) from hospital_data;
select department, count(patients) as Lowest_no_patients from hospital_data 
group by department order by Lowest_no_patients asc limit 1;

-- 10.Monthly Medical Expenses Report
select year(admission_date) as Year, month(admission_date) as Month, sum(medical_expenses) as Total_Medical_Expenses
from hospital_data group by Year, Month order by Year, Month; 




