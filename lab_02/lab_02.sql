-- ЗАДАНИЕ 1: Показать все продажи модели 'Model Chi' с именами покупателей.
SELECT 
    p.model,
    c.first_name,
    c.last_name,
    c.email,
    s.sales_transaction_date,
    s.sales_amount,
    s.channel
FROM sales s
INNER JOIN customers c ON s.customer_id = c.customer_id
INNER JOIN products p ON s.product_id = p.product_id
WHERE p.model = 'Model Chi'
ORDER BY s.sales_transaction_date DESC;


-- ЗАДАНИЕ 2: Найдите сотрудников, нанятых позже, чем самый старый сотрудник был уволен.
SELECT 
    sp.first_name,
    sp.last_name,
    sp.hire_date,
	sp.termination_date
FROM salespeople sp
WHERE sp.hire_date > (
    SELECT MIN(sp2.termination_date) 
    FROM salespeople sp2
    WHERE sp2.termination_date IS NOT NULL
)
ORDER BY sp.hire_date;


-- ЗАДАНИЕ 3: Используя COALESCE, в таблице dealerships выведите дату закрытия.
-- Если не закрыт - 'Still Open'.

-- Создаем копию таблицы dealerships, полностью копируя данные
CREATE TABLE dealerships_02 AS
SELECT * FROM dealerships;

-- Добавляем столбец для статуса
ALTER TABLE dealerships_02
ADD COLUMN closing_status TEXT;

-- Обновляем статус с использованием COALESCE
UPDATE dealerships_02
SET closing_status = COALESCE(date_closed::TEXT, 'Still Open');

-- Вывод результата
SELECT 
    d.street_address,
    d.city,
    d.state,
    d.closing_status,
	d.date_closed
FROM dealerships_02 d
ORDER BY 
    CASE WHEN d.date_closed IS NULL THEN 0 ELSE 1 END,
    d.date_closed DESC;

-- DROP TABLE dealerships_02;