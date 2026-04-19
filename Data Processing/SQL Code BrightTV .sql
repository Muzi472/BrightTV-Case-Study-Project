Select * from `workspace`.`default`.`user_profiles` limit 100;
select * from `workspace`.`default`.`viewership` limit 100;

---Formulating the Big Query for BrightTV Case Study
---Data Analysis
Select A.UserID, 
---Using Count Distinct to Dentermine number of users
      Count(distinct UserID) AS Users_and_Viewers,

--Checking for Nulls and Handling them
      Ifnull(Gender,'No_Gender') AS Gender,
      Ifnull(Race, 'No_Race') AS Race,
      Ifnull(Province,'No_Province') AS Province,

Ifnull(Age, '0') AS Age,
CASE
    When Age < '18' Then 'Young'
    When Age Between 18 AND 40 THEN 'Adults'
    When Age Between 41 AND 65 THEN 'Senior'
    When Age Between 66 AND 80 THEN 'Old'
 Else 'Grandparents'
END AS Age_Classification,

---Converting time from UTC TO SA time, and Creating case statement for day categories also time buckets
--from_utc_timestamp(TO_TIMESTAMP(RecordDate2, 'dd/MM/yyyy HH:mm'), 'Africa/Johannesburg') AS Sast_timestamp,
CAST(from_utc_timestamp(TO_TIMESTAMP(RecordDate2, 'dd/MM/yyyy HH:mm'),'Africa/Johannesburg') AS DATE) AS Date_Part,
Dayname(Date_Part) AS Day_name,
MonthName(Date_Part) AS Name_of_Month,
DayofMonth(Date_Part) AS Day_of_Month,

---When Day_name IN ('Sun','Sat') THEN 'Weekend'
CASE  
    When Dayname(Date_Part) IN ('Sun','Sat') THEN 'Weekend'
  ELSE 'Weekday'
END AS Day_Category,

date_format(from_utc_timestamp(TO_TIMESTAMP(RecordDate2, 'dd/MM/yyyy HH:mm'),'Africa/Johannesburg'),'HH:mm:ss') AS Time_Part,       
 CASE
      When Time_Part Between '00:00:00' AND '05:59:59' THEN 'Early_Morning'
      When Time_Part Between '06:00:00' AND '11:59:59' THEN 'Morning'
      When Time_Part Between '12:00:00' AND '16:59:59' THEN 'Afternoon'
      When Time_Part Between '17:00:00' AND '22:59:59' THEN 'Evenning'
    Else 'Late_Night'
  END AS Time_buckets,

  ---Checking Nulls and Case for Duration column
Ifnull(Channel2, 'No_Channel') AS Channel2, 
date_format (TO_TIMESTAMP(`Duration 2`),'H:mm:ss') AS Formatted_time,  
CASE
     When Formatted_time BETWEEN '0:00:00' AND '1:59:59' THEN 'Shortwatch'
     When Formatted_time BETWEEN '2:00:00' AND '3:59:59' THEN 'Mediumwatch'
     When Formatted_time BETWEEN '4:00:00' AND '6:59:59'  THEN 'Longwatch'
   Else 'Bingewatch'
END AS Duration_Buckets,
Email 

From `workspace`.`default`.`user_profiles` AS A
Left Join `workspace`.`default`.`viewership` AS B
On A.UserID = B.UserID0
Group By A.UserID, 
Gender, 
Race,
Age,
Province, 
Channel2, 
RecordDate2, 
`Duration 2`,
Email;



