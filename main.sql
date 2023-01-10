create database forge_dbs;
use forge_dbs;



-- TABLE CREATION

create table forgers (
    ForgerID varCHAR(4) NOT NULL,
    FirstName varCHAR(100),
    LastName varCHAR(100),
    Status CHAR(1),
    CONSTRAINT forgers_ForgerID_pk PRIMARY KEY (ForgerID)
);

create table verification_personnel (
    VerificationPersonnelID varCHAR(4) NOT NULL,
    ForgerID varCHAR(4) NOT NULL,
    Status CHAR(1),
    CONSTRAINT verification_personnel_VerificationPersonnelID_pk PRIMARY KEY (VerificationPersonnelID),
    CONSTRAINT forgers_ForgerID_fk FOREIGN KEY (ForgerID) REFERENCES forgers(ForgerID)
);

create table gametypes (
    GametypeID varCHAR(4) NOT NULL,
    GametypeName varCHAR(100),
    Purpose varCHAR(100),
    Description varCHAR(1000),
    CONSTRAINT gametypes_GametypeID_pk PRIMARY KEY (GametypeID)
);

create table map_sectors (
    SectorNumber varCHAR(4) NOT NULL,
    Description varCHAR(1000),
    CONSTRAINT map_sectors_SectorNumber_pk PRIMARY KEY (SectorNumber)
);
    
create table maps (
    MapID varCHAR(4) NOT NULL,
    MapName varCHAR(100),
    SectorNumber varCHAR(4) NOT NULL,
    GametypeID varCHAR(4) NOT NULL,
    DateCreated date,
    Description varCHAR(1000),
    Difficulty CHAR(1),
    MapOwnerAndOverallCreator varCHAR(4) NOT NULL,
    Visibility CHAR(1),
    MaxPlayers CHAR(2),
    CONSTRAINT maps_MapID_pk PRIMARY KEY (MapID),
    CONSTRAINT maps_SectorNumber_fk FOREIGN KEY (SectorNumber) REFERENCES map_sectors(SectorNumber),
    CONSTRAINT maps_GametypeID_fk FOREIGN KEY (GametypeID) REFERENCES gametypes(GametypeID),
    CONSTRAINT maps_MapOwnerAndOverallCreator_fk FOREIGN KEY (MapOwnerAndOverallCreator) REFERENCES forgers(ForgerID)
);
    
create table individual_map_creations (
    CreationID varCHAR(4) NOT NULL,
    ForgerID varCHAR(4) NOT NULL,
    MapID varCHAR(4) NOT NULL,
    CONSTRAINT ind_map_creations_CreationID_pk PRIMARY KEY (CreationID),
    CONSTRAINT ind_map_creations_ForgerID_fk FOREIGN KEY (ForgerID) REFERENCES forgers(ForgerID),
    CONSTRAINT ind_map_creations_MapID_fk FOREIGN KEY (MapID) REFERENCES maps(MapID)
);

create table individual_map_verifications (
    VerificationID varCHAR(4) NOT NULL,
    VerificationPersonnelID varCHAR(4) NOT NULL,
    MapID varCHAR(4) NOT NULL,
    CONSTRAINT ind_map_verifs_VerificationID_pk PRIMARY KEY (VerificationID),
    CONSTRAINT ind_map_verifs_VerificationPersonnelID_fk FOREIGN KEY (VerificationPersonnelID) REFERENCES verification_personnel(VerificationPersonnelID),
    CONSTRAINT ind_map_verifs_MapID_fk FOREIGN KEY (MapID) REFERENCES maps(MapID)
);

create table map_edits (
    EditID varCHAR(4) NOT NULL,
    Date date,
    MapID varCHAR(4) NOT NULL,
    Description varCHAR(1000),
    CONSTRAINT map_edits_EditID_pk PRIMARY KEY (EditID),
    CONSTRAINT map_edits_MapID_fk FOREIGN KEY (MapID) REFERENCES maps(MapID)
);

create table individual_map_edits (
    IndividualEditID varCHAR(4) NOT NULL,
    EditID varCHAR(4) NOT NULL,
    ForgerID varCHAR(4) NOT NULL,
    CONSTRAINT ind_edits_IndividualEditID_pk PRIMARY KEY (IndividualEditID),
    CONSTRAINT ind_edits_EditID_fk FOREIGN KEY (EditID) REFERENCES map_edits(EditID),
    CONSTRAINT ind_edits_ForgerID_fk FOREIGN KEY (ForgerID) REFERENCES forgers(ForgerID)
);





-- RECORD INSERTION

INSERT INTO forgers
VALUES
('99','Jonathan','Anders','A');
INSERT INTO forgers
VALUES
('37','Steve','Macintosh','A');
INSERT INTO forgers
VALUES
('47','RaShun','Stewart','A');
INSERT INTO forgers
VALUES
('77','Kody','White','A');
INSERT INTO forgers
VALUES
('54','Johnathen','Glenn','A');
INSERT INTO forgers
VALUES
('42','Brandon','Frances','A');
INSERT INTO forgers
VALUES
('43','Chad','Curlington','I');
INSERT INTO verification_personnel
VALUES
('A1','99','A');
INSERT INTO verification_personnel
VALUES
('A2','37','A');
        
