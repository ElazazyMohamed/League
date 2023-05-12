CREATE Database Milestone_2
drop database Milestone_2


-- (2.1) a)


go
CREATE Proc createAllTables
	as
		Create Table SystemUser(
			UserName varchar(20) Primary Key,
			Password varchar(20)
		);
		Create Table SportAssociationManager(
			ID int Primary Key Identity(1,1),
			Name varchar(20),
			UserName varchar(20),
			Foreign Key (UserName) references SystemUser (UserName) on delete cascade on update cascade
		);
		Create Table ClubRepresentative(
			ID int Primary Key Identity(1,1),
			Name varchar(20),
			UserName varchar(20),
			Foreign Key (UserName) references SystemUser (UserName) on delete cascade on update cascade
		);
		Create Table Club(
			ID int Primary Key Identity(1,1),
			Name varchar(20),
			Location varchar(20),
			ClubRepresentativeID int,
			Foreign key (ClubRepresentativeID) references ClubRepresentative(ID) on delete cascade
		);
		
		Create Table StadiumManager(
			ID int Primary Key Identity(1,1),
			Name varchar(20),
			UserName varchar(20),
			Foreign Key (UserName) references SystemUser (UserName) on delete cascade on update cascade
		);
		Create Table Stadium(
			ID int Primary Key Identity(1,1),
			Name varchar(20),
			Capacity int,
			Location varchar(20),
			Status bit,
			StadiumManagerID int,
			Foreign Key (StadiumManagerID) references StadiumManager(ID) on delete set null
		);
		Create Table Match(
			ID int Primary Key Identity(1,1),
			StartTime datetime,
			EndTime datetime ,
			StadID int,
			ClubHostID int,
			ClubGuestID int,
			Foreign Key (StadID) references Stadium (ID)  ,
			Foreign Key (ClubHostID) references Club (ID) ,
			Foreign Key (ClubGuestID) references Club (ID) 
			  
		);
		Create Table Fan(
			NationalID varchar(20) Primary Key,
			PhoneNumber varchar(20),
			Name varchar(20),
			Address varchar(20),
			Status bit,
			BirthDate date,
			UserName varchar(20),
			Foreign Key (UserName) references SystemUser (UserName) on delete cascade on update cascade
		);
		Create Table Ticket(
			ID int Primary Key Identity(1,1),
			Status bit,
			FanID varchar(20),
			MatchID int
		constraint FK_FANID	Foreign Key (FanID) references Fan(NationalID) ,
		constraint FK_MatchID Foreign Key (MatchID) references Match(ID) 
		);
		Create Table SystemAdmin(
			ID int Primary Key Identity(1,1),
			Name varchar(20),
			UserName varchar(20),
			Foreign Key (UserName) references SystemUser (UserName)	on delete cascade on update cascade		
		);
		Create Table HostRequest(
			ID int Primary Key Identity(1,1),
			Status varchar(20),
			MatchID int, 
			StadiumManagerID int, 
			ClubRepresentativeID int,
			Foreign Key (MatchID) references Match (ID) ,
			Foreign Key (StadiumManagerID) references StadiumManager (ID) ,
			Foreign Key (ClubRepresentativeID) references ClubRepresentative (ID) 
		);
		go ;
		


		select * from Club
		select * from Fan
		select * from SystemUser
		select * from Match
		select * from Stadium
		select * from availableMatchesToAttend()

execute createAllTables;
-- (2.1) b)
go
Create Procedure dropAllTables
	as
		Drop Table HostRequest
		Drop Table SystemAdmin 
		Drop Table SportAssociationManager
		Drop Table Ticket
		Drop Table Fan
		Drop Table Match
		Drop Table Club
		Drop Table ClubRepresentative
		Drop Table Stadium
		Drop Table StadiumManager
		Drop Table SystemUser
		go;
		

		
-- (2.1) d)
go
Create Proc clearAllTables
	as
	Exec dropAllTables
	Exec createAllTables
		go ;

-- (2.2) a)
go
Create View allAssocManagers as
	SELECT sam.UserName, su.Password, sam.Name
	FROM SportAssociationManager sam , SystemUser su 
	WHERE sam.UserName = su.UserName ;
	go;

-- (2.2) b)

