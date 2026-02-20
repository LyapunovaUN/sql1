-- ЗАДАНИЕ 1: Найти дисперсию (VAR_SAMP) цены продуктов
SELECT 
    ROUND(VAR_SAMP(base_msrp)::NUMERIC, 2) AS price_variance
FROM products
WHERE base_msrp IS NOT NULL;


-- ЗАДАНИЕ 2: Посчитать количество дилеров в каждом штате
SELECT 
    state,
    COUNT(*) AS dealership_count
FROM dealerships
WHERE state IS NOT NULL
GROUP BY state
ORDER BY dealership_count DESC;


-- ЗАДАНИЕ 3: Вывести штаты, где суммарная выручка превысила 1,000,000
SELECT 
    d.state,
    ROUND(SUM(s.sales_amount)::NUMERIC, 2) AS total_revenue
FROM dealerships d
LEFT JOIN sales s ON d.dealership_id = s.dealership_id
WHERE d.state IS NOT NULL
GROUP BY d.state
HAVING SUM(s.sales_amount) > 1000000
ORDER BY total_revenue DESC;