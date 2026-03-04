-- ВАРИАНТ 10

-- ЗАДАНИЕ 1: Пронумеровать продукты по году выпуска (year) от новых к старым внутри типа продукта.
SELECT 
    p.product_type,
    p.model,
    p.year,
    p.base_msrp,
    ROW_NUMBER() OVER (PARTITION BY p.product_type ORDER BY p.year DESC) as product_number
FROM products p
WHERE p.production_end_date IS NULL
ORDER BY p.product_type ASC, p.year DESC;


-- ЗАДАНИЕ 2: Сравнить base_msrp товара со средней ценой предыдущих двух товаров того же типа.
SELECT 
    p.product_type,
    p.model,
    p.year,
    p.base_msrp as current_price,
    AVG(p.base_msrp) OVER (
        PARTITION BY p.product_type 
        ORDER BY p.year DESC 
        ROWS BETWEEN 2 PRECEDING AND 1 PRECEDING
    ) as avg_previous_two_price
FROM products p
WHERE p.production_end_date IS NULL
ORDER BY p.product_type ASC, p.year DESC;


-- ЗАДАНИЕ 3: Нарастающий итог суммы продаж для клиентов из штата 'CA' (требуется JOIN).
SELECT 
    s.sales_transaction_date::DATE as sale_date,
    s.sales_amount,
    SUM(s.sales_amount) OVER (ORDER BY s.sales_transaction_date) as running_total_ca
FROM sales s
INNER JOIN customers c ON s.customer_id = c.customer_id
WHERE c.state = 'CA'
ORDER BY s.sales_transaction_date ASC;