/*First I create a database.
--Then I create a table for my database.
*/

CREATE TABLE nashville_housing
(
    UniqueID INT PRIMARY KEY,
    ParcelID INT,
    LandUse TEXT,
    PropertyAddress TEXT,
    SaleDate DATE,
    SalePrice INT,
    LegalReference TEXT,
    SoldAsVacant BOOLEaN,
    OwnerName TEXT,
    OwnerAdress TEXT,
    Acreage INT,
    TaxDistrit TEXT,
    LandValue INT,
    BuildingValue INT,
    TotalValue INT,
    YearBuilt VARCHAR(3),
    Bedrooms INT,
    FullBath INT,
    HalfBath INT

);
ALTER TABLE nashville_housing OWNER to postgres;

/* Then I have to do some changes in my table, because of wrong column/data type.
I changed also some data in "SalesPrice"
 column by deleting comamas (I wanted to have an integer type of this data)
 */

ALTER TABLE nashville_housing
ALTER COLUMN ParcelID TYPE TEXT;


ALTER TABLE nashville_housing
ALTER COLUMN Acreage TYPE FLOAT;


ALTER TABLE nashville_housing
ALTER COLUMN YearBuilt TYPE VARCHAR(10);

ALTER TABLE nashville_housing
ALTER COLUMN saleprice TYPE INT;

/* Now I can load data to my created table.
*/
\copy nashville_housing FROM 'C:\Users\ASUS\Downloads\SQL_PROJECT2\housing\Nashville Housing.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

--Let's check I it worked: 

SELECT * FROM nashville_housing
--It worked! I created a dataset (housing), a table (nashville_housing)and I downloaded data (Nashville Housing.csv) to the table.