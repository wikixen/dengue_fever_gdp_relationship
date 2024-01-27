--Filling all tables with values from csv's
 / COPY DENGUE_DEATHS 
FROM '"C:/Users/Benny/Downloads/data/dengue_deaths.csv"' 
DELIMITER ',' CSV HEADER ;

/ COPY DENGUE_INCIDENCE
FROM 'C:/Users/Benny/Downloads/data/dengue_incidence.csv'
DELIMITER ',' CSV HEADER ;

/ COPY GDP
FROM 'C:/Users/Benny/Downloads/data/gdp.csv'
DELIMITER ',' CSV HEADER ;

--Some light clean up to remove unnecessary cells+Renaming cols
--dengue_deaths contains the aggregate of regions which I dont need or want
DELETE
FROM DENGUE_DEATHS
WHERE CODE IS NULL;

ALTER TABLE DENGUE_DEATHS
DROP COLUMN INDEX;

ALTER TABLE DENGUE_DEATHS RENAME COLUMN "deaths - cause: dengue - sex: both sexes - age_group: allages" TO DEATH_RATE;

--Also contains region aggregates
DELETE
FROM DENGUE_INCIDENCE
WHERE ENTITY like '%(WHO)'
	OR ENTITY like '%(WB)';

ALTER TABLE DENGUE_INCIDENCE
DROP COLUMN INDEX;

ALTER TABLE DENGUE_INCIDENCE RENAME COLUMN "number of new cases of dengue, in both sexes aged all ages" TO TOTAL_CASES;

--I need to condense all the year cols into one col called year with the gdp val in a new col to merge
--I made a new table to do this
CREATE TABLE GDP2 AS
SELECT G."country name" AS ENTITY, G."country code" AS CODE, C.*
FROM GDP AS G
CROSS JOIN LATERAL(
VALUES(g."1991",1991),(g."1992",1992),(g."1993",1993),(g."1994",1994),(g."1995",1995),(g."1996",1996),(g."1997",1997),(g."1998",1998),(g."1999",1999),
	(g."2000",2000),(g."2001",2001),(g."2002",2002),(g."2003",2003),(g."2004",2004),(g."2005",2005),(g."2006",2006),(g."2007",2007),(g."2008",2008),(g."2009",2009),
	(g."2010",2010),(g."2011",2011),(g."2012",2012),(g."2013",2013),(g."2014",2014),(g."2015",2015),(g."2016",2016),(g."2017",2017),(g."2018",2018),(g."2019",2019)
) AS C(GDP_VAL,YEAR);


--Joining to make a complete table; Joining on deaths since it has the smallest
--range of years
-- Creating table
CREATE TABLE DENGUEDI_GDP AS
SELECT *
FROM DENGUE_DEATHS
LEFT JOIN DENGUE_INCIDENCE
USING(code,year,entity)
LEFT JOIN GDP2
USING(code,entity,year);