Create View allClubRepresentatives as
	Select CR.UserName,SU.Password, CR.Name as Club_RepresentativeName, C.Name as Club_Name
	From ClubRepresentative CR, Club C , SystemUser SU
	Where CR.ID = C.ClubRepresentativeID AND CR.UserName = SU.UserName ;
	go;

-- (2.2) c)

Create View allStadiumManagers as
	Select SM.UserName, SU.Password, SM.Name as Stadium_ManagerName, S.Name as Stadium_Name
	From StadiumManager SM, Stadium S , SystemUser SU 
	Where SM.ID = S.StadiumManagerID AND SM.UserName = SU.UserName;
	go;

-- (2.2) d)

Create View allFans as
	Select SU.UserName, SU.Password, F.Name, F.NationalID, F.BirthDate, F.Status
	From Fan F, SystemUser SU 
	WHERE F.UserName = SU.UserName;
	go;

-- (2.2) e)

Create View allMatches as
	Select C1.Name as Host_Club, C2.Name as Guest_Club, M.StartTime 
	From Match M , Club C1 , Club C2
	Where M.ClubHostID = C1.ID AND M.ClubGuestID = C2.ID;
	go;

-- (2.2) f)

Create View allTickets as
	Select C1.Name as Host_Club, C2.Name as Guest_Club, S.Name as Stadium_Name, M.StartTime
	From Ticket T, Match M, Stadium S, Club C1, Club C2
	Where T.MatchID = M.ID AND M.StadID = S.ID AND C1.ID = M.ClubHostID AND C2.ID = M.ClubGuestID;
	go;

-- (2.2) g)

Create View allCLubs as
	Select Name, Location
	From Club;
	go;

-- (2.2) h)

Create View allStadiums as
	Select Name, Location, Capacity, Status
	From Stadium;
	go;

-- (2.2) i)

drop view allRequests
Create View allRequests as
	Select	CR.UserName as Club_RepresentativeUserName, SM.UserName as Stadium_ManagerUserName, HR.Status
	From HostRequest HR, ClubRepresentative CR, StadiumManager SM 
	Where HR.StadiumManagerID = SM.ID AND HR.ClubRepresentativeID = CR.ID 
	go;

-- (2.1) c)

Create Proc dropAllProceduresFunctionsViews
	 as
		Drop PROCEDURE createAllTables
		Drop PROCEDURE dropAllTables
		Drop PROCEDURE clearAllTables
		Drop View allAssocManagers
		Drop View allClubRepresentatives
		Drop View allStadiumManagers
		Drop View allFans
		Drop View allMatches
		Drop View allTickets
		Drop View allCLubs
		Drop View allStadiums
		Drop view allRequests
		Drop PROCEDURE addAssociationManager
		Drop PROCEDURE addNewMatch
		Drop View clubsWithNoMatches
		Drop PROCEDURE deleteMatch
		Drop PROCEDURE deleteMatchesOnStadium
		Drop PROCEDURE addClub
		Drop PROCEDURE addTicket
		Drop Procedure deleteClub
		Drop PROCEDURE addStadium
		Drop Procedure deleteStadium
		Drop Procedure blockFan
		Drop PROCEDURE unblockFan
		Drop PROCEDURE addRepresentative
		Drop FUNCTION viewAvailableStadiumsOn
		Drop PROCEDURE addHostRequest
		Drop FUNCTION allUnassignedMatches
		Drop PROCEDURE addStadiumManager
		Drop FUNCTION allPendingRequests
		Drop PROCEDURE acceptRequest
		Drop PROCEDURE rejectRequest
		Drop PROCEDURE addFan
		Drop FUNCTION upcomingMatchesOfClub
		Drop FUNCTION availableMatchesToAttend
		Drop PROCEDURE purchaseTicket
		Drop PROCEDURE updateMatchHost
		Drop VIEW matchesPerTeam
		Drop VIEW clubsNeverMatched
		Drop FUNCTION clubsNeverPlayed
		Drop FUNCTION matchWithHighestAttendance
		Drop FUNCTION matchesRankedByAttendance
		Drop FUNCTION requestsFromClub ;

		go;
		


-- (2.3) (i)
go
Create proc addAssociationManager
@name varchar(20),
@username varchar(20),
@password varchar(20)
as
insert into SystemUser values (@username,@password)
insert into SportAssociationManager values (@name,@username)
go;


