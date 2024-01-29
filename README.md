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
<br>
The incidence data strecthes as far back as 1990 but the death data starts from the year 2000. Also it appears that even countries with colder climates like those in Scandinavia do have the occasional death from Dengue; This could be because people may travel to countries with warmer climates, get infected, and die in the countries with colder climates. I contemplated gathering temperature data and removing countries based off of that information but instead used the incidence rate to achieve the same result; If a country has a mean of 0 infections through the 20 year span of data it is a country where getting infected by dengue isn't possible.
I downloaded the GDP data set from the worldbank website which can found using the following link: https://data.worldbank.org/indicator/NY.GDP.MKTP.CD 
<br>
The GDP data stretched as far back as 1960 and ended on 2022. Various cells were null but these were mostly in the years before 2000

# Work
## QA

Excel, python, postgreSQL, &amp; tableau.