INSERT INTO verification_personnel
VALUES
('A3','47','A');
        
INSERT INTO verification_personnel
VALUES
('A4','54','A');
        
INSERT INTO verification_personnel
VALUES
('A5','77','I');

INSERT INTO gametypes
VALUES
('1','Phoenix Raid','Raiding','Free for all, normal raid starting traits, with unimited score, and 1 hour and 5 minute time limit');

INSERT INTO gametypes
VALUES
('2','Phoenix Training','General Training','Free for all, training traits with no extras, with unimited score, and with unimited time limit');

INSERT INTO gametypes
VALUES
('3','TS Training','TS Training for TS maps','Free for all, training traits with Player Trait Alpha having invulnerability, with unimited score, and with unimited time limit');

INSERT INTO gametypes
VALUES
('4','Phoenix Meeting','Meetings inside and outside of group','Free for all, meeting traits with nothing, with unimited score, and with unimited time limit');

INSERT INTO gametypes
VALUES
('5','Phoenix Skirmish','Skirmish matches between other groups and inter group skirmishes','Two teams, normal skirmish traits, score of 100, and with unimited time limit');

INSERT INTO map_sectors
VALUES
('I','Initiation map');
        
INSERT INTO map_sectors
VALUES
('II','Raid maps');
        
INSERT INTO map_sectors
VALUES
('III','Inter group Meeting maps');
        
INSERT INTO map_sectors
VALUES
('IV','General training maps');
        
INSERT INTO map_sectors
VALUES
('V','Skirmish maps');
        
INSERT INTO map_sectors
VALUES
('VI','group to group Meeting maps');

INSERT INTO maps
VALUES
('1','Eros','II','1','2021-04-07','Small Base. 2 Entrances. Small size raid map.','5','47','V','16');

INSERT INTO maps
VALUES
('2','Cocytus','II','1','2021-06-24','Map is based with a theme on Cocytus the 4th layer of hell in Greek Mythology. Contains the Lake of Lamination. (a frosty ice-covered map)','4','54','I','16');

INSERT INTO maps
VALUES
('3','Molding Station','I','2','2020-08-03','Initiation map with a theme of a run-down base during a sunrise.','8','42','V','8');

INSERT INTO maps
VALUES
('4','Courthouse','III','4','2020-08-12','Official Phoenix courthouse for use in the Phoenix Court System.','0','43','I','10');

INSERT INTO maps
VALUES
('5','TS Training02','IV','3','2020-06-15','2nd edition of the TS maps and this one ramps up the difficulty and has bigger areas than the 1st edition. Mainly to help coordination.','6','99','V','14');

INSERT INTO maps
VALUES
('6','TS Training03','IV','3','2020-06-28','This is the 3rd edition of the TS maps and this one adds even bigger and better areas for people to show their progress towards coordination with each other.','7','99','V','16');

INSERT INTO maps
VALUES
('7','Relativity','V','5','2020-10-14','Naval skirmish map with battleship in water. Attackers have wasps.','3','37','I','16');

INSERT INTO maps
VALUES
('8','Rekindled Flame','VI','4','2021-01-28','A meeting map for group to group meetings that is inside a volcano with a round table.','0','37','V','8');
        
INSERT INTO individual_map_creations
VALUES
('A','99','1');
        
INSERT INTO individual_map_creations
VALUES
('B','37','1');
        
INSERT INTO individual_map_creations
VALUES
('C','54','1');
        
INSERT INTO individual_map_creations
VALUES
('D','99','2');
        
INSERT INTO individual_map_creations
VALUES
('E','37','2');
        
INSERT INTO individual_map_creations
VALUES
('F','42','3');
        
INSERT INTO individual_map_creations
VALUES
('G','77','5');
        
INSERT INTO individual_map_creations
VALUES
('H','77','6');
        
INSERT INTO individual_map_creations
VALUES
('I','47','7');
        
INSERT INTO individual_map_creations
VALUES
('J','99','7');
INSERT INTO individual_map_verifications
VALUES
('1A','A1','1');
        
INSERT INTO individual_map_verifications
VALUES
('1B','A2','1');
        
INSERT INTO individual_map_verifications
VALUES
('1C','A3','1');
        
INSERT INTO individual_map_verifications
VALUES
('1D','A3','2');
        
INSERT INTO individual_map_verifications
VALUES
('1E','A1','3');
        
INSERT INTO individual_map_verifications
VALUES
('1F','A5','4');
        
INSERT INTO individual_map_verifications
VALUES
('1G','A4','4');
        
INSERT INTO individual_map_verifications
VALUES
('1H','A2','5');
        
INSERT INTO individual_map_verifications
VALUES
('1I','A2','6');
        
INSERT INTO individual_map_verifications
VALUES
('1J','A5','7');
        
INSERT INTO individual_map_verifications
VALUES
('1K','A3','7');
        
INSERT INTO individual_map_verifications
VALUES
('1L','A5','8');
INSERT INTO map_edits
VALUES
('AA1','2021-06-17','1','Added Scouthog. Rock formation front left and 
mid area. 2 blocks in each entrance. Total of 9 crates along the wall.');

INSERT INTO map_edits
VALUES
('AA2','2021-07-01','2','Changed spawn area to better fit theme and 
fixed invisible blockers in the back right of the base.');

INSERT INTO map_edits
VALUES
('AA3','2021-08-29','1','Took away previously added crates along the 
wall and replaced them with sandbags.');

INSERT INTO map_edits
VALUES
('AA4','2020-07-08','5','Added a bit more cover in the first course. 
Took away the mongoose in the third course.');

INSERT INTO map_edits
VALUES
('AA5','2021-02-16','8','Made the lava a little less bright, and added 
a few rocks to cover some areas in volcano that looked unfinished.');

INSERT INTO map_edits
VALUES
('AA6','2020-12-16','7','Added some much needed extra wasps for 
attacking team. Took off a few bit of extra foliage that was causing 
destabilization of area and dropping frame rate. Removed a z-fight in the 
underbelly of the main ship. Added two banshees for attacking team. Changed all 
vehicles to on disturbance respawn instead of deletion respawn and set them all to 
30 seconds.');

INSERT INTO map_edits
VALUES
('AA7','2021-04-30','7','Took off one of the banshees for the attacking
team. Defending team granted a single wasp on deletion respawn and a 60 second 
respawn');
        
INSERT INTO individual_map_edits
VALUES
('1AA','AA1','43');

INSERT INTO individual_map_edits
VALUES
('1AB','AA1','37');

INSERT INTO individual_map_edits
VALUES
('1AC','AA2','77');

INSERT INTO individual_map_edits
VALUES
('1AD','AA3','99');

INSERT INTO individual_map_edits
VALUES
('1AE','AA4','99');

INSERT INTO individual_map_edits
VALUES
('1AF','AA4','54');

INSERT INTO individual_map_edits
VALUES
('1AG','AA5','54');

INSERT INTO individual_map_edits
VALUES
('1AH','AA6','99');

INSERT INTO individual_map_edits
VALUES
('1AI','AA6','42');

INSERT INTO individual_map_edits
VALUES
('1AJ','AA6','37');

INSERT INTO individual_map_edits
VALUES
('1AK','AA6','54');

INSERT INTO individual_map_edits
VALUES
('1AL','AA7','99');




-- QUERIES

-- what are the tables/entities?
show tables;

-- What is the information you store on forgers?
show columns from forgers;

-- What are the maps that are above 5 difficulty?
select all MapName
from maps 
where Difficulty > 5 
group by MapName;

-- How many maps has each forger created?
select FirstName, LastName, count(MapName) as NumberOfMapsCreated
from forgers, maps 
where forgers.ForgerID = maps.MapOwnerAndOverallCreator
group by LastName
order by LastName asc;

-- What are the names of maps and their Edit IDs for edits that changed anything to 
do with cover(description contains the word 'cover')?
select MapName, EditID, map_edits.Date as DateOfEdit
from maps, map_edits
where maps.MapID = map_edits.MapID
and map_edits.description like '%cover%';

-- What are the full names and VerificationPersonnelID that are both forgers and 
-- verification personnel and order it by descending order by last name?
select CONCAT(FirstName,' ',LastName) as FullName, verification_personnel.VerificationPersonnelID
from forgers
inner join verification_personnel on forgers.ForgerID = verification_personnel.ForgerID
order by LastName desc;

-- What is the map name and date for any map that was created/verified for any 
-- forgers that are map owners that are currently inactive as a forger?
select MapName, DateCreated
from maps
where MapOwnerAndOverallCreator in
(select ForgerID from forgers where status = 'I');

-- What are the FullName, MapName, and EditID's of any active forger that took part in an edit on 2021-04-30 or 
-- any inactive verification Personnel who verified any invisible map? Order the 
-- query by mapID in ascending order with no repeat answers.
select distinct CONCAT(FirstName,' ',LastName) as FullName, MapName, map_edits.EditID, map_edits.date as DateOfEdit
from maps, forgers, map_edits, individual_map_edits, verification_personnel
where (maps.MapID = map_edits.MapID
and map_edits.EditID = individual_map_edits.EditID
    and individual_map_edits.ForgerID = forgers.ForgerID
    and verification_personnel.ForgerID = forgers.ForgerID
    and forgers.status = 'A'
    and map_edits.date = '2021-04-30')
    or (maps.MapID = map_edits.MapID
and map_edits.EditID = individual_map_edits.EditID
and individual_map_edits.ForgerID = forgers.ForgerID
    and verification_personnel.ForgerID = forgers.ForgerID
and verification_personnel.status = 'I'
    and Visibility = 'I')
order by maps.MapID asc;