-- (2.3)  (ii)

Create proc addNewMatch 
@hostclub varchar(20),
@guestclub varchar(20),
@starttime datetime ,
@endtime datetime
as
insert into Match(ClubHostID,ClubGuestID,StartTime,EndTime ) values ( (select c.ID from Club c where c.Name = @hostclub)  ,
			(select c2.ID from Club c2 where c2.Name=@guestclub) , @starttime , @endtime ) 
go;


-- (2.3) (iii)

create view  clubsWithNoMatches
as
select c.Name
from Club c 
where  not Exists ( select c2.name from Match m1 inner join Club c2 on c2.ID = m1.ClubHostID Union
								select c3.name from Match m2 inner join Club c3 on c3.ID = m2.ClubGuestID ) 
go;




-- (2.3) (iv)
create proc deleteMatch
@hostclub varchar(20),
@guestclub varchar(20),
@starttime datetime,
@endtime datetime

as
delete from Match 
where   (   ClubHostID = (select c.ID from Club c where c.Name = @hostclub) AND 
			ClubGuestID = (select c2.ID from Club c2 where c2.Name =@guestclub) AND 
			StartTime = @starttime AND
			EndTime = @endtime)

go;


-- (2.3) (v) 
create proc deleteMatchesOnStadium
@stadiumname varchar(20)
as
delete from Match 
where exists (select* from Match m , Stadium s where (m.StadID = s.ID) AND (s.Name = @stadiumname) AND (m.StartTime > 'CURRENT_TIMESTAMP'))   
go;

-- (2.3) (vi)
create proc  addClub
@clubname varchar(20),
@location varchar (20)
as
insert into Club (Name,Location) values (@clubname, @location)
insert into Club (Name,Location) values (@clubname, @location)
go;

-- (2.3) (vii) 

create proc addTicket2 @hr int as
insert into Ticket (Status,MatchID) values('1',(select m.ID from Match m,HostRequest hrr where hrr.ID = @hr and m.ID = hrr.MatchID ))

go

create proc stadcapacity @hr int, @size int output as
set @size = (select s.Capacity from HostRequest hr , Stadium s , Match m where hr.ID = @hr and m.ID = hr.MatchID and m.StadID = s.ID  )

go;

create proc  addTicket
@hostclub varchar(20),
@guestclub varchar(20),
@starttime Datetime 
as 
insert into Ticket (Status,MatchID) values (1, ( select m.ID from Match m ,Club c1 ,Club c2 where  (m.ClubHostID = c1.ID AND c1.Name = @hostclub) AND 
																				            	   (m.ClubGuestID = c2.ID AND c2.Name = @guestclub) AND
																						            m.StartTime = @starttime ) )
go;

-- (2.3) (viii) 
create proc deleteClub
@clubname varchar (20)
as
delete from Club where (Name = @clubname)
go;

-- (2.3)  (ix) 
create proc  addStadium
@stadiumname varchar(20),
@location varchar(20),
@capacity int 
as
insert into Stadium (Name,Location,Capacity,Status) values (@stadiumname,@location,@capacity,1)
go;


-- (2.3) (x) 
create proc  deleteStadium
@stadiumname varchar(20)
as 
delete from Stadium where (Name = @stadiumname)
go;

-- (2.3) (xi)
create proc  blockFan
@nationalid varchar(20)
as
update Fan set Status = 0 where (NationalID = @nationalid)
go;

-- (2.3) (xii)
create proc  unblockFan
@nationalid varchar(20)
as 
update Fan set Status = 1 where (NationalID = @nationalid)
go;

-- (2.3) (xiii) 



create proc addRepresentative
@name varchar(20),
@clubname varchar(20),
@username varchar(20),
@password varchar(20)
as
insert into SystemUser (UserName, Password) values (@username,@password) ;
insert into ClubRepresentative (Name,UserName) values (@name,@username);
update Club set ClubRepresentativeID =  (select cr.ID from ClubRepresentative cr  where ( cr.UserName = @username )) where Name = @clubname
go;


-- (2.3) (xiv)    


create function viewAvailableStadiumsOn
(@starttime datetime)
returns table 
as return
	
	(select s.Name , s.Location , s.Capacity
	from Stadium s 
	where not exists (  (select * from Stadium s2 , Match m2 where ( s.ID = s2.ID  and m2.StadID = s2.ID and @starttime between m2.StartTime and m2.EndTime AND s.Status = '1'  )   )  )
	)
