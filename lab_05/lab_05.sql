EXPLAIN ANALYZE
SELECT * 
FROM customers 
WHERE last_name = 'Smith';


CREATE INDEX idx_customers_last_name 
ON customers(last_name);


EXPLAIN ANALYZE
SELECT * 
FROM customers 
WHERE last_name = 'Smith';


DROP INDEX idx_customers_last_name;


EXPLAIN ANALYZE
SELECT *
FROM dealerships
WHERE date_closed IS NOT NULL;


CREATE INDEX idx_dealerships_closed
ON dealerships(date_closed)
WHERE date_closed IS NOT NULL;



EXPLAIN ANALYZE
SELECT *
FROM dealerships
WHERE date_closed IS NOT NULL;

DROP INDEX idx_dealerships_closed;