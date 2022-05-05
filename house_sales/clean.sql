SELECT YEAR(datesold) AS Year, MONTH(datesold) AS Month, ROUND(AVG(price),0) AS Price
FROM (SELECT * FROM raw_sales WHERE propertyType = 'House' AND bedrooms = 3) AS house_sales
GROUP BY YEAR(datesold), MONTH(datesold);

Select * from raw_sales;

SELECT DISTINCT YEAR(datesold), MONTH(datesold)
FROM bdauu.raw_sales
ORDER BY datesold;