go;


-- (2.3) (xv)
create proc addHostRequest
@clubname varchar(20),
@stadiumname varchar(20),
@starttime datetime

as
insert into HostRequest (Status, MatchID , ClubRepresentativeID, StadiumManagerID) values 
('unhandled', 
 (select m.ID from Club c, Stadium s, Match m ,ClubRepresentative cr, StadiumManager sm where c.Name = @clubname AND 
																							  c.ID = m.ClubHostID AND 
																							  s.Name = @stadiumname AND																						
																			           	      m.StartTime=@starttime AND
																						      c.ClubRepresentativeID = cr.ID AND 
																							  s.StadiumManagerID = sm.ID AND 
																							  s.Name = @stadiumname ) ,
 (select cr.ID from Club c ,Stadium s, Match m, ClubRepresentative cr, StadiumManager sm where c.Name = @clubname AND 
																							  c.ID = m.ClubHostID AND 
																							  s.Name = @stadiumname AND																				
																			           	      m.StartTime=@starttime AND
																						      c.ClubRepresentativeID = cr.ID AND 
																							  s.StadiumManagerID = sm.ID AND 
																							  s.Name = @stadiumname ),
 (select sm.ID from Club c,Stadium s ,Match m,ClubRepresentative cr, StadiumManager sm where c.Name = @clubname AND 
																							  c.ID = m.ClubHostID AND 
																							  s.Name = @stadiumname AND																						
																			           	      m.StartTime=@starttime AND
																						      c.ClubRepresentativeID = cr.ID AND 
																							  s.StadiumManagerID = sm.ID AND 
																							  s.Name = @stadiumname ) )

go;


-- (2.3) (xvi) 
create function allUnassignedMatches
(@hostname varchar(20))
returns table 
as return
(
	select c2.Name , m.StartTime
	from Match m , Club c1, Club c2 
	where c1.Name = @hostname AND c1.ID = m.ClubHostID AND c2.ID = m.ClubGuestID AND m.StadID IS NULL
)
go;


-- (2.3) (xvii)
-- updated by nada
create proc addStadiumManager
@name varchar(20),
@stadiumname varchar(20),
@username varchar(20),
@password varchar(20)

as
insert into SystemUser (UserName, Password) values (@username, @password)
insert into StadiumManager (Name , UserName) values (@name, @username)
update Stadium
set StadiumManagerID = (select sm.ID from  StadiumManager sm  where sm.UserName = @username) where Name = @stadiumname
go;




-- (2.3) (xviii)
create function allPendingRequests (@stadiummanager varchar(20))
returns table 
as return 
(
select c1.Name as HostClub, c2.Name as GuestClub, m.StartTime, m.EndTime, hr.Status , cr.Name as ClubRepresentative , hr.ID as HostRequestID
from HostRequest hr , match m , ClubRepresentative cr , Club c1 , Club c2, StadiumManager sm
where hr.MatchID = m.ID AND hr.Status = 'unhandled' and m.ClubHostID = c1.ID AND m.ClubGuestID = c2.ID AND hr.ClubRepresentativeID = cr.ID AND hr.StadiumManagerID = sm.ID AND sm.UserName = @stadiummanager
)

go;




create proc acceptRequest2
@smusername varchar(20),
@id int as
update HostRequest set Status = 'accepted' where ID = @id 
update Match set StadID = (select s.ID from Stadium s , StadiumManager sm
		where @smusername = sm.UserName and s.StadiumManagerID = sm.ID   ) where ID = ( select MatchID from HostRequest  where ID = @id )

go

create proc rejecttRequest2
@id int as
update HostRequest set Status = 'rejected' where ID = @id 
go





-- (2.3) (xix)
create proc acceptRequest
@stadiummanagerusername varchar(20),
@hostname varchar(20),
@guestname varchar(20),
@starttime datetime

