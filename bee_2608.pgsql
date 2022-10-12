
CREATE TABLE IF NOT EXISTS products(
    id INTEGER PRIMARY KEY,
    name VARCHAR(60),
    amount INTEGER,
    price NUMERIC(9,2)  
);

INSERT INTO products (id, name, amount, price)
VALUES
  (1,	'Two-doors wardrobe',	100,	800),
  (2,	'Dining table',	1000,	560),
  (3,	'Towel holder',	10000,	25.50),
  (4,	'Computer desk',	350,	320.50),
  (5,	'Chair',	3000,	210.64),
  (6,	'Single bed',	750,	460);
  
  /*  Execute this query to drop the tables */
  -- DROP TABLE products; --
     
SELECT MAX(price),MIN(price) AS price FROM products;