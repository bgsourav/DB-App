drop procedure if exists update_max_cap;
drop trigger if exists check_contributions_cap;
DELIMITER $$
Create Procedure update_max_cap(IN CountryName varchar(30),IN Amount INT(11))
BEGIN 
	signal SQLSTATE '23487' set message_text = "Contributions exceed limit.";
END $$
DELIMITER ;
DELIMITER $$
create trigger check_contributions_cap before insert on Contributions for each row
BEGIN 
	if new.Amount > 460000000 and new.Type = "Funds" then 
		call update_max_cap(new.CountryName,new.Amount);
	end if;
end $$
DELIMITER ;
---view creation
create view Countries_under_depts as select DepartmentNumber,DepartmentName,Budget,TreatyNumber,TreatyName,CountryName from TreatyMake Natural JOIN Treaties Natural JOIN Department;
-- List all the Countries which have standing Treaties with the European Council
select CountryName from Countries_under_depts where DepartmentName = "European Council";