as
update HostRequest 
set Status = 'accepted'
where ((@stadiummanagerusername = (select sm.UserName from HostRequest hr, StadiumManager sm  where hr.StadiumManagerID = sm.ID ) ) AND 
	  (@hostname = (select c1.Name from HostRequest hr, Club c1  where hr.ClubRepresentativeID = c1.ClubRepresentativeID ) ) AND 
	  (@guestname = (select c2.Name from HostRequest hr,Match m , Club c2  where hr.MatchID = m.ID AND m.ClubGuestID = c2.ID ) ) AND 
	  (@starttime =  (select m.StartTime from HostRequest hr, Match m  where hr.MatchID = m.ID ) ) 
	  )
go;



-- (2.3) (xx)
create proc  rejectRequest
@stadiummanagerusername varchar(20),
@hostname varchar(20),
@guestname varchar(20),
@starttime datetime

as
update HostRequest 
set Status = 'rejected'
where ((@stadiummanagerusername = (select sm.UserName from HostRequest hr, StadiumManager sm  where hr.StadiumManagerID = sm.ID ) ) AND 
	  (@hostname = (select c1.Name from HostRequest hr, Club c1  where hr.ClubRepresentativeID = c1.ClubRepresentativeID ) ) AND 
	  (@guestname = (select c2.Name from HostRequest hr,Match m , Club c2  where hr.MatchID = m.ID AND m.ClubGuestID = c2.ID ) ) AND 
	  (@starttime =  (select m.StartTime from HostRequest hr, Match m  where hr.MatchID = m.ID ) ) 
	  )
go;




-- (2.3) (xxi)
create proc addFan
@name varchar(20),
@username varchar(20),
@password varchar(20),
@nationalid varchar(20),
@birthdate datetime,
@address varchar(20),
@phonenum int 

as
insert into SystemUser (UserName, Password) values (@username,@password)
insert into Fan (NationalID, PhoneNumber, Name, Address, BirthDate, UserName, Status) values (@nationalid, @phonenum, @name, @address, @birthdate, @username ,1)
go;


-- (2.3) (xxii)
go
create function upcomingMatchesOfClub
(@clubname varchar(20))
returns table 
as return 
 ( 
	(select c1.Name as Host , c2.Name as Guest , m.StartTime, m.EndTime, (select stest.Name from Stadium stest where stest.ID = m.StadID ) as StadiumName
	from Match m , Club c1 , club c2 
	where (c1.Name = @clubname AND (c1.ID = m.ClubHostID AND c2.ID = m.ClubGuestID) AND (CURRENT_TIMESTAMP <= m.StartTime)  ))
	union
	(select c2.Name as Host , c1.Name as Guest , m.StartTime,m.EndTime,(select stest.Name from Stadium stest where stest.ID = m.StadID ) as StadiumName
	from Match m , Club c1 , club c2
	where (c1.Name = @clubname AND (c2.ID = m.ClubHostID AND c1.ID = m.ClubGuestID) AND (CURRENT_TIMESTAMP <= m.StartTime)))     
)
go;


create proc checkmatchpurchase @matchid int , @user varchar(20) , @found bit output as
begin

if exists( select * from Match m , Fan f , Ticket t where m.ID = @matchid and f.UserName = @user and t.MatchID = m.ID and t.FanID = f.NationalID  )
	set @found = 1
else
	set @found = 0
end




go
-- (2.3) (xxiii)
create function availableMatchesToAttend

(@datetime datetime, @user varchar(20))

returns table 
as return 
(
	select c1.Name as HostClubName , c2.Name as GuestClubName, s.Name as StadiumName, s.Location as StadiumLocation,  m.ID as MatchID
	from Match m , Stadium s, Club c1, Club c2 , Ticket t
	where m.StadID = s.ID AND m.ClubHostID = c1.ID AND m.ClubGuestID = c2.ID AND @datetime <= m.StartTime AND t.MatchID = m.ID AND t.Status = 1
	group by m.ID , c1.Name , c2.Name , s.Name , s.Location 
)
go;




-- (2.3) (xxiv)




create proc purchaseticket2 @user varchar(20) , @mid int as
update Ticket set Status = '0' , FanID = (select NationalID from Fan where UserName = @user) where ID = ( select top 1 t.ID from Ticket t where t.MatchID = @mid and
																											Status = '1' order by t.ID  )


go
create proc  purchaseTicket
@nationalid varchar(20),
@clubname varchar(20),
@guestname varchar(20),
@starttime datetime

