-- delete 
-- from denguedi_gdp
-- where gdp_val is null or total_cases is null or total_deaths is null;


select distinct(entity),round(avg(total_deaths::numeric),2) as avg_deaths, round(avg(total_cases::numeric),2) as avg_cases
from denguedi_gdp
group by entity
order by avg_deaths desc, avg_cases desc;