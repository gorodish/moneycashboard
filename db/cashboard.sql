DROP TABLE merchants CASCADE;
DROP TABLE transactions CASCADE;

CREATE TABLE merchants (
  id SERIAL4 primary key,
  name VARCHAR(255) not null,
  linkref INT4 UNIQUE
);

CREATE TABLE transactions (
  id SERIAL4 primary key,
  merchant_id INT4 references merchants(linkref),
  amount NUMERIC not null,
  tag VARCHAR(255)
);