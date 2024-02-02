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

/ COPY POPULATION 
FROM 'C:/Users/Benny/Downloads/data/population.csv' 
DELIMITER ',' CSV HEADER ;
