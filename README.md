![image](https://github.com/Xenny-sudo/dengue_fever_gdp_relationship/assets/15963479/3dd0ec66-03a9-4294-9ea4-f4622c1b75ad)
Tableau Dashboard Link: https://public.tableau.com/app/profile/benny.hernandez3887/viz/DenguevsGDP/DenguevsGDP?publish=yes
# Relationship between Dengue Fever & GDP($)
I wanted to perform an analysis of some topic to put skills that I learned in practice; I decided to do an analyis of Gross Domestic Product(GDP$) and a disease. I had to choose a disease and ultimately ended up choosing dengue fever due to its prevalence in my mother country of the Domincan Republic. The goal was to see if a higher GDP results in less dengue fever deaths.<br>
It's important to note that I'm neither an economist, biologist, or medical doctor; With that being said I have a basic understanding of economics and biology which I picked up in college & high school AP courses.
## Dengue Fever (DENV)
According to the <a href="https://www.who.int/news-room/fact-sheets/detail/dengue-and-severe-dengue">World Health Organization</a>, "dengue fever is a viral infection transmitted through the bite of infected mosquitoes". Something of note is that dengue is found in tropical/sub-tropical climates meaning a lot of countries with colder climates like Canada or Russia should have 0 deaths or infections.
## Gross Domestic Product(GDP$) 
As defined by the <a href="https://www.imf.org/en/Publications/fandd/issues/Series/Back-to-Basics/gross-domestic-product-GDP#:~:text=GDP%20measures%20the%20monetary%20value,a%20quarter%20or%20a%20year).">International Monetary Fund</a>, GDP is "the measure of of all monetary value of final goods and services produced in a country in a given period of time." It is different from Gross National Product in that GDP only accounts for products made within the country and not products made abroad by companies of said country.

## The Data
The dengue data consisted of two datasets from ourwouldindata.org; One was the data of incidence rates of dengue across the globe (Incidence means total cases of an illness) and the other was the total deaths from dengue across the globe which can be found with the following links:<br>
https://ourworldindata.org/grapher/dengue-incidence
<br>
https://ourworldindata.org/grapher/dengue-fever-deaths

The incidence data strecthes as far back as 1990 but the death data starts from the year 2000; They both end at the year 2019.

Also it appears that even countries with colder climates like those in Scandinavia do have the occasional death from Dengue; This could be because people may travel to countries with warmer climates, get infected, and die in the countries with colder climates. I contemplated gathering temperature data and removing countries based off of that information but instead used the incidence rate to achieve the same result; If a country has a mean of 0 infections through the 20 year span of data it is a country where getting infected by dengue isn't possible. 

I downloaded the GDP dataset from the worldbank website which can found using the following link: https://data.worldbank.org/indicator/NY.GDP.MKTP.CD 
<br>
The GDP data stretched as far back as 1960 and ended on 2022. Various cells were null but these were mostly in the years before 2000. I also used excel to delete all the data before 1990 as it would be useless and it had so many nulls that even I wanted to use it, doing so would be useless.

The final dataset that I used was a population data set from <a href="https://ourworldindata.org/population-growth">ourworldindata</a> which I downloaded just in case I needed population data.

For all four datasets various territories or contested land was left with no data (Puerto Rico, Western Sahara, etc.) but this is very common with global datasets so it's something that I ignored. However there were some exceptions where the NULL values were more important. Certain countries for example lacked their GDP values; For countries like Russia it doesn't matter because the incidence rate is 0 but for countries like Vietnam which does have dengue cases & deaths it means my analysis will be lacking.

## Tools
I used Excel to give the data a cursory view and to delete some cols that I thought were unecessary like aforementioned GDP data or a header that came with the dengue data. Afterwards I wanted to load the data into a PostgreSQL database, perform data analysis in Python(Jupyter), and then make a dashboard using Tableau Public. I used pgAdmin4 as an interface for SQL.

# Work
## Importing Data
After giving the data a look in Excel, I wanted to import the data into pgAdmin but in order to do so I had to create a table to import the data into; This would take way too long since the GDP dataset has a column for each year. In order to automate this process I made a script in python that would connect to the database, would read the csv, and create an empty table using the column names. See easy_tables.py 

After this I could now fill the table with the data, which I did using postgreSQL(See import_data SQL)
## Merge
I now had to clean the data and merge it(making_db.sql).

I had to do some final QA in python; I needed to fix the one to many issue (Every country had multiple instances because the years), so I made a pivot table and then flattened it:
```
df2 = df.pivot_table(['gdp_val','total_cases','total_deaths'],['entity'],'year').reset_index()
df2.columns = [ '_'.join([str(c) for c in c_list]) for c_list in df2.columns.values ]
df2.head()
```
I use both the merged table and the flattened pivot table for my analysis.
## Analysis
As stated before there are some NULL values for certain countries that make my analysis incomplete. In total there 516 rows where either total cases, total deaths, or gdp is a null value; For some of these countries all data for all 20 years is missing but for others there are simply small gaps in the data. In total 29 countries have missing data and I decided to remove them as they are of no use and there isn't a value I could replace them with. 
The top ten countries for mean deaths & mean cases are India, Indonesia, Pakistan, Philippines, Myanmar, Brazil, Malaysia, Thailand, Sri Lanka, & Colombia.<br>
When mean deaths and cases are viewed separately there are some differences in the top 10 list like Mexico or Pakistan which appear in the top total cases but don't have as many deaths. For mean deaths there were 88 countries that had at least one death in the span of 20 years. By comparison, 109 countries had at least one death.<br>
Based off the graphs that I made using Tableau there appears to be no connection between GDP & Dengue deaths/cases; India has the msot of amount of cases & has rising deaths despite having a rising GDP. Brazil had a dip in GDP starting in 2014 but it's total cases/deaths remained consistent. Indonesia had a rising GDP but while it did have a small drop(A decrease of ~1-3k deaths) in deaths it maintained a steady amount of cases.

Tableau Dashboard Link: https://public.tableau.com/app/profile/benny.hernandez3887/viz/DenguevsGDP/DenguevsGDP?publish=yes
