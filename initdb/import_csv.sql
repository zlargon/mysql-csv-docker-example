-- create table
CREATE TABLE CRIME_CSV (
  INCIDENT_NUMBER     VARCHAR(13),   -- 142052550, I152044642-00, I152028570-01, I140300475-02, I030217815-08, ...
  OFFENSE_CODE        VARCHAR(5),    -- 0724, 00724, ...
  OFFENSE_CODE_GROUP  VARCHAR(100),
  OFFENSE_DESCRIPTION VARCHAR(100),
  DISTRICT            VARCHAR(3),    -- "", A1, A7, A15, B2, B3, C6, C11, D4, D14, E5, E13, E18
  REPORTING_AREA      VARCHAR(3),    -- "", 000, ...
  SHOOTING            CHAR(1),       -- "", Y
  OCCURRED_ON_DATE    DATETIME,
  YEAR                INT,           -- 2015 ~ 2018
  MONTH               INT,           -- 1 ~ 12
  DAY_OF_WEEK         VARCHAR(9),    -- Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday
  HOUR                INT,           -- 0 ~ 23
  UCR_PART            VARCHAR(20),   -- "", Part One, Part Two, Part Three, Other
  STREET              VARCHAR(100),
  LATITUDE            VARCHAR(20),   -- "", -1, 42.30028028, ...
  LONGITUDE           VARCHAR(20),   -- "", -1, -71.06015261, ...
  LOCATION            VARCHAR(100)   -- "", "(-1,-1)", "(42.33383935, -71.08029038)", ...
);

-- import csv into crime table
LOAD DATA INFILE '/tmp/crime.csv'
INTO TABLE CRIME_CSV
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS; -- skip the heading row