as
update Ticket
set Status = 0 , FanID = @nationalid
where MatchID =( select m.ID
				from Match m , Club c1, Club c2
				where m.ClubHostID = c1.ID AND m.ClubGuestID = c2.ID AND @clubname = c1.Name AND @guestname = c2.Name AND m.StartTime = @starttime)
go;


-- (2.3) (xxv)
create proc updateMatchHost
@hostname varchar(20),
@guestname varchar(20),
@starttime datetime

as
update Match
set ClubHostID = (select c.ID from Club c where c.Name = @guestname ) , ClubGuestID = (select c2.ID from Club c2 where c2.Name =@hostname )
where ( StartTime = @starttime AND 
	    @hostname = (select c1.Name from Club c1 where ClubHostID = c1.ID ) AND 
	    @guestname = (select c2.Name from Club c2 where ClubGuestID = c2.ID )       )    
go;



-- (2.3) (xxvi)
create view  matchesPerTeam as 
select c.Name , count(*) as numOfmatchesPlayed
from Match m , Club c 
where  m.ClubHostID = c.ID OR m.ClubGuestID = c.ID
group by c.Name

go;
-- (2.3) (xxvii)
create view  clubsNeverMatched as 
select c1.Name as FirstClubName , c2.Name as SecondClubName
from club c1 , Club c2 
where (c1.ID < c2.ID) AND 
NOT EXISTS ( select *
			 from Match m1, Club c11, Club c22
			 where ( (c1.ID = c11.ID AND c2.ID = c22.ID)  AND
			          m1.ClubHostID = c1.ID AND m1.ClubGuestID = c2.ID ) OR (m1.ClubHostID = c2.ID AND m1.ClubGuestID = c1.ID ) 
				  
)
go;




-- (2.3)  (xxviii)
create function  clubsNeverPlayed 
(@clubname varchar(20))
returns table 
as return 
(
select c3.Name
from Club c , Club c3
where (@clubname = c.Name) AND (c.ID <> c3.ID) AND NOT EXISTS (select c2.Name
															   from Club c2, Match m2
															   where  (m2.ClubHostID = c.ID AND m2.ClubGuestID = c2.ID )OR(m2.ClubGuestID = c.ID AND m2.ClubHostID = c2.ID) 
																	   AND c2.ID = c3.ID )
)
go;


-- (2.3)  (xxix)
create function matchWithHighestAttendance ()
returns table 
as return 
(
select c1.Name as hostclub , c2.Name as guestclub , count(m.ID) as maxNumOfTickets
from Match m , Ticket t, Club c1, Club c2
where m.ID = t.MatchID AND m.ClubHostID = c1.ID AND m.ClubGuestID = c2.ID AND t.Status = 0
group by m.ID ,c1.name,c2.name
having count(*) = (select max(test)
					  from (  select count(*) as test
							  from Match m1 , Ticket t1, Club c11, Club c22 
							  where m1.ID = t1.MatchID AND m1.ClubHostID = c11.ID AND m1.ClubGuestID = c22.ID AND t1.Status = 0
							  group by m1.ID   ) as n ) 
							  
)
go;




-- (2.3)  (xxx)
create function matchesRankedByAttendance ()
returns table 
as return 
(
select top(100) percent c1.Name as hostname, c2.Name as guestname , count(t.ID) as totalNumTickets
from Match m ,Club c1 ,Club c2 ,Ticket t 
where m.ClubHostID = c1.ID AND m.ClubGuestID = c2.ID AND t.MatchID = m.ID and t.Status = 0
group by m.ID, c1.Name, c2.Name  
order by count(m.ID) desc
)
go;



-- (2.3) (xxxi)
create function  requestsFromClub
(@stadiumname varchar(20), @clubname varchar(20))
returns table 
as return
(
select c1.Name as HostClubName, c2.Name as GuestClubName
from Match m , Club c1, Club c2, HostRequest hr, Stadium s 
where ((m.ClubHostID = c1.ID AND m.ClubGuestID = c2.ID) AND 
	   (@clubname = c1.Name )  AND       
	   (hr.MatchID = m.ID) AND 
	   (m.StadID = s.ID) AND
	   (@stadiumname = s.Name) AND 
	   ( hr.ClubRepresentativeID = c1.ClubRepresentativeID ) AND 
	   (hr.Status = 'unhandled' ))
)
go;




