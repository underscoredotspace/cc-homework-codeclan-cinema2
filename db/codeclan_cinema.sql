DROP TABLE IF EXISTS tickets;
DROP TABLE IF EXISTS films;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
  id SERIAL4,
  name VARCHAR(255),
  funds INT2
);

CREATE TABLE films (
  id SERIAL4,
  title VARCHAR(255),
  price INT2
);

CREATE TABLE tickets (
  id SERIAL4,
  customer_id INT4,
  film_id INT4
);