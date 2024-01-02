select * from product;

select * from internetsales;
select * from date;
select * from geography;
select * from customer;

SELECT concat(firstname,' ',middlename,' ',lastname) FROM CUSTOMER;

SELECT MIDDLENAME FROM CUSTOMER WHERE MIDDLENAME='NULL';

select CASE WHEN NOT middlename = 'NULL' THEN concat(firstname,' ',middlename,' ',lastname)
			ELSE concat(firstname,' ',lastname)
			END AS CUSTOMERNAME
from customer
ORDER BY CUSTOMERNAME;

ALTER TABLE CUSTOMER ADD customername varchar;

SELECT FIRSTNAME,MIDDLENAME,LASTNAME,CUSTOMERNAME FROM CUSTOMER;

UPDATE customer
SET customername = CASE WHEN middlename = 'NULL' THEN CONCAT(firstname,' ',lastname)
ELSE CONCAT(firstname,' ',middlename,' ',lastname) END;

SELECT * FROM internetsales
WHERE TO_DATE(orderdate, 'MM/DD/YYYY') < '2021-01-01';

SELECT TO_DATE(ORDERDATE,'YYYY/MM/DD') FROM INTERNETSALES;

ALTER TABLE customer 
DROP COLUMN firstname,
DROP COLUMN middlename,
DROP COLUMN lastname,
DROP COLUMN numbercarsowned,
DROP COLUMN houseownerflag,
DROP COLUMN numberchildrenathome,
DROP COLUMN spanisheducation,
DROP COLUMN frencheducation,
DROP COLUMN spanishoccupation,
DROP COLUMN frenchoccupation,
DROP COLUMN totalchildren,
DROP COLUMN suffix,
DROP COLUMN maritalstatus;

ALTER TABLE customer 
DROP COLUMN namestyle;

select suffix from customer where not suffix = 'NULL';
select title from customer where not title = 'NULL';
select namestyle from customer where namestyle <> 0;

select * from customer;
select * from geography;

ALTER TABLE geography
DROP COLUMN spanishcountryregionname,
DROP COLUMN frenchcountryregionname;

SELECT a.*, b.city,b.stateprovincecode,b.stateprovincename,b.countryregioncode,
b.englishcountryregionname AS countryregionname, b.postalcode,b.salesterritorykey,b.ipaddresslocator
FROM customer AS a
LEFT JOIN geography AS b
ON a.geographykey= b.geographykey;

CREATE TABLE customer_geo AS 
(SELECT a.*, b.city,b.stateprovincecode,b.stateprovincename,b.countryregioncode,
b.englishcountryregionname AS countryregionname, b.postalcode,b.salesterritorykey,b.ipaddresslocator
FROM customer AS a
LEFT JOIN geography AS b
ON a.geographykey= b.geographykey);


select * from customer where datefirstpurchase < '2021-01-01';
DELETE FROM CUSTOMER WHERE datefirstpurchase < '2021-01-01';

select * from customer;
select * from customer_geo;
select * from internetsales;
select salesamount from internetsales where salesamount = NULL;

select substring(orderdatekey for 4) from internetsales;
select * from internetsales where orderdatekey < '20210101';

select to_date(orderdatekey,'YYYYMMDD') FROM internetsales;

UPDATE internetsales 
SET orderdate = to_date(orderdatekey,'YYYYMMDD');

select * from internetsales where orderdate<'2021-01-01';
DELETE FROM internetsales WHERE orderdate < '2021-01-01';

ALTER TABLE internetsales
DROP COLUMN promotionkey,
DROP COLUMN currencykey;

select * from product;
select * from productcategory;
select * from productsubcategory;

SELECT a.*,b.productcategorykey,b.productcategoryalternatekey,b.englishproductcategoryname as productcategoryname,
c.productsubcategoryalternatekey,c.englishproductsubcategoryname as productsubcategoryname
FROM product as a
LEFT JOIN productsubcategory as c
on a.productsubcategorykey = c.productsubcategorykey
LEFT JOIN productcategory as b
on c.productcategorykey = b.productcategorykey
order by productkey;

CREATE TABLE product_all AS
(SELECT a.*,b.productcategorykey,b.productcategoryalternatekey,b.englishproductcategoryname as productcategoryname,
c.productsubcategoryalternatekey,c.englishproductsubcategoryname as productsubcategoryname
FROM product as a
LEFT JOIN productsubcategory as c
on a.productsubcategorykey = c.productsubcategorykey
LEFT JOIN productcategory as b
on c.productcategorykey = b.productcategorykey
order by productkey);

SELECT * FROM product_all;

select * from date;

ALTER TABLE date
DROP COLUMN spanishdaynameofweek,
DROP COLUMN frenchdaynameofweek,
DROP COLUMN spanishmonthname,
DROP COLUMN frenchmonthname;

select distinct calendaryear from date order by calendaryear;
select * from date where fulldatealternatekey >= '2021-01-01';

DELETE FROM date where calendaryear < 2021;
