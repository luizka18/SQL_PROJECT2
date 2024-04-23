# Introduction
🏡 Dive with me into real estate data related to Nashville city. The data includes information on the sale of specific properties in this specific area of America. Enriched with, among other things: land value, property sale date 📆, building type, information about owners, as well as a property sale price 💰. This project was created to investigate dependencies concerning this topic 📊 and to perform certain analyses. 

- My SQL queries? Check them out here: [housing_questions.sql folder](/housing/housing_questions.sql)

# Background
The project is a result of my desire for development in the domain of Data Analysis and my curiosity. All analyses were based on questions I had previously set for myself and also during attempts to discover🔎 the capabilities of the "Power BI" tool. 

The questions I wanted to answer through my SQL queries : 

1. What were the most 10 valuable properties? *(totalvalue*)
2. What were the most 10 valuable properties that were built after the 2000s?
3. How many sold properties were from each year? (*yearbuilt*) + What was the average value of a sold building in a given year?
4.  How many sold properties were from each category (*landuse*)? 
5.  What is the average cost of properties from every category?
6.  Which land was in the top 10 valuable lands?
7. Is there an owner who sold more than one property? What are the top 5 owners when it comes to the amount of sold properties? 
8. What are the top 5 owners when it comes to the total amount of money they “gain”?
9. How many properties were from each price range?

# Tools I Used
The following tools allowed me to delve into the data, draw conclusions from it, and then visualize them.

- **SQL:** helped answer my questions with the help of queries and data filtering.
- **PostgreSQL:** built the foundation for my database and provided the capability to manage that dataset.
- **Visual Studio Code:** this allowed me to conduct analysis using SQL queries, enabled code editing, and connected the project to my GitHub account.
- **GitHub & Git:** helped me share the results of my work with others and control the project's process.
- **Power BI:** enabled data visualization and presentation in a more visually appealing format, according to the previously obtained answers in VS Code.

# The Analysis
### 1. What were the most 10 valuable properties? (*totalvalue*)
```sql
SELECT
      UniqueID,
      PropertyAddress,
      yearbuilt,
      SaleDate,
      totalvalue
FROM nashville_housing
WHERE totalvalue IS NOT NULL
ORDER BY totalvalue DESC
LIMIT 10 
```
Here's the result: [most valuable properties](/housing_the_rest/most_valuable_properties.csv) regarding *totalvalue* from this data. 

### 2. How many properties were sold from each year? + What was the average value of a sold building in a given year?
```sql
SELECT EXTRACT(YEAR FROM saledate) AS Year,
      COUNT(UniqueID) AS How_many_properties
FROM nashville_housing
WHERE saledate is not NULL
GROUP BY Year 
ORDER BY Year ASC 
```
![Average of Sale Price by Year](housing_the_rest\Average of Sale price by Year.png) 

### 3.  How many sold properties were from each category?
```sql
SELECT landuse,
       COUNT(UniqueID) AS Category_count
FROM nashville_housing
WHERE landuse IS NOT NULL
GROUP BY landuse
ORDER BY Category_count DESC 
```
### 4.  What is the average cost of properties from every category?
```sql
SELECT landuse,
      ROUND(AVG(saleprice), 1) AS Average_sale_count
FROM nashville_housing
WHERE saleprice IS NOT NULL AND landuse IS NOT NULL
GROUP BY landuse
ORDER BY Average_sale_count DESC 
```
### 5. Is there an owner who sold more than one property? What are the top 5 owners when it comes to the amount of sold properties?
```sql
SELECT ownername,
       COUNT(SaleDate) AS Owner_count
FROM nashville_housing
WHERE ownername is not NULL
GROUP BY ownername
ORDER BY Owner_count DESC  
```

### 6. What are the top 5 owners when it comes to the total amount of money they “gain”?
```sql
SELECT ownername,
       SUM(saleprice) AS Owner_money_count
FROM nashville_housing
WHERE ownername is not NULL AND saleprice is not NULL
GROUP BY ownername
ORDER BY Owner_money_count DESC 
LIMIT 5
```
### 7. How many properties were from each price range?
```sql
SELECT
    CASE
        WHEN saleprice BETWEEN 0 AND 100000 THEN '0-100k'
        WHEN saleprice BETWEEN 100001 AND 200000 THEN '100k-200k'
        WHEN saleprice BETWEEN 200001 AND 300000 THEN '200k-300k'
        WHEN saleprice BETWEEN 300001 AND 500000 THEN '300k-500k'
        ELSE '500k+'
    END AS price_range,
    COUNT(*) AS total_properties
FROM nashville_housing
WHERE saleprice is not NULL
GROUP BY price_range
ORDER BY total_properties DESC
```
# What I Learned
# Conclusions
