SELECT 
	host_neighbourhood,
	AVG(REPLACE(REPLACE(REPLACE(CAST(price as varchar), '$', ''), '.', ''), ',', '') / 100) as price_avg
FROM [Airbnb].[dbo].[listings]
WHERE (availability_30 > 0) AND property_type NOT LIKE '%Private room%' AND minimum_nights = 1
GROUP BY
	host_neighbourhood
ORDER BY
	price_avg;

SELECT 
	listing_url,
	property_type,
	beds,
	host_neighbourhood,
	REPLACE(REPLACE(REPLACE(CAST(price as varchar), '$', ''), '.', ''), ',', '') / 100 as price
FROM [Airbnb].[dbo].[listings] 
WHERE host_neighbourhood IN (
	'Kensington-Cedar Cottage', 
	'Gastown', 
	'Fairview', 
	'Strathcona', 
	'Shaughnessy', 
	'South Main', 
	'Grandview-Woodland', 
	'Riley Park', 
	'South Cambie')
	AND (availability_30 > 0) 
	AND property_type NOT LIKE '%Private room%' 
	AND minimum_nights = 1
	AND price IS NOT NULL
ORDER BY price;
