SELECT 
    EXTRACT(YEAR FROM sales_transaction_date) AS year,
    EXTRACT(QUARTER FROM sales_transaction_date) AS quarter,
    SUM(sales_amount) AS total_sales
FROM sales
GROUP BY year, quarter
ORDER BY year, quarter;


SELECT c.customer_id
FROM customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM dealerships d
    WHERE point(c.longitude, c.latitude) <@> point(d.longitude, d.latitude) <= 500
);


SELECT 
    CASE 
        WHEN feedback ILIKE '%service%' OR feedback ILIKE '%staff%' THEN 'Service'
        WHEN feedback ILIKE '%bike%' OR feedback ILIKE '%scooter%' OR feedback ILIKE '%quality%' THEN 'Product'
        ELSE 'Other'
    END AS category,
    COUNT(*) AS total_reviews
FROM customer_survey
GROUP BY category
ORDER BY total_reviews DESC;