create proc userLogin 
@username varchar(20),
@password varchar(20),
@success bit OUTPUT 
as 
begin 
if exists(
select su.UserName, su.Password
from SystemUser su
where su.UserName = @username AND su.Password= @password
)
	set @success = 1
else 
	set @success = 0
end

	 go ;

create proc checkuser
@username varchar(20),
@found bit output
as
begin
if
exists(
select su.UserName
from SystemUser su
where su.UserName = @username
)
	set @found = 1
else 
	set @found = 0
end

go;



go

create proc checkClub
@clubname varchar(20),
@found bit output
as
begin
if
exists(
select c.Name
from Club c
where c.Name = @clubname
)
	set @found = 1
else 
	set @found = 0
end

go



create proc checkstadium
@stadiumname varchar(20),
@found bit output
as
begin
if
exists(
select s.Name
from Stadium s
where s.Name = @stadiumname
)
	set @found = 1
else 
	set @found = 0
end



go
create proc whichProfile
@username varchar(20),
@profileType int OUTPUT
as
begin 
if exists(
select sa.UserName
from SystemAdmin sa
where sa.UserName = @username
)
set @profileType = 1;

else if exists(
select sam.UserName
from SportAssociationManager sam
where sam.UserName = @username
)
set @profileType = 2;

else if exists(
select cr.UserName
from ClubRepresentative cr
where cr.UserName = @username
)
set @profileType = 3;

else if exists(
select sm.UserName
from StadiumManager sm
where sm.UserName = @username
)
set @profileType = 4;

else if exists(
select f.UserName
from Fan f
where f.UserName = @username
)
set @profileType= 5;
end




go
create proc checkStadium
@stadiumname varchar(20),
@found bit OUTPUT
as
begin
if exists(
select s.Name
from Stadium s
where s.Name = @stadiumname
)
	set @found = 1
else 
	set @found = 0
end


go
create proc checkFan
@fanid varchar(20),
@found bit OUTPUT
as
begin
if exists(
select f.NationalID
from Fan f 
where f.NationalID = @fanid
)
	set @found = 1
else 
	set @found = 0
end


go

create proc checkMatch
@hostname varchar(20),
@guestname varchar(20),
@starttime datetime,
@endtime datetime,
@found bit OUTPUT
as
begin
if exists(
select *
from Match m, Club c1, Club c2 
where m.ClubHostID = c1.ID AND m.ClubGuestID = c2.ID AND c1.Name = @hostname AND c2.Name = @guestname AND m.StartTime = @starttime AND m.EndTime = @endtime
)
	set @found = 1
else 
	set @found = 0
end



--agmad procs by nada
go
create proc clubInformation
@clubrepresentative varchar(20),
@clubid int OUTPUT,
@clubname varchar(20) OUTPUT,
@clublocation varchar(20) OUTPUT
as
begin
 (select  @clubid =c.ID  , @clubname = c.Name , @clublocation = c.Location
			   from club c , ClubRepresentative cr
			   where cr.UserName = @clubrepresentative AND c.ClubRepresentativeID = cr.ID)

end

go
create proc stadiumInformation
@stadiummanager varchar(20),
@stadiumid int OUTPUT,
@stadiumname varchar(20) OUTPUT,
@stadiumcapacity varchar(20) OUTPUT,
@stadiumlocation varchar(20) OUTPUT,
@stadiumstatus varchar(20) OUTPUT
as
begin
 (select  @stadiumid =s.ID  , @stadiumname = s.Name , @stadiumlocation = s.Location , @stadiumcapacity = s.Capacity  , @stadiumstatus = s.Status 
			   from Stadium s, StadiumManager sm
			   where sm.UserName = @stadiummanager AND s.StadiumManagerID = sm.ID )

end

go



-- maghood mo7taram bas malhash lazma
create proc getClubName 
@clubrepresentative varchar(20),
@clubname varchar(20) OUTPUT  
as
begin 
select @clubname = c.Name
from Club c, ClubRepresentative cr 
where   @clubrepresentative = cr.UserName AND  c.ClubRepresentativeID = cr.ID
end
-----------------------------------------------
go


