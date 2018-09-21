DROP TABLE tickets ;
DROP TABLE screenings;
DROP TABLE customers;
DROP TABLE films;

CREATE TABLE films(
  ID SERIAL4 PRIMARY KEY,
  title VARCHAR(255),
  price INT2
);

CREATE TABLE customers(
ID SERIAL4 PRIMARY KEY,
name VARCHAR(255),
funds INT2
);

CREATE TABLE screenings(
ID SERIAL4 PRIMARY KEY,
start_time VARCHAR(255),
empty_seats INT2,
film_id INT4 REFERENCES films(id) ON DELETE CASCADE
);

CREATE TABLE tickets(
ID SERIAL4 PRIMARY KEY,
screening_id INT4 REFERENCES screenings(id) ON DELETE CASCADE,
customer_id INT4 REFERENCES customers(id) ON DELETE CASCADE
);
