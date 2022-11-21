---Populating the Countries Table with values
insert into Countries values 
("United Kingdom",1,"2022-6-12","London","Rishi Sunak",81500)
,("France",2,"2002-9-7","Paris","Emanuel Macron",75000)
,("Germany",3,"2002-8-9","Berlin","Olaf Scholf",83000)
,("Belgium",4,"2003-7-8","Brussels","Alexander De Croo",89000)
,("Italy",5,"2005-9-10","Rome","Mario Draghi",72000);
---Populating the Department Table with values
insert into Department values(1,"European Court of Justice",209,30000000);
insert into Department values(2,"European Central Bank",567,2000000);
insert into Department values(3,"European Parliment",1,89000000);
insert into Department values(4,"European Council",3,65000000);
insert into Department values(5,"European Court of Auditors",45,34000000);
---Populating the Contributions Table with values
insert into Contributions values(1,"France","Funds",340000000);
insert into Contributions values(2,"United Kingdom","Troops",450000);
insert into Contributions values(3,"United Kingdom","Funds",38678000);
insert into Contributions values(4,"Belgium","Funds",89000000);
insert into Contributions values(5,"Italy","Troops",345679);
insert into Contributions values(6,"Germany","Funds",450000000);
insert into Contributions values(7,"France","Troops",128976);
--Populating the Staff Table with values
insert into Staff values(001,"James","Webb","Chief Of Staff",4,"France",134879,1);
insert into Staff values(002,"Nora","Dunn","Judge",1,"Belgium",167934,2);
insert into Staff values(003,"Angela","Merkel","Chief Executive Officer",2,"Germany",124578,2);
insert into Staff values(004,"Ben","Shapiro","Auditor",5,"Italy",109754,2);
insert into Staff values(005,"John","Oliver","Lawmaker",3,"United Kingdom",110437,1);
insert into Staff values(006,"Liz","Truss","Engineer",2,"United Kingdom",80123,1);
insert into Staff values(007,"Gustaffe","Eiffel","CoOrdinator",2,"France",67324,5);
--Populating the Treaties Table with values
insert into Treaties values(1,"Schengen Grants Treaty",3);
insert into Treaties values(2,"Uniform Monetary Treaty",2);
insert into Treaties values(3,"Uniform Civil Code Treaty",1);
insert into Treaties values(4,"Energy Regulation Treaty",4);
--Populating the TreatyMake table with values
insert into TreatyMake values(1,"France");
insert into TreatyMake values(1,"Germany");
insert into TreatyMake values(1,"Belgium");
insert into TreatyMake values(1,"Italy");
insert into TreatyMake values(2,"France");
insert into TreatyMake values(2,"Germany");
insert into TreatyMake values(2,"Belgium");
insert into TreatyMake values(2,"Italy");
insert into TreatyMake values(3,"United Kingdom");
insert into TreatyMake values(3,"France");
insert into TreatyMake values(3,"Germany");
insert into TreatyMake values(3,"Belgium");
insert into TreatyMake values(3,"Italy");
insert into TreatyMake values(4,"France");
insert into TreatyMake values(4,"Germany");
insert into TreatyMake values(4,"Italy");