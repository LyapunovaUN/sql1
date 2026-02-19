-- ЗАДАНИЕ 1.1: Дилеры (dealerships) с широтой (latitude) > 40. Сортировка: широта.
SELECT dealership_id, city, state, postal_code, latitude, longitude
FROM dealerships
WHERE latitude > 40
ORDER BY latitude ASC;


-- ЗАДАНИЕ 1.2: Товары (products) типа 'automobile' с ценой < 15000.
SELECT product_id, product_type, base_msrp, year, production_start_date, production_end_date
FROM products
WHERE product_type = 'automobile' 
  AND base_msrp < 90000
ORDER BY base_msrp ASC;

-- ЗАДАНИЕ 1.3*: Таблица cheap_parts (цена < 50). Удвоить цену. Удалить тип 'accessory' (если есть).

-- Создание таблицы cheap_parts с товарами, у которых base_msrp < 50

-- условие задание изменено на товары ценорй меньше 600, так как в таблице нет товаров, меньше 50

CREATE TABLE cheap_parts AS
SELECT product_id, model, year, product_type, base_msrp, production_start_date, production_end_date
FROM products
WHERE base_msrp < 600;

-- Удвоение цены (base_msrp) для всех товаров в таблице cheap_parts
UPDATE cheap_parts
SET base_msrp = base_msrp * 2;

-- Удаление из cheap_parts записей, где product_type = 'accessory'

-- в таблице нет такого типа, так что задание не имеет смысла

DELETE FROM cheap_parts
WHERE product_type = 'accessory';

-- Проверка результата
SELECT product_id, model, product_type, base_msrp
FROM cheap_parts
ORDER BY base_msrp;