go ;
create function allRequests (@stadiummanager varchar(20))
returns table 
as return 
(
select c1.Name as HostClub, c2.Name as GuestClub, m.StartTime, m.EndTime, hr.Status , cr.Name as ClubRepresentative , hr.ID as HostRequestID
from HostRequest hr , match m , ClubRepresentative cr , Club c1 , Club c2, StadiumManager sm
where hr.MatchID = m.ID AND m.ClubHostID = c1.ID AND m.ClubGuestID = c2.ID AND hr.ClubRepresentativeID = cr.ID AND hr.StadiumManagerID = sm.ID AND sm.UserName = @stadiummanager
)


go
create function allUpcomingMatches ()
returns table 
as return
(Select C1.Name as Host_Club, C2.Name as Guest_Club, M.StartTime , M.EndTime
From Match M , Club C1 , Club C2
Where M.ClubHostID = C1.ID AND M.ClubGuestID = C2.ID AND CURRENT_TIMESTAMP <= M.StartTime
)
go

create function allPlayedMatches ()
returns table 
as return
(Select C1.Name as Host_Club, C2.Name as Guest_Club, M.StartTime , M.EndTime
From Match M , Club C1 , Club C2
Where M.ClubHostID = C1.ID AND M.ClubGuestID = C2.ID AND CURRENT_TIMESTAMP > M.StartTime
)


go

-----------------------------------JOE
create proc faninfo @user varchar(20),@status varchar(20) output as
begin
if(select f.Status from Fan f where f.UserName = @user) = '0'
	set @status = 'Blocked'
else
	set @status = 'Unblocked'
end

go
create proc stadiumavailablehelper 
@stname varchar(20),
@starttime datetime,
@found bit output as
begin
if  exists (select * from Match m , Stadium s where ( @stname = s.Name and m.StadID = s.ID and @starttime between m.StartTime and m.EndTime ) )
	set @found = '1'
else
	set @found = '0'

end

go 


create proc reqhelper
@crep varchar(20),
@starttime datetime ,
@found bit output as
begin
if exists( select * from  ClubRepresentative cr, Match m , Club c where ( cr.UserName = @crep and c.ClubRepresentativeID = cr.ID
																	and m.ClubHostID = c.ID and m.StartTime = @starttime  ))
	set @found = '1'
else
	set @found = '0'
end
go




create proc finalreqhelper
@crep varchar(20),
@starttime datetime ,
@found int output as
begin
 declare @x int
 declare @status varchar(20)
 set @x = ( select m.ID from   ClubRepresentative  cr, Match m , Club c where ( cr.UserName = @crep and c.ClubRepresentativeID = cr.ID
														and m.ClubHostID = c.ID and m.StartTime = @starttime  ))

	if not exists (select Status from HostRequest where MatchID = @x)
		set @found = '2'

	else

		set	@status = (select Status from HostRequest where MatchID = @x)

		if @status = 'accepted'
			set @found = '0'
		else
			if @status = 'unhandled'
				set @found = '1'
			else
				set @found = '2'

end
go

select * from HostRequest
go
select * from SportAssociationManager
select * from ClubRepresentative
select * from Club
select * from SystemUser
select * from Stadium
select * from StadiumManager
select * from Match
select * from Club
select * from Fan
select * from SystemAdmin
select * from Stadium
select * from HostRequest
select * from Match

delete from Match where ID = 7
insert into Club(Name,Location) values('Ahly','Al Gazeira')
insert into Club(Name,Location) values('Zamalik','maadi')
insert into Stadium(Name,Location) values ('Eltetsh','Al Gazerira');
insert into SystemAdmin values('nadakandil','nada')
insert into SystemUser values('nada',123)
insert into Match (ClubHostID,ClubGuestID,StartTime,EndTime) values('2','3','2030-01-01 09:00:00 ','2030-01-01 11:00:00 ');
insert into Match (ClubHostID,ClubGuestID,StartTime,EndTime) values('4','2','2029-11-23 11:30:34 ','2029-11-23 2:30:34 ');



drop function upcomingMatchesOfClub

select * from upcomingMatchesOfClub('Ahly')

insert into Match (ClubHostID,ClubGuestID,StartTime,EndTime) values('3','2','2029-11-23 11:30:34 ','2029-11-23 2:30:34 ');


select * from availableMatchesToAttend('2023-01-01 09:00:00 ', 'PSG')

execute addRepresentative 
@name = 'xxx',
@clubname = 'barcelona',
@username = 'xxx',
@password = 111 ;





