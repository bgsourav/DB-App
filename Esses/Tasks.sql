--Join Queries
--Normal Join Queries
--Retrieve the Names of the Countries which have signed the "Uniform Monetary Treaty"
select CountryName as Countries from Treaties Natural Join TreatyMake where TreatyName = "Uniform Monetary Treaty";
--Retrieve the Staff Information of the staff who belong to the Country with Monetary Contributions exceeding 400 million euros
 select * from Staff where StaffID in (select StaffID from Staff Natural JOIN (select * from Countries Natural JOIN Contributions) as A where A.Type = "Funds" and A.Amount > 400000000);
--Retrive the Country Details which send more than 250000 troops to EU mission.
select * from Countries where CountryName in (select CountryName from Contributions where Type="Troops" and Amount > 250000);
--Retrieve the Staff who come from countries which have GDP per capita greater than 80000 euros
select * from Staff where CountryName in (select CountryName from Countries where GDPpercapita > 80000);
--Retrive all the Treaties which have more than 3 nations participating.
select TreatyNumber,TreatyName from Treaties where TreatyNumber in (select TreatyNumber from (select COUNT(*) as No_of_Countries,TreatyNumber from TreatyMake group by TreatyNumber) as A where No_of_Countries > 3);
--Retreive the total Monetary Fund in Euros which have been contributed to the EU from its member countries
select SUM(Amount) as Total_Monetary_Amount from Contributions where Type = "Funds";
--Get the Information of all the Countries which are participating in Both "Schegen Grants Treaty" and the "Energy Regulation Treaty"
select * from Countries where CountryName in ((select CountryName from TreatyMake Natural JOIN Treaties where TreatyName = "Schengen Grants Treaty") INTERSECT (select CountryName from TreatyMake Natural JOIN Treaties where TreatyName ="Energy Regulation Treaty"));
--Get the Information of all the Countries which have either given Troops to EU or are participating in TreatyNumber 1
select * from Countries where CountryName in ((select CountryName from TreatyMake where TreatyNumber = 1) UNION (select CountryName from Contributions where Type = "Troops" ));
--Coorelated Queries
--Retreive the Details of the staff who earn more than their countries GDP per capita
select * from Staff as A where A.Salary > ANY(select B.GDPpercapita from Countries as B where B.CountryName = A.CountryName);
--Retrive the Details of the staff who earn the higest in their respective department
select * from Staff as A where A.Salary = ALL(select MAX(Salary) from Staff as B where B.DepartmentNumber = A.DepartmentNumber);
--Creation of View
DELIMITER $$
create trigger valid_candidate before insert
on Countries for each row 
begin
declare error_msg varchar(255);
set error_msg = ('The Country cannot have a GDP per capita of less than 50000');
NEW.GDPpercapita < 50000 THEN
SIGNAL SQLSTATE '45000'
set MESSAGE_TEXT = error_msg;
end if;
end $$
DELIMITER ;