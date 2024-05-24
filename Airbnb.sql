SELECT 
	host_neighbourhood,
	AVG(REPLACE(REPLACE(REPLACE(CAST(price as varchar), '$', ''), '.', ''), ',', '') / 100) as price_avg
FROM [Airbnb].[dbo].[listings]
WHERE (availability_30 > 0) AND property_type != 'Private room in home' AND minimum_nights = 1
GROUP BY
	host_neighbourhood
ORDER BY
	price_avg

SELECT 
	listing_url,
	property_type,
	beds,
	host_neighbourhood,
	REPLACE(REPLACE(REPLACE(CAST(price as varchar), '$', ''), '.', ''), ',', '') / 100 as price
FROM [Airbnb].[dbo].[listings] 
WHERE 
	(host_neighbourhood = 'Kensington-Cedar Cottage' 
	OR host_neighbourhood = 'Gastown'
	OR host_neighbourhood = 'Fairview'
	OR host_neighbourhood = 'Strathcona'
	OR host_neighbourhood = 'Shaughnessy'
	OR host_neighbourhood = 'South Main'
	OR host_neighbourhood = 'Grandview-Woodland'
	OR host_neighbourhood = 'Riley Park'
	OR host_neighbourhood = 'South Cambie')
	AND (availability_30 > 0) 
	AND property_type NOT LIKE '%Private room%' 
	AND minimum_nights = 1
ORDER BY price