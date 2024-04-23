-- Let's do some digging and let's check what questions can I ask, and what answers can I get from this specific data (Nashville Housing.csv).


/*QUESTIONS:
1. What are the most 10 valuable properties? (totalvalue)
*/ 
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

/* 2.How many properties were sold each year? (saledate) 
*/
SELECT EXTRACT(YEAR FROM saledate) AS Year,
      COUNT(UniqueID) AS How_many_properties
FROM nashville_housing
WHERE saledate is not NULL
GROUP BY Year 
ORDER BY Year ASC 

/* 3.How many sold properties were from each category (landuse)?
*/
SELECT landuse,
       COUNT(UniqueID) AS Category_count
FROM nashville_housing
WHERE landuse IS NOT NULL
GROUP BY landuse
ORDER BY Category_count DESC 

--Here is the result:
/*
[
  {
    "landuse": "SINGLE FAMILY",
    "category_count": "34197"
  },
  {
    "landuse": "RESIDENTIAL CONDO",
    "category_count": "14080"
  },
  {
    "landuse": "VACANT RESIDENTIAL LAND",
    "category_count": "3547"
  },
  {
    "landuse": "VACANT RES LAND",
    "category_count": "1549"
  },
  {
    "landuse": "DUPLEX",
    "category_count": "1373"
  },
  {
    "landuse": "ZERO LOT LINE",
    "category_count": "1048"
  },
  {
    "landuse": "CONDO",
    "category_count": "247"
  },
  {
    "landuse": "RESIDENTIAL COMBO/MISC",
    "category_count": "95"
  },
  {
    "landuse": "TRIPLEX",
    "category_count": "92"
  },
  {
    "landuse": "QUADPLEX",
    "category_count": "39"
  },
  {
    "landuse": "CONDOMINIUM OFC  OR OTHER COM CONDO",
    "category_count": "35"
  },
  {
    "landuse": "CHURCH",
    "category_count": "34"
  },
  {
    "landuse": "MOBILE HOME",
    "category_count": "20"
  },
  {
    "landuse": "DORMITORY/BOARDING HOUSE",
    "category_count": "19"
  },
  {
    "landuse": "VACANT COMMERCIAL LAND",
    "category_count": "17"
  },
  {
    "landuse": "SPLIT CLASS",
    "category_count": "17"
  },
  {
    "landuse": "PARKING LOT",
    "category_count": "11"
  },
  {
    "landuse": "FOREST",
    "category_count": "10"
  },
  {
    "landuse": "GREENBELT",
    "category_count": "10"
  },
  {
    "landuse": "PARSONAGE",
    "category_count": "6"
  },
  {
    "landuse": "VACANT RESIENTIAL LAND",
    "category_count": "3"
  },
  {
    "landuse": "GREENBELT/RES\r\nGRRENBELT/RES",
    "category_count": "3"
  },
  {
    "landuse": "TERMINAL/DISTRIBUTION WAREHOUSE",
    "category_count": "2"
  },
  {
    "landuse": "VACANT ZONED MULTI FAMILY",
    "category_count": "2"
  },
  {
    "landuse": "NON-PROFIT CHARITABLE SERVICE",
    "category_count": "2"
  },
  {
    "landuse": "RESTURANT/CAFETERIA",
    "category_count": "2"
  },
  {
    "landuse": "APARTMENT: LOW RISE (BUILT SINCE 1960)",
    "category_count": "2"
  },
  {
    "landuse": "DAY CARE CENTER",
    "category_count": "2"
  },
  {
    "landuse": "VACANT RURAL LAND",
    "category_count": "2"
  },
  {
    "landuse": "OFFICE BLDG (ONE OR TWO STORIES)",
    "category_count": "2"
  },
  {
    "landuse": "CONVENIENCE MARKET WITHOUT GAS",
    "category_count": "1"
  },
  {
    "landuse": "CLUB/UNION HALL/LODGE",
    "category_count": "1"
  },
  {
    "landuse": "METRO OTHER THAN OFC, SCHOOL,HOSP, OR PARK",
    "category_count": "1"
  },
  {
    "landuse": "STRIP SHOPPING CENTER",
    "category_count": "1"
  },
  {
    "landuse": "LIGHT MANUFACTURING",
    "category_count": "1"
  },
  {
    "landuse": "SMALL SERVICE SHOP",
    "category_count": "1"
  },
  {
    "landuse": "MORTUARY/CEMETERY",
    "category_count": "1"
  },
  {
    "landuse": "NIGHTCLUB/LOUNGE",
    "category_count": "1"
  },
  {
    "landuse": "ONE STORY GENERAL RETAIL STORE",
    "category_count": "1"
  }
]
*/

/* 4.What is the average cost of properties from every category?
*/

SELECT landuse,
      ROUND(AVG(saleprice), 1) AS Average_sale_count
FROM nashville_housing
WHERE saleprice IS NOT NULL AND landuse IS NOT NULL
GROUP BY landuse
ORDER BY Average_sale_count DESC 

/* 5.Is there an owner who sold more than one property?
*/ 
SELECT ownername,
       COUNT(SaleDate) AS Owner_count
FROM nashville_housing
WHERE ownername is not NULL
GROUP BY ownername
ORDER BY Owner_count DESC 

--Yes! 
--What are top 5 owners when it comes to the amount of houses sold? 
/*[
  {
    "ownername": "JRG PROPERTIES, LLC",
    "owner_count": "26"
  },
  {
    "ownername": "HILL 33, LLC",
    "owner_count": "24"
  },
  {
    "ownername": "SUMMEY, CLARENCE",
    "owner_count": "23"
  },
  {
    "ownername": "KHAZANOV, MAX",
    "owner_count": "21"
  },
  {
    "ownername": "FED DEVELOPMENT, LLC",
    "owner_count": "21"
  }
]*/

/* 6.What are the top 5 owners when it comes to the total amount of money they “gain”?
*/
SELECT ownername,
       SUM(saleprice) AS Owner_money_count
FROM nashville_housing
WHERE ownername is not NULL AND saleprice is not NULL
GROUP BY ownername
ORDER BY Owner_money_count DESC 
LIMIT 5

--Here is the result:
/*[
  {
    "ownername": "HILL 33, LLC",
    "owner_money_count": "105600000"
  },
  {
    "ownername": "RADNOR II, L.P.",
    "owner_money_count": "57000000"
  },
  {
    "ownername": "CATHOLIC DIOCESE OF NASHVILLE",
    "owner_money_count": "24875000"
  },
  {
    "ownername": "CUMBERLAND DEVELOPMENT PARTNERS, LLC",
    "owner_money_count": "20400000"
  },
  {
    "ownername": "WALLACE, ANNE B.",
    "owner_money_count": "12149000"
  }
]*/

/* 7. How many properties were from each price range?
*/ 

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

--Here is the result: 
/*[
  {
    "price_range": "100k-200k",
    "total_properties": "20046"
  },
  {
    "price_range": "200k-300k",
    "total_properties": "12737"
  },
  {
    "price_range": "300k-500k",
    "total_properties": "10119"
  },
  {
    "price_range": "0-100k",
    "total_properties": "7486"
  },
  {
    "price_range": "500k+",
    "total_properties": "6089"
  }
]*/