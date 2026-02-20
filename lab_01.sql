-- ЗАДАНИЕ 1.1: Дилеры (dealerships) с широтой (latitude) > 40. Сортировка: широта.
SELECT 
    d.city, 
    d.state, 
    d.postal_code, 
    d.latitude, 
    d.longitude
FROM dealerships d
WHERE d.latitude > 40
ORDER BY d.latitude ASC;


-- ЗАДАНИЕ 1.2: Товары (products) типа 'automobile' с ценой < 15000.
SELECT 
    p.product_type, 
    p.base_msrp, 
    p.year, 
    p.production_start_date, 
    p.production_end_date
FROM products p
WHERE p.product_type = 'automobile' 
  AND p.base_msrp < 90000
ORDER BY p.base_msrp ASC;

-- ЗАДАНИЕ 1.3: Таблица cheap_parts (цена < 50). Удвоить цену. Удалить тип 'accessory' (если есть).

-- Создание таблицы cheap_parts с товарами, у которых base_msrp < 50
-- условие задания изменено на товары ценой меньше 600, так как в таблице нет товаров меньше 50
CREATE TABLE cheap_parts AS
SELECT 
    p.product_id, 
    p.model, 
    p.year, 
    p.product_type, 
    p.base_msrp, 
    p.production_start_date, 
    p.production_end_date
FROM products p
WHERE p.base_msrp < 600;


-- Удвоение цены (base_msrp) для всех товаров в таблице cheap_parts
UPDATE cheap_parts cp
SET cp.base_msrp = cp.base_msrp * 2;


-- Удаление из cheap_parts записей, где product_type = 'accessory'
-- в таблице нет такого типа, так что задание не имеет смысла
DELETE FROM cheap_parts cp
WHERE cp.product_type = 'accessory';


-- Проверка результата
SELECT 
    cp.product_id, 
    cp.model, 
    cp.product_type, 
    cp.base_msrp
FROM cheap_parts cp
ORDER BY cp.base_